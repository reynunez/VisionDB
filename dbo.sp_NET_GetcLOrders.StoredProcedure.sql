/****** Object:  StoredProcedure [dbo].[sp_NET_GetcLOrders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/30/2020
-- Description: Get cl Orders
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetcLOrders]
(
	@ORDER_DATE_FROM DATE,
	@ORDER_DATE_TO DATE,
	@STATUS VARCHAR(50) = '',
	@PATIENTNO INT = 0,
	@ORDER_ID INT = 0,
	@TRAY VARCHAR(25) = '',
	@OFFICEID INT = 0,
	@INSURANCE_NAME VARCHAR(100) = '',
	@CREATEDBY VARCHAR(100) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 
	DECLARE @SQL_StatemenTotal NVARCHAR(2000) ;


	SET @SQL_StatemenTotal = '  Declare @OrderCount INT;
								Declare @patTotal NUMERIC(18,2);
								Declare @insTotal NUMERIC(18,2);
								Declare @allTotal NUMERIC(18,2);
								Select @OrderCount = Count(ORDER_ID),@patTotal = SUM(o.ORDER_PATIENT),@insTotal = SUM(o.ORDER_INSURANCE),@allTotal = SUM(o.ORDER_TOTAL) 
								from	CL_ORDER_HDR o
										LEFT JOIN patient p ON o.PATIENT_NO = p.patient_no
										LEFT JOIN office l ON l.officeid  = o.OFFICEID 
								WHERE	1=1 '

	set @SQL_Statement = 'Select	o.ORDER_ID 
									,o.ORDER_DATE 
									,o.PATIENT_NO 
									,RTRIM(LTRIM(p.first_name)) + '' '' + RTRIM(LTRIM(p.last_name)) as PATIENT_NAME
									,o.officeid
									,l.description as OFFICE
									,o.ORDER_TRAY 
									,o.FLOWSTATUS as ORDER_STATUS
									,o.STATUS_CHANGE_DATE
									,o.STATUS_CHANGE_LOCATION
									,o.ORDER_INS_PLAN as INSURANCE_PLAN
									,o.ORDER_INS_BENEFITS as BENEFITS
									,o.ORDER_INS_AUTH as ''AUTHORIZATION''
									,o.ORDER_PATIENT as PATIENT_CHARGES
									,o.ORDER_INSURANCE as INSURANCE_CHARGES
									,o.ORDER_TOTAL 
									,(Select top 1 CAST(voidafter AS DATE) from prescCL where prescid = o.PRESCID ) as VOIDAFTER
									,o.username as CREATED_BY
							from	CL_ORDER_HDR o
							LEFT JOIN patient p ON o.PATIENT_NO = p.patient_no
							LEFT JOIN office l ON l.officeid  = o.OFFICEID 
							WHERE	1=1 '

	IF ((@PATIENTNO = 0 ) AND (@ORDER_ID = 0) AND (@TRAY = '')) BEGIN
		IF @ORDER_DATE_FROM <> '' AND @ORDER_DATE_TO  <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND CAST(o.ORDER_DATE as DATE) BETWEEN ' + '''' + CAST(@ORDER_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@ORDER_DATE_TO AS VARCHAR) + '''  '
			SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND CAST(o.ORDER_DATE as DATE) BETWEEN ' + '''' + CAST(@ORDER_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@ORDER_DATE_TO AS VARCHAR) + '''  '
		END
		IF @STATUS <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND o.FLOWSTATUS = ' + '''' + @STATUS + ''''
			SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.FLOWSTATUS = ' + '''' + @STATUS + ''''
		END
	END

	IF @PATIENTNO <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.PATIENT_NO = ' + CAST(@PATIENTNO AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.PATIENT_NO = ' + CAST(@PATIENTNO AS VARCHAR) + ' '
	END

	IF @ORDER_ID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.ORDER_ID = ' + CAST(@ORDER_ID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.ORDER_ID = ' + CAST(@ORDER_ID AS VARCHAR) + ' '
	END

	IF @TRAY <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.ORDER_TRAY = ' + '''' + @TRAY + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.ORDER_TRAY = ' + '''' + @TRAY + ''' '
	END

	IF @OFFICEID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
	END

	IF @CREATEDBY <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.username = ' + '''' + @CREATEDBY + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.username = ' + '''' + @CREATEDBY + ''' '
	END

	IF @INSURANCE_NAME <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.ORDER_INS_PLAN = ' + '''' + @INSURANCE_NAME + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.ORDER_INS_PLAN = ' + '''' + @INSURANCE_NAME + ''' '
	END

	/*
	SET @SQL_Statement = @SQL_StatemenTotal + '; ' + @SQL_Statement + ' union all 
						Select NULL,NULL,NULL,''Total Orders'',Cast(@OrderCount as Varchar(20)),'''','''','''',NULL,'''','''','''',''Total'',@patTotal,@insTotal,@allTotal,NULL,'''' '
	*/

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

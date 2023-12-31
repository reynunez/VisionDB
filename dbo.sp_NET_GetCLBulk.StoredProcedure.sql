/****** Object:  StoredProcedure [dbo].[sp_NET_GetCLBulk]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 02/12/2021
-- Description: Get cl Orders Bulk
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCLBulk]
(
	@ORDER_DATE_FROM DATE,
	@ORDER_DATE_TO DATE,
	@STATUS VARCHAR(50) = '',
	@OFFICEID INT = 0,
	@ORDERS_LIST VARCHAR(MAX) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(MAX) 

	set @SQL_Statement = 'Select	o.ORDER_ID 
									,o.ORDER_DATE 
									,o.PATIENT_NO 
									,RTRIM(LTRIM(p.first_name)) + '' '' + RTRIM(LTRIM(p.last_name)) as PATIENT_NAME
									,o.officeid
									,l.description as OFFICE
									,o.FLOWSTATUS as ORDER_STATUS
									,o.STATUS_CHANGE_DATE
									,o.STATUS_CHANGE_LOCATION
									,o.ORDER_TRAY
									,o.ORDER_INS_PLAN 
									,o.ORDER_INS_BENEFITS 
									,o.ORDER_INS_AUTH 
									,o.ORDER_PATIENT 
									,o.ORDER_INSURANCE 
									,o.ORDER_TOTAL 
									,o.username 
							from	CL_ORDER_HDR o
							LEFT JOIN patient p ON o.PATIENT_NO = p.patient_no
							LEFT JOIN office l ON l.officeid  = o.OFFICEID 
							WHERE	1=1 '

	IF @ORDER_DATE_FROM <> '' AND @ORDER_DATE_TO  <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND CAST(o.ORDER_DATE as DATE) BETWEEN ' + '''' + CAST(@ORDER_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@ORDER_DATE_TO AS VARCHAR) + '''  '
	END

	IF @ORDERS_LIST <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.ORDER_ID IN(' + @ORDERS_LIST + ') '

		IF @OFFICEID <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
		END
	END
	ELSE BEGIN

		IF @STATUS <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND o.FLOWSTATUS = ' + '''' + @STATUS + ''' '
		END

		IF @OFFICEID <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
		END
	END

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

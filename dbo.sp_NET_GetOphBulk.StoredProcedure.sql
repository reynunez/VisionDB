/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphBulk]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 02/12/2021
-- Description: Get Oph Orders for Bulk
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphBulk]
(
	@ORDER_DATE_FROM DATE,
	@ORDER_DATE_TO DATE,
	@STATUS VARCHAR(50) = '',
	@OFFICEID INT = 0,
	@ORDERS_LIST VARCHAR(MAX) = '',
	@MATERIAL VARCHAR(100) = '',
	@DESIGN VARCHAR(100) = '',
	@TX VARCHAR(100) = '',
	@trace int = 0
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(MAX) 

	set @SQL_Statement = 'Select DISTINCT 
								o.ORDER_ID 
								,o.ORDER_DATE 
								,o.PATIENT_NO 
								,RTRIM(LTRIM(p.first_name)) + '' '' + RTRIM(LTRIM(p.last_name)) as PATIENT_NAME
								,o.OFFICEID
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
								,f.trace
								,CASE WHEN LEN(f.trace) > 0 THEN ''(t)'' ELSE '''' END as trace_display
						from	OPH_ORDER_HDR o
								LEFT JOIN patient p ON o.PATIENT_NO = p.patient_no
								LEFT JOIN office l ON l.officeid  = o.OFFICEID 
								LEFT JOIN OPH_ORDER_TREAT t ON o.ORDER_ID = t.ORDER_ID
								LEFT JOIN tblVUFrames f ON o.frameid = f.frameid
						WHERE	1=1 '

	IF (@trace = 1)	BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND LEN(f.trace) > 0 '
	END

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

		IF @MATERIAL <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND o.order_material = ' + '''' + @MATERIAL + ''' '
		END

		IF @DESIGN <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND o.order_design = ' + '''' + @DESIGN + ''' '
		END

		IF @TX <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND t.TREAT_DESCRIPTION = ' + '''' + @TX + ''' '
		END

	END

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

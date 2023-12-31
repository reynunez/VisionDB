/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppointments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/27/2021
-- Description: Get Appointments
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppointments]
(
	@APPMT_DATE_FROM DATE,
	@APPMT_DATE_TO DATE,
	@PATIENT_ID INT = 0,
	@DOCTORID INT = 0,
	@OFFICEID INT = 0,
	@INSURANCE_NO INT = 0,
	@CREATEDBY VARCHAR(100) = '',
	@WORKFLOW VARCHAR(100) = '',
	@STATUS VARCHAR(100) = ''
)
AS
BEGIN

    SET NOCOUNT ON
	DECLARE @SQL_Statement NVARCHAR(2000) ;
	DECLARE @SQL_StatemenTotal NVARCHAR(2000) ;
	

	set @SQL_StatemenTotal = '  Declare @AppmtCount INT;
								Select @AppmtCount = Count(*) from view_AppmtList where 1=1 ';

	set @SQL_Statement = '
						Select	Convert(varchar,appmtdate,101)  AS APPOINTMENT_DATE
								,appmttime AS APPOINTMENT_TIME
								,patient_no AS PATIENT_ID
								,PatientName  as PATIENT_NAME
								,phone1 as PATIENT_CELL
								,doctor as PROVIDER
								,location AS LOCATION
								,insurance_name AS INSURANCE_PLAN
								,ins_benefits AS INSURANCE_BENEFITS
								,ins_authorization AS INSURANCE_AUTHRORIZATION
								,reason AS APPOINTMENT_REASON
								,username AS CREATED_BY
								,workflow AS WORKFLOW_STATUS
								,apstatus as APSTATUS
						From	view_AppmtList 
						WHERE	1=1
						';

	IF @APPMT_DATE_FROM <> '' AND @APPMT_DATE_TO  <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND CAST(appmtdate as DATE) BETWEEN ' + '''' + CAST(@APPMT_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@APPMT_DATE_TO AS VARCHAR) + '''  '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND CAST(appmtdate as DATE) BETWEEN ' + '''' + CAST(@APPMT_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@APPMT_DATE_TO AS VARCHAR) + '''  '
	END

	IF @PATIENT_ID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND patient_no = ' + CAST(@PATIENT_ID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND patient_no = ' + CAST(@PATIENT_ID AS VARCHAR) + ' '
	END

	IF @DOCTORID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND doctorid = ' + CAST(@DOCTORID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND doctorid = ' + CAST(@DOCTORID AS VARCHAR) + ' '
	END

	IF @OFFICEID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
	END

	IF @INSURANCE_NO <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND insurance_no = ' + CAST(@INSURANCE_NO AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND insurance_no = ' + CAST(@INSURANCE_NO AS VARCHAR) + ' '
	END

	IF @WORKFLOW <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND workflow = ' + '''' + @WORKFLOW + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND workflow = ' + '''' + @WORKFLOW + ''' '
	END

	IF @CREATEDBY <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND username = ' + '''' + @CREATEDBY + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND username = ' + '''' + @CREATEDBY + ''' '
	END

	IF @STATUS <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND apstatus = ' + '''' + @STATUS + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND apstatus = ' + '''' + @STATUS + ''' '
	END

	SET @SQL_Statement = @SQL_StatemenTotal + '; ' + @SQL_Statement + ' union all 
						Select ''Total'',Cast(@AppmtCount as Varchar(20)),'''','''','''','''','''','''','''','''','''','''','''','''' '

	print @SQL_Statement;
	Exec sp_executesql @SQL_Statement;

END
GO

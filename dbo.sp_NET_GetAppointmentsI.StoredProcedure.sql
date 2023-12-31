/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppointmentsI]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/27/2021
-- Description: Get Appointments
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppointmentsI]
AS
BEGIN

    SET NOCOUNT ON

	Select	appmtdate  AS APPOINTMENT_DATE
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

END
GO

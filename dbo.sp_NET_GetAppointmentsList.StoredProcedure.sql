/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppointmentsList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/27/2020
-- Description:	Procedure to get Appoinmtnet List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppointmentsList] 
	@sDate date
	,@officeID integer = 20
AS
BEGIN
	SET NOCOUNT ON;
IF @officeID = 20
BEGIN
	Select	DISTINCT
			appmttime as Time
			,(rtrim(ltrim(first_name)) + ' ' + last_name ) as Name
			,birth_date as Birthdate
			,phone1 as Cell
			,reason as Reason
			,apstatus as Status
			,insurance_name as Insurance
			,ins_benefits as Benefits
			,view_AppmtList.patient_no
			,CASE 
				WHEN workflow = 'noshow' THEN 'No Show' 
				WHEN workflow = 'tech' THEN 'Technician' 
				WHEN workflow = 'onboarding' THEN 'Boarded' 
				WHEN workflow = 'exam' THEN 'Exam Room' 
				WHEN workflow = 'floor' THEN 'Floor' 
				WHEN workflow = 'checkout' THEN 'Checked Out' 
				WHEN workflow = 'eyewear' THEN 'Eyewear' 
			 END as Workflow
			,createdat as Created
			,'' as onboarded
			,ins_authorization as InsAuthorization
			,PCP as PCP
			,case when isnull(email_address,'') = '' then ''  else email_address end as Email
			,pataddress as Pattient_Address
			,voicent as VoiceNt
			,doctorid as Doctorid
			,username as Created_by
			,appmtdate as AppDate
			,appmt_no as AppmtNo
			,cast(note as VARCHAR) as Note
			,case when tblonboarding.updatedate is NULL THEN 'NOT BOARDED' ELSE 'BOARDED' END AS Boarding
			,dbo.udf_GetTimeFormat(appmttime) as MilTime
	from	view_AppmtList LEFT JOIN
			tblonboarding on tblonboarding.patient_no = view_AppmtList.patient_no and convert(date,tblonboarding.updatedate,101) = convert(date,dateadd(hour,-5,getdate()),101)
	where	cancelled <> 'Yes' 
			and appmttime <> '' 
			and appmtdate = @sDate 
	order by dbo.udf_GetTimeFormat(appmttime)
END
ELSE
BEGIN
	Select	DISTINCT
			appmttime as Time
			,(rtrim(ltrim(first_name)) + ' ' + last_name ) as Name
			,birth_date as Birthdate
			,phone1 as Cell
			,reason as Reason
			,apstatus as Status
			,insurance_name as Insurance
			,ins_benefits as Benefits
			,view_AppmtList.patient_no
			,CASE 
				WHEN workflow = 'noshow' THEN 'No Show' 
				WHEN workflow = 'tech' THEN 'Technician' 
				WHEN workflow = 'onboarding' THEN 'Boarded' 
				WHEN workflow = 'exam' THEN 'Exam Room' 
				WHEN workflow = 'floor' THEN 'Floor' 
				WHEN workflow = 'checkout' THEN 'Checked Out' 
				WHEN workflow = 'eyewear' THEN 'Eyewear' 
			 END as Workflow
			,createdat as Created
			,'' as onboarded
			,ins_authorization as InsAuthorization
			,PCP as PCP
			,case when isnull(email_address,'') = '' then ''  else email_address end as Email
			,pataddress as Pattient_Address
			,voicent as VoiceNt
			,doctorid as Doctorid
			,username as Created_by
			,appmtdate as AppDate
			,appmt_no as AppmtNo
			,cast(note as VARCHAR) as Note
			,case when tblonboarding.updatedate is NULL THEN 'NOT BOARDED' ELSE 'BOARDED' END AS Boarding
			,dbo.udf_GetTimeFormat(appmttime) as MilTime
	from	view_AppmtList LEFT JOIN
			tblonboarding on tblonboarding.patient_no = view_AppmtList.patient_no and convert(date,tblonboarding.updatedate,101) = convert(date,dateadd(hour,-5,getdate()),101)
	where	cancelled <> 'Yes' 
			and appmttime <> '' 
			and appmtdate = @sDate 
			and officeid = @officeID
	order by dbo.udf_GetTimeFormat(appmttime)	
END
END
GO

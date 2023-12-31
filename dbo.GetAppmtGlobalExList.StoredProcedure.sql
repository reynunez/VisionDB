/****** Object:  StoredProcedure [dbo].[GetAppmtGlobalExList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 4/13/2013
-- Description:	Appointments Exceptions Global List
-- Exec GetAppmtGlobalExList '04/12/2013','04/12/2013',1,'Not Show'
-- =============================================
CREATE PROCEDURE [dbo].[GetAppmtGlobalExList](
	@dFrom varchar(10),
	@dTo varchar(10),
	@officeid int = 0,
	@exception varchar(15) = ''
)	
AS
BEGIN

	Declare @dateFrom datetime,
			@dateTo datetime
			
	set @dateFrom = cast(@dFrom as datetime)	
	set @dateTo = cast(@dTo as datetime)

	IF @exception = '' BEGIN
		IF @officeid = 0 BEGIN
			Select GLOB.* from (
			------ NOT SHOW QUERY
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no  and isDefault = 1)) as [Insurance],
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Not Show' as [Exception]		
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO not in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)
		
			UNION

			------ SHOW QUERY
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id  from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Show' as [Exception]
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO  in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)

			UNION

			------    WALK IN QUERY
			Select	officeid,
					officename as [offname],
					visit_date as [seldate],
					patient_no,
					patientname,
					(Select top 1 eventdate from signatureevents where patient_no = vw_GetDoctorRecords.patient_no order by eventseq asc) as [sigonfiledate],
					phone1,
					'' as [CREATEDATE],
					'' as [APPMT_DATE],
					'' as [APPMT_TIME],
					'' as [APPMT_REASON],
					'' AS [DOCTOR_NAME],
					'' AS [entry_date],
					'' AS [Sex],
					'' AS [head_of_household],
					'' AS [occupation],
					'' AS [marital_status],
					'' AS [last_office_visit_date],
					'' AS [last_appointment],
					'' AS [next_appointment],
					'' AS [last_update],
					'' AS [employername],
					'' AS [phone2],
					Doctor as EXECUTE_DOCTOR,
					'' as CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = vw_GetDoctorRecords.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = vw_GetDoctorRecords.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = vw_GetDoctorRecords.patient_no) as [Address],
					'Walk In' as [Excepton]
			from vw_GetDoctorRecords
			Where	visit_date between @dateFrom and @dateTo
					and patient_no not in (	Select PATIENT_NO 
											from Vw_AllAppointments 
											Where APPMT_DATE between @dateFrom and @dateTo
										)
			) AS GLOB
			order by GLOB.Exception,GLOB.officeid,GLOB.seldate,GLOB.patient_no
		END 
		ELSE BEGIN

			Select GLOB.* from (

			---------- NOT SHOW QUERY
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1)) as [Insurance],
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Not Show' as [Exception]		
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO not in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)
			UNION
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Show' as [Exception]
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO  in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)
		
			UNION							

			--------------WALK IN QUERY
			Select	officeid,
					officename as [offname],
					visit_date as [seldate],
					patient_no,
					patientname,
					(Select top 1 eventdate from signatureevents where patient_no = vw_GetDoctorRecords.patient_no order by eventseq asc) as [sigonfiledate],
					phone1,
					'' as [CREATEDATE],
					'' as [APPMT_DATE],
					'' as [APPMT_TIME],
					'' as [APPMT_REASON],
					'' as [DOCTOR_NAME],
					'' AS [entry_date],
					'' AS [Sex],
					'' AS [head_of_household],
					'' AS [occupation],
					'' AS [marital_status],
					'' AS [last_office_visit_date],
					'' AS [last_appointment],
					'' AS [next_appointment],
					'' AS [last_update],
					'' AS [employername],
					'' AS [phone2],
					Doctor as [EXECUTE_DOCTOR],
					''  as [CREATEDBY],
					(Select top 1 insured_id  from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = vw_GetDoctorRecords.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = vw_GetDoctorRecords.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = vw_GetDoctorRecords.patient_no) as [Address],
					'Walk In' as [Excepton]
			from vw_GetDoctorRecords
			Where	visit_date between @dateFrom and @dateTo
					and patient_no not in (	Select PATIENT_NO 
											from Vw_AllAppointments 
											Where APPMT_DATE between @dateFrom and @dateTo
										)
			) AS GLOB
			WHERE GLOB.officeid = @officeid
			order by GLOB.Exception,GLOB.officeid,GLOB.seldate,GLOB.patient_no
		END	
	END
	ELSE BEGIN
		IF @officeid = 0 BEGIN
			Select GLOB.* from (
			------ NOT SHOW QUERY
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no  and isDefault = 1)) as [Insurance],
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Not Show' as [Exception]		
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO not in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)
		
			UNION

			------ SHOW QUERY
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [pseldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as insured_id,
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as policy_group_no,
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Show' as [Exception]
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO  in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)

			UNION

			------    WALK IN QUERY
			Select	officeid,
					officename as [offname],
					visit_date as [seldate],
					patient_no,
					patientname,
					(Select top 1 eventdate from signatureevents where patient_no = vw_GetDoctorRecords.patient_no order by eventseq asc) as [sigonfiledate],
					phone1,
					'' as [CREATEDATE],
					'' as [APPMT_DATE],
					'' as [APPMT_TIME],
					'' as [APPMT_REASON],
					'' as [DOCTOR_NAME],
					'' AS [entry_date],
					'' AS [Sex],
					'' AS [head_of_household],
					'' AS [occupation],
					'' AS [marital_status],
					'' AS [last_office_visit_date],
					'' AS [last_appointment],
					'' AS [next_appointment],
					'' AS [last_update],
					'' AS [employername],
					'' AS [phone2],
					Doctor as [EXECUTE_DOCTOR],
					'' as [CREATEDBY],
					(Select top 1 insured_id from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = vw_GetDoctorRecords.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = vw_GetDoctorRecords.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = vw_GetDoctorRecords.patient_no) as [Address],
					'Walk In' as [Excepton]
			from vw_GetDoctorRecords
			Where	visit_date between @dateFrom and @dateTo
					and patient_no not in (	Select PATIENT_NO 
											from Vw_AllAppointments 
											Where APPMT_DATE between @dateFrom and @dateTo
										)
			) AS GLOB
			WHERE GLOB.Exception = @exception
			order by GLOB.Exception,GLOB.officeid,GLOB.seldate,GLOB.patient_no
		END 
		ELSE BEGIN

			Select GLOB.* from (

			---------- NOT SHOW QUERY
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1)) as [Insurance],
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Not Show' as [Exception]		
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO not in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)
			UNION
			Select	officeid,
					office_name as [offname],
					APPMT_DATE as [seldate],
					PATIENT_NO,
					PATIENT_NAME,
					(Select top 1 eventdate from signatureevents where patient_no = Vw_AllAppointments.patient_no order by eventseq asc) as [sigonfiledate],
					phone1 ,
					CREATEDATE,
					APPMT_DATE,
					APPMT_TIME,
					APPMT_REASON,
					DOCTOR_NAME,
					entry_date,
					Sex,
					head_of_household,
					occupation,
					marital_status,
					last_office_visit_date,
					last_appointment,
					next_appointment,
					last_update,
					employername,
					phone2,
					ISNULL((Select TOP 1 doctor from vw_GetDoctorRecords where patient_no = Vw_AllAppointments.patient_no AND visit_date between @dateFrom and @dateTo),'NO RECORD') as [EXECUTE_DOCTOR],
					CREATEDBY,
					(Select top 1 insured_id from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as[insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as[policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = Vw_AllAppointments.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = Vw_AllAppointments.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = Vw_AllAppointments.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = Vw_AllAppointments.patient_no) as [Address],
					'Show' as Exception
			from	Vw_AllAppointments
			Where	APPMT_DATE between @dateFrom and @dateTo
					and PATIENT_NO  in (	Select PATIENT_NO 
											from	vw_GetDoctorRecords 
											where visit_date between @dateFrom and @dateTo
										)
		
			UNION							

			--------------WALK IN QUERY
			Select	officeid,
					officename as [offname],
					visit_date as [seldate],
					patient_no,
					patientname,
					(Select top 1 eventdate from signatureevents where patient_no = vw_GetDoctorRecords.patient_no order by eventseq asc) as [sigonfiledate],
					phone1,
					'' as [CREATEDATE],
					'' as [APPMT_DATE],
					'' as [APPMT_TIME],
					'' as [APPMT_REASON],
					'' as [DOCTOR_NAME],
					'' AS [entry_date],
					'' AS [Sex],
					'' AS [head_of_household],
					'' AS [occupation],
					'' AS [marital_status],
					'' AS [last_office_visit_date],
					'' AS [last_appointment],
					'' AS [next_appointment],
					'' AS [last_update],
					'' AS [employername],
					'' AS [phone2],
					Doctor as [EXECUTE_DOCTOR],
					''  as [CREATEDBY],
					(Select top 1 insured_id from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [insured_id],
					(Select top 1 policy_group_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [policy_group_no],
					(Select top 1 iauthorization from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [Authorization],
					(Select top 1 benefits from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1) as [benefits],
					(Select top 1 insurance_name from dbo.insurance where insurance_no = (Select top 1 insurance_no from patient_insurances where patient_no = vw_GetDoctorRecords.patient_no and isDefault = 1)) as [Insurance],	
					(Select top 1 birth_date from patient where patient_no = vw_GetDoctorRecords.patient_no) as [dob],
					(Select top 1 email_address from patient where patient_no = vw_GetDoctorRecords.patient_no) as [email],
					(Select top 1 rtrim(ltrim(isnull(address1,''))) + ' ' + rtrim(ltrim(isnull(address2,''))) + ' ' + ltrim(rtrim(isnull(city,''))) + ' ' + isnull(state,'') + ',' + isnull(zip,'') from dbo.address where patient_no = vw_GetDoctorRecords.patient_no) as [Address],
					'Walk In' as [Excepton]
			from vw_GetDoctorRecords
			Where	visit_date between @dateFrom and @dateTo
					and patient_no not in (	Select PATIENT_NO 
											from Vw_AllAppointments 
											Where APPMT_DATE between @dateFrom and @dateTo
										)
			) AS GLOB
			WHERE GLOB.officeid = @officeid AND GLOB.Exception = @exception
			order by GLOB.Exception,GLOB.officeid,GLOB.seldate,GLOB.patient_no
		END	
	END	
END
GO

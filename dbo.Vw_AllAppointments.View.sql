/****** Object:  View [dbo].[Vw_AllAppointments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[Vw_AllAppointments]
AS
select	appointment.appmt_no AS [APPMT_NO],
		appointment.patient_no AS [PATIENT_NO],
		appointment.createdate AS [CREATEDATE],
		appointment.apstatusid,
		(patient.first_name + ' ' + patient.last_name) AS [PATIENT_NAME],
		patient.first_name,
		patient.last_name,
		(Select top 1 phone1 from address where patient_no = dbo.patient.patient_no) as [phone1],
		appointment.appmtdate AS [APPMT_DATE],
		appointment.appmttime AS [APPMT_TIME],
		appreasons.reasonid AS [REASONID],
		appreasons.description AS [APPMT_REASON],
		salespeople.salesmanid AS [SALESMANID],
		salespeople.name AS [CREATEDBY],
		office.officeid AS [OFFICEID],
		office.voicent,
		office.description AS [OFFICE_NAME],
		doctors.doctorid AS [DOCTORID],
		doctors.description AS [DOCTOR_NAME],
		patient.entry_date,
		(Case patient.sex When 1 then 'F' Else 'M' End) as Sex,
		(Case patient.head_of_household When 1 then 'Y' else 'N' End) as head_of_household,
		patient.occupation,
		(Case patient.marital_status When 0 then 'Single' When 1 then 'Married' When 2 then 'Divorced' When 3 then 'Widowed' Else 'Unknown' End) as marital_status,
		patient.last_office_visit_date,
		(Select top 1 appmtdate from appointment where patient_no = patient.patient_no and appmtdate <= getdate() order by appmtdate desc) as last_appointment,
		(Select top 1 appmtdate from appointment where patient_no = patient.patient_no and appmtdate >= getdate() order by appmtdate asc) as next_appointment,
		patient.last_update,
		patient.employername,
		isWalkin,
		(Select top 1 phone2 from address where patient_no = patient.patient_no) as [phone2]
from	appointment inner join 
		salespeople on salespeople.salesmanid = appointment.salesmanid inner join
		office on office.officeid = appointment.appmtlocation inner join
		patient on patient.patient_no = appointment.patient_no inner join
		appReasons on appreasons.reasonid = appointment.appmtreason inner join
		doctors on doctors.doctorid = appointment.appmtdoctor
where   appointment.apstatusid <> 1 


GO

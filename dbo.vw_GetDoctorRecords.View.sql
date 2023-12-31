/****** Object:  View [dbo].[vw_GetDoctorRecords]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[vw_GetDoctorRecords]
AS
SELECT	dbo.doctors.doctorid, 
		dbo.doctors.description AS [Doctor], 
		dbo.doctorsrecord.patient_no,
		dbo.patient.officeid,
		(Select top 1 voicent from office where officeid = dbo.patient.officeid) as [voicent],
		ISNULL((Select top 1 phone1 from address where patient_no = dbo.patient.patient_no),'n/a') as [phone1],
		dbo.patient.first_name,
		dbo.patient.last_name,
		ISNULL((Select top 1 description from office where officeid = dbo.patient.officeid),'n/a') as [OfficeName],
		RTRIM(dbo.patient.first_name) + ' ' + RTRIM(dbo.patient.last_name) as [patientname],
		RTRIM(dbo.patient.first_name) + ' ' + RTRIM(dbo.patient.last_name) + ' - ' +  ISNULL((Select top 1 locationprefix from locations where officeid = patient.officeid),'--') AS [Patient], 
		dbo.doctorsrecord.visit_date, 
		dbo.doctorsrecord.comp, 
		dbo.doctorsrecord.glau, 
		dbo.doctorsrecord.conl, 
		dbo.doctorsrecord.minr,
		dbo.doctorsrecord.chis
FROM    dbo.patient LEFT JOIN
        dbo.doctorsrecord ON dbo.patient.patient_no = dbo.doctorsrecord.patient_no LEFT JOIN
        dbo.doctors ON dbo.doctorsrecord.doctorid = dbo.doctors.doctorid
GO

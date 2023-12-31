/****** Object:  View [dbo].[view_GetOneRecord]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_GetOneRecord]
AS
SELECT	dbo.patient.*, 
		dbo.address.address1, 
		dbo.address.address2, 
		dbo.address.city, 
		dbo.address.state, 
		dbo.address.zip, 
		dbo.address.phone1, 
        dbo.address.phone2, 
		dbo.address.fax, 
		dbo.patient_insurances.insurance_no, 
		dbo.patient_insurances.insured_id, 
        dbo.patient_insurances.policy_group_no, 
		dbo.patient_insurances.iauthorization, 
		dbo.patient_insurances.benefits, 
        dbo.office.description AS office_name, 
		dbo.doctors.description AS doctor_name, 
		dbo.insurance.insurance_name
FROM    dbo.insurance INNER JOIN
        dbo.patient_insurances ON dbo.insurance.insurance_no = dbo.patient_insurances.insurance_no RIGHT OUTER JOIN
        dbo.patient INNER JOIN
        dbo.office ON dbo.patient.officeid = dbo.office.officeid INNER JOIN
        dbo.doctors ON dbo.patient.doctorid = dbo.doctors.doctorid ON dbo.patient_insurances.patient_no = dbo.patient.patient_no LEFT OUTER JOIN
        dbo.address ON dbo.patient.patient_no = dbo.address.patient_no
WHERE   (dbo.patient.patient_no = 355)
GO

/****** Object:  View [dbo].[View_InsReport]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_InsReport]
AS
SELECT	dbo.patient.last_name, 
		dbo.patient.first_name, 
		dbo.patient.mid_name, 
		dbo.patient.birth_date, 
		dbo.address.address1, 
		dbo.address.address2, 
        dbo.address.city, 
		dbo.address.state, 
		dbo.address.zip, 
		dbo.address.phone1, 
		dbo.patient.patient_no, 
		dbo.patient.marital_status, 
        dbo.patient.signature_on_file, 
		dbo.patient.sex, 
		dbo.patient_insurances.insurance_no, 
		dbo.patient_insurances.insured_id, 
        dbo.patient_insurances.policy_group_no, 
		dbo.patient_insurances.iauthorization, 
		dbo.patient_insurances.benefits
FROM    dbo.address INNER JOIN
        dbo.patient ON dbo.address.patient_no = dbo.patient.patient_no INNER JOIN
        dbo.patient_insurances ON dbo.patient.patient_no = dbo.patient_insurances.patient_no
GO

/****** Object:  View [dbo].[View_PatProvInsMatching]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_PatProvInsMatching]
AS
SELECT	DISTINCT 
		patient.patient_no, 
		patient_insurances.insured_id, 
		patient_insurances.policy_group_no, 
		patient_insurances.iauthorization, 
        patient_insurances.benefits, 
		patient_insurances.isDefault, 
		patient_insurances.isDisabled,
		insurance.insurance_name, 
		insurance.insurance_account_no, 
		insurance.payer_id, 
        insurance.payer_Name, 
		insurance.active,
		insurance.insurance_address1, 
		insurance.insurance_address2, 
		insurance.insurance_city, 
		insurance.state_cd, 
        insurance.insurance_zip_cd,  
        doctors.taxid, 
		doctors.npi, 
		ProvidersId.provider_id, 
		ProvidersId.insurance_no AS [pinsurance_no], 
		insurance.Availity, 
		patient_insurances.insurance_no AS [patinsurance_no]
FROM    ProvidersId INNER JOIN
        insurance ON ProvidersId.insurance_no = insurance.insurance_no RIGHT OUTER JOIN
        patient LEFT OUTER JOIN
        patient_insurances ON patient.patient_no = patient_insurances.patient_no LEFT OUTER JOIN
        doctors ON patient.doctorid = doctors.doctorid ON insurance.insurance_no = patient_insurances.insurance_no AND 
        ProvidersId.doctorid = doctors.doctorid
where	not insurance.insurance_name is null
GO

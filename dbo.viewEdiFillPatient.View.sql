/****** Object:  View [dbo].[viewEdiFillPatient]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[viewEdiFillPatient]
AS
SELECT	patient.patient_no,
		patient.last_name, 
		patient.first_name, 
		patient.ss_no, 
		patient_insurances.insurance_no, 
		address.address1, address.address2, 
		address.city, 
        address.state, 
		address.zip, 
		address.phone1, 
		patient.sex, 
		patient.birth_date, 
		patient.employername, 
		patient_insurances.policy_group_no, 
        patient_insurances.insured_id, 
		doctors.description, 
		doctors.address1 AS DrAddress1, 
		doctors.address2 AS DrAddress2, 
		doctors.city as DrCity,
		doctors.state AS DrState, 
		doctors.zip as DrZip,
		doctors.license, 
		doctors.taxid,
		doctors.firstname as docfirstname,
		doctors.lastname as doclastname,
		doctors.middle as docmiddle,
		doctors.npi as docnpi,
		insurance.Availity,
		insurance.insurance_name, 
		insurance.payer_id,
		insurance.payer_Name,
		insurance.insurance_account_no,
		insurance.insurance_address1, 
		insurance.insurance_address2, 
		insurance.insurance_city, 
        insurance.insurance_state, 
		insurance.state_cd, 
		insurance.insurance_zip_cd, 
		insurance.insurance_phone_no,
		insurance.issendprovider
FROM    patient LEFT OUTER JOIN
        patient_insurances ON patient.patient_no = patient_insurances.patient_no and isDefault = 1 LEFT OUTER JOIN
        insurance ON patient_insurances.insurance_no = insurance.insurance_no LEFT OUTER JOIN
        office ON patient.officeid = office.officeid LEFT OUTER JOIN
        doctors ON patient.doctorid = doctors.doctorid LEFT OUTER JOIN
        address ON patient.patient_no = address.patient_no
GO

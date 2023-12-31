/****** Object:  View [dbo].[viewPatient]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[viewPatient]
AS
SELECT	TOP (100) PERCENT 
		patient.patient_no, 
		RTRIM(patient.first_name) + ' ' + RTRIM(patient.last_name) AS [pname], 
		patient.birth_date AS [pbdate], 
        RTRIM(address.address1) + ' ' + RTRIM(address.address2) AS [paddress1], 
		RTRIM(address.city) + ', ' + RTRIM(address.state) + ' ' + RTRIM(address.zip) AS [paddress3], 
		address.phone1, 
		address.phone2, 
		doctors.description AS [dname], 
		RTRIM(doctors.address1) + ' ' + RTRIM(doctors.address2) AS [daddress1], 
		RTRIM(doctors.city) + ',' + RTRIM(doctors.state) + ' ' + RTRIM(doctors.zip) AS [daddress2], 
		insurance.insurance_name AS [iname], 
        RTRIM(insurance.insurance_address1) + ' ' + RTRIM(insurance.insurance_address2) AS [iaddress1], 
		RTRIM(insurance.insurance_city) + ',' + RTRIM(insurance.insurance_state) + ' ' + RTRIM(insurance.insurance_zip_cd) AS [iaddress2], 
		insurance.insurance_contact AS [icontact], 
        insurance.insurance_type AS [itype], 
		insurance.insurance_coverage AS [icoverage], 
		patient_insurances.insured_id,
		patient_insurances.iauthorization, 
        patient_insurances.benefits AS [ibenefits], 
		doctors.address1 AS [dr_address1], 
		doctors.address2 AS [dr_address2], 
		doctors.city AS [dr_city], 
        doctors.state AS [dr_state], 
		doctors.zip AS [dr_zip],
		patient.pcp
FROM    patient LEFT JOIN
        address ON patient.patient_no = address.patient_no LEFT JOIN
        patient_insurances ON patient.patient_no = patient_insurances.patient_no and isdefault = 1 LEFT JOIN
        doctors ON patient.doctorid = doctors.doctorid LEFT JOIN
        insurance ON patient_insurances.insurance_no = insurance.insurance_no
ORDER BY patient.patient_no
GO

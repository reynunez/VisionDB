/****** Object:  StoredProcedure [dbo].[sp_ViewPatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_ViewPatient](@patient_no int) AS
SELECT	TOP 100 PERCENT 
		dbo.patient.patient_no, 
		RTRIM(dbo.patient.first_name) + ' ' + RTRIM(dbo.patient.last_name) AS [pname], 
		CAST(@patient_no as VARCHAR(10)) + '-' + CAST(DATEDIFF ( year , getdate() , dbo.patient.birth_date ) AS VARCHAR(4)) AS [pbdate], 
		dbo.patient.entry_date AS [pedate],
        dbo.patient.ss_no AS [pssn],
		RTRIM(dbo.address.address1) + ' ' + RTRIM(dbo.address.address2) AS paddress1, 
		RTRIM(dbo.address.city) + ', ' + RTRIM(dbo.address.state) + ' ' + RTRIM(dbo.address.zip) AS [paddress3], 
		dbo.address.phone1 AS [phone1], 
		dbo.address.phone2 AS [phone2], 
		dbo.doctors.description AS [dname], 
        RTRIM(dbo.doctors.address1) + ' ' + RTRIM(dbo.doctors.address2) AS [daddress1], 
		RTRIM(dbo.doctors.city) + ',' + RTRIM(dbo.doctors.state) + ' ' + RTRIM(dbo.doctors.zip) AS [daddress2], 
		dbo.doctors.phone as dphone,dbo.insurance.insurance_name AS [iname], 
		RTRIM(dbo.insurance.insurance_address1) + ' ' + RTRIM(dbo.insurance.insurance_address2) AS [iaddress1], 
		RTRIM(dbo.insurance.insurance_city) + ',' + RTRIM(dbo.insurance.insurance_state) + ' ' + RTRIM(dbo.insurance.insurance_zip_cd) AS [iaddress2], 
		dbo.insurance.insurance_contact AS [icontact], 
		dbo.insurance.insurance_type AS [itype], 
        dbo.insurance.insurance_coverage AS [icoverage], 
		dbo.patient_insurances.iauthorization AS [iauthorization],  
		'' as insured_id,   --- DBO.PATIENT_INSURANCES.insured_id,
		dbo.patient.employername AS [pwplace],
        dbo.patient_insurances.benefits AS [ibenefits],
		dbo.insurance.insurance_phone_no as [iphone],
		dbo.patient_insurances.policy_group_no as [igroup],
		dbo.patient.last_office_visit_date AS [last_visit],
		dbo.doctors.address1 AS [dr_address1], 
		dbo.doctors.address2 AS [dr_address2], 
		dbo.doctors.city AS [dr_city], 
	    dbo.doctors.state AS dr_state,dbo.doctors.zip AS [dr_zip],
		dbo.patient.pcp,
		dbo.patient.ethnicity,
		dbo.patient.race,
		dbo.patient.language,
		dbo.patient.officeid
FROM    DBO.PATIENT LEFT JOIN
		DBO.PATIENT_INSURANCES ON dbo.patient_insurances.patient_no = dbo.patient.patient_no AND dbo.patient_insurances.isdefault = 1 LEFT JOIN
		DBO.INSURANCE ON dbo.insurance.insurance_no = dbo.patient_insurances.insurance_no  LEFT JOIN
		DBO.ADDRESS ON dbo.patient.patient_no = dbo.address.patient_no LEFT JOIN
		DBO.DOCTORS ON dbo.patient.doctorid = dbo.doctors.doctorid
WHERE     (dbo.patient.patient_no = @patient_no)
ORDER BY dbo.patient.patient_no
GO

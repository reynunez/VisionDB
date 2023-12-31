/****** Object:  StoredProcedure [dbo].[sp_GetRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetRecord]
@patient_no INT
AS
SELECT	dbo.patient.*,
		dbo.address.address_no, 
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
		(Select top 1 appmtdate from appointment where patient_no = dbo.patient.patient_no and appmtdate <= getdate() order by appmtdate desc) as last_appointment,
		(Select top 1 appmtdate from appointment where patient_no = dbo.patient.patient_no and appmtdate >= getdate() order by appmtdate asc) as next_appointment,
		dbo.office.description AS office_name, 
		dbo.doctors.description AS doctor_name, 
		dbo.insurance.insurance_name,dbo.insurance.insurance_no
FROM    PATIENT LEFT JOIN
		doctors ON patient.doctorid = doctors.doctorid LEFT JOIN
		office ON patient.officeid = office.officeid LEFT JOIN 
		ADDRESS ON address.patient_no = patient.patient_no LEFT JOIN
		patient_insurances ON patient.patient_no = patient_insurances.patient_no AND patient_insurances.isdefault = 1 LEFT JOIN 
		INSURANCE ON insurance.insurance_no = patient_insurances.insurance_no
WHERE	(dbo.patient.patient_no = @patient_no)
order by patient.patient_no
GO

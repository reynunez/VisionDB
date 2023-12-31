/****** Object:  View [dbo].[View_PatInsurance]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_PatInsurance]
AS
SELECT	patient.patient_no, 
		patient_insurances.Ins_no, 
		insurance.insurance_name, 
		patient_insurances.insured_id, 
		patient_insurances.policy_group_no, 
        patient_insurances.iauthorization, 
		patient_insurances.benefits,
		patient_insurances.date_creaated,
		patient_insurances.date_disabled,
		patient.doctorid,
		patient_insurances.insurance_no,
		(	Select top 1 p.Provider_id + ISNULL ((	Select description
													From office
													where officeid = p.officeid
												),'')
			from providersid p 
			where p.doctorid = patient.doctorid 
				and p.insurance_no=patient_insurances.insurance_no
				and p.officeid = patient.officeid
		) as [provider_id],
		(	Select top 1 officeid 
			from providersid p 
			where p.doctorid = patient.doctorid 
				and p.insurance_no=patient_insurances.insurance_no
				and p.officeid = patient.officeid
		) as [provider_officeid],
		isdefault,
		insurance.active,
		insurance.insurance_account_no, 
		insurance.payer_id, 
		 insurance.payer_Name,
		patient_insurances.isDisabled
FROM    insurance LEFT JOIN
        patient_insurances ON insurance.insurance_no = patient_insurances.insurance_no LEFT JOIN
        patient ON patient_insurances.patient_no = patient.patient_no
GO

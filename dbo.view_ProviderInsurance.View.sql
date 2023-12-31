/****** Object:  View [dbo].[view_ProviderInsurance]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_ProviderInsurance]
AS
SELECT	doctors.doctorid, 
		doctors.description, 
		doctors.address1, 
		doctors.address2, 
		doctors.city, 
		doctors.state, 
		doctors.zip, 
		doctors.phone,
		doctors.taxid, 
		office.description as [office],
		ProvidersId.insurance_no, 
		insurance.insurance_name, 
		ProvidersId.provider_id, 
		insurance.insurance_address1, 
		insurance.insurance_address2, 
        insurance.insurance_city, 
		insurance.insurance_state, 
		insurance.state_cd, 
		insurance.insurance_account_no, 
		insurance.Availity,
		insurance.insurance_coverage, 
		insurance.insurance_type, 
		insurance.salestax
FROM    doctors INNER JOIN
        ProvidersId ON doctors.doctorid = ProvidersId.doctorid LEFT JOIN
        insurance ON ProvidersId.insurance_no = insurance.insurance_no LEFT JOIN
		office on ProvidersId.officeid = office.officeid
GO

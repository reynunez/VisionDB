/****** Object:  View [dbo].[v_patientsearchlist]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_patientsearchlist]
AS
	Select	DISTINCT
			p.patient_no
			,rtrim(ltrim(p.first_name)) + ' ' + rtrim(ltrim(p.last_name)) as patient_name
			,p.first_name
			,p.mid_name
			,p.last_name
			,p.birth_date
			,a.phone1 as cell_phone
			,a.address1 as address
			,a.zip
			,p.eMail_address
			,p.last_office_visit_date
			,dbo.udf_GetNumeric(a.phone1) as phone1
			,active 
	from	patient p
			left join address a on a.patient_no = p.patient_no
GO

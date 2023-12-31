/****** Object:  View [dbo].[v_patient_diagnosis]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_patient_diagnosis] AS
Select  distinct
		pd.patient_no,
		pd.patdiagcode,
		pd.diag_date,
		di.group_cd,
		di.user_cd as diagnosis_code,
		di.user_cd as code,
		di.user_cd,
		di.diagnosis_descr,
		di.diagnosis_descr as description,
		di.diag_plan,
		pd.comments,
		pd.diag_start,
		pd.diag_end,
		pd.cd_key,
		di.is_icd10 
From	patient_diagnosis pd join 
		v_diagnosis_join di ON pd.user_cd = di.user_cd 

GO

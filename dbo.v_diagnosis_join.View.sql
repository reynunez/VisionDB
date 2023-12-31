/****** Object:  View [dbo].[v_diagnosis_join]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_diagnosis_join] AS
Select	diagnosis_cd,
		diagnosis_descr,
		substring(user_cd,1,3) as group_cd,
		user_cd,
		diag_plan,
		0 as is_icd10 
from	diagnosis_join 
where	diagnosis_cd < 3000 
UNION
select	d.diagnosis_id as diagnosis_cd,
		d.long_description as diagnosis_descr,
		d.group_code as group_cd,
		d.icd_code as user_cd,
		p.diag_plan,
		1 as is_icd10 
from	[dbo].[tbl_icd_codes] d
		LEFT JOIN diagnosis_plans p ON p.icd_code = d.icd_code

GO

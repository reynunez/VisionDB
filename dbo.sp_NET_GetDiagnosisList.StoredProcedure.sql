/****** Object:  StoredProcedure [dbo].[sp_NET_GetDiagnosisList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/01/2020
-- Description: Get Diagnosis List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDiagnosisList]
(
	@diaglist varchar(max) = ''
)
AS
BEGIN

    Select	d.icd_code AS ICD_CODE
			,d.short_description AS DESCRIPTION
			,coalesce(p.diag_plan,'') as diag_plan
			,d.diagnosis_id as order_no
	from	tbl_icd_codes d
			left join diagnosis_plans p on d.icd_code = p.icd_code 
	where	d.icd_code IN(select item from SplitString(@diaglist,','))

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_AllICDCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get Opt/Opht Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_AllICDCodes](
	@icd_code VARCHAR(2000) = ''
)
AS
BEGIN

    SET NOCOUNT ON;

	declare @SQL_Statement NVARCHAR(2500);

	SET @SQL_Statement = '
			Select	d.icd_code as ICD_CODE
					,d.short_description as DESCRIPTION
					,p.diag_plan as diag_plan
					,d.DIAGNOSIS_ID
			from	tbl_icd_codes d
					LEFT JOIN diagnosis_plans p ON d.icd_code = p.icd_code
			where	1=1
					and d.icd_code like ''%' + @icd_code + '%'' 
					or d.short_description like ''%' + @icd_code + '%'' 
			ORDER BY d.icd_code,d.short_description 
	';

	Exec sp_executesql @SQL_Statement;

END
GO

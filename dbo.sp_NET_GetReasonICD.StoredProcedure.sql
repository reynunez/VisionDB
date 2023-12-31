/****** Object:  StoredProcedure [dbo].[sp_NET_GetReasonICD]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/22/2020
-- Description:	Appointment Reasons ICD List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetReasonICD](
	@reasonid INT
)
AS
BEGIN

	SET NOCOUNT ON;

  SELECT	DISTINCT
			TR.reasonid 
			,TR.acronym 
			,TRC.icd_code 
			,ICD.short_description as description
			,p.diag_plan
  FROM		TBLREASON TR 
			JOIN tblreasoncodes TRC ON TR.reasonid = TRC.reasonid 
			JOIN tbl_icd_codes ICD ON ICD.icd_code = TRC.icd_code 
			JOIN diagnosis_plans p ON p.icd_code = ICD.icd_code
  WHERE		TR.reasonid = @reasonid
		

END
GO

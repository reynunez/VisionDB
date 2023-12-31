/****** Object:  StoredProcedure [dbo].[sp_NET_GetPcpQuestions]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/01/2020
-- Description: Get PCP Questions
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPcpQuestions]
(
	@patient_no int
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @DIAB INT,
			@CDIAB INT,
			@GLAUC INT
	
	Select	TOP 1 @DIAB = LEN(icd.ICD_CODE)
	from	patient_diagnosis pd LEFT JOIN
			tbl_icd_codes icd on pd.user_cd  = icd.icd_code 
	where	pd.patient_no = @patient_no
			AND icd.group_code IN('E10','E11');

	Select	TOP 1 @CDIAB = LEN(icd.ICD_CODE)
	from	patient_diagnosis pd LEFT JOIN
			tbl_icd_codes icd on pd.user_cd  = icd.icd_code 
	where	pd.patient_no = @patient_no
			AND ((icd.icd_code between 'E10.311' and 'E10.3599') 
			or (icd.icd_code between 'E11.311' and 'E11.3599'));

	Select	TOP 1 @GLAUC = LEN(icd.ICD_CODE)
	from	patient_diagnosis pd LEFT JOIN
			tbl_icd_codes icd on pd.user_cd  = icd.icd_code 
	where	pd.patient_no = @patient_no
			AND icd.group_code = 'H40';

	SELECT CASE WHEN (@DIAB>0) THEN 'YES' ELSE 'NO' END AS DIABETES,
		   CASE WHEN (@CDIAB>0) THEN 'YES' ELSE 'NO' END AS CHRONIC_DIABETES,
		   CASE WHEN (@GLAUC>0) THEN 'YES' ELSE 'NO' END AS GLAUCOMA;

END
GO

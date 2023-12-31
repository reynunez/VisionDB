/****** Object:  StoredProcedure [dbo].[sp_getPatientDiagnosis]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2017-09-04
-- Description:	Get Patient Diagnosis
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientDiagnosis]( 
	@patient_no int
)
AS
BEGIN

	Select CONVERT(varchar,diag_date,101) + ' - ' + diagnosis_descr as diagnosis
	From v_patient_diagnosis 
	Where Patient_no = @patient_no
	order by diag_date desc

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientDiagList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/01/2020
-- Description: Get Diagnosis List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientDiagList]
(
	@patient_no int
)
AS
BEGIN

    SET NOCOUNT ON

	Select  distinct
			di.user_cd as code,
			di.diagnosis_descr as description,
			di.diag_plan,
			pd.diag_date,
			pd.diag_start,
			pd.diag_end,
			di.diagnosis_cd as order_no
	From	patient_diagnosis pd left join 
			v_diagnosis_join di ON pd.user_cd = di.user_cd 
	where	pd.patient_no = @patient_no
	order	by di.user_cd desc
END
GO

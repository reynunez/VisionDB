/****** Object:  StoredProcedure [dbo].[sp_NET_SaveDiagPlan]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/01/2020
-- Description: Save Diagnosis Plan
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_SaveDiagPlan]
(
	@diag_plan varchar(max),
	@icd_code varchar(20)
)
AS
BEGIN

    SET NOCOUNT ON

	if EXISTS(SELECT icd_code FROM diagnosis_plans WHERE icd_code = @icd_code) BEGIN
		Update	diagnosis_plans 
		set		diag_plan = @diag_plan 
		where	icd_code = @icd_code
	END 
	ELSE BEGIN
		INSERT INTO diagnosis_plans
		SELECT @icd_code AS icd_code,@diag_plan as diag__plan 
	END

END
GO

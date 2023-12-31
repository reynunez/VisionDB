/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsListbyPatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/21/2020
-- Description:	Get Insurances by Patient
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsListbyPatient]
	@PATIENT_NO INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select	distinct
			ins_no
			,insurance_name
	from	View_PatInsurance
	where	patient_no = @PATIENT_NO
	order	by ins_no

END
GO

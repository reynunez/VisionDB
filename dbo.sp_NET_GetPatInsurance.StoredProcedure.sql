/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatInsurance]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/22/2020
-- Description:	Get Patient Insurance list
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatInsurance] 
	@PATIENT_NO INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @PATIENT_NO <> 0 BEGIN
		Select	distinct
				insurance_no
				,insurance_name
				,insured_id 
		from	View_PatInsurance
		where	patient_no = @PATIENT_NO;
	END
	ELSE BEGIN
		Select	distinct
				insurance_no
				,insurance_name
		from	insurance
		where	active = 1;
	END
END
GO

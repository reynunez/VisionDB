/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientInsuranceList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/05/2022
-- Description:	Get Patient Insurance List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientInsuranceList]
	@patient_no INTEGER
AS
BEGIN
	SET NOCOUNT ON;

	Select	DISTINCT
			Ins_no
			,insurance_name
	from	View_PatInsurance 
	where	patient_no = @patient_no 

END
GO

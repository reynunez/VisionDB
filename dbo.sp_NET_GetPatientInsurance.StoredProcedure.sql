/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientInsurance]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/30/2020
-- Description:	Get Patient Insurance Info
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientInsurance]
	@patient_no INTEGER = 0
AS
BEGIN
	SET NOCOUNT ON;
	IF @patient_no > 0 BEGIN
		Select	DISTINCT
				Ins_no
				,insurance_name
				,COALESCE(insured_id,'') AS insured_id
				,COALESCE(policy_group_no,'') AS Policy_group_no
				,Ins_no as insurance_no 
				,date_creaated
				,date_disabled
				,isdefault
		from	View_PatInsurance 
		where	patient_no = @patient_no 
	END
	ELSE BEGIN
		Select	DISTINCT
				Ins_no 
				,insurance_name
		from	View_PatInsurance
	END
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientInsurances]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/12/2020
-- Description:	Get Patient Insurance
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientInsurances] 
	@Patient_no integer
AS
BEGIN
	select	ins_no as insuranceid
			,insured_id
			,policy_group_no
			,iauthorization
			,benefits
			,CASE WHEN isDefault=0 THEN 'No' ELSE 'Yes' END as isdefault
			,CASE WHEN isDisabled=0 THEN 'No' ELSE 'Yes' END as isdisabled
	from	View_PatInsurance
	where	patient_no = @patient_no
END
GO

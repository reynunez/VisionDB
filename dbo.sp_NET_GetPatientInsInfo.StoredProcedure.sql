/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientInsInfo]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 03/01/2021
-- Description: Get Patient Insurance Information
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientInsInfo](
	@patient_no INT,
	@insurance_no INT
)
AS

BEGIN

	Select	pi.insured_id 
			,pi.policy_group_no 
			,pi.isDisabled 
			,pi.date_disabled 
			,i.insurance_name 
			,CASE WHEN i.insurance_type = 1 THEN 1 ELSE 0 END AS IsMedicare
			,(select description from instype where instypeid = i.insurance_type ) as insurance_type
	from	patient_insurances pi 
			join insurance i on i.insurance_no = pi.insurance_no 
	where	pi.patient_no = @patient_no
			and pi.insurance_no = @insurance_no

END
GO

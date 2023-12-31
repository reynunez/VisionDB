/****** Object:  StoredProcedure [dbo].[sp_NET_GetOboardingWeb]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 2023-03-11
-- Description: Get OnBoarding Data for Web Form
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOboardingWeb]
(
	@PATIENT_NO int
)
AS
BEGIN

    SET NOCOUNT ON
	Select	o.* 
			,CASE WHEN o.patient_no IS NULL THEN 1 ELSE 0 END isNew
			,pc.description as primarycare
			,ph.description as pharmacy
			,op.description as ophthalmologist
	from	tblonboarding  o
			left join ext_doctors pc on o.primarycid = pc.doctorid
			left join ext_doctors ph on o.pharmid = ph.doctorid
			left join ext_doctors op on o.ophthid  = op.doctorid
	where	patient_no = @PATIENT_NO
END
GO

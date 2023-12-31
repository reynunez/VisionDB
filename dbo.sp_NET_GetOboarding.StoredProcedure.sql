/****** Object:  StoredProcedure [dbo].[sp_NET_GetOboarding]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/07/2020
-- Description: Get OnBoarding Data
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOboarding]
(
	@PATIENT_NO int
)
AS
BEGIN

    SET NOCOUNT ON
	Select	o.* 
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

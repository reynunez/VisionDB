/****** Object:  StoredProcedure [dbo].[sp_NET_GetThHistory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/26/2020
-- Description: Get Therapeautics History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetThHistory](
	@patient_no as integer
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	Th.tradename,
			Th.generic,
			Th.Manufacturer,
			Th.preparation ,
			Th.sig,
			cast(PH.prescdate as date) as prescdate,
			PH.doctor,
			PH.prescid
	from	prescheader PH
			join prescTH Th on Th.prescid = PH.prescid and PH.void = 0
	where	PH.patient_no = @patient_no
			and PH.presctype = 3
	Order	By PH.prescdate DESC

END
GO

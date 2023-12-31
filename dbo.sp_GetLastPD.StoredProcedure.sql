/****** Object:  StoredProcedure [dbo].[sp_GetLastPD]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/19/2017
-- Description:	Get last PD to Compare
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLastPD](
	@patient_no int
)
AS
BEGIN
	Select	top 1
			poph.distpdr,
			poph.distpdl,
			poph.nearpdr,
			poph.nearpdl
	from	prescheader	ph inner join
			prescoph poph ON ph.prescid = poph.prescid
	where	patient_no = @patient_no
			and poph.presctype = 'Spectacle Rx'
			and ph.void = 0
	order	by prescdate desc
END
GO

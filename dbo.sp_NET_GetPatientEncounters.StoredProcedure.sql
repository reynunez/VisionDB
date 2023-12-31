/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientEncounters]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/27/2020
-- Description:	Procedure to get Appoinmtnet List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientEncounters] (
	@patient_no int
)
as

BEGIN
	SET NOCOUNT ON;

	Select	distinct 
			convert(date,prescdate ,101) as encounterdate
	from	prescheader  
	where	patient_no = @patient_no
	order	by convert(date,prescdate ,101) desc;

END
GO

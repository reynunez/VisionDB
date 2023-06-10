/****** Object:  StoredProcedure [dbo].[sp_NET_GetDoctorRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2022
-- Description:	Get Doctor Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDoctorRecord]
	@doctorid INT
AS
BEGIN

	Select	*
	from	doctors
	where	doctorid = @doctorid 

END
GO

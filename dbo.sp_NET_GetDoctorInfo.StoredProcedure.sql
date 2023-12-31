/****** Object:  StoredProcedure [dbo].[sp_NET_GetDoctorInfo]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/23/2020
-- Description:	Procedure to get Doctor Info
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDoctorInfo] 
	@doctorid INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	  FROM dbo.doctors
	  WHERE	doctorid = @doctorid
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GETDoctorID]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/24/2020
-- Description:Get DoctorID
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GETDoctorID]
	@description varchar(100)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [doctorid]
	FROM [dbo].[doctors]
	WHERE DESCRIPTION = @description;
END
GO

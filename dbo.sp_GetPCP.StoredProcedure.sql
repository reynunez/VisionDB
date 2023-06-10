/****** Object:  StoredProcedure [dbo].[sp_GetPCP]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/23/2017
-- Description: Get PCP
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPCP]
AS
BEGIN
	Select doctorid,description from dbo.ext_doctors where specialtyid = 1 order by description;
END
GO

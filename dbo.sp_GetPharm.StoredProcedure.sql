/****** Object:  StoredProcedure [dbo].[sp_GetPharm]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/23/2017
-- Description: Get Pharmacy
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPharm]
AS
BEGIN
	Select doctorid,description from dbo.ext_doctors where specialtyid = 3 order by description;
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetThSubCategory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/15/2020
-- Description: Get Therapeutics subCategory
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetThSubCategory]
AS
BEGIN

    SET NOCOUNT ON

	Select distinct subcategory from druglist where not subcategory is null and subcategory  <> ''

END
GO

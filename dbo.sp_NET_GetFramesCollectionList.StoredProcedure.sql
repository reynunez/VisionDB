/****** Object:  StoredProcedure [dbo].[sp_NET_GetFramesCollectionList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 2023-04-24
-- Description:Get Frames Collections List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetFramesCollectionList]
AS
BEGIN

    SET NOCOUNT ON;

    SELECT	collectionid
			,collection_name
	FROM	tblCollections
	order by collectionid desc

END
GO

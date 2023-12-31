/****** Object:  StoredProcedure [dbo].[sp_NET_GetFramesCollection]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 2023-04-23
-- Description:Get Frames Collections
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetFramesCollection]
AS
BEGIN

    SET NOCOUNT ON;

    SELECT	collection_name
			,manufacturer_name + '|' + cast(min_price as varchar(20)) + '|' + cast(max_price as varchar(20)) as cargo
	FROM	tblCollections
	where active = 1
	order by collection_name

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetCollection]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 2023-04-24
-- Description:Get Collection Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCollection](
	@collectionid int
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	*
	From	tblCollections
	Where	collectionid = @collectionid

END
GO

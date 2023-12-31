/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertCollection]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-04-24
-- Description:	Insert/Update Collection
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertCollection](
	@collectionid INT
	,@collection_name VARCHAR(100)
	,@manufacturer_name VARCHAR(100)
	,@min_price numeric(18,2)
	,@max_price numeric(18,2)
	,@active bit

)
AS
BEGIN
	IF @collectionid = 0 BEGIN
			Insert into tblCollections(
					collection_name
					,manufacturer_name 
					,min_price
					,max_price 
					,active 
					)
			Values(
					@collection_name 
					,@manufacturer_name
					,@min_price 
					,@max_price 
					,@active 
			)
	END
	ELSE BEGIN

		Update tblCollections
			Set collection_name = @collection_name 
			,manufacturer_name = @manufacturer_name
			,min_price = @min_price
			,max_price = @max_price
			,active = @active
		WHERE collectionid = @collectionid 
	END

END
GO

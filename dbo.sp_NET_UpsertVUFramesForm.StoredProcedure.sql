/****** Object:  StoredProcedure [dbo].[sp_NET_UpsertVUFramesForm]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-05-26
-- Description:	Add/Update VU Frames Form
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpsertVUFramesForm](
	@frameid int = 0,
	@collectionName varchar(100) ,
	@styleName varchar(100) ,
	@colordescription varchar(100) ,
	@A numeric(18, 2) ,
	@DBL numeric(18, 2) ,
	@B numeric(18, 2) ,
	@ED numeric(18, 2) ,
	@rimType varchar(100) ,
	@CompletePrice numeric(18, 2) 
) As

BEGIN
	
	DECLARE @manufacturerName varchar(100)
	SELECT TOP 1 @manufacturerName = manufacturer_name from tblCollections where collection_name = @collectionName

	IF @frameid = 0 BEGIN
		INSERT INTO tblVUFrames(
								manufacturerName,
								collectionName,
								styleName,
								colordescription,
								A,
								DBL,
								B,
								ED,
								rimType,
								CompletePrice,
								date_created,
								date_updated
								)
						Values(
								@manufacturerName,
								@collectionName,
								@styleName,
								@colordescription,
								@A,
								@DBL,
								@B,
								@ED,
								@rimType,
								@CompletePrice,
								DATEADD(hh,-5,getdate()),
								DATEADD(hh,-5,getdate())
						)
		SELECT TOP 1 @FRAMEID = FRAMEID FROM tblVUFrames ORDER BY FRAMEID DESC
	END 
	ELSE BEGIN
		UPDATE tblVUFrames
		SET manufacturerName = @manufacturerName,
			collectionName = @collectionName,
			styleName = @styleName,
			colordescription = @colordescription,
			A = @A,
			DBL = @DBL,
			B = @B,
			ED = @ED,
			rimType = @rimType,
			CompletePrice = @CompletePrice,
			date_updated = DATEADD(hh,-5,getdate())
		WHERE frameid = @frameid
	END

END
GO

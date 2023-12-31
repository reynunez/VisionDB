/****** Object:  StoredProcedure [dbo].[sp_NET_UpsertVUFrames]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-04-26
-- Description:	Add/Update VU Frames
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpsertVUFrames](
	@manufacturerName varchar(100) ,
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
	
	DECLARE @FRAMEID INT

	SELECT	@FRAMEID = frameid
	FROM	tblVUFrames
	WHERE	1=1
			AND manufacturerName = @manufacturerName
			AND collectionName = @collectionName
			AND styleName = @styleName
			AND colordescription = @colordescription
			AND A = @A
			AND DBL = @DBL
			AND B = @B
			AND ED = @ED
			AND rimType = @rimType

	IF @FRAMEID IS NULL BEGIN
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
		SET CompletePrice = @CompletePrice,
			date_updated = DATEADD(hh,-5,getdate())
		WHERE FRAMEID = @FRAMEID
	END

	SELECT @FRAMEID AS FRAMEID

END
GO

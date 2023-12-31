/****** Object:  StoredProcedure [dbo].[sp_NET_IsFrameExists]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-04-26
-- Description:	Add/Update VU Frames
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_IsFrameExists](
	@collectionName varchar(100) ,
	@styleName varchar(100) ,
	@colordescription varchar(100) ,
	@A numeric(18, 2) ,
	@DBL numeric(18, 2) ,
	@B numeric(18, 2) ,
	@ED numeric(18, 2) ,
	@rimType varchar(100)
) As

BEGIN
	
	DECLARE @FRAMEID INT

	SELECT	@FRAMEID = frameid
	FROM	tblVUFrames
	WHERE	1=1
			AND collectionName = @collectionName
			AND styleName = @styleName
			AND colordescription = @colordescription
			AND A = @A
			AND DBL = @DBL
			AND B = @B
			AND ED = @ED
			AND rimType = @rimType

	IF @FRAMEID IS NULL BEGIN
		SELECT 0 AS FRAMEEXISTS
	END
	ELSE BEGIN
		SELECT 1 AS FRAMEEXISTS
	END 

END
GO

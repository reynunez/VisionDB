/****** Object:  StoredProcedure [dbo].[sp_GetSourceFrameData]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetSourceFrameData]
@fpcID NVARCHAR (14), @haveCase BIT=0, @officeid INT
AS
BEGIN
 Insert into framesStockData(
   fpcID,
   officeid,
   manufacturerName,
   collectionName,
   styleName,
   styleNew,
   colordescription,
   colorCode,
   A,
   DBL,
   DBC,
   B,
   ED,
   temple,
   rimType,
   material,
   circunference,
   eye,
   frameShape,
   markup,
   completeprice,
   upc,
   havecase)
 Select fpcID,
   @officeid,
   manufacturerName,
   collectionName,
   styleName,
   styleNew,
   colordescription,
   colorCode,
   A,
   DBL,
   DBC,
   B,
   ED,
   temple,
   rimType,
   material,
   circunference,
   eye,
   frameShape,
   markup,
   completeprice,
   upc,
   @haveCase as [havecase]
 from FramesData
 Where fpcID = @fpcID
   and not exists(Select * from framesstockdata where fpcID = @fpcID and officeid = @officeid)
END
GO

/****** Object:  StoredProcedure [dbo].[sp_GetTace]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetTace]
@frameid INT
AS
SELECT	trace
FROM    tblVUFrames
WHERE	frameid = @frameid
GO

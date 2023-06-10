/****** Object:  StoredProcedure [dbo].[sp_NET_DeleteFrame]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-05-26
-- Description: Delete Frame
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_DeleteFrame](
	@frameid int = 0
) As
BEGIN
	
	Delete from tblVUFrames where frameid = @frameid

END
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertTraceFile]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/17/2023
-- Description:	Link trace file to frame
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertTraceFile](
	@frameid int,
	@traceContents varchar(max)
)
AS
BEGIN
	Update tblVUFrames
	set trace = @traceContents
	where frameid = @frameid
END
GO

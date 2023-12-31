/****** Object:  StoredProcedure [dbo].[sp_TaskInProgress]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/19/2014
-- Description:	In Progress Task
-- =============================================
CREATE PROCEDURE [dbo].[sp_TaskInProgress]
	@taskid integer,
	@changedby integer
AS
BEGIN
	Update vomtasks
	Set statusid = 2,
		dateupdated = dateadd(Hh,-5,current_timestamp),
		changedby = @changedby,
		ended = NULL
	Where taskid = @taskid
END
GO

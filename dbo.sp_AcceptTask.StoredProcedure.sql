/****** Object:  StoredProcedure [dbo].[sp_AcceptTask]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/19/2014
-- Description:	Accept Task
-- =============================================
CREATE PROCEDURE [dbo].[sp_AcceptTask] 
	@taskid integer,
	@changedby integer
AS
BEGIN
	Update vomtasks
	Set accepted = 1,
		started = dateadd(Hh,-5,current_timestamp),
		dateupdated = dateadd(Hh,-5,current_timestamp),
		changedby = @changedby,
		statusid = 2
	Where taskid = @taskid
END
GO

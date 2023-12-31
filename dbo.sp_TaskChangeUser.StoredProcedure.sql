/****** Object:  StoredProcedure [dbo].[sp_TaskChangeUser]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/19/2014
-- Description:	Change Task User
-- =============================================
CREATE PROCEDURE [dbo].[sp_TaskChangeUser]
	@taskid integer,
	@assignto integer,
	@changedby integer
AS
BEGIN
	Update vomtasks
	Set statusid = 2,
		dateupdated = dateadd(Hh,-5,current_timestamp),
		changedby = @changedby,
		assignto = @assignto,
		accepted = 0,
		started = NULL,
		ended = NULL
	Where taskid = @taskid
END
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateTask]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/05/2014
-- Description:	Task Insert/Update Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdateTask] 
	@taskid int,
	@taskdescription nvarchar(100),
	@assignfrom int,
	@assignto int,
	@area nvarchar(50),
	@areaid int,
	@areatext TEXT,
	@priorityid int,
	@statusid int,
	@comments text
AS
BEGIN
	IF (@taskid = 0) BEGIN
		Insert into dbo.vomtasks
		Select @taskdescription,@assignfrom,@assignto,@area,@areaid,@areatext,@priorityid,@statusid,@comments,dateadd(Hh,-5,current_timestamp),dateadd(Hh,-5,current_timestamp),0,NULL,NULL,@assignfrom
	END
	ELSE BEGIN
		Update dbo.vomtasks
		Set taskdescription = @taskdescription,
			assignfrom = @assignfrom,
			assignto = @assignto,
			area = @area,
			areaid = @areaid,
			areatext = @areatext,
			priorityid = @priorityid,
			statusid = @statusid,
			comments = @comments
		Where taskid = @taskid
	END
END
GO

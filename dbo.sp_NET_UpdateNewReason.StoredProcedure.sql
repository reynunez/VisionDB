/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateNewReason]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/18/2020
-- Description: Update Reason Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateNewReason]
(
	@name varchar(100)
	,@acronym varchar(25)
	,@description varchar(250)
	,@time_frame varchar(25)
	,@system varchar(25)
	,@active bit
	,@reasonid int
)
AS
BEGIN
	Update tblreason
	set name = @name
		,acronym = @acronym
		,description = @description
		,time_frame = @time_frame
		,system = @system
		,active = @active
	where reasonid = @reasonid
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_InsertNewReason]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/18/2020
-- Description: Insert Reason Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertNewReason]
(
	@name varchar(100)
	,@acronym varchar(25)
	,@description varchar(250)
	,@time_frame varchar(25)
	,@system varchar(25)
	,@active bit
)
AS
BEGIN
	Insert	into tblreason(
		name
		,acronym
		,description
		,time_frame
		,system
		,active
		)
	Values(
		@name
		,@acronym
		,@description
		,@time_frame
		,@system
		,@active
		)
END
GO

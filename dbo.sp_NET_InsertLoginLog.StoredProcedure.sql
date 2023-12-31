/****** Object:  StoredProcedure [dbo].[sp_NET_InsertLoginLog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 02-07-2022
-- Description: Insert Login Log
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertLoginLog]
(
		@login_user varchar(200),
		@login_appversion varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON

	Insert into tbl_loginlogs(
		login_user,
		login_timestamp,
		login_appversion
		)
	Values(
		@login_user,
		DATEADD(hh,-5,getdate()),
		@login_appversion
		)
END
GO

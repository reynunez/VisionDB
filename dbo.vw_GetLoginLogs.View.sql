/****** Object:  View [dbo].[vw_GetLoginLogs]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_GetLoginLogs]
as
select	distinct
		login_user,
		cast(login_timestamp as date) as loginDate,
		login_appversion 
from	tbl_loginlogs
GO

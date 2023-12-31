/****** Object:  View [dbo].[vw_onlineReference]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW  [dbo].[vw_onlineReference] AS

Select	id,
		dbo.DecryptString(username,79) as username,
		dbo.DecryptString(userlogin,76) as userlogin,
		dbo.DecryptString(userreference,82) as userreference,
		app_001,
		app_002,
		app_003,
		app_004,
		app_005,
		app_006,
		app_007,
		orders_001,
		orders_002,
		orders_003,
		orders_004,
		patients,
		inventory_001,
		reports_001,
		reports_002,
		pat_001,
		pat_002,
		pat_003,
		pat_004,
		pat_005,
		pat_006,
		pat_007,
		pat_008,
		isActive,
		dbo.DecryptString(position,85) as position,
		dbo.DecryptString(location,85) as location
from	onlinereference
where	id <> 1




GO

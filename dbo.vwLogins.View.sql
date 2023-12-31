/****** Object:  View [dbo].[vwLogins]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwLogins]
AS
Select dbo.DecryptString(UserName,76) as UserName,
  dbo.DecryptString(UserLogin,76) as LoginName, 
  dbo.DecryptString(UserPosition,76) as Position,
  CheckInDateTime,
  CheckOutDateTime,
  isnull(dbo.GetOfficeName(clocation),'NA') as Office,
  isnull(dbo.GetOfficeIP(LocationID ),'NA') as IPAddress
from dbo.tblVOMMaBIT
Where id > 1
GO

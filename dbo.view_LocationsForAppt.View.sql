/****** Object:  View [dbo].[view_LocationsForAppt]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE VIEW [dbo].[view_LocationsForAppt]
AS
Select *
From Office
Where isOperational = 1
GO

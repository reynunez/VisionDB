/****** Object:  View [dbo].[view_Locations]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE VIEW [dbo].[view_Locations]
AS
Select *
From Office
Where officeid <> 20 and isOperational = 1
GO

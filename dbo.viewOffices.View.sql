/****** Object:  View [dbo].[viewOffices]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewOffices]
AS
SELECT TOP 100 PERCENT 
		officeid, 
		description
FROM    dbo.office
ORDER BY description
GO

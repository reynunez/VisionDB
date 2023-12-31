/****** Object:  View [dbo].[view_ProvList]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_ProvList]
AS
SELECT	TOP 100 PERCENT 
		doctorid AS [code], 
		description
FROM    dbo.doctors
where	isactive = 1
ORDER BY description
GO

/****** Object:  View [dbo].[view_InvProviders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_InvProviders]
AS
SELECT	doctorid AS [code], 
		description
FROM    dbo.doctors
Union
SELECT	salesmanid AS [code], 
		name AS description
FROM    dbo.salespeople
GO

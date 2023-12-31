/****** Object:  View [dbo].[view_Services]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_Services]
AS
SELECT	dbo.servcategories.servcat, 
		dbo.servcategories.description, 
		dbo.services.servid, 
		dbo.services.servdesc, 
		dbo.services.np, dbo.services.ep, 
        dbo.services.cpt, 
		dbo.services.fee, 
		dbo.services.taxable
FROM    dbo.servcategories INNER JOIN
        dbo.services ON dbo.servcategories.servcat = dbo.services.servcat
GO

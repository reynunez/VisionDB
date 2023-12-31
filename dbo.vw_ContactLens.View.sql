/****** Object:  View [dbo].[vw_ContactLens]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ContactLens]
AS
SELECT	dbo.contactlens.clid, 
		dbo.contactlens.manufacturername, 
		dbo.contactlens.clname, 
		dbo.contactlens.cost, 
		dbo.contactlens.[list price], 
		dbo.contactlens.trial, 
        dbo.lenstype.description AS [stb_desc], 
		dbo.contactlens.stb, 
		dbo.contactlens.bc, 
		dbo.contactlens.sph, 
		dbo.contactlens.cyl,
		dbo.contactlens.axs, 
		dbo.contactlens.cladd, 
        dbo.trial.description AS [istrial_desc], 
		dbo.contactlens.istrial, 
		dbo.contactlens.color,
		dbo.contactlens.upcc,
		'R' as [Eye]
FROM    dbo.contactlens INNER JOIN
        dbo.lenstype ON dbo.contactlens.stb = dbo.lenstype.value INNER JOIN
        dbo.trial ON dbo.contactlens.istrial = dbo.trial.value
GO

/****** Object:  View [dbo].[view_invdetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_invdetails]
AS
SELECT	dbo.invdetails.invoiceid, 
		dbo.invdetails.servcat, 
		dbo.servcategories.description AS [catdesc], 
		dbo.invdetails.servid, 
		dbo.services.servdesc, 
        dbo.invdetails.quantity, 
		dbo.invdetails.fee, 
		(dbo.invdetails.quantity * dbo.invdetails.fee) AS [total]
FROM    dbo.invdetails INNER JOIN
        dbo.servcategories ON dbo.invdetails.servcat = dbo.servcategories.servcat INNER JOIN
        dbo.services ON dbo.invdetails.servid = dbo.services.servid
GO

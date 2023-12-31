/****** Object:  View [dbo].[view_invoicelist]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_invoicelist]
AS
SELECT	TOP 100 PERCENT 
		dbo.view_invoicetotals.invoiceid AS [invoiceno], 
		dbo.view_invoicetotals.invdate AS [postdate], 
        dbo.view_invoicetotals.total AS [invtotal], 
		ISNULL(dbo.view_Invpayments.sumPayments, 0) AS [payments], 
        (dbo.view_invoicetotals.total - ISNULL(dbo.view_Invpayments.sumPayments, 0)) AS [Balance], 
		dbo.View_PatAddr.Name, 
		dbo.View_PatAddr.address, 
        dbo.View_PatAddr.city, 
		dbo.View_PatAddr.state, 
		dbo.View_PatAddr.zip, 
		DATEDIFF(dd, dbo.view_invoicetotals.invdate, GETDATE()) AS [agingdays], 
        dbo.AgingDesc(DATEDIFF(dd, dbo.view_invoicetotals.invdate, GETDATE())) AS [status], 
		dbo.view_invoicetotals.shipping, 
		dbo.view_invoicetotals.tax, 
        dbo.view_invoicetotals.salesperson
FROM    dbo.view_invoicetotals INNER JOIN
        dbo.View_PatAddr ON dbo.view_invoicetotals.patient_no = dbo.View_PatAddr.patient_no LEFT OUTER JOIN
        dbo.view_Invpayments ON dbo.view_invoicetotals.invoiceid = dbo.view_Invpayments.invoiceid
ORDER BY dbo.view_invoicetotals.invoiceid
GO

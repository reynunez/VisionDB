/****** Object:  View [dbo].[view_invoicetotals]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_invoicetotals]
AS
SELECT	dbo.invoices.invoiceid, 
		dbo.invoices.invdate, 
		dbo.invoices.patient_no, 
		SUM(dbo.invdetails.quantity * dbo.invdetails.fee) AS [subtotal], 
        dbo.invoices.shipping, 
		dbo.invoices.tax, 
		SUM(dbo.invdetails.quantity * dbo.invdetails.fee) + dbo.invoices.shipping + dbo.invoices.tax AS [total], 
        dbo.salespeople.name AS [salesperson]
FROM    dbo.invoices INNER JOIN
        dbo.invdetails ON dbo.invoices.invoiceid = dbo.invdetails.invoiceid INNER JOIN
        dbo.salespeople ON dbo.invoices.salesmanid = dbo.salespeople.salesmanid
GROUP BY dbo.invoices.invoiceid, dbo.invoices.invdate, dbo.invoices.patient_no, dbo.invoices.shipping, dbo.invoices.tax, dbo.salespeople.name
GO

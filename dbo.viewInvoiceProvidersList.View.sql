/****** Object:  View [dbo].[viewInvoiceProvidersList]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewInvoiceProvidersList]
AS
SELECT	TOP 100 PERCENT 
		dbo.Invoice.invoiceid, 
		dbo.Invoice.invdate, 
		dbo.invoicedetails.cpt, 
		dbo.invoicedetails.productname, 
		dbo.invoicedetails.icd9, 
        dbo.invoicedetails.qty, 
		dbo.invoicedetails.fees, 
		(dbo.invoicedetails.qty * dbo.invoicedetails.fees) AS [Total], 
		dbo.invoicedetails.provider
FROM    dbo.invoicedetails INNER JOIN
        dbo.Invoice ON dbo.invoicedetails.invoiceid = dbo.Invoice.invoiceid
WHERE   (dbo.Invoice.reference = 'P')
ORDER BY dbo.invoicedetails.provider, dbo.Invoice.invdate
GO

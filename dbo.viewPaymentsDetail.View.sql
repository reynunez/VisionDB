/****** Object:  View [dbo].[viewPaymentsDetail]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewPaymentsDetail]
AS
SELECT TOP 100 PERCENT 
       dbo.payments.invoiceid, 
       dbo.payments.pydate, 
       dbo.getPaymentType(pytype) AS [pmttype], 
       dbo.getPayee(payer) AS [payee], 
       dbo.payments.pymemo, 
	   payment,
       dbo.invoice.officeid,
       (Select description from Office where officeid = Invoice.officeid) as [officename]
FROM   dbo.payments inner join dbo.invoice on dbo.invoice.invoiceid = dbo.payments.invoiceid
ORDER BY dbo.payments.invoiceid, dbo.payments.pydate
GO

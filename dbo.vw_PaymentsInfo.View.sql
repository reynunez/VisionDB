/****** Object:  View [dbo].[vw_PaymentsInfo]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_PaymentsInfo]
AS
SELECT	DISTINCT
		Invoice.invoiceid, 
		Invoice.invdate, 
		Invoice.provider, 
		(Invoice.cashamt + Invoice.checkamt + Invoice.otheramt) as [initial_payment],
		Invoice.recorder as [invoice_recorder],
		detTotals.InvTotal, 
		Invoice.pbalance,
		payments.payment_date,
		payments.payments, 
		((Invoice.cashamt + Invoice.checkamt + Invoice.otheramt) + payments.payments) as [total_pmt],
		(Invoice.pbalance - payments.payments) as [remaining_bal],
		invoicedetails.provider AS [salesperson]
FROM    Invoice LEFT JOIN
		(SELECT invoiceid, 
				pydate as [payment_date],
				SUM(payment) AS [Payments]
		FROM   payments
		WHERE  (payer = 0)
		GROUP BY invoiceid,pydate
		) as payments ON Invoice.invoiceid = payments.invoiceid LEFT JOIN
		(
		SELECT	invoiceid, 
		SUM(fees) AS [InvTotal]
		FROM   invoicedetails
		GROUP  BY invoiceid
		)as detTotals ON Invoice.invoiceid = detTotals.invoiceid inner join
        invoicedetails ON Invoice.invoiceid = invoicedetails.invoiceid
GO

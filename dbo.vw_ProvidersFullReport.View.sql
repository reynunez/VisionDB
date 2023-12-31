/****** Object:  View [dbo].[vw_ProvidersFullReport]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ProvidersFullReport]
AS

SELECT	DISTINCT 
        Invoice.invoiceid, 
		Invoice.invdate, 
		invoicedetails.provider,
        Invoice.checkamt, 
		Invoice.cashamt, 
		Invoice.otheramt,
		Invoice.pcharges,
		Invoice.inscharges,
		Invoice.adjustments,
		Invoice.otheropitms,
		Invoice.credits, 
		Invoice.pbalance, 
        Invoice.ibalance, 
		ISNULL(viewPayments.payments, 0) + Invoice.checkamt + Invoice.cashamt + Invoice.otheramt AS [payments], 
		Invoice.pbalance + Invoice.ibalance - ISNULL(viewPayments.payments, 0) AS [TBalance]
FROM    invoicedetails INNER JOIN
        Invoice ON invoicedetails.invoiceid = Invoice.invoiceid LEFT OUTER JOIN
        patient ON Invoice.patient_no = patient.patient_no LEFT OUTER JOIN
        viewPayments ON Invoice.invoiceid = viewPayments.invoiceid
WHERE   (Invoice.reference = 'P') and len(invoicedetails.provider)>0
GO

/****** Object:  View [dbo].[viewInvoiceBalance]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[viewInvoiceBalance]
AS
SELECT DISTINCT 
		dbo.Invoice.invoiceid, LTRIM(RTRIM(dbo.patient.first_name)) + ' ' + LTRIM(RTRIM(dbo.patient.last_name)) AS [name], 
		dbo.Invoice.pbalance, 
		dbo.Invoice.ibalance, 
		dbo.Invoice.pcharges + dbo.Invoice.inscharges AS [baltotal], 
		ISNULL(dbo.viewPayments.payments, 0) + dbo.Invoice.checkamt + dbo.Invoice.cashamt + dbo.Invoice.otheramt + isnull(dbo.viewWriteOff.woAmount,0)  [payments], 
		dbo.Invoice.pbalance + dbo.Invoice.ibalance - (ISNULL(dbo.viewPayments.payments, 0) + isnull(dbo.viewWriteOff.woAmount,0)) AS [balance], 
		dbo.Invoice.invdate, 
		dbo.Invoice.patient_no, 
        dbo.Invoice.reference, 
		dbo.patient.officeid, 
		dbo.getInsuranceName(dbo.patient.patient_no) AS [Insurance], 
		dbo.getInsuranceName(dbo.patient.patient_no) AS [insname], 
		dbo.Invoice.trayno,
		dbo.office.description as [officename],
		dbo.Invoice.provider,
		viewWriteOff.woAmount
FROM    dbo.patient RIGHT OUTER JOIN
        dbo.Invoice ON dbo.patient.patient_no = dbo.Invoice.patient_no LEFT OUTER JOIN
        dbo.viewPayments ON dbo.Invoice.invoiceid = dbo.viewPayments.invoiceid left outer join
		dbo.viewWriteOff  ON dbo.viewWriteOff.invoiceid = dbo.Invoice.invoiceid left join
        dbo.office on office.officeid = invoice.officeid
GO

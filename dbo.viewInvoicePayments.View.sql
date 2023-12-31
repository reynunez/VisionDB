/****** Object:  View [dbo].[viewInvoicePayments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[viewInvoicePayments]
AS
SELECT	TOP 100 PERCENT 
		dbo.Invoice.invoiceid, 
		dbo.Invoice.invdate, 
		LTRIM(RTRIM(dbo.patient.first_name)) + ' ' + LTRIM(RTRIM(dbo.patient.last_name)) AS [name], 
		dbo.insurance.insurance_name AS [insname], 
		dbo.payments.pydate, 
		dbo.getPyType(dbo.payments.pytype) AS [Type], 
        dbo.getPayer(dbo.payments.payer) AS [Payer], 
		dbo.payments.pymemo AS [Note], 
		COALESCE(dbo.payments.payment,0) as payment
FROM    dbo.Invoice LEFT JOIN
        dbo.patient ON dbo.Invoice.patient_no = dbo.patient.patient_no LEFT JOIN
        dbo.patient_insurances ON dbo.patient.patient_no = dbo.patient_insurances.patient_no LEFT JOIN
        dbo.insurance ON dbo.patient_insurances.insurance_no = dbo.insurance.insurance_no and dbo.patient_insurances.isdefault = 1 LEFT JOIN
        dbo.payments ON dbo.Invoice.invoiceid = dbo.payments.invoiceid
ORDER BY dbo.Invoice.invoiceid, dbo.Invoice.invdate
GO

/****** Object:  View [dbo].[ViewInvPmtsDet]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewInvPmtsDet]
AS
SELECT	dbo.Invoice.invoiceid, 
		RTRIM(dbo.patient.first_name) + ' ' + RTRIM(dbo.patient.last_name) AS [Patient], 
		dbo.Invoice.invdate, 
       isnull(dbo.Invoice.checkamt,0) as [check],
       isnull(dbo.Invoice.cashamt,0) as [cash],
       isnull(dbo.Invoice.otheramt,0) as [other],
       (Select description from office where officeid = invoice.officeid) as [officename],
       invoice.officeid
FROM    dbo.Invoice INNER JOIN
        dbo.patient ON dbo.Invoice.patient_no = dbo.patient.patient_no
union
SELECT dbo.payments.invoiceid, 
       (Select rtrim(first_name) + ' ' + RTRIM(last_name) from dbo.patient where patient_no = (Select patient_no from dbo.invoice where dbo.invoice.invoiceid = dbo.Payments.invoiceid)) as [Patient],
       dbo.Payments.pydate as invdate, 
       (case dbo.Payments.pytype when 0 then dbo.Payments.payment else 0 end)  as [check],
       (case dbo.Payments.pytype when 1 then dbo.Payments.payment else 0 end) as [cash],
       (case dbo.Payments.pytype when 2 then dbo.Payments.payment else 0 end) as [other],
       (Select description from office where officeid = invoice.officeid) as [officename],
       invoice.officeid      
FROM    dbo.Payments INNER JOIN
        dbo.Invoice on dbo.Invoice.invoiceid = dbo.payments.invoiceid
GO

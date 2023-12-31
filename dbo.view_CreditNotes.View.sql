/****** Object:  View [dbo].[view_CreditNotes]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_CreditNotes]
AS
SELECT  TOP 100 PERCENT 
		ISNULL(LTRIM(RTRIM(dbo.patient.first_name)) + ' ' + LTRIM(RTRIM(dbo.patient.last_name)), '') AS [name], 
        ISNULL(dbo.address.address1, N'') AS [address1], 
		ISNULL(dbo.address.city, N'') AS [city], 
		ISNULL(dbo.address.state, N'') AS [state], 
        ISNULL(dbo.address.zip, N'') AS [zip], 
		dbo.creditnotes.invoiceid, 
		dbo.creditnotes.invoicedate, 
		dbo.creditnotes.supportdoc, 
		dbo.creditnotes.fullcredit, 
        dbo.creditnotes.partialcredit, 
		dbo.creditnotes.invrev,
		dbo.creditnotes.goodsret, 
		dbo.creditnotes.other, 
		dbo.creditnotes.fulldesc, 
        dbo.creditnotes.authorizedby, 
		dbo.creditnotes.notedate, 
		ISNULL(dbo.address.address2, N'') AS [address2], 
		dbo.creditnotes.cnoteid, 
        dbo.patient.patient_no, dbo.creditnotes.amount
FROM    dbo.creditnotes INNER JOIN
        dbo.patient ON dbo.creditnotes.patient_no = dbo.patient.patient_no INNER JOIN
        dbo.address ON dbo.patient.patient_no = dbo.address.patient_no
ORDER BY dbo.creditnotes.cnoteid
GO

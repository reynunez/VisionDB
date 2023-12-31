/****** Object:  View [dbo].[viewPayments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[viewPayments]
AS
SELECT	invoiceid, 
		'Balance' as [type], 
		SUM(payment) AS [payments]
FROM    dbo.payments
GROUP	BY invoiceid

UNION

SELECT	invoiceid, 
		'WRITE OFF' as [type], 
		SUM(woamount) AS [payments]
FROM    dbo.viewwriteoff
GROUP	BY invoiceid
GO

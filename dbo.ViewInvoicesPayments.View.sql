/****** Object:  View [dbo].[ViewInvoicesPayments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewInvoicesPayments]
AS
SELECT	TOP 100 PERCENT 
		invdate, SUM(checkamt) AS [Checks], 
		SUM(cashamt) AS [Cash], 
		SUM(otheramt) AS [Other], 
		SUM(checkamt + cashamt + otheramt) AS [total]
FROM    dbo.Invoice
GROUP BY invdate
ORDER BY invdate
GO

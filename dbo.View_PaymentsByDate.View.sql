/****** Object:  View [dbo].[View_PaymentsByDate]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_PaymentsByDate]
AS
SELECT	TOP 100 PERCENT 
		pydate, 
		dbo.getPaymentType(pytype) AS [paytype], 
		SUM(payment) AS [payment]
FROM    dbo.payments
GROUP BY pydate, dbo.getPaymentType(pytype)
ORDER BY pydate, dbo.getPaymentType(pytype)
GO

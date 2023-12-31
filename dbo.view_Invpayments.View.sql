/****** Object:  View [dbo].[view_Invpayments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_Invpayments]
AS
SELECT	invoiceid, 
		SUM(payment) AS [sumPayments]
FROM    dbo.payments
GROUP BY invoiceid
GO

/****** Object:  View [dbo].[vw_InventoryTransactions]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_InventoryTransactions]
AS
SELECT	dbo.InvTransactions.transactionDate, 
		dbo.InvTransactions.poNumber, 
		dbo.InvTransactions.tranType,
		dbo.invTrasactionType.description AS [tranTypeDesc], 
		dbo.InvTransactions.quantity, 
        dbo.InvTransactions.fpcID, 
		dbo.InvTransactions.prodTableID,
		dbo.InvTransactions.orderid,
		dbo.invtransactions.officeid
FROM    dbo.InvTransactions INNER JOIN
        dbo.invTrasactionType ON dbo.InvTransactions.tranType = dbo.invTrasactionType.trantype
GO

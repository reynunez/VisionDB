/****** Object:  View [dbo].[vw_StockFramesOrderDetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_StockFramesOrderDetails]
AS
SELECT	dbo.Orders.orderid, 
		dbo.Orders.orderdate,
		rtrim(dbo.patient.first_name) + ' ' + rtrim(dbo.patient.last_name) as [Patname],
		dbo.patient.first_name,
		dbo.patient.last_name, 
		dbo.sforders.type, 
		dbo.sforders.manufacturer, 
		dbo.sforders.price,
		dbo.sforders.cost,
		dbo.sforders.model, 
		dbo.sforders.color, 
		dbo.sforders.A, 
		dbo.sforders.dbl, 
		dbo.sforders.B, 
		dbo.sforders.ED, 
		dbo.sforders.Temple, 
		dbo.sforders.colorcode, 
		dbo.sforders.UPC, 
		isnull(dbo.sforders.ToOrder,0) as [ToOrder],
		dbo.sforders.fpcID,
		(Select description from orderstatus where orderstatus = dbo.orders.orderstatus) as [orderstatus],
		dbo.Orders.officeid,
		dbo.office.description as [officename]
FROM    dbo.Orders LEFT JOIN
        dbo.sforders ON dbo.Orders.orderid = dbo.sforders.orderid LEFT JOIN
        dbo.patient ON dbo.Orders.patient_no = dbo.patient.patient_no LEFT JOIN
        dbo.office on office.officeid = orders.officeid
GO

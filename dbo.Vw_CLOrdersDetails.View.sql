/****** Object:  View [dbo].[Vw_CLOrdersDetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[Vw_CLOrdersDetails]
AS
SELECT	dbo.Orders.orderid, 
		dbo.Orders.orderdate, 
		(rtrim(dbo.patient.first_name) + ' ' + rtrim(dbo.patient.last_name)) as [patientname],
		dbo.patient.first_name,
		dbo.patient.last_name,
		dbo.clorders.status, 
		dbo.clorders.eye, 
		dbo.clorders.manufacturer, 
		dbo.clorders.name, 
		dbo.clorders.lenstype, 
		dbo.clorders.color, 
		dbo.clorders.sph, 
		dbo.clorders.cyl, 
		dbo.clorders.axis, 
		dbo.clorders.addition, 
		dbo.clorders.UPCC, 
		dbo.clorders.Qty, 
		dbo.clorders.Bc,
		dbo.clorders.price,
		dbo.clorders.cost,
		dbo.Orders.Tray,
		dbo.patient.patient_no,
		(Select description from orderstatus where orderstatus = dbo.orders.orderstatus) as [orderstatus],
		dbo.orders.officeid,
		dbo.office.description as [officename],
		dbo.Orders.vomonline
FROM    dbo.Orders INNER JOIN
        dbo.clorders ON dbo.Orders.orderid = dbo.clorders.orderid INNER JOIN
        dbo.patient ON dbo.Orders.patient_no = dbo.patient.patient_no LEFT JOIN
        dbo.office ON office.officeid = dbo.orders.officeid
WHERE   (dbo.Orders.ordertype = 1)

GO

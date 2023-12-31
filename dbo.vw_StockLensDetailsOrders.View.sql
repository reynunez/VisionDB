/****** Object:  View [dbo].[vw_StockLensDetailsOrders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_StockLensDetailsOrders]
AS
SELECT	Orders.orderid, 
		Orders.orderdate, 
		patient.first_name + N' ' + patient.last_name AS [name], 
		patient.first_name,
		patient.last_name,
		slorders.manufacturer, 
		slorders.eye, 
		slorders.lname, 
		slorders.lenstype, 
		slorders.sph, 
		slorders.cyl, 
		slorders.addition, 
		slorders.UPCC, 
		Orders.Tray,
		(Select description from orderstatus where orderstatus = dbo.orders.orderstatus) as [orderstatus],
		slorders.price,
		slorders.cost,
		Orders.officeid,
		office.description as [officename]
FROM    Orders INNER JOIN
        slorders ON Orders.orderid = slorders.orderid INNER JOIN
        patient ON Orders.patient_no = patient.patient_no LEFT JOIN
        office ON office.officeid = orders.officeid
GO

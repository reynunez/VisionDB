/****** Object:  View [dbo].[vw_LabLensesOrderDetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_LabLensesOrderDetails]
AS
SELECT	Orders.orderid, 
		ordertype.description AS OrderType, 
		rtrim(dbo.patient.first_name) + ' ' + rtrim(dbo.patient.last_name) as [Patname],
		dbo.patient.first_name,
		dbo.patient.last_name, 
		Orders.orderdate, 
		Orders.ordertotal, 
		Orders.officeid,
		OrderStatus.description AS [OrderStatus],
		llorders.lenstype,
		llorders.manufacturer, 
		llorders.name,	 
		llorders.material, 
		llorders.price, 
		llorders.cost, 
        llorders.style
FROM    Orders INNER JOIN
        llorders ON Orders.orderid = llorders.orderid INNER JOIN
        ordertype ON Orders.ordertype = ordertype.ordertype  INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus LEFT JOIN
        dbo.patient ON dbo.Orders.patient_no = dbo.patient.patient_no
GO

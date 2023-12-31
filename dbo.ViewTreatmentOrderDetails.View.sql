/****** Object:  View [dbo].[ViewTreatmentOrderDetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewTreatmentOrderDetails]
AS
SELECT Orders.orderid, 
  Orders.orderdate, 
	  OrderStatus.description AS [orderstatus], 
	  DBO.Split(ophorderdetails.treatment1,'|',1) as [type],
	  DBO.Split(ophorderdetails.treatment1,'|',2) as [manufacturer],
	  DBO.Split(ophorderdetails.treatment1,'|',3) as [name],
	  DBO.Split(ophorderdetails.treatment1,'|',4) as [price],
	  DBO.Split(ophorderdetails.treatment1,'|',5) as [cost],
	  DBO.Orders.officeid,
	  DBO.office.description as [officename]
FROM    Orders INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ophorderdetails ON Orders.orderid = ophorderdetails.orderid LEFT JOIN
        office on office.officeid = orders.officeid
where len(ophorderdetails.treatment1) <> 0
union
SELECT	Orders.orderid, 
		Orders.orderdate, 
		OrderStatus.description AS [orderstatus], 
		DBO.Split(ophorderdetails.treatment2,'|',1) as [type],
		DBO.Split(ophorderdetails.treatment2,'|',2) as [manufacturer],
		DBO.Split(ophorderdetails.treatment2,'|',3) as [name],
		DBO.Split(ophorderdetails.treatment2,'|',4) as [price],
		DBO.Split(ophorderdetails.treatment2,'|',5) as [cost],
		DBO.Orders.officeid,
		DBO.office.description as [officename]
FROM    Orders INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ophorderdetails ON Orders.orderid = ophorderdetails.orderid LEFT JOIN
        office on office.officeid = orders.officeid
where len(ophorderdetails.treatment2) <> 0
union
SELECT Orders.orderid, 
	  Orders.orderdate, 
	  OrderStatus.description AS [orderstatus], 
	  DBO.Split(ophorderdetails.treatment3,'|',1) as [type],
	  DBO.Split(ophorderdetails.treatment3,'|',2) as [manufacturer],
	  DBO.Split(ophorderdetails.treatment3,'|',3) as [name],
	  DBO.Split(ophorderdetails.treatment3,'|',4) as [price],
	  DBO.Split(ophorderdetails.treatment3,'|',5) as [cost],
	  DBO.Orders.officeid,
	  DBO.office.description as [officename]
FROM    Orders INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ophorderdetails ON Orders.orderid = ophorderdetails.orderid LEFT JOIN
        office on office.officeid = orders.officeid
where len(ophorderdetails.treatment3) <> 0
union
SELECT Orders.orderid, 
	  Orders.orderdate, 
	  OrderStatus.description AS [orderstatus], 
	  DBO.Split(ophorderdetails.treatment4,'|',1) as [type],
	  DBO.Split(ophorderdetails.treatment4,'|',2) as [manufacturer],
	  DBO.Split(ophorderdetails.treatment4,'|',3) as [name],
	  DBO.Split(ophorderdetails.treatment4,'|',4) as [price],
	  DBO.Split(ophorderdetails.treatment4,'|',5) as [cost],
	  DBO.Orders.officeid,
	  DBO.office.description as [officename]
FROM    Orders INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ophorderdetails ON Orders.orderid = ophorderdetails.orderid LEFT JOIN
        office on office.officeid = orders.officeid
where len(ophorderdetails.treatment4) <> 0
union
SELECT Orders.orderid, 
	  Orders.orderdate, 
	  OrderStatus.description AS [orderstatus], 
	  DBO.Split(ophorderdetails.treatment5,'|',1) as [type],
	  DBO.Split(ophorderdetails.treatment5,'|',2) as [manufacturer],
	  DBO.Split(ophorderdetails.treatment5,'|',3) as [name],
	  DBO.Split(ophorderdetails.treatment5,'|',4) as [price],
	  DBO.Split(ophorderdetails.treatment5,'|',5) as [cost],
	  DBO.Orders.officeid,
	  DBO.office.description as [officename]
FROM    Orders INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ophorderdetails ON Orders.orderid = ophorderdetails.orderid LEFT JOIN
        office on office.officeid = orders.officeid
where len(ophorderdetails.treatment5) <> 0
union
SELECT Orders.orderid, 
	  Orders.orderdate, 
	  OrderStatus.description AS [orderstatus], 
	  DBO.Split(ophorderdetails.treatment6,'|',1) as [type],
	  DBO.Split(ophorderdetails.treatment6,'|',2) as [manufacturer],
	  DBO.Split(ophorderdetails.treatment6,'|',3) as [name],
	  DBO.Split(ophorderdetails.treatment6,'|',4) as [price],
	  DBO.Split(ophorderdetails.treatment6,'|',5) as [cost],
	  DBO.Orders.officeid,
	  DBO.office.description as [officename]
FROM    Orders INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ophorderdetails ON Orders.orderid = ophorderdetails.orderid LEFT JOIN
        office on office.officeid = orders.officeid
where len(ophorderdetails.treatment6) <> 0
GO

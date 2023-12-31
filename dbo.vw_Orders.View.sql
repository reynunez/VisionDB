/****** Object:  View [dbo].[vw_Orders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_Orders]
AS
SELECT	Orders.orderid, 
		ordertype.description AS [ordertype], 
		office.description as [officeName],
		Orders.orderdate, 
		RTRIM(patient.first_name) + ' ' + patient.last_name AS [patient_name], 
		patient.first_name, 
		patient.last_name, 
		patient.birth_date, 
		Orders.ordertotal, 
		OrderStatus.description AS [orderstatus], 
		Orders.Tray, 
		Orders.labtray,
		office.voicent,
		address.phone1 as [patientphone],
		statuschange,
		patient.patient_no,
		ordersinvoiced.invoiceid,
		orders.officeid,
		patient.eMail_address,
		Orders.elab,
		null as dummy,
		Orders.olorder,
		orders.vomonline
FROM    Orders INNER JOIN
        patient ON Orders.patient_no = patient.patient_no INNER JOIN
        OrderStatus ON Orders.orderstatus = OrderStatus.orderstatus INNER JOIN
        ordertype ON Orders.ordertype = ordertype.ordertype LEFT OUTER JOIN
        address ON patient.patient_no = address.patient_no left join
		ordersinvoiced on ordersinvoiced.orderid = orders.orderid left join
		office on office.officeid = orders.officeid

GO

/****** Object:  View [dbo].[view_PatOrders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[view_PatOrders]
AS
Select	(Case ordertype
			When 1 then '92070'
			Else 'V2020'
		End) as [code],
		(Case ordertype
			When 1 then 'Contact Lenses Order No ' + convert(varchar(15),orderid) + ' On ' + convert(varchar(10),orderdate,101)
			Else 'Ophthalmic Lenses Order No ' + convert(varchar(15),orderid) + ' On ' + convert(varchar(10),orderdate,101)
		End) as [description],
		Ordertotal as [Fee],
		( Case ordertype
			When 1 then '92070|' +  'Contact Lenses Order No ' + convert(varchar(15),orderid) + ' On ' + convert(varchar(10),orderdate,101) + '|1|' + rtrim(convert(varchar(15),ordertotal))
			Else 'V2020|' +  'Ophthalmic Lenses Order No ' + convert(varchar(15),orderid) + ' On ' + convert(varchar(10),orderdate,101) + '|1|' + isnull(orderdetails,rtrim(convert(varchar(15),ordertotal)))
		End) as [boundcol],
		patient_no
From	dbo.orders
Where	(orderstatus in(1,10))

/*
'V2020|' +  'Ophthalmic Lenses Order No ' + convert(varchar(15),orderid) + ' On ' + convert(varchar(10),orderdate,101) + '|1|' + rtrim(convert(varchar(15),ordertotal))
*/
GO

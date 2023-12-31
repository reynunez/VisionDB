/****** Object:  View [dbo].[VwOrderStatusTran]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VwOrderStatusTran] AS
Select	stHi.orderid,
		orSt.description as [Status],
		stHi.changedate,
		isNull(myOf.description,'') as [Office]
from	tblOrderStatusHist stHi inner join 
		OrderStatus orSt on stHi.status = orSt.orderstatus Left join
		office myOf on stHi.officeid = myOf.officeid
GO

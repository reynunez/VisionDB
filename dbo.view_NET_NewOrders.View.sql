/****** Object:  View [dbo].[view_NET_NewOrders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[view_NET_NewOrders]
AS

select	ORDER_ID as orderid
		,2 as ordertype
		,ORDER_TOTAL as ordertotal
		,CAST(ORDER_DATE AS DATE) AS orderdate
		,PATIENT_NO as patient_no
from	OPH_ORDER_HDR 
where	FLOWSTATUS = 'NEW'
UNION
select	ORDER_ID
		,1 AS ordertype
		,ORDER_TOTAL as ordertotal
		,CAST(ORDER_DATE AS DATE) as orderdate
		,PATIENT_NO as patient_no
FROM	CL_ORDER_HDR 
WHERE	FLOWSTATUS = 'NEW'
GO

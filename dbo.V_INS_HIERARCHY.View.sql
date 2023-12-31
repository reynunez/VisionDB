/****** Object:  View [dbo].[V_INS_HIERARCHY]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_INS_HIERARCHY] AS

with billingprov as(
	SELECT	h.parent_level
			,h.greatgreatparent
			,h.greatparent
			,h.parent
			,h.mylevel
			,h.myid 
	FROM	INS_HIERARCHY h
	where	h.mylevel = 0
), insurance as(
	SELECT	h.parent_level
			,h.greatgreatparent
			,h.greatparent
			,h.parent
			,h.mylevel
			,h.myid 
	FROM	INS_HIERARCHY h
	where	h.mylevel = 1
), facility as(
	SELECT	h.parent_level
			,h.greatgreatparent
			,h.greatparent
			,h.parent
			,h.mylevel
			,h.myid 
	FROM	INS_HIERARCHY h
	where	h.mylevel = 2
), rendering as(
	SELECT	h.parent_level
			,h.greatgreatparent
			,h.greatparent
			,h.parent
			,h.mylevel
			,h.myid 
	FROM	INS_HIERARCHY h
	where	h.mylevel = 3
)

Select	b.parent_level AS BP_PARENT_LEVEL
		,b.parent AS BP_PARENT
		,b.mylevel AS BP_LEVEL
		,b.myid AS BP_ID
		,i.parent_level AS INS_PARENT_LEVEL
		,i.parent AS INS_PARENT
		,i.mylevel AS INS_LEVEL
		,i.myid AS INS_ID
		,f.parent_level AS LOC_PARENT_LEVEL
		,f.parent AS LOC_PARENT
		,f.mylevel AS LOC_LEVEL
		,f.myid AS LOC_ID
		,r.parent_level AS RP_PARENT_LEVEL
		,r.parent AS RP_PARENT
		,r.mylevel AS RP_LEVEL
		,r.myid AS RP_ID
from	billingprov b
		left join insurance i ON b.myid = i.parent and i.mylevel = 1
		left join facility f ON i.myid = f.parent  and f.mylevel = 2 and b.myid = f.greatparent
		left join rendering r on f.myid = r.parent and r.mylevel = 3 and i.myid = r.greatparent and b.myid = r.greatgreatparent
GO

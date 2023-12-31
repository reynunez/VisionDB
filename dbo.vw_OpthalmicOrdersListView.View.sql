/****** Object:  View [dbo].[vw_OpthalmicOrdersListView]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[vw_OpthalmicOrdersListView]
AS
Select	DISTINCT
		PARENT.*,
		null as novalue,
		PATIENT.pname as PatientName,
		CHILD.manufacturer,
		FRAMES.styleName,
		FRAMES.rimtype,
		FRAMES.material,
		PATIENT.iname,
		LL.style as [llstyle]
from	vw_Orders PARENT LEFT JOIN
		vw_StockFramesOrderDetails CHILD on PARENT.orderid = CHILD.orderid LEFT JOIN
		llorders LL on LL.orderid = PARENT.orderid LEFT JOIN
		FramesStockData FRAMES on CHILD.fpcID = FRAMES.fpcID and FRAMES.officeid = PARENT.officeid LEFT JOIN
		viewPatient PATIENT on PARENT.patient_no = PATIENT.patient_no
GO

/****** Object:  View [dbo].[vw_Patients_Orders_count]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Patients_Orders_count] AS
Select	cl.patient_no 
		,cl.patient_name 
		,COALESCE(cl.order_count,0) as contactlens_order_count
		,COALESCE(op.order_count,0) as ophthalmic_order_count
From	(
		SELECT	p.patient_no
				,LTRIM(RTRIM(p.first_name)) + ' ' + LTRIM(RTRIM(p.last_name )) as patient_name
				,'CONTANCT LENSES' AS order_tye
				,COUNT(c.ORDER_ID ) AS order_count
		FROM	patient p
				JOIN CL_ORDER_HDR c ON P.patient_no = c.PATIENT_NO 
		WHERE	c.FLOWSTATUS <> 'Cancelled'
		GROUP	BY p.patient_no ,LTRIM(RTRIM(p.first_name)) + ' ' + LTRIM(RTRIM(p.last_name ))
		) cl
Left Join (
		SELECT	p.patient_no
				,LTRIM(RTRIM(p.first_name)) + ' ' + LTRIM(RTRIM(p.last_name )) as patient_name
				,'OPHTHALMIC LENSES' AS order_tye
				,COUNT(o.ORDER_ID ) AS order_count
		FROM	patient p
				JOIN OPH_ORDER_HDR o ON P.patient_no = o.PATIENT_NO 
		WHERE	o.FLOWSTATUS <> 'Cancelled'
		GROUP	BY p.patient_no ,LTRIM(RTRIM(p.first_name)) + ' ' + LTRIM(RTRIM(p.last_name ))
) op	ON cl.patient_no = op.patient_no 
GO

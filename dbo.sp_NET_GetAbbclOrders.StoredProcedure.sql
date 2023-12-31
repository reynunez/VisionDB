/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbclOrders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 05/12/2021
-- Description:Get Abb Contact Lens Orders
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbclOrders](
	@ORDER_DATE_FROM DATE ,
	@ORDER_DATE_TO DATE,
	@OFFICEID INT = 0,
	@SHIPTOPATIENT INT = 0
)
AS
BEGIN
	IF @OFFICEID = 0 BEGIN
		SELECT	h.ORDER_ID 
				,h.ORDER_DATE 
				,d.ITEM_ID 
				,d.VU_ITEM_ID as VUITEM_ID
				,d.ITEM_DESC as ITEM_DESCRIPTION 
				,d.ITEM_UNITS 
				,d.ITEM_SER_ID
				,d.ITEM_SER_NAME
				,p.patient_no as PATIENT_NO
				,ltrim(rtrim(p.first_name)) + ' ' + ltrim(rtrim(p.last_name)) as PATIENT_NAME
				,H.OFFICEID AS OFFICE_ID
				,o.description OFFICE_NAME
				,h.shiptopatient
				,SUBSTRING(d.item_description,1,1) as EYE
		  FROM	[dbo].[CL_ORDER_HDR] h
				join [dbo].[CL_ORDER_ITEMS] d ON h.ORDER_ID = d.ORDER_ID 
				left join patient p ON h.PATIENT_NO = p.patient_no 
				left join office o ON o.officeid = h.OFFICEID
		  WHERE	CAST(h.ORDER_DATE AS DATE) Between @ORDER_DATE_FROM and @ORDER_DATE_TO
				AND h.FLOWSTATUS = 'New'
				AND h.shiptopatient = @SHIPTOPATIENT
				and d.VU_ITEM_ID < 2000000
	END
	ELSE BEGIN
		SELECT	h.ORDER_ID 
				,h.ORDER_DATE 
				,d.ITEM_ID 
				,d.VU_ITEM_ID as VUITEM_ID
				,d.ITEM_DESC as ITEM_DESCRIPTION 
				,d.ITEM_UNITS 
				,d.ITEM_SER_ID
				,d.ITEM_SER_NAME
				,p.patient_no as PATIENT_NO
				,ltrim(rtrim(p.first_name)) + ' ' + ltrim(rtrim(p.last_name)) as PATIENT_NAME
				,H.OFFICEID AS OFFICE_ID
				,o.description OFFICE_NAME
				,h.shiptopatient
				,SUBSTRING(d.item_description,1,1) as EYE
			FROM	[dbo].[CL_ORDER_HDR] h
				join [dbo].[CL_ORDER_ITEMS] d ON h.ORDER_ID = d.ORDER_ID 
				left join patient p ON h.PATIENT_NO = p.patient_no 
				left join office o ON o.officeid = h.OFFICEID
			WHERE	CAST(h.ORDER_DATE AS DATE) Between @ORDER_DATE_FROM and @ORDER_DATE_TO
				AND h.FLOWSTATUS = 'New'
				AND h.shiptopatient = @SHIPTOPATIENT
				AND H.OFFICEID = @OFFICEID
				and d.VU_ITEM_ID < 2000000
	END
END
GO

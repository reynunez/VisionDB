/****** Object:  StoredProcedure [dbo].[sp_NET_GetEDIInvoicesByID]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/20/2022
-- Description:	Get EDI Invoices List by ID
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEDIInvoicesByID](
	@INVOICEID INT
)
AS

BEGIN

	SET NOCOUNT ON;

	SELECT  DISTINCT
			H.invoiceid
			,H.patient_no
			,LTRIM(RTRIM(P.FIRST_NAME)) + ' ' + LTRIM(RTRIM(P.LAST_NAME)) AS PATIENT_NAME
			,H.order_id
			,cast(cast(H.invdate as date) as varchar) as INVDATE
			,cast(cast(H.effdate as date) as varchar) as EFFDATE
			,H.officeid
			,H.INV_STATUS
			,H.ORDER_TYPE
			,H.INSURANCE_NO
			,D.ITEM_CLASS
			,D.ITEM_CODE
			,D.ITEM_MODIFIER
			,D.ITEM_MODIFIER2
			,D.ITEM_DESCRIPTION
			,D.ITEM_UNITS
			,D.ITEM_FEE
			,D.ITEM_PATIENT_P
			,D.ITEM_PATIENT_D
			,D.ITEM_INSURANCE_D
			,D.ITEM_TOTAL
			,CASE WHEN CHARINDEX(' ',D.DIAGNOSIS) = 0 THEN '' ELSE LEFT(D.DIAGNOSIS,(CHARINDEX(' ',D.DIAGNOSIS)-1)) END AS DIAGCODE
			,D.DIAGNOSIS
			,D.RENDPROV
			,D.RENDFACILITY
			,D.PAYER
			,D.REFERRING
			,D.BILLPROVIDER
			,O.description AS OFFICENAME
			,O.ADDRESS1
			,O.ADDRESS2
			,O.CITY
			,O.STATE
			,O.ZIP
	FROM    INVOICE_HDR H 
			JOIN INVOICE_ITEMS D ON H.INVOICEID = D.INVOICEID
			JOIN OFFICE O ON H.OFFICEID = O.OFFICEID
			JOIN PATIENT P ON H.PATIENT_NO = P.PATIENT_NO
	WHERE   H.INVOICEID = @INVOICEID

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetOrderInvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/31/2020
-- Description:Get Order Invoice
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOrderInvoice](
	@ORDER_ID INT,
	@ORDER_TYPE VARCHAR(10)
)
AS

BEGIN

	Select	h.PATIENT_NO
			,h.ORDER_ID
			,h.INVOICEID
			,h.INVDATE
			,h.EFFDATE 
			,h.PCHARGES
			,h.INSCHARGES
			,h.OFFICEID
			,h.INV_STATUS
			,h.adjustments 
			,h.INSURANCE_NO 
			,h.INS_PLAN 
			,h.INS_AUTH 
			,h.INS_BENEFITS 
			,(SELECT SUM(TOTALPAYMENT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.ispatient = 1) as PATPAYMENTS
			,(SELECT SUM(ADJAMT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.ispatient = 1) as PATADJUSTMENTS
			,(SELECT SUM(TOTALPAYMENT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.isinsurance = 1) as INSPAYMENTS
			,(SELECT SUM(ADJAMT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.isinsurance = 1) as INSADJUSTMENTS
			,h.comments 
	From	INVOICE_HDR h
	Where	Order_id = @ORDER_ID
			and order_type = @ORDER_TYPE;

END
GO

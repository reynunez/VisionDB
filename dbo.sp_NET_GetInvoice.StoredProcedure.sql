/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/02/2021
-- Description:Get Invoice
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvoice](
	@INVOICEID INT
)
AS

BEGIN

	Select	h.PATIENT_NO
			,h.ORDER_ID
			,h.ORDER_TYPE 
			,h.INVOICEID
			,h.INVDATE
			,h.EFFDATE
			,h.PCHARGES
			,h.INSCHARGES
			,h.OFFICEID
			,h.INV_STATUS
			,h.adjustments 
			,(SELECT SUM(TOTALPAYMENT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.ispatient = 1) as PATPAYMENTS
			,(SELECT SUM(ADJAMT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.ispatient = 1) as PATADJUSTMENTS
			,(SELECT SUM(TOTALPAYMENT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.isinsurance = 1) as INSPAYMENTS
			,(SELECT SUM(ADJAMT) FROM INVOICE_PMT p WHERE p.invoiceid = h.invoiceid and p.isinsurance = 1) as INSADJUSTMENTS
			,h.INS_PLAN
			,h.INS_BENEFITS
			,h.INS_AUTH 
			,h.INSURANCE_NO
			,h.comments 
	From	INVOICE_HDR h
	Where	h.invoiceid = @INVOICEID

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_InsertInvoiceDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/19/2020
-- Description:	Create Invoice Line Items
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertInvoiceDetails]
(
    @invoiceid int ,
	@ITEM_CLASS varchar(50) ,
	@ITEM_CODE varchar(50) ,
	@ITEM_MODIFIER varchar(50) ,
	@ITEM_MODIFIER2 varchar(50) ,
	@ITEM_DESCRIPTION varchar(100) ,
	@ITEM_UNITS int ,
	@ITEM_FEE numeric(18, 2) ,
	@ITEM_PATIENT_P int ,
	@ITEM_PATIENT_D numeric(18, 2) ,
	@ITEM_INSURANCE_D numeric(18, 2) ,
	@ITEM_TOTAL numeric(18, 2) ,
	@DIAGNOSIS varchar(100) ,
	@RENDPROV varchar(100) ,
	@RENDFACILITY varchar(100) ,
	@PAYER varchar(100) ,
	@REFERRING varchar(100) ,
	@BILLPROVIDER varchar(100) 
)
AS

BEGIN
	INSERT INTO INVOICE_ITEMS (
							invoiceid,
							ITEM_CLASS,
							ITEM_CODE,
							ITEM_MODIFIER,
							ITEM_MODIFIER2,
							ITEM_DESCRIPTION,
							ITEM_UNITS,
							ITEM_FEE,
							ITEM_PATIENT_P,
							ITEM_PATIENT_D,
							ITEM_INSURANCE_D,
							ITEM_TOTAL,
							DIAGNOSIS,
							RENDPROV,
							RENDFACILITY,
							PAYER,
							REFERRING,
							BILLPROVIDER
							)
	VALUES(
			@invoiceid,
			@ITEM_CLASS,
			@ITEM_CODE,
			@ITEM_MODIFIER,
			@ITEM_MODIFIER2,
			@ITEM_DESCRIPTION,
			@ITEM_UNITS,
			@ITEM_FEE,
			@ITEM_PATIENT_P,
			@ITEM_PATIENT_D,
			@ITEM_INSURANCE_D,
			@ITEM_TOTAL,
			@DIAGNOSIS,
			@RENDPROV,
			@RENDFACILITY,
			@PAYER,
			@REFERRING,
			@BILLPROVIDER	
	)
END
GO

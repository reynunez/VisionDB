/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvoiceItems]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/31/2020
-- Description:Get Invoice Items
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvoiceItems](
	@INVOICEID INT
)
AS

BEGIN

	Select	ITEM_CLASS
			,ITEM_CODE
			,ITEM_MODIFIER
			,ITEM_MODIFIER2
			,ITEM_DESCRIPTION
			,ITEM_UNITS
			,ITEM_FEE
			,ITEM_PATIENT_P
			,ITEM_PATIENT_D
			,ITEM_INSURANCE_D
			,ITEM_TOTAL
			,DIAGNOSIS
			,RENDPROV
			,RENDFACILITY
			,PAYER
			,REFERRING
			,BILLPROVIDER 
	from	INVOICE_ITEMS
	WHERE	INVOICEID = @INVOICEID

END
GO

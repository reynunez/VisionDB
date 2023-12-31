/****** Object:  StoredProcedure [dbo].[sp_NET_Voidinvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/23/2021
-- Description: Void Invoice
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_Voidinvoice](
	@invoiceid as integer
)
AS
BEGIN

	Update	INVOICE_HDR 
	Set		INV_STATUS = 'Voided'
	Where	invoiceid = @invoiceid 
END
GO

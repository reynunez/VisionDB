/****** Object:  StoredProcedure [dbo].[sp_DelInvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DelInvoice](
	@invoiceid int
) AS
begin tran
	Delete from invdetails where invoiceid = @invoiceid
	if @@error <> 0 begin
		rollback tran
	end	
	Delete from payments where invoiceid = @invoiceid
	if @@error <> 0 begin
		rollback tran
	end	
	delete from invoices where invoiceid = @invoiceid
	if @@error <> 0 begin
		rollback tran
	end	
commit tran
GO

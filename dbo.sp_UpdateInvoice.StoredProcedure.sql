/****** Object:  StoredProcedure [dbo].[sp_UpdateInvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_UpdateInvoice](
	@invoiceid int,
	@salesmanid int,
	@invdate datetime,
	@shipping numeric(18,2),
	@tax numeric(18,2)
)AS
begin tran
	update invoices set
	invdate = @invdate,
	salesmanid = @salesmanid,
	shipping = @shipping,
	tax = @tax
	where 
	invoiceid = @invoiceid

	if @@error <> 0 begin
		rollback tran
	end
commit tran
GO

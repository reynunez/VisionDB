/****** Object:  StoredProcedure [dbo].[sp_AddInvoicedetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddInvoicedetails](
	@invoiceid int,
	@servcat int,
	@servid int,
	@quantity int,
	@fee numeric(18,2)
)
as
begin tran
	insert into invdetails(
		invoiceid,
		servcat,
		servid,
		quantity,
		fee
		)
	values(
		@invoiceid,
		@servcat,
		@servid,
		@quantity,
		@fee		
		)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

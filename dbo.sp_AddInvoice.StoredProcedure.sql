/****** Object:  StoredProcedure [dbo].[sp_AddInvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddInvoice](
	@invdate datetime,
	@salesmanid int,
	@patient_no int,
	@shipping numeric(18,2),
	@tax numeric(18,2)
)
as
begin tran
	insert into invoices(
		invdate,
		salesmanid,
		patient_no,
		shipping,
		tax
		)
	values(
		@invdate,
		@salesmanid,
		@patient_no,
		@shipping,
		@tax
		)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

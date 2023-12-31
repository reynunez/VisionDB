/****** Object:  StoredProcedure [dbo].[sp_AddCreditNote]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddCreditNote](
	@patient_no int,
	@invoiceid int,
	@invoicedate datetime,
	@supportdoc smallint,
	@fullcredit smallint,
	@partialcredit smallint,
	@invrev smallint,
	@goodsret smallint,
	@other smallint,
	@fulldesc text,
	@authorizedby char(45),
	@notedate datetime,
	@amount numeric(18,2)
)
as
begin tran
	
	insert into creditnotes(
		patient_no,
		invoiceid,
		invoicedate,
		supportdoc,
		fullcredit,
		partialcredit,
		invrev,
		goodsret,
		other,
		fulldesc,
		authorizedby,
		notedate,
		amount
		)
	values(
		@patient_no,
		@invoiceid,
		@invoicedate,
		@supportdoc,
		@fullcredit,
		@partialcredit,
		@invrev,
		@goodsret,
		@other,
		@fulldesc,
		@authorizedby,
		@notedate,
		@amount
		)	

	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

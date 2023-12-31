/****** Object:  StoredProcedure [dbo].[sp_UpdateCreditNote]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_UpdateCreditNote](
	@cnoteid int,
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
	
	update creditNotes set
		patient_no = @patient_no,
		invoiceid = @invoiceid,
		invoicedate = @invoicedate,
		supportdoc = @supportdoc,
		fullcredit = @fullcredit,
		partialcredit = @partialcredit,
		invrev = @invrev,
		goodsret = @goodsret,
		other = @other,
		fulldesc = @fulldesc,
		authorizedby = @authorizedby,
		amount = @amount
	where cnoteid = @cnoteid
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

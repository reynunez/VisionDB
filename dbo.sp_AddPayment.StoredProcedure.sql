/****** Object:  StoredProcedure [dbo].[sp_AddPayment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddPayment](
	@invoiceid int,
	@pydate datetime,
	@pytype smallint,
	@pymemo char(45),
	@payment numeric(18,2)
)
as
begin tran
	insert into payments(
		invoiceid,
		pydate,
		pytype,
		pymemo,
		payment
		)
	values(
		@invoiceid,
		@pydate,
		@pytype,
		@pymemo,
		@payment
		)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

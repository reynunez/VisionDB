/****** Object:  StoredProcedure [dbo].[sp_AddPrescDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddPrescDetails](
	@rxnumber int,
	@description char(45),
	@eye char(2),
	@quantity char(15),
	@every char(15),
	@days smallint
)
as
begin tran
	insert into prescdetails(
		rxnumber,
		description,
		eye,
		quantity,
		every,
		days
		)
	values(
		@rxnumber,
		@description,
		@eye,
		@quantity,
		@every,
		@days
		)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

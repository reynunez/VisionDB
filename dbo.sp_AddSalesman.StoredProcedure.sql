/****** Object:  StoredProcedure [dbo].[sp_AddSalesman]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddSalesman](
	@name char(60),
	@commision numeric(18,2),
	@officeid int=NULL,
	@phone nvarchar(20)=NULL
)
as
begin tran
	
	insert into salespeople(
		name,
		commision,
		officeid,
		phone)
	values(
		@name,
		@commision,
		@officeid,
		@phone)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

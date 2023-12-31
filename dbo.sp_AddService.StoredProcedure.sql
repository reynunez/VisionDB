/****** Object:  StoredProcedure [dbo].[sp_AddService]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddService](
	@servcat int,
	@servdesc char(45),
	@np nvarchar(12),
	@ep nvarchar(12),
	@cpt nvarchar(12),
	@fee money,
	@taxable smallint
)
as
begin tran
	
	insert into services(
		servcat,
		servdesc,
		np,
		ep,
		cpt,
		fee,
		taxable)
	values(
	@servcat,
	@servdesc ,
	@np,
	@ep,
	@cpt,
	@fee,
	@taxable)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

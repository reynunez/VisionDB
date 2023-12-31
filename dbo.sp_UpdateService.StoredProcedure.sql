/****** Object:  StoredProcedure [dbo].[sp_UpdateService]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateService](
	@servid int,
	@servcat int,
	@servdesc char(45),
	@np nvarchar(12),
	@ep nvarchar(12),
	@cpt nvarchar(12),
	@fee money,
	@taxable smallint)
AS
begin tran
	update Services set
	servcat = @servcat,
	servdesc = @servdesc,
	np = @np,
	ep = @ep,
	cpt = @cpt,
	fee = @fee,
	taxable = @taxable
	where servid = @servid
	if @@error <> 0 begin
		rollback tran
	end
commit tran
GO

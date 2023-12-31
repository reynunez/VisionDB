/****** Object:  StoredProcedure [dbo].[sp_UpdateSalesman]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateSalesman](
	@salesmanid int,
	@name char(60),
	@commision numeric(18,2),
	@officeid int=null,
	@phone nvarchar(20)=null
) AS
begin tran
	update salespeople set
	name = @name,
	commision = @commision,
	officeid = @officeid,
	phone = @phone
	where salesmanid = @salesmanid

	if @@error <> 0 begin
		rollback tran
	end

commit tran
GO

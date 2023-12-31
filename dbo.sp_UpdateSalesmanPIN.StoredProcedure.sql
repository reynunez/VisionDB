/****** Object:  StoredProcedure [dbo].[sp_UpdateSalesmanPIN]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateSalesmanPIN](
	@salesmanid int,
	@persidnumber varchar(4) = null
) AS
begin tran

	update salespeople set
	persidnumber = (Select dbo.EncryptString(@persidnumber,102))
	where salesmanid = @salesmanid

	if @@error <> 0 begin
		rollback tran
	end

commit tran
GO

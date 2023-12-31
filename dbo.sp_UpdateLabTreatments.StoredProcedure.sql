/****** Object:  StoredProcedure [dbo].[sp_UpdateLabTreatments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE procedure [dbo].[sp_UpdateLabTreatments](
	@treatmentid int,
	@manufacturer nvarchar(50),
	@type nvarchar(40),
	@txname nvarchar(50),
	@cost numeric(18,2),
	@listprice numeric(18,2)
)
as
begin tran
	update labtreatments set
	manufacturer = @manufacturer,
	type = @type,
	txname = @txname,
	cost = @cost,
	listprice = @listprice
	where treatmentid = @treatmentid
	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

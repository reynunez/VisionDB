/****** Object:  StoredProcedure [dbo].[sp_AddNewLabTreatment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_AddNewLabTreatment](
	@manufacturer nvarchar(50),
	@type nvarchar(40),
	@txname nvarchar(50),
	@cost numeric(18,2),
	@listprice numeric(18,2)
)
as
begin tran
	insert into labtreatments(
		manufacturer,
		Type,
		txname,
		Cost,
		listprice
		)
	values(
		@manufacturer,
		@type,
		@txname,
		@cost,
		@listprice
		)
	
	if @@error <> 0 begin
		rollback tran
	end
commit tran
GO

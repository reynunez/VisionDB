/****** Object:  StoredProcedure [dbo].[sp_AddNewBillProv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_AddNewBillProv](
	@name varchar(100),
	@address_line1 varchar(50),
	@address_line2 varchar(50),
	@city varchar(50),
	@state varchar(2),
	@zip varchar(10),
	@phone varchar(15),
	@provider_id varchar(20),
	@taxid varchar(20),
	@npi varchar(45),
	@active tinyint
)
as
begin tran
	
	insert into tbl_billing_provider(
		name,
		address_line1,
		address_line2,
		city,
		state,
		zip,
		phone,
		provider_id,
		taxid,
		npi,
		active)
	values(
		@name,
		@address_line1,
		@address_line2,
		@city,
		@state,
		@zip,
		@phone,
		@provider_id,
		@taxid,
		@npi,
		@active)
	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

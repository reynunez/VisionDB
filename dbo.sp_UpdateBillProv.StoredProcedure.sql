/****** Object:  StoredProcedure [dbo].[sp_UpdateBillProv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_UpdateBillProv](
	@id integer,
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
	
	update tbl_billing_provider set
		name = @name,
		address_line1 = @address_line1,
		address_line2 = @address_line2,
		city = @city,
		state = @state,
		zip = @zip,
		phone = @phone,
		provider_id = @provider_id,
		taxid = @taxid,
		npi = @npi,
		active = @active
	where id = @id
	
	if @@error <> 0 begin
		rollback tran
	end 
	
commit tran
GO

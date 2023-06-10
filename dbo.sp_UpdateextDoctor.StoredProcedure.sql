/****** Object:  StoredProcedure [dbo].[sp_UpdateextDoctor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_UpdateextDoctor](
	@Doctorid int,
	@description nvarchar(50),
	@address1 char(45),
	@address2 char(45),
	@city char(25),
	@state char(2),
	@zip char(10),
	@phone char(15),
	@fax char(15),
	@license char(45),
	@taxid char(20),
	@degrees char(45),
	@specialty char(45),
	@isActive bit,
	@npi varchar(15),
	@email varchar(255)
)
as
begin tran
	
	update ext_Doctors set
		description = @description,
		address1 = @address1,
		address2 = @address2,
		city = @city,
		state = @state,
		zip = @zip,
		phone = @phone,
		fax = @fax,
		license = @license,
		taxid = @taxid,
		degrees = @degrees,
		specialty = @specialty,
		isActive = @isActive,
		npi = @npi,
		email = @email
	where Doctorid = @Doctorid
	
	if @@error <> 0 begin
		rollback tran
	end 
	
commit tran
GO

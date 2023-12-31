/****** Object:  StoredProcedure [dbo].[sp_UpdateDoctor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_UpdateDoctor](
	@doctorid int,
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
	@firstname varchar(45)='',
	@lastname varchar(45)='',
	@middle char(1)=''
)
as
begin tran
	
	update doctors set
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
		firstname = @firstname,
		lastname = @lastname,
		middle = @middle
	where doctorid = @doctorid
	
	if @@error <> 0 begin
		rollback tran
	end 
	
commit tran
GO

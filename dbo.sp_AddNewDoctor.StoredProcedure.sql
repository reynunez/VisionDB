/****** Object:  StoredProcedure [dbo].[sp_AddNewDoctor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_AddNewDoctor](
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
	
	insert into doctors(
		description,
		address1,
		address2,
		city,
		state,
		zip,
		phone,
		fax,
		license,
		taxid,
		degrees,
		specialty,
		isactive,
		npi,
		firstname,
		lastname,
		middle)
	values(
		@description,
		@address1,
		@address2,
		@city,
		@state,
		@zip,
		@phone,
		@fax,
		@license,
		@taxid,
		@degrees,
		@specialty,
		@isActive,
		@npi,
		@firstname,
		@lastname,
		@middle)
	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

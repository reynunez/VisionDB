/****** Object:  StoredProcedure [dbo].[sp_AddNewInsurance]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddNewInsurance](
	@insurance_name nvarchar(40),
	@insurance_address1 nvarchar(40),
	@insurance_address2 nvarchar(40),
	@insurance_city nvarchar(30),
	@insurance_state char(2),
	@insurance_zip_cd nvarchar(10),
	@insurance_phone_no nvarchar(20),
	@insurance_fax_no nvarchar(20),
	@insurance_contact nvarchar(30),
	@insurance_account_no nvarchar(10),
	@signature_onfile_allowed bit,
	@insurance_type int,
	@insurance_coverage decimal(10,2),
	@active bit = 1,
	@availity bit = 0,
	@payer_id varchar(15) = '',
	@payer_name varchar(45) = ''
)
as
begin tran
	insert into insurance(
		insurance_name,
		insurance_address1,
		insurance_address2,
		insurance_city,
		insurance_state,
		insurance_zip_cd,
		insurance_phone_no,
		insurance_fax_no,
		insurance_contact,
		insurance_account_no,
		signature_onfile_allowed,
		insurance_type,
		insurance_coverage,
		active,
		availity,
		payer_id,
		payer_name
		)
	values(
		@insurance_name,
		@insurance_address1,
		@insurance_address2,
		@insurance_city,
		@insurance_state,
		@insurance_zip_cd,
		@insurance_phone_no,
		@insurance_fax_no,
		@insurance_contact,
		@insurance_account_no,
		@signature_onfile_allowed,
		@insurance_type,
		@insurance_coverage,
		@active,
		@availity,
		@payer_id,
		@payer_name
		)
	
	if @@error <> 0 begin
		rollback tran
	end
commit tran
GO

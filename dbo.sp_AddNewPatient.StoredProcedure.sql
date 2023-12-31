/****** Object:  StoredProcedure [dbo].[sp_AddNewPatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_AddNewPatient] 
	@first_name NVARCHAR (25), 
	@mid_name NVARCHAR (15), 
	@last_name NVARCHAR (25), 
	@suffix NVARCHAR (10), 
	@entry_date DATETIME, 
	@sex SMALLINT, 
	@birth_date DATETIME, 
	@ss_no NVARCHAR (11), 
	@title NVARCHAR (10), 
	@head_of_household SMALLINT, 
	@salutation NVARCHAR (30), 
	@occupation NVARCHAR (30), 
	@marital_status INT, 
	@signature_on_file SMALLINT, 
	@signature_date DATETIME, 
	@med_alert NTEXT, @notes NTEXT, 
	@active SMALLINT, 
	@last_office_visit_date DATETIME, 
	@next_appointment DATETIME, 
	@last_update DATETIME, 
	@mailing_list SMALLINT, 
	@last_exam_date DATETIME, 
	@eMail_address NVARCHAR (125), 
	@employername NVARCHAR (50), 
	@officeid INT, 
	@doctorid SMALLINT, 
	@isbeingedit BIT,
	@pcp NVARCHAR (65)='N/A', 
	@address1 NVARCHAR (40), 
	@address2 NVARCHAR (40), 
	@city NVARCHAR (40), 
	@state NVARCHAR (2), 
	@zip NVARCHAR (10), 
	@phone1 NVARCHAR (30), 
	@phone2 NVARCHAR (30), 
	@fax NVARCHAR (20), 
	@ethnicity integer = 0,
	@race integer = 0,
	@language integer = 0,	
	@guardian varchar(100) = NULL,
	@insurance_no INT=0, 
	@insured_id NVARCHAR (20)=NULL, 
	@policy_group_no NVARCHAR (20)=NULL, 
	@iauthorization NVARCHAR (50)=NULL, 
	@benefits NVARCHAR (50)=NULL, 
	@isSaveInsurance BIT=1,
	@npcp integer = NULL,
	@nomd integer = NULL,
	@pharmacy integer = NULL
AS
declare @ThisDate datetime
select @ThisDate = DATEADD(hh,-5,getdate())
declare @LastPatient int
begin tran
	insert into patient(
		first_name,
		mid_name,		
		last_name,		
		suffix,
		entry_date,
		sex,
		birth_date,
		ss_no,
		title,
		head_of_household,
		salutation,
		occupation,
		marital_status,
		signature_on_file,
		signature_date,
		med_alert,
		notes,
		active,
		last_office_visit_date,
		next_appointment,
		last_update,
		mailing_list,
		last_exam_date,
		eMail_address,
		employername,
		officeid,
		doctorid,
		isbeingedit,
		pcp,
		ethnicity,
		race,
		language,
		guardian,
		npcp,
		nomd,
		pharmacy)
	values(
		@first_name,
		@mid_name,
		@last_name,
		@suffix,
		@entry_date,
		@sex,
		@birth_date,
		@ss_no,
		@title,
		@head_of_household,
		@salutation,
		@occupation,
		@marital_status,
		@signature_on_file,
		@signature_date,
		@med_alert,
		@notes,
		@active,
		@last_office_visit_date,
		@next_appointment,
		@last_update,
		@mailing_list,
		@last_exam_date,
		@eMail_address,
		@employername,
		@officeid,
		@doctorid,
		@isbeingedit,
		@pcp,
		@ethnicity,
		@race,
		@language,
		@guardian,
		@npcp,
		@nomd,
		@pharmacy)
		
	if @@error <> 0 begin
		rollback tran
	end

	Select TOP 1 @LastPatient = patient_no from patient order by patient_no DESC

	insert into address(
		patient_no,
		address1,
		address2,
		city,
		state,
		zip,
		phone1,
		phone2,
		fax)
	values(
		@LastPatient,
		@address1,
		@address2,
		@city,
		@state,
		@zip,
		@phone1,
		@phone2,
		@fax)

	if @@error <> 0 begin
		rollback tran
	end
	
	if (@isSaveInsurance = 1 and @insurance_no <> 0) BEGIN
		Insert into patient_insurances(
			patient_no,
			insurance_no,
			insured_id,
			policy_group_no,
			iauthorization,
			benefits)
		values(
			@LastPatient,
			@insurance_no,
			@insured_id,
			@policy_group_no,
			@iauthorization,
			@benefits)
	END

	if @@error <> 0 begin
		rollback tran
	end
commit tran
GO

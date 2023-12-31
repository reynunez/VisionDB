/****** Object:  StoredProcedure [dbo].[sp_UpdatePatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_UpdatePatient](
	@patient_no int,
	@address_no int,
	@ins_no int,
	@first_name nvarchar(25),
	@mid_name nvarchar(15),
	@last_name nvarchar(25),
	@suffix nvarchar(10),
	@sex smallint,
	@birth_date datetime,
	@ss_no nvarchar(11),
	@title nvarchar(10),
	@head_of_household smallint,
	@salutation nvarchar(30),
	@occupation nvarchar(30),
	@marital_status int,
	@signature_on_file smallint,
	@signature_date datetime,
	@med_alert ntext,
	@notes ntext,
	@active smallint,
	@last_office_visit_date datetime,
	@next_appointment datetime,
	@last_update datetime,
	@mailing_list smallint,
	@last_exam_date datetime,
	@eMail_address nvarchar(125),
	@employername char(45),
	@officeid int,
	@doctorid smallint,
	@isbeingedit bit,
	@pcp NVARCHAR (65)='N/A',
	@address1 nvarchar(40),
	@address2 nvarchar(40),
	@city nvarchar(40),
	@state nvarchar(2),
	@zip nvarchar(10),
	@phone1 nvarchar(30),
	@phone2 nvarchar(30),
	@fax nvarchar(20),
	@ethnicity integer = 0,
	@race integer = 0,
	@language integer = 0,
	@guardian varchar(100) = NULL,
	@insurance_no int =0,
	@insured_id nvarchar(20) = NULL,
	@policy_group_no nvarchar(20) = NULL,
	@iauthorization char(45) = NULL,
	@benefits char(45) = NULL,
	@isSaveInsurance bit = 1,
	@npcp integer = NULL,
	@nomd integer = NULL,
	@pharmacy integer = NULL
)
As
declare @ThisDate datetime
select @ThisDate = DATEADD(hh,-5,getdate())

begin tran
	update patient set 
		first_name = @first_name,
		mid_name = @mid_name,		
		last_name = @last_name,		
		suffix = @suffix,
		sex = @sex,
		birth_date = @birth_date,
		ss_no = @ss_no,
		title = @title,
		head_of_household = @head_of_household,
		salutation = @salutation,
		occupation = @occupation,
		marital_status = @marital_status,
		signature_on_file = @signature_on_file,
		signature_date = @signature_date,
		med_alert = @med_alert,
		notes = @notes,
		active = @active,
		last_office_visit_date = @last_office_visit_date,
		next_appointment = @next_appointment,
		last_update = @last_update,
		mailing_list = @mailing_list,
		last_exam_date = @last_exam_date,
		eMail_address = @eMail_address,
		employername = @employername,
		officeid = @officeid,
		doctorid = @doctorid,
		isbeingedit = @isbeingedit,
		pcp = @pcp,
		ethnicity = @ethnicity,
		race = @race,
		language = @language,
		guardian = @guardian,
		npcp = @npcp,
		nomd = @nomd,
		pharmacy = @pharmacy
	where patient_no = @patient_no
		
	if @@error <> 0 begin
		rollback tran
	end

	update address set
		address1 = @address1,
		address2= @address2,
		city = @city,
		state = @state,
		zip = @zip,
		phone1 = @phone1,
		phone2 = @phone2,
		fax = @fax
	where patient_no = @patient_no
	
	if @@error <> 0 begin
		rollback tran
	end

	IF (@isSaveInsurance = 1 and @insurance_no <> 0) BEGIN
		if exists(Select * from patient_insurances where patient_no = @patient_no)
			begin
			update patient_insurances set
				insurance_no = @insurance_no,
				insured_id = @insured_id,
				policy_group_no = @policy_group_no,
				iauthorization = @iauthorization,
				benefits = @benefits
			where patient_no = @patient_no
			end
		else
			begin
			Insert into patient_insurances(
				patient_no,
				insurance_no,
				insured_id,
				policy_group_no,
				iauthorization,
				benefits)
			values(
				@patient_no,
				@insurance_no,
				@insured_id,
				@policy_group_no,
				@iauthorization,
				@benefits)
			end
	END
	
	if @@error <> 0 begin
		rollback tran
	end
commit tran
GO

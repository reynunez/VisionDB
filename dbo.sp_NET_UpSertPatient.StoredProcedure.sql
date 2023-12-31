/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertPatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/01/2020
-- Description: Adding/Update a Patient
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertPatient]
(
		@isnew bit = 0,
		@patient_no int,
		@first_name nvarchar(25) ,
		@mid_name nvarchar(15) = '',
		@last_name nvarchar(25) ,
		@suffix nvarchar(10) ,
		@entry_date datetime ,
		@sex smallint ,
		@birth_date datetime ,
		@ss_no nvarchar(11) ,
		@title nvarchar(10) ,
		@head_of_household smallint ,
		@salutation nvarchar(30) ,
		@occupation nvarchar(30) ,
		@marital_status int ,
		@signature_on_file smallint ,
		@signature_date datetime ,
		@med_alert ntext ,
		@notes ntext ,
		@active smallint ,
		@last_office_visit_date datetime ,
		@next_appointment datetime ,
		@last_update datetime ,
		@mailing_list smallint ,
		@last_exam_date datetime ,
		@eMail_address nvarchar(125) ,
		@employername char(45) ,
		@officeid int ,
		@doctorid smallint ,
		@isbeingedit bit  ,
		@oPatient_no int ,
		@pcp varchar(65) ,
		@ethnicity int  ,
		@race int  ,
		@language int  ,
		@guardian varchar(100) ,
		@guardianphone varchar(15),
		@npcp int = 0,
		@nomd int = 0 ,
		@pharmacy int = 0,
		@address_no int  ,
		@address1 nvarchar(40) ,
		@address2 nvarchar(40) ,
		@city nvarchar(40) ,
		@state nvarchar(2) ,
		@zip nvarchar(10) ,
		@phone1 nvarchar(30) ,
		@phone2 nvarchar(30) ,
		@fax nvarchar(20) ,
		@isSaveInsurance smallint,
		@insurance_no int,
		@insured_id varchar(25),
		@policy_group_no varchar(25)
)
AS
    SET NOCOUNT ON

	IF @isnew = 1 BEGIN

		begin tran

		DECLARE @LastPatient INT

		INSERT INTO PATIENT(
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
				notes  ,
				active  ,
				last_office_visit_date,
				next_appointment ,
				last_update,
				mailing_list,
				last_exam_date,
				eMail_address,
				employername,
				officeid,
				doctorid,
				isbeingedit,
				oPatient_no,
				pcp,
				ethnicity,
				race,
				language,
				guardian,
				guardianphone,
				npcp,
				nomd,
				pharmacy
				)
		Values(
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
				@oPatient_no,
				@pcp,
				@ethnicity,
				@race,
				@language,
				@guardian,
				@guardianphone,
				@npcp,
				@nomd,
				@pharmacy
			)

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
					benefits,
					date_creaated,
					date_disabled)
				values(
					@LastPatient,
					@insurance_no,
					@insured_id,
					@policy_group_no,
					'',
					'',
					DATEADD(hh,-5,getdate()),
					NULL)
			END

			if @@error <> 0 begin
				rollback tran
			end
			commit tran
		END
		ELSE BEGIN

			begin tran

				UPDATE PATIENT
					SET first_name = @first_name,
					mid_name = @mid_name,
					last_name = @last_name,
					sex = @sex,
					birth_date = @birth_date,
					head_of_household = @head_of_household,
					notes = @notes,
					active = @active,
					last_office_visit_date = @last_office_visit_date,
					last_update = @last_update,
					last_exam_date = @last_exam_date,
					eMail_address = @eMail_address,
					pcp = @pcp,
					guardian = @guardian,
					guardianphone = @guardianphone,
					npcp = @npcp,
					nomd = @nomd,
					pharmacy = @pharmacy
				WHERE patient_no = @patient_no

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

			commit tran
		END 
GO

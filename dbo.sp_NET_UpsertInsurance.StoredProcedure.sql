/****** Object:  StoredProcedure [dbo].[sp_NET_UpsertInsurance]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/01/2021
-- Description:	Procedure Update Insurance
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpsertInsurance](
	@insurance_no [Int],
	@insurance_name [nvarchar](40),
	@insurance_address1 [nvarchar](40) , 
	@insurance_address2 [nvarchar](40) , 
	@insurance_city [nvarchar](30), 
	@insurance_state [char](2), 
	@insurance_zip_cd [nvarchar](10) , 
	@insurance_phone_no [nvarchar](20), 
	@insurance_fax_no [nvarchar](20), 
	@insurance_contact [nvarchar](30) , 
	@insurance_type [smallint] , 
	@payer_name [nvarchar](45) = '', 
	@active [bit],
	@payer_id [nvarchar](15) = ''
)
AS
BEGIN
	IF @insurance_no <> 0  BEGIN
		Update Insurance 
		SET insurance_name = @insurance_name,
		insurance_address1 = @insurance_address1,
		insurance_address2 = @insurance_address2,
		insurance_city = @insurance_city,
		insurance_state = @insurance_state,
		insurance_zip_cd = @insurance_zip_cd,
		insurance_phone_no = @insurance_phone_no,
		insurance_fax_no = @insurance_fax_no,
		insurance_contact = @insurance_contact,
		insurance_type = @insurance_type,
		payer_name = @payer_name,
		payer_id = @payer_id,
		active = @active
		WHERE insurance_no = @insurance_no
	END
	ELSE BEGIN
		INSERT INTO insurance (	insurance_name ,
								insurance_address1 ,
								insurance_address2 ,
								insurance_city ,
								insurance_state ,
								state_cd ,
								insurance_zip_cd ,
								insurance_phone_no ,
								insurance_fax_no ,
								insurance_contact ,

								signature_onfile_allowed ,
								pay_sales_tax ,
								salestax ,

								insurance_type ,
								Availity ,
								payer_id ,
								payer_Name ,
								active ,
								isSendProvider ,
								insurance_account_no ,
								insurance_coverage
								)
		VALUES(
				@insurance_name ,
				@insurance_address1 , 
				@insurance_address2 , 
				@insurance_city , 
				@insurance_state , 
				0,
				@insurance_zip_cd  , 
				@insurance_phone_no , 
				@insurance_fax_no , 
				@insurance_contact , 
				1,
				0,
				0,
				@insurance_type , 
				1,
				@payer_id ,
				@payer_name , 
				@active ,
				1 ,
				'',
				1
				)
	END
END
GO

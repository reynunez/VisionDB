/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertBProvider]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/07/2021
-- Description:	Insert/Update Billing Provider
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertBProvider](
	@doctorid INT
	,@provid int = 0
	,@name VARCHAR(100)
	,@address1 VARCHAR(100)
	,@address2 VARCHAR(100)
	,@city VARCHAR(100)
	,@state VARCHAR(2)
	,@zip VARCHAR(10)
	,@phone VARCHAR(15)
	,@taxid varchar(45)
	,@npi VARCHAR(45)
	,@active tinyint 
    ,@contactname VARCHAR(100)
    ,@contactemail VARCHAR(120)
    ,@contactphone VARCHAR(20)
)
AS
BEGIN
	IF @doctorid = 0 BEGIN
			Insert into tbl_billing_provider(
					name 
					,provider_id 
					,address_line1 
					,address_line2 
					,city 
					,state 
					,zip 
					,phone
					,taxid 
					,npi 
					,active
                    ,contactname
                    ,contactemail
                    ,contactphone
					)
			Values(
					@name
					,@provid 
					,@address1 
					,@address2 
					,@city 
					,@state 
					,@zip 
					,@phone
					,@taxid
					,@npi 
					,@active 
                    ,@contactname
                    ,@contactemail
                    ,@contactphone                    
			)
	END
	ELSE BEGIN

		Update tbl_billing_provider
			Set name = @name 
			,address_line1 = @address1
			,address_line2 = @address2
			,city = @city
			,state = @state
			,zip = @zip
			,phone = @phone
			,taxid = @taxid 
			,npi = @npi
			,active = @active 
            ,contactname = @contactname
            ,contactemail = @contactemail
            ,contactphone = @contactphone
		WHERE id = @doctorid
	END

END
GO

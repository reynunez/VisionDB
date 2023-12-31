/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertLocation]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2021
-- Description:	Insert/Update Location
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertLocation](
	@officeid INT
	,@busname VARCHAR(50)
	,@description VARCHAR(50)
	,@address1 VARCHAR(45)
	,@address2 VARCHAR(45)
	,@city VARCHAR(25)
	,@state VARCHAR(2)
	,@zip VARCHAR(10)
	,@phone VARCHAR(15)
	,@fax VARCHAR(15)
	,@medicaid VARCHAR(20) = ''
	,@npi VARCHAR(20) = ''
	,@isOperational BIT
	,@abbCode VARCHAR(10) = ''

)
AS
BEGIN
	IF @officeid = 0 BEGIN
			Insert into office(
					busname
					,description 
					,address1 
					,address2 
					,city 
					,state 
					,zip 
					,phone
					,fax 
					,isOperational
					,sqlserver 
					,taxid 
					,medicaid
					,npi
					,voicent 
					,abbCode
					)
			Values(
					@busname 
					,@description
					,@address1 
					,@address2 
					,@city 
					,@state 
					,@zip 
					,@phone
					,@fax 
					,@isOperational
					,''
					,''
					,@medicaid 
					,@npi 
					,''
					,@abbCode
			)
	END
	ELSE BEGIN

		Update office
			Set busname = @busname 
			,description = @description
			,address1 = @address1
			,address2 = @address2
			,city = @city
			,state = @state
			,zip = @zip
			,phone = @phone
			,fax = @fax
			,medicaid = @medicaid 
			,npi = @npi 
			,isOperational = @isOperational 
			,abbCode = @abbCode
		WHERE officeid = @officeid 
	END

END
GO

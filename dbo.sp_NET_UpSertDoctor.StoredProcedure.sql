/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertDoctor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2021
-- Description:	Insert/Update Doctor
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertDoctor](
	@doctorid INT
	,@description VARCHAR(50)
	,@address1 VARCHAR(45)
	,@address2 VARCHAR(45)
	,@city VARCHAR(25)
	,@state VARCHAR(2)
	,@zip VARCHAR(10)
	,@phone VARCHAR(15)
	,@fax VARCHAR(15)
	,@license VARCHAR(45)
	,@taxid VARCHAR(20)
	,@degrees VARCHAR(45)
	,@specialty VARCHAR(45)
	,@isactive BIT
	,@npi VARCHAR(15)
	,@firstname VARCHAR(45)
	,@lastname VARCHAR(45)
	,@middle  VARCHAR(1)
)
AS
BEGIN
	IF @doctorid = 0 BEGIN
			Insert into Doctors(
					description 
					,address1 
					,address2 
					,city 
					,state 
					,zip 
					,phone
					,fax 
					,license 
					,taxid 
					,[degrees]
					,specialty 
					,isactive 
					,npi 
					,lastrecordedsig
					,firstname 
					,lastname 
					,middle 
					)
			Values(
					@description
					,@address1 
					,@address2 
					,@city 
					,@state 
					,@zip 
					,@phone
					,@fax 
					,@license 
					,@taxid 
					,@degrees
					,@specialty 
					,@isactive 
					,@npi 
					,DATEADD(hh,-5,getdate())
					,@firstname 
					,@lastname 
					,@middle 
			)
	END
	ELSE BEGIN

		Update Doctors
			Set description = @description
			,address1 = @address1
			,address2 = @address2
			,city = @city
			,state = @state
			,zip = @zip
			,phone = @phone
			,fax = @fax
			,license = @license
			,taxid = @taxid
			,[degrees] = @degrees
			,specialty = @specialty
			,isactive = @isactive
			,npi = @npi
			,lastrecordedsig = DATEADD(hh,-5,getdate())
			,firstname = @firstname
			,lastname = @lastname
			,middle = @middle
		WHERE doctorid = @doctorid
	END

END
GO

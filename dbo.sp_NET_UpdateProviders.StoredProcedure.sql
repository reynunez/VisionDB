/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateProviders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/27/2020
-- Description: Update Providers
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateProviders]
(
	@id INTEGER,
	@description varchar(50),
	@address1 varchar(45),
	@address2 varchar(45),
	@city varchar(25),
	@state varchar(2),
	@zip varchar(10),
	@phone varchar(15),
	@fax varchar(15),
	@license varchar(45),
	@taxid varchar(20),
	@specialty varchar(25),
	@isactive bit,
	@email varchar(255),
	@last_name varchar(25),
	@first_name varchar(25),
	@specialtyid smallint = 0,
	@npi varchar(20) = ''
)
AS
BEGIN
    SET NOCOUNT ON
			Update ext_doctors 
			set description = @description,
			address1 = @address1,
			address2 = address2,
			city = @city,
			state = @state,
			zip = @zip,
			phone = @phone,
			fax = @fax,
			license = @license,
			taxid = @taxid,
			specialty = @specialty,
			isactive = @isactive,
			lastrecordedsig = DATEADD(hh,-5,getdate()),
			email =@email,
			last_name = @last_name,
			first_name = @first_name,
			specialtyid = @specialtyid,
			npi = @npi
			where doctorid = @id
END
GO

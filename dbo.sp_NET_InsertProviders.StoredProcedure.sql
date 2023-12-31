/****** Object:  StoredProcedure [dbo].[sp_NET_InsertProviders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/10/2020
-- Description: Add Providers
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertProviders]
(
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
	@degrees varchar(45),
	@specialty varchar(45),
	@isactive bit,
	@npi varchar(20),
	@email varchar(255),
	@last_name varchar(25),
	@first_name varchar(25),
	@specialtyid smallint = 0
)
AS
BEGIN
    SET NOCOUNT ON

    insert into ext_doctors(
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
			[degrees],
			specialty,
			isactive,
			npi,
			lastrecordedsig,
			email,
			last_name,
			first_name,
			specialtyid
			)
		Values(
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
			@isactive,
			@npi,
			DATEADD(hh,-5,getdate()),
			@email,
			@last_name,
			@first_name,
			@specialtyid
			)
END
GO

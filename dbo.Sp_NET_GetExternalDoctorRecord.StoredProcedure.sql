/****** Object:  StoredProcedure [dbo].[Sp_NET_GetExternalDoctorRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/26/2020
-- Description:	External Doctors Record
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetExternalDoctorRecord]
	@id INTEGER
AS
BEGIN
		select	doctorid
				,description
				,address1 
				,address2 
				,city 
				,state
				,zip
				,phone
				,fax
				,license
				,taxid
				,degrees
				,specialty
				,isactive
				,npi
				,lastrecordedsig 
				,email
				,last_name 
				,first_name 
				,specialtyid
		from	ext_doctors
		where	doctorid = @id 
END
GO

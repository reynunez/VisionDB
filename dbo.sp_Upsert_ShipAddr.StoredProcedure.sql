/****** Object:  StoredProcedure [dbo].[sp_Upsert_ShipAddr]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 04/15/2016
-- Description:	Maintain Shipping Address for Patients
-- =============================================
CREATE PROCEDURE [dbo].[sp_Upsert_ShipAddr](
	@address_no int,
	@patient_no int,
	@address1 nvarchar(100),
	@address2 nvarchar(100),
	@city nvarchar(80),
	@state nvarchar(2),
	@zip nvarchar(10),
	@phone1 nvarchar(15),
	@phone2 nvarchar(15),
	@fax nvarchar(15),
	@default bit
	)
AS
BEGIN
	SET NOCOUNT ON;

	IF @address_no = 0 BEGIN
		INSERT INTO dbo.shipaddress
		SELECT	@patient_no as patient_no
				,@address1 as address1
				,@address2 as address2
				,@city as city
				,@state as state
				,@zip as zip
				,@phone1 as phone1
				,@phone2 as phone2
				,@fax as fax
				,@default as [default]
				,DATEADD(hh,-5,getdate()) as create_date
				
	END
	ELSE BEGIN
		
		UPDATE dbo.shipaddress
		SET patient_no = @patient_no
		,address1 = @address1
		,address2 = @address2
		,city = @city
		,state = @state
		,zip = @zip
		,phone1 = @phone1
		,phone2 = @phone2
		,fax = @fax
		,[default] = @default
		WHERE address_no = @address_no
			
	END

END
GO

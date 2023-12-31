/****** Object:  StoredProcedure [dbo].[sp_NET_GetThPrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/01/2020
-- Description: Get Therapeutic Prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetThPrescription](
	@prescid as integer
)
AS
BEGIN

	select	tradename 
			,generic 
			,manufacturer 
			,preparation 
			,howsupplied 
			,sig 
			,refills 
			,refillsamt 
			,voidafter 
	from	prescth 
	where	prescid = @prescid

END

GO

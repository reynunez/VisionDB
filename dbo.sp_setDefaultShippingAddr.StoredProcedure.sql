/****** Object:  StoredProcedure [dbo].[sp_setDefaultShippingAddr]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 4/16/2016
-- Description:	Set default shipping address
-- =============================================
CREATE PROCEDURE [dbo].[sp_setDefaultShippingAddr]( 
	@patient_no int,
	@address_no int
)
AS
BEGIN

	update dbo.shipaddress
	set [default] = 0
	where patient_no = @patient_no
	
	update dbo.shipaddress
	set [default] = 1
	where address_no = @address_no

		
END
GO

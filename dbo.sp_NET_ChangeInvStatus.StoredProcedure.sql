/****** Object:  StoredProcedure [dbo].[sp_NET_ChangeInvStatus]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/01/2021
-- Description: Change Invoice Status
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_ChangeInvStatus](
	@INVOICEID INT,
	@INV_STATUS VARCHAR(25)
)
AS
BEGIN

	UPDATE INVOICE_HDR 
	SET INV_STATUS = @INV_STATUS 
	WHERE invoiceid = @INVOICEID 

END
GO

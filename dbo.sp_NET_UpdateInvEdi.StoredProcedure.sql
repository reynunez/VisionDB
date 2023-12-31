/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateInvEdi]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/18/2020
-- Description:Update Invoice EDI Flag
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateInvEdi]
(
	@invoiceid INT
)
AS

BEGIN
		UPDATE INVOICE_HDR 
		SET isEDI = 1 
		WHERE invoiceid = @invoiceid
END
GO

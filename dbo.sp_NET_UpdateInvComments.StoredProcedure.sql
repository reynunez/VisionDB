/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateInvComments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/02/2021
-- Description:	Update Invoice Comments
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateInvComments](
	@INVOICEID INT,
	@COMMENTS TEXT = ''
)
As

BEGIN

		Update	INVOICE_HDR 
		SET		comments = @COMMENTS
		WHERE	invoiceid = @INVOICEID 

END
GO

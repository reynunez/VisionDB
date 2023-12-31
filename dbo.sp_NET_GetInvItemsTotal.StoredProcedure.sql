/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvItemsTotal]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/03/2021
-- Description: Get Invoice Items Total
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvItemsTotal](
	@INVOICEID as integer
)
AS

BEGIN

	SELECT	SUM(ITEM_TOTAL) 
	FROM	INVOICE_ITEMS 
	WHERE	INVOICEID = @INVOICEID

END
GO

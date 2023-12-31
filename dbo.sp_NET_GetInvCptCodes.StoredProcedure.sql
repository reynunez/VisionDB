/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvCptCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/15/2021
-- Description:	Procedure to get operational locations
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvCptCodes]
AS
	SET NOCOUNT ON;

	select	DISTINCT
			ITEM_CODE
	from	INVOICE_ITEMS;
GO

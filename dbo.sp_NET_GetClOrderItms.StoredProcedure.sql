/****** Object:  StoredProcedure [dbo].[sp_NET_GetClOrderItms]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/01/2021
-- Description: Get CL Order Items
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetClOrderItms](
	@ORDER_ID as integer
)
AS

BEGIN

		SELECT ITEM_CLASS
			  ,ITEM_CODE
			  ,ITEM_MODIFIER
			  ,ITEM_MODIFIER2
			  ,ITEM_DESCRIPTION
			  ,ITEM_UNITS
			  ,ITEM_FEE
			  ,ITEM_TOTAL
		  FROM dbo.CL_ORDER_ITEMS
		  where ORDER_ID = @ORDER_ID
		  Order by ITEM_DESCRIPTION DESC

  END
GO

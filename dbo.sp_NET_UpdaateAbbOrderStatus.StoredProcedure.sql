/****** Object:  StoredProcedure [dbo].[sp_NET_UpdaateAbbOrderStatus]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 05/27/2021
-- Description: Update ABB Order Status
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdaateAbbOrderStatus](
	@OrderStatus VARCHAR(45),
	@abbOrderId int
)
AS
BEGIN

	Update AbbOrders 
	set OrderStatus = @OrderStatus
	WHERE abbOrderId = @abbOrderId

END
GO

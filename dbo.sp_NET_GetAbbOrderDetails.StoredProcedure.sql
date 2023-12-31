/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbOrderDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description: ABB Orders Details
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbOrderDetails](
	@ordercode varchar(45)
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	d.*
	From	AbbDetailOrder  d join
			AbbOrders h ON h.ordercode = d.ordercode 
	Where	h.ordercode = @ordercode

END
GO

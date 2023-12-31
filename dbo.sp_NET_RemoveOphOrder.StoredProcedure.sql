/****** Object:  StoredProcedure [dbo].[sp_NET_RemoveOphOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/30/2010
-- Description:	Remove Oph Order
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_RemoveOphOrder](
	@ORDER_ID int
)
AS
	BEGIN TRAN

    SET NOCOUNT ON;

	DELETE FROM OPH_ORDER_XTRA WHERE ORDER_ID = @ORDER_ID 
	DELETE FROM OPH_ORDER_TREAT WHERE ORDER_ID = @ORDER_ID 
	DELETE FROM OPH_ORDER_ITEMS WHERE ORDER_ID = @ORDER_ID 
	DELETE FROM OPH_ORDER_HDR WHERE ORDER_ID = @ORDER_ID 

	COMMIT TRAN
GO

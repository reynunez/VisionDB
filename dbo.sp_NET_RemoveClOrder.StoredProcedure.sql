/****** Object:  StoredProcedure [dbo].[sp_NET_RemoveClOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/29/2010
-- Description:	Remove CL Order
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_RemoveClOrder](
	@ORDER_ID int
)
AS
	BEGIN TRAN

    SET NOCOUNT ON;

	DELETE FROM CL_ORDER_ITEMS WHERE ORDER_ID = @ORDER_ID 
	DELETE FROM CL_ORDER_HDR WHERE ORDER_ID = @ORDER_ID 

	COMMIT TRAN
GO

/****** Object:  StoredProcedure [dbo].[CreateOrdersTextMessage]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 03/13/2020
-- Description:	Update appointments Text Transmissions
-- =============================================
CREATE PROCEDURE [dbo].[CreateOrdersTextMessage](
	@ORDERID AS INT
	,@RESULTS AS NVARCHAR(500)
) 

AS
BEGIN
	DECLARE @TDATE AS DATETIME = CURRENT_TIMESTAMP

	INSERT INTO DBO.ORDERS_TEXTING(ORDERID,RESULTS,TDATE)
	VALUES(@ORDERID,@RESULTS,@TDATE)
END
GO

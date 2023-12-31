/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertSerPrice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 05/15/2021
-- Description: Update/Insert ABB Ser Price
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertSerPrice](
	@SER_ID VARCHAR(10),
	@COST NUMERIC(18,2),
	@MARKUP NUMERIC(18,2),
	@PRICE NUMERIC(18,2)
)
AS
BEGIN

	DECLARE @CLPRICE_ID INT

	SELECT @CLPRICE_ID = CLPRICE_ID  FROM CLMAN_SER_UNIT_PRICE  WHERE SER_ID = @SER_ID

	IF @CLPRICE_ID > 0 BEGIN
		UPDATE CLMAN_SER_UNIT_PRICE
		SET COST = @COST
			,MARKUP = @MARKUP
			,PRICE = @PRICE
		WHERE CLPRICE_ID = @CLPRICE_ID
	END
	ELSE BEGIN
		INSERT INTO CLMAN_SER_UNIT_PRICE(SER_ID,COST,MARKUP,PRICE)
		VALUES(@SER_ID,@COST,@MARKUP,@PRICE)
	END


END
GO

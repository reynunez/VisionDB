/****** Object:  StoredProcedure [dbo].[sp_NET_GetCompletionLetter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/10/2021
-- Description:	Get ready orders email
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCompletionLetter](
	@ORDER_TYPE VARCHAR(25)
)
AS
BEGIN

	IF @ORDER_TYPE = 'OPH' BEGIN
		select	PRODUCT1 as CONTENTS
		from	OrderStatusLetters
		where	letterid = 4
	END
	ELSE BEGIN
		select	PRODUCT2 as CONTENTS
		from	OrderStatusLetters
		where	letterid = 4
	END

END


GO

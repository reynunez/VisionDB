/****** Object:  StoredProcedure [dbo].[sp_NET_GetSerID]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 05/14/2021
-- Description: Get Abb Serial ID
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetSerID](
	@SER_NAME VARCHAR(100)
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SER_ID VARCHAR(10)

	SELECT	@SER_ID = [SER_ID]
	FROM	[dbo].[CLMAN_SER_UNIT]
	where	SER_NAME = @SER_NAME;

	IF @SER_ID IS NULL BEGIN
		SET @SER_ID = 'NONE';
	END

	SELECT @SER_ID AS SER_ID;

END
GO

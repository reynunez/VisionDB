/****** Object:  StoredProcedure [dbo].[sp_NET_GetProduct]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 04/28/2021
-- Description: Get Abb Products List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetProduct](
	@MAN_ID VARCHAR(10)
)
AS
BEGIN

    SET NOCOUNT ON

	SELECT	DISTINCT
			SER_ID 
			,SER_NAME 
	FROM	CLMAN_SER_UNIT 
	WHERE	MAN_ID = @MAN_ID 

END
GO

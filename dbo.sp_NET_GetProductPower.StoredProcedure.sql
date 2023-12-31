/****** Object:  StoredProcedure [dbo].[sp_NET_GetProductPower]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 04/28/2021
-- Description: Get Abb Product Power
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetProductPower](
	@SER_ID VARCHAR(10)
)
AS
BEGIN

    SET NOCOUNT ON

	Select	distinct
			PRD_POWER        
	from	CLMASTER 
	where	SER_ID = @SER_ID
	ORDER	BY PRD_POWER ASC

END
GO

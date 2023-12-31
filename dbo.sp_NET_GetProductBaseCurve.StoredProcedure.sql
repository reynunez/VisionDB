/****** Object:  StoredProcedure [dbo].[sp_NET_GetProductBaseCurve]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 04/28/2021
-- Description: Get Abb Product Base Curve
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetProductBaseCurve](
	@SER_ID VARCHAR(10)
)
AS
BEGIN

    SET NOCOUNT ON

	Select	distinct
			PRF_BASECURVE      
	from	CLMASTER 
	where	SER_ID = @SER_ID
	ORDER	BY PRF_BASECURVE ASC;

END
GO

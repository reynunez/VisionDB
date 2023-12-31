/****** Object:  StoredProcedure [dbo].[sp_NET_ChangeTrayContents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/01/2021
-- Description: Change Invoice Status
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_ChangeTrayContents](
	@ORDER_ID INT,
	@ORDERTYPE VARCHAR(25),
	@TRAY VARCHAR(25)
)
AS
BEGIN

	IF @ORDERTYPE = 'OPH' BEGIN
		UPDATE OPH_ORDER_HDR 
		SET ORDER_TRAY = @TRAY 
		WHERE ORDER_ID = @ORDER_ID
	END
	ELSE BEGIN
		UPDATE CL_ORDER_HDR 
		SET ORDER_TRAY = @TRAY 
		WHERE ORDER_ID = @ORDER_ID 
	END

END
GO

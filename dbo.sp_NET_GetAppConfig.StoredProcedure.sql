/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppConfig]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/18/2020
-- Description: Get Configuration Values
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppConfig]
AS

BEGIN
	SELECT * FROM APP_CONFIG
END
GO

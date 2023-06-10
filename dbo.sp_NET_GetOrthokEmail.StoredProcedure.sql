/****** Object:  StoredProcedure [dbo].[sp_NET_GetOrthokEmail]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 03/19/2021
-- Description:	Get Orthok Email
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOrthokEmail]
AS
BEGIN

	SELECT	ORTHOKEMAIL 
	FROM	APP_CONFIG 
	WHERE	configid = 1

END
GO

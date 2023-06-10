/****** Object:  StoredProcedure [dbo].[sp_NET_GetVisitReasons]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/31/2022
-- Description: Get Visit Reasons
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetVisitReasons]
AS
BEGIN

    SET NOCOUNT ON;
	select	distinct 
			reasonid
			,name 
	from	tblreason

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetFrameDependency]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-05-26
-- Description: Check for Orders Dependency
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetFrameDependency](
	@frameid int = 0
) As
BEGIN

	IF EXISTS(Select * from OPH_ORDER_HDR WHERE FRAMEID = @frameid) BEGIN
		SELECT 1 AS DEPENDENCY
	END
	ELSE BEGIN
		SELECT 0 AS DEPENDENCY
	END

END
GO

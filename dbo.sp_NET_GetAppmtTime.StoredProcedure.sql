/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppmtTime]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/02/2022
-- Description: Get appintment time list
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppmtTime]
AS
BEGIN

    SET NOCOUNT ON

	Select	TIMEID
			,APPMTTIME
	from	appmttime 
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetTesCom]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Test Comments
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetTesCom]
(
    @examid int
)
AS
BEGIN

    SET NOCOUNT ON

    Select	*
	From	tblEyeExamCom
	where	examid = @examid
END
GO

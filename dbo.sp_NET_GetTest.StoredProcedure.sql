/****** Object:  StoredProcedure [dbo].[sp_NET_GetTest]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Test 
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetTest]
(
    @examid int
)
AS
BEGIN

    SET NOCOUNT ON

    Select	testid,
			description
	From	tblEyeExamTest
	where	examid = @examid
END
GO

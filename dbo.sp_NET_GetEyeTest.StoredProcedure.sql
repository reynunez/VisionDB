/****** Object:  StoredProcedure [dbo].[sp_NET_GetEyeTest]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Eye Test 
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEyeTest]
(
    @examid int,
	@eyeid VARCHAR(10)
)
AS
BEGIN

    SET NOCOUNT ON

		Select	* 
		from	tblEyeExamEyeTest 
		where	examid = @examid
		and eyeid = @eyeid
END
GO

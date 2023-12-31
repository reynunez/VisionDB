/****** Object:  StoredProcedure [dbo].[sp_NET_GeteEyeExam]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/07/2020
-- Description:Get Eye Exam Contents
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GeteEyeExam](
	@examid as integer
)
AS
BEGIN

		SET NOCOUNT ON

		Select	contents 
		from	eyeexam 
		where	examid = @examid
END
GO

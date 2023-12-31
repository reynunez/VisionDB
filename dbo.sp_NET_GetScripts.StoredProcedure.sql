/****** Object:  StoredProcedure [dbo].[sp_NET_GetScripts]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/07/2020
-- Description: Retrieve Scripts
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetScripts]
AS
BEGIN

    SET NOCOUNT ON

	Select	s.scriptid 
			,s.isall
			,e.description as exam
			,t.description as test
			,s.color
			,s.script 
	from	tblEyeExamScript s
			left join tblEyeExamTest t on t.testid = s.testid 
			left join tblEyeExam e on e.examid = s.examid 
END
GO

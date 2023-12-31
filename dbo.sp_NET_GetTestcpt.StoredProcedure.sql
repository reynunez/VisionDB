/****** Object:  StoredProcedure [dbo].[sp_NET_GetTestcpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Test CPT LIST
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetTestcpt]
AS
BEGIN

    SET NOCOUNT ON

	Select	c.cptid
			,c.examid
			,eyetestid as testid
			,t.description as testdescription
			,coalesce(c.codelist,'') as codelist
			,coalesce(c.codedetails,'') as codedetails
	from	tblEyeExamTest t
			join tblEyeExamCpt c ON c.examid = t.examid and c.eyetestid = t.testid

END
GO

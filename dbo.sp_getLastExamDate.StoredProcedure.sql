/****** Object:  StoredProcedure [dbo].[sp_getLastExamDate]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2017-09-04
-- Description:	Get last exam date
-- =============================================
CREATE PROCEDURE [dbo].[sp_getLastExamDate]( 
	@patient_no int
)
AS
BEGIN
	Select	top 1 
			ISNULL(scriptdate,'Date Unavailable') AS lastexamdate,
			ISNULL(scripttime,'') as lastexamtime
	from	emrsavedscripts 
	where	patientid = @patient_no
	order	by scriptdate desc
END
GO

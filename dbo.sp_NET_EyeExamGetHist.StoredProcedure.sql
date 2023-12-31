/****** Object:  StoredProcedure [dbo].[sp_NET_EyeExamGetHist]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/07/2020
-- Description:Get Eye Exam History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_EyeExamGetHist](
	@patientid as integer
)
AS
BEGIN

		SET NOCOUNT ON

		Select	examid,
				ltrim(rtrim(datestr)) + ' ' + ltrim(rtrim(timestr )) as datetime
		from	eyeexam 
		where	patientid = @patientid
		order	by examid desc
END
GO

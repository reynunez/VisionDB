/****** Object:  StoredProcedure [dbo].[sp_GetST_TimeElapsed]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez	
-- Create date: 11/07/2017
-- Description:	Specialty Test Time Elapsed
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetST_TimeElapsed]( 
	@testdate date,
	@patientid int
)
AS
BEGIN
	SELECT	top 1 
			datediff(m,testdate,@testdate) as difmonth,
			testdate 
	FROM	[dbo].[emrSpecialtyTest] 
	where	testdate < @testdate and patientid = @patientid 
	order by testdate desc
END
GO

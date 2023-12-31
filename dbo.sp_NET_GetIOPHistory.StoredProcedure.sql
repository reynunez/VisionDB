/****** Object:  StoredProcedure [dbo].[sp_NET_GetIOPHistory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/02/2020
-- Description: Get IOPs History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetIOPHistory](
	@patient_no as integer
)
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	*
	FROM(
		Select	testdate  as Test_Date
				,iopOD as OD
				,iopos as OS
				,iopComment as Comment
		from	emrSpecialtyTest
		where	patientid = @patient_no
		UNION
		Select	DISTINCT
				cast(examdate as date) as test_date,
				dbo.Split(dbo.Split(contents,'~',2),'|',3) as OD,
				dbo.Split(dbo.Split(contents,'~',2),'|',4) as OS,
				dbo.Split(dbo.Split(contents,'~',2),'|',5) as Comment
		from	eyeexam where patientid = @patient_no
	) AS MAIN
	ORDER BY 1 DESC
END
GO

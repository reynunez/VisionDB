/****** Object:  StoredProcedure [dbo].[sp_GetWalkIn]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/20/2017
-- Description:	Get All Walk Ins
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetWalkIn]( 
	@DateFrom date,
	@DateTo date,
	@officeid int = 0
)
AS
BEGIN
	SET NOCOUNT ON;
	Select	visit_date,
			voicent,
			officeid,
			officename,
			doctor,
			patient_no,patientname,
			phone1,
			first_name,
			last_name 
	from	vw_GetDoctorRecords 
	where	visit_date between @DateFrom and @DateTo
			and patient_no not in (	Select	patient_no
									from	Vw_AllAppointments 
									Where	(APPMT_DATE between @DateFrom and @DateTo)
								)
			and ((CASE WHEN @officeid = 0 THEN 0 ELSE officeid  END) = @officeid)
	UNION 
	Select	visit_date,
			voicent,
			officeid,
			officename,
			doctor,
			patient_no,patientname,
			phone1,
			first_name,
			last_name 
	from	vw_GetDoctorRecords 
	where	visit_date between @DateFrom and @DateTo
			and patient_no  in (	Select	patient_no
									from	Vw_AllAppointments 
									Where	isWalkin = 1 
											and (APPMT_DATE between @DateFrom and @DateTo)
											and ((CASE WHEN @officeid = 0 THEN 0 ELSE officeid  END) = @officeid)
								)

END
GO

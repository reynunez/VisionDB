/****** Object:  StoredProcedure [dbo].[sp_NET_GetOnlineOB]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 2023-04-02
-- Description: Get Online OnBoarding
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOnlineOB]
(
	@PAR_DATE_1 DATE = '',
	@PAR_DATE_2 DATE = ''
)

AS
BEGIN

	Select	p.patient_no as Patient_No
			,p.first_name as First_Name
			,p.last_name as Last_Name
			,p.birth_date as Birthday
			,cast(o.createdate as date) as OB_Created
			,o.last_updated as OB_LastUpdated
			,p.last_office_visit_date as LastVisitDate
			,p.entry_date as EntryDate
	From	tblonboarding o
			join patient p on o.patient_no = p.patient_no 
	Where	isweb = 1
			and cast(last_updated as date)  between @PAR_DATE_1 and @PAR_DATE_2

END
GO

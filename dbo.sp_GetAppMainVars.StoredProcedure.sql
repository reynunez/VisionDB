/****** Object:  StoredProcedure [dbo].[sp_GetAppMainVars]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/04/2017
-- Description:	Initialize Main Program Patient Variables
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetAppMainVars]( 
	@patient_no integer
)
AS
BEGIN
	Select	isnull(doctorid,0) as doctorid
			,isnull(doctor_name,'') as doctor_name
			,isnull(patient_no,0) as patient_no
			,isnull(ss_no,'') as ss_no
			,convert(varchar(10),isnull(entry_date,'01/01/1900'),101) as entry_date
			,convert(varchar(10),isnull(birth_date,'01/01/1900'),101) as birth_date
			,isnull(address1,'') as address1
			,isnull(city,'') as city
			,isnull(state,'') as state
			,isnull(zip,'') as zip
			,isnull(phone1,'') as phone1
			,convert(varchar(10),isnull(last_office_visit_date,'01/01/1900'),101) as last_office_visit_date
			,isnull(office_name,'') as office_name
			,isnull(first_name,'') + ' ' + isnull(last_name,'') as patient_name
	from	getPatients 
	where	patient_no = @patient_no
END
GO

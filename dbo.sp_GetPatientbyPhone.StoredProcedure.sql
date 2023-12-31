/****** Object:  StoredProcedure [dbo].[sp_GetPatientbyPhone]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/16/2018
-- Description:	Search Patients using phone No
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPatientbyPhone]( 
	@phone varchar(20)
)
AS
BEGIN
Select	patient.patient_no,
		rtrim(patient.first_name) + ' ' + rtrim(patient.last_name) as patient_name,
		convert(varchar,patient.entry_date,101) as entry_date,
		Case patient.sex when 0 then 'Male' else 'Female' end as Sex,
		convert(varchar,patient.birth_date,101) as birth_date,
		convert(varchar,patient.last_office_visit_date,101) as last_office_visit_date,
		convert(varchar,patient.last_update,101) as last_update,
		office_name as Location,
		doctor_name as Doctor
from	getPatients patient join
		address ON patient.patient_no = address.patient_no
where	(replace(replace(replace(replace(replace(replace(address.phone1,'(',''),')',''),' ',''),'-',''),'.',''),'_','') = replace(replace(replace(replace(replace(replace(@phone,'(',''),')',''),' ',''),'-',''),'.',''),'_','') or
		 replace(replace(replace(replace(replace(replace(address.phone2,'(',''),')',''),' ',''),'-',''),'.',''),'_','') = replace(replace(replace(replace(replace(replace(@phone,'(',''),')',''),' ',''),'-',''),'.',''),'_',''))
END
GO

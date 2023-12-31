/****** Object:  StoredProcedure [dbo].[Sp_GetAppmtMetrics]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[Sp_GetAppmtMetrics]
@QueryType INT, @DateFrom VARCHAR (10), @DateTo VARCHAR (10)
AS
BEGIN
 
 IF @QueryType = 1 BEGIN
  Select CREATEDBY,
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)
  GROUP BY CREATEDBY
  union
  Select 'Total' as [CREATEDBY],
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)    
 END
 
 IF @QueryType = 2 BEGIN
  Select DOCTOR_NAME,
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)
  GROUP BY DOCTOR_NAME
  union
  Select 'Total' as [DOCTOR_NAME],
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)    
 END 

 IF @QueryType = 3 BEGIN   
  Select APPMT_REASON,
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)
  GROUP BY APPMT_REASON  
  union
  Select 'Total' as [APPMT_REASON],
    count(*) [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)  
 END
 
 IF @QueryType = 4 BEGIN 
  Select OFFICE_NAME,
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)
  GROUP BY OFFICE_NAME 
  union
  Select 'Total' as [OFFICE_NAME],
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE APPMT_DATE BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)    
 END 
 IF @QueryType = 5 BEGIN
  Select CREATEDBY,
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE createdate BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)
  GROUP BY CREATEDBY
  union
  Select 'Total' as [CREATEDBY],
    count(*) as [TOTAL_APPMT]
  FROM Vw_AllAppointments
  WHERE createdate BETWEEN cast(@DateFrom as date) AND cast(@DateTo as date)  
 END
 IF @QueryType = 6 BEGIN
	Select	isnull(Apps.Doctor,'Other') as [Doctor],
			isnull(Apps.Appointments,0) as [Appointments],
			isnull(Ex.Executed,0) as [ActualExams], 
			case 
				When (Apps.Appointments <> 0 and Ex.Executed <> 0) then cast(cast((cast(Ex.Executed as float)/cast(Apps.Appointments as float)*100) as numeric(8,0)) as varchar(3)) + '%' 
				else 'Not Available'
			end as [Effectiveness]
			from(
			(Select	doctorid,
					doctor_name Doctor,
					count(patient_no) as [Appointments],
					0 Exams
			from	Vw_AllAppointments
			Where	Appmt_date between cast(@DateFrom as date) AND cast(@DateTo as date)
			Group	by doctorid,doctor_name) Apps full outer join 
			(Select	doctorid,
					doctor Doctor,
					0 as [Appointments],
					count(visit_date) Executed
			from	vw_GetDoctorRecords
			Where	visit_date between cast(@DateFrom as date) AND cast(@DateTo as date)
			Group	by doctorid,doctor) Ex
			on Apps.doctorid = Ex.doctorid
			)	
	union
	Select	Apps.Doctor,
			Apps.Appointments,
			Ex.Executed as [ActualExams], 
			case 
				When Apps.Appointments <> 0 then cast(cast((cast(Ex.Executed as float)/cast(Apps.Appointments as float)*100) as numeric(8,0)) as varchar(3)) + '%' 
				else '0'
			end as [Effectiveness]
			from(
			
			(Select	'' as [Doctorid],
					'Totals' as [Doctor],
					count(patient_no) as [Appointments],
					0 Exams
			from	Vw_AllAppointments
			Where	Appmt_date between cast(@DateFrom as date) AND cast(@DateTo as date)
			) Apps full outer join 
			
			(Select	'' as [Doctorid],
					'Totals' as [Doctor],
					0 as [Appointments],
					count(visit_date) as [Executed]
			from	vw_GetDoctorRecords
			Where	visit_date between cast(@DateFrom as date) AND cast(@DateTo as date)
			) Ex
			on Apps.doctorid = Ex.doctorid
			
			)
 END
 
END
GO

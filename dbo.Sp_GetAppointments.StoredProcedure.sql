/****** Object:  StoredProcedure [dbo].[Sp_GetAppointments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_GetAppointments] 
@appDate SMALLDATETIME
AS
BEGIN
SELECT appointment.appmttime, 
  appointment.appmtdate, 
  patient.first_name, 
  patient.last_name, 
  office.description AS [location], 
  doctors.description AS [doctor], 
  appReasons.description AS [reason],
  salespeople.name as [createdby]
FROM    appointment LEFT JOIN
        patient ON appointment.patient_no = patient.patient_no LEFT JOIN
        office ON appointment.appmtlocation = office.officeid LEFT JOIN
        appReasons ON appointment.appmtreason = appReasons.reasonID LEFT JOIN
        doctors ON appointment.appmtdoctor = doctors.doctorid LEFT JOIN
        salespeople on appointment.salesmanid = salespeople.salesmanid
where appointment.appmtdate = @appDate  and appointment.appmttime <> '' and not appointment.appmttime is null and ( is_cancel is null or is_cancel = 0)
Order by dbo.udf_GetTimeFormat(appointment.appmttime) asc
--order by substring(appointment.appmttime,1,charindex(':',appointment.appmttime,1)-1),right(appointment.appmttime,3) asc

END
GO

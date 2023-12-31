/****** Object:  View [dbo].[View_OnlineApp]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_OnlineApp]
AS
SELECT distinct 
  PatAppointments.id,
  PatAppointments.timeid,
  PatAppointments.reasonid,
  PatAppointments.officeid,
  PatAppointments.doctorid,
  PatAppointments.isConfirmed,
  PatAppointments.address1,
  PatAppointments.address2,
  PatAppointments.city,
  PatAppointments.state,
  PatAppointments.zip,
  PatAppointments.insurance_no,
  PatAppointments.insured_id,
  PatAppointments.policy_group_no,
  PatAppointments.midname,
  PatAppointments.phone,
  PatAppointments.email,
  RTRIM(PatAppointments.firstname) + ' ' + RTRIM(PatAppointments.lastname) AS [Name], 
  PatAppointments.firstname,
  PatAppointments.lastname,
  CONVERT (varchar(10), PatAppointments.birthdate, 101) AS [birthdate],
  CONVERT (varchar(10), PatAppointments.appdate, 101) AS [Appointment Date], 
  appmttime.appmttime AS [Appointment Time], 
  appReasons.description AS [Reason for Visit], 
  office.description + N'   ' + office.City AS [Location], 
  doctors.description AS [Doctor],
  createDate,
  PatAppointments.comment
FROM PatAppointments INNER JOIN 
  appmttime ON PatAppointments.timeid = appmttime.timeid INNER JOIN 
  appReasons ON PatAppointments.reasonid = appReasons.reasonID INNER JOIN 
  office ON PatAppointments.officeid = office.officeid INNER JOIN 
  doctors ON PatAppointments.doctorid = doctors.doctorid 
where isconfirmed = 0
GO

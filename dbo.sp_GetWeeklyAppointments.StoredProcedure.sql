/****** Object:  StoredProcedure [dbo].[sp_GetWeeklyAppointments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetWeeklyAppointments]
(
 @StWeekDate varchar(10),
 @officeID int = 0
)
AS
BEGIN
 Declare @CStWeekDate smalldatetime
 set @CStWeekDate = convert(smalldatetime,@StWeekDate)
 if @officeID = 0 BEGIN
  SELECT  DISTINCT
     dbo.udf_GetTimeFormat(appmttime.appmttime) as sortcol,
     appmttime.appmttime, 
     dbo.udf_GetNumberOfAppointments(a.appmtdate,a.appmttime,0) as [DATE1],
     dbo.udf_GetNumberOfAppointments(b.appmtdate,b.appmttime,0) as [DATE2],
     dbo.udf_GetNumberOfAppointments(c.appmtdate,c.appmttime,0) as [DATE3],
     dbo.udf_GetNumberOfAppointments(d.appmtdate,d.appmttime,0) as [DATE4],
     dbo.udf_GetNumberOfAppointments(e.appmtdate,e.appmttime,0) as [DATE5],
     dbo.udf_GetNumberOfAppointments(f.appmtdate,f.appmttime,0) as [DATE6],
     dbo.udf_GetNumberOfAppointments(g.appmtdate,g.appmttime,0) as [DATE7]
  FROM  appmttime Left JOIN
     appointment a ON appmttime.appmttime = a.appmttime and a.appmtdate = @CStWeekDate left join
     appointment b ON appmttime.appmttime = b.appmttime and b.appmtdate = dateadd(dd,1,@CStWeekDate) left join
     appointment c ON appmttime.appmttime = c.appmttime and c.appmtdate = dateadd(dd,2,@CStWeekDate) left join
     appointment d ON appmttime.appmttime = d.appmttime and d.appmtdate = dateadd(dd,3,@CStWeekDate) left join
     appointment e ON appmttime.appmttime = e.appmttime and e.appmtdate = dateadd(dd,4,@CStWeekDate) left join
     appointment f ON appmttime.appmttime = f.appmttime and f.appmtdate = dateadd(dd,5,@CStWeekDate) left join
     appointment g ON appmttime.appmttime = g.appmttime and g.appmtdate = dateadd(dd,6,@CStWeekDate)
  Order  by dbo.udf_GetTimeFormat(appmttime.appmttime) ASC
 END
 ELSE BEGIN
  SELECT  DISTINCT
     dbo.udf_GetTimeFormat(appmttime.appmttime) as sortcol,
     appmttime.appmttime, 
     dbo.udf_GetNumberOfAppointments(a.appmtdate,a.appmttime,@officeID) as [DATE1],
     dbo.udf_GetNumberOfAppointments(b.appmtdate,b.appmttime,@officeID) as [DATE2],
     dbo.udf_GetNumberOfAppointments(c.appmtdate,c.appmttime,@officeID) as [DATE3],
     dbo.udf_GetNumberOfAppointments(d.appmtdate,d.appmttime,@officeID) as [DATE4],
     dbo.udf_GetNumberOfAppointments(e.appmtdate,e.appmttime,@officeID) as [DATE5],
     dbo.udf_GetNumberOfAppointments(f.appmtdate,f.appmttime,@officeID) as [DATE6],
     dbo.udf_GetNumberOfAppointments(g.appmtdate,g.appmttime,@officeID) as [DATE7]
  FROM  appmttime Left JOIN
     appointment a ON appmttime.appmttime = a.appmttime and a.appmtdate = @CStWeekDate and a.appmtlocation = @officeID left join
     appointment b ON appmttime.appmttime = b.appmttime and b.appmtdate = dateadd(dd,1,@CStWeekDate) and b.appmtlocation = @officeID left join
     appointment c ON appmttime.appmttime = c.appmttime and c.appmtdate = dateadd(dd,2,@CStWeekDate) and c.appmtlocation = @officeID left join
     appointment d ON appmttime.appmttime = d.appmttime and d.appmtdate = dateadd(dd,3,@CStWeekDate) and d.appmtlocation = @officeID left join
     appointment e ON appmttime.appmttime = e.appmttime and e.appmtdate = dateadd(dd,4,@CStWeekDate) and e.appmtlocation = @officeID left join
     appointment f ON appmttime.appmttime = f.appmttime and f.appmtdate = dateadd(dd,5,@CStWeekDate) and f.appmtlocation = @officeID left join
     appointment g ON appmttime.appmttime = g.appmttime and g.appmtdate = dateadd(dd,6,@CStWeekDate) and g.appmtlocation = @officeID 
  Order  by dbo.udf_GetTimeFormat(appmttime.appmttime) ASC
 END
END
GO

/****** Object:  StoredProcedure [dbo].[GetAppmtDoctors]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAppmtDoctors]
@txtDate VARCHAR (10), @officeid INT
AS
BEGIN

 Declare @appmtdate date
 set @appmtdate = cast(@txtDate as date)
 select distinct
   doctorid,
   description
 from doctors
 where doctorid in (
       Select doctorid 
       from doctorschedule 
       where appmtdate = @appmtdate and officeid = @officeid
       group by doctorid
      )
END
GO

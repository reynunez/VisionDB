/****** Object:  StoredProcedure [dbo].[sp_GetAvailableTime]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAvailableTime] 
@doctorid INT, @txtDate VARCHAR (10), @officeid INT
AS
Declare @appmtdate date
set @appmtdate = cast(@txtDate as date)

Select timeid,appmttime
from appmttime 
where appmttime in (Select appmttime 
                    from doctorschedule 
                    where doctorid = @doctorid 
                          and appmtdate = @appmtdate 
                          and officeid = @officeid
                          and appmttime not in (Select appmttime from appointment where 1=1 and ( is_cancel is null or is_cancel = 0) and appmtdoctor = @doctorid and appmtdate = @appmtdate and appmtlocation = @officeid)
                    )
GO

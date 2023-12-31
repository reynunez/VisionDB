/****** Object:  StoredProcedure [dbo].[sp_DeleteSchedules]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DeleteSchedules]
@DateFrom DATE, @DateTo DATE, @doctorid INT, @officeid INT
WITH EXECUTE AS CALLER
AS
Delete from doctorschedule
where appmtdate between @DateFrom and @DateTo and doctorid = @doctorid and officeid = @officeid
GO

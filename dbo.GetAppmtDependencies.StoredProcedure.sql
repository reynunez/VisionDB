/****** Object:  StoredProcedure [dbo].[GetAppmtDependencies]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAppmtDependencies]
@doctorid INT, @locationid INT, @txtDateFrom VARCHAR (10), @txtDateTo VARCHAR (10)
AS
BEGIN
declare @DateFrom date,
        @DateTo date

 set @DateFrom = cast(@txtDateFrom as date)
 set @DateTo = cast(@txtDateTo as date)

 Select count(*) as [appcount]
 From appointment
 where appmtdoctor = @doctorid
 and appmtlocation = @locationid
 and appmtdate between @DateFrom and @DateTo 
END
GO

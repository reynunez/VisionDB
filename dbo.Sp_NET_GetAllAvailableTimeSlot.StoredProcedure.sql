/****** Object:  StoredProcedure [dbo].[Sp_NET_GetAllAvailableTimeSlot]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/18/2020
-- Description:	Get Available Appmt Times
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetAllAvailableTimeSlot]
	@APPMTDATE DATE ,
	@OFFICEID INTEGER ,
	@DOCTORID INTEGER
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @STARTAT INTEGER

	SELECT @STARTAT =	TIMEID
					FROM	appmttime
					WHERE	appmttime = (
									Select	top 1
											appmttime
									from	doctorschedule
									where	cast(appmtdate as date) = @APPMTDATE
											and doctorid = @DOCTORID
											order by scheduleid
									)

	SELECT	appmttime AS Available
	FROM	appmttime
	where	appmttime NOT IN
			(
			Select	a.appmttime
			from	appointment a join
					doctorschedule ds on ds.doctorid = a.appmtdoctor
			where	cast(a.appmtdate as date) = @APPMTDATE
					and a.appmtlocation = @OFFICEID
					and a.appmtdoctor = @DOCTORID
			)
			AND timeid >= @STARTAT
	order by timeid

END
GO

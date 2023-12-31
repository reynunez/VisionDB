/****** Object:  StoredProcedure [dbo].[Sp_NET_GetAvailableTimeSlot]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/18/2020
-- Description:	Get Available Appmt Times
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetAvailableTimeSlot]
	@APPMTDATE DATE ,
	@OFFICEID INTEGER ,
	@TIMESLOT VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT	appmttime AS avtime
	FROM	appmttime
	where	appmttime NOT IN
			(
			Select	appmttime
			from	appointment
			where	cast(appmtdate as date) = @APPMTDATE
					and appmtlocation = @OFFICEID
			)
			AND appmttime = @TIMESLOT
END
GO

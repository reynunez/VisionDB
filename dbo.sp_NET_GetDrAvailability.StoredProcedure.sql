/****** Object:  StoredProcedure [dbo].[sp_NET_GetDrAvailability]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/20/2021
-- Description: Get Dr Schedule Availability
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDrAvailability]
(
		@doctorid INT,
		@officeid INT,
		@schddate DATE
)
AS
BEGIN

    SET NOCOUNT ON

	Select	time AS AVTIME
	from	tbl_net_drschedule
	where	cast(schddate as date) = @schddate
			and doctorid = @doctorid
			and officeid = @officeid
			and time not in(select	appmttime
							from	appointment
							where	appmtdoctor = @doctorid
									and appmtlocation = @officeid
									and cast(appmtdate as date) = @schddate
									and not apstatusid IN(1)
									)
END
GO

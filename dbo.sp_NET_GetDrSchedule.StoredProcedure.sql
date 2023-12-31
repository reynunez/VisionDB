/****** Object:  StoredProcedure [dbo].[sp_NET_GetDrSchedule]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/19/2021
-- Description: Get Dr Schedule
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDrSchedule]
(
		@doctorid INT,
		@officeid INT,
		@thisweek INT
)
AS
BEGIN

    SET NOCOUNT ON

	select	* 
	from	tbl_NET_drschedule
	where	doctorid = @doctorid
			and officeid = @officeid
			and thisweek = @thisweek

END
GO

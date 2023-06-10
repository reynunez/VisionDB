/****** Object:  StoredProcedure [dbo].[sp_NET_RemoveDrSchedule]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/19/2021
-- Description: Remove Dr Schedule
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_RemoveDrSchedule]
(
		@doctorid INT,
		@officeid INT,
		@thisweek INT
)
AS
BEGIN

    SET NOCOUNT ON

	DELETE FROM tbl_NET_drschedule WHERE doctorid = @doctorid AND officeid = @officeid AND thisweek = @thisweek

END
GO

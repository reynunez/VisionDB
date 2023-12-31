/****** Object:  StoredProcedure [dbo].[sp_NET_InsertDrSchedule]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/19/2021
-- Description: Insert Dr Schedule
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertDrSchedule]
(
		@doctorid INT,
		@officeid INT,
		@schddate DATE,
		@time varchar(10),
		@thisweek INT,
		@thisrow INT,
		@thiscol INT
)
AS
BEGIN

    SET NOCOUNT ON
	IF NOT EXISTS(SELECT	*
				  FROM		tbl_NET_drschedule 
				  WHERE		doctorid = @doctorid 
							AND officeid = @officeid 
							AND schddate = @schddate 
							AND time = @time 
							AND thisweek = @thisweek 
							AND thisrow = @thisrow 
							AND thiscol = @thiscol ) BEGIN

			Insert into tbl_NET_drschedule(
				doctorid,
				officeid,
				schddate,
				time,
				thisweek,
				thisrow,
				thiscol
				)
			Values(
				@doctorid ,
				@officeid ,
				@schddate ,
				@time ,
				@thisweek ,
				@thisrow ,
				@thiscol 
			)

	END
END
GO

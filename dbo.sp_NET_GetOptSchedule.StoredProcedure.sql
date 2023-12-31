/****** Object:  StoredProcedure [dbo].[sp_NET_GetOptSchedule]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/22/2021
-- Description: Get Option Schedule
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOptSchedule]
(
		@doctorid INT,
		@officeid INT,
		@thisweek INT,
		@Option INT,
		@year INT = 2022
)
AS
BEGIN

    SET NOCOUNT ON

	IF @Option = 1 BEGIN
		select	s.* 
				,o.orderprefix as initials
		from	tbl_NET_drschedule s
				left join office o ON s.officeid = o.officeid 
		where	o.officeid = @officeid
				and thisweek = @thisweek
				and year(cast(s.schddate as date)) = @year
	END
	ELSE BEGIN
	select	s.* 
			,(left(ltrim(rtrim(d.firstname )),1) + left(ltrim(rtrim(d.lastname  )),1)) as initials			
	from	tbl_NET_drschedule s
			left join doctors d on s.doctorid = d.doctorid 
	where	d.doctorid = @doctorid
			and thisweek = @thisweek
			and year(cast(s.schddate as date)) = @year
	END

END
GO

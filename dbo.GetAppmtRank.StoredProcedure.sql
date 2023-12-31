/****** Object:  StoredProcedure [dbo].[GetAppmtRank]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2017-09-04
-- Description:	Get appointment rank
-- =============================================
CREATE PROCEDURE [dbo].[GetAppmtRank]( 
	@Param1 VARCHAR(10), 
	@Param2 VARCHAR(10),
	@Param3 VARCHAR(10),
	@Param4 integer
)
AS
BEGIN
	Select rank,total,appmttime,reason,note from(
		Select	rank() OVER (ORDER BY dbo.udf_GetTimeFormat(appmttime),appmt_no) as rank,
				(Select	count(*)
				from	view_appointments
				where	cancelled <> 'Yes' 
						and appmttime <> '' 
						and appmtdate = convert(datetime,@Param1,101) 
						and charindex(RIGHT(@Param2,3),appmttime,0) > 0
						and officeid = @Param4
				) as total,
				* 
		from	view_appointments
		where	cancelled <> 'Yes' 
				and appmttime <> '' 
				and appmtdate = convert(datetime,@Param1,101) 
				and charindex(RIGHT(@Param2,3),appmttime,0) > 0
				and officeid = @Param4
	) as Main
	Where patient_no = @Param3
END
GO

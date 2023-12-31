/****** Object:  StoredProcedure [dbo].[sp_NET_GetSchedDoctor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/21/2020
-- Description:	Get Scheduled Doctor
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetSchedDoctor]
	@APPMTDATE DATE
	,@OFFICEID INTEGER
AS
BEGIN

	SET NOCOUNT ON;

	Select	DISTINCT
			ds.doctorid
			,d.description as name
	from	tbl_net_drschedule ds join
			doctors d on d.doctorid = ds.doctorid
	where	ds.officeid = @OFFICEID
			and cast(ds.schddate as date) = @APPMTDATE
END
GO

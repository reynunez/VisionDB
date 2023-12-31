/****** Object:  StoredProcedure [dbo].[sp_NET_GetScheduledDoctor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/21/2020
-- Description:	Get Scheduled Doctor
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetScheduledDoctor]
	@APPMTDATE DATE
	,@OFFICEID INTEGER
AS
BEGIN

	SET NOCOUNT ON;

	Select	DISTINCT
			ds.doctorid
			,d.description as name
	from	doctorschedule ds join
			doctors d on d.doctorid = ds.doctorid
	where	officeid = @OFFICEID
			and cast(appmtdate as date) = @APPMTDATE
END
GO

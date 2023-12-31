/****** Object:  StoredProcedure [dbo].[sp_NET_GetLastTimeSlot]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      REynaldo Nunez
-- Create Date: 01/26/2021
-- Description: Get Last Time Slot
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetLastTimeSlot]
(
	@appmtdate Date,
	@appmtlocation Int
)
AS
BEGIN

	Select	top 1 appmttime
	From	appointment
	Where	Cast(appmtdate as Date) = 	@appmtdate
			and appmtlocation = @appmtlocation
			and not apstatusid IN(1)
	Order	By CAST(replace(appmttime,'.','') as time) desc

END
GO

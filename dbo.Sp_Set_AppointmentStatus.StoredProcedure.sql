/****** Object:  StoredProcedure [dbo].[Sp_Set_AppointmentStatus]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2016-09-28>
-- Description:	Change Appointments Status
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Set_AppointmentStatus] 
	-- Add the parameters for the stored procedure here
	@appmt_no integer, 
	@apstatusid integer
AS
BEGIN
	IF @apstatusid <> 1 BEGIN
		Update dbo.appointment
		set apstatusid = @apstatusid,
		is_cancel = 0
		where appmt_no = @appmt_no
	END
	ELSE BEGIN
		Update dbo.appointment
		set apstatusid = @apstatusid,
			is_cancel = 1
		where appmt_no = @appmt_no
	END
END
GO

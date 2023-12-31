/****** Object:  StoredProcedure [dbo].[sp_NET_ConvertPreAppointment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/05/2022
-- Description:	Convert Pre-Appointment
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_ConvertPreAppointment]
	@pre_appmt_no INTEGER
AS
BEGIN
	SET NOCOUNT ON;

	update	preappointment
	set		is_converted = 1
	where	pre_appmt_no = @pre_appmt_no

END
GO

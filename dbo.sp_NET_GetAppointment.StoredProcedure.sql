/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppointment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      REynaldo Nunez
-- Create Date: 08/06/2020
-- Description: Appointment UpSert Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppointment]
(
	@appmt_no INT 
)
AS
BEGIN

    SET NOCOUNT ON

	Select 	appmt_no 
			appmtdoctor,
			doctors.description as doctorname,
			appmtdate,
			appmttime,
			appmtlocation,
			office.description as location,
			appmtreason,
			tblreason.description as reason,
			Case When offduty = 'Yes' THEN 1 ELSE 0 END as offduty,
			returntowork,
			letterto,
			cast(note as VARCHAR) as note,
			salesmanid,
			createdate,
			isWalkin,
			insurance_no ,
			ins_authorization,
			ins_benefits
	from	appointment 
			LEFT JOIN doctors ON doctors.doctorid = appointment.appmtdoctor 
			LEFT JOIN tblreason ON tblreason.reasonid = appointment.appmtreason 
			LEFT JOIN office ON office.officeid = appointment.appmtlocation 
	where	appmt_no = @appmt_no

END
GO

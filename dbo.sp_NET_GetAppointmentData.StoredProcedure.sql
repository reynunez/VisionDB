/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppointmentData]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/24/2020
-- Description: Retrieve APPOINTMENT 
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppointmentData](
	@appmt_no integer
)
AS
BEGIN

    SET NOCOUNT ON

	Select	coalesce(ap.appmtdate,'') as appmtdate
			,coalesce(ap.appmttime, '') as appmttime 
			,coalesce(ap.reason,'') as reason  
			,coalesce(ap.appmtreason,0) as appmtreason
			,coalesce(tr.acronym,'') as acronym
			,coalesce(ap.note ,'') as note
			,coalesce(ap.insurance_name ,'') as insurance_name
			,coalesce(ap.ins_authorization ,'') as ins_authorization
			,coalesce(ap.ins_benefits ,'') as ins_benefits
			,coalesce(ap.billingprov ,'') as billingprovider
			,coalesce(ap.insurance_no ,0) as insurance_no
	from	view_AppmtList ap
			left join tblreason tr on ap.reason = tr.name 
	where	ap.appmt_no = @appmt_no

END
GO

/****** Object:  StoredProcedure [dbo].[sp_getCheckedIn]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/19/2017
-- Description:	Get already processed checked in
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCheckedIn]( 
	@appmtdate date,
	@officeid int
)
AS
BEGIN
	Select	(count(ap.patient_no) + 1) as checkedin
	from	doctorsrecord dr join 
			view_appointments ap ON dr.patient_no = ap.patient_no
								 and cast(dr.visit_date as date) = cast(ap.appmtdate as date)
	where	cast(ap.appmtdate as date) = @appmtdate
			and ap.officeid = @officeid
			and (dr.comp + dr.glau + dr.conl + dr.minr + dr.chis) > 0
END
GO

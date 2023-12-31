/****** Object:  StoredProcedure [dbo].[sp_getLast6NatureofVisit]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2017-09-04
-- Description:	Get last 6 nature of visit
-- =============================================
CREATE PROCEDURE [dbo].[sp_getLast6NatureofVisit]( 
	@patient_no int
)
AS
BEGIN
	Select	ISNULL(convert(varchar,sdate,101),'') AS examdate,
			ISNULL(natureofvisit,'') as natureofvisit
	from	emrsavedscripts 
	where	patientid = @patient_no
	order	by scriptdate desc
END
GO

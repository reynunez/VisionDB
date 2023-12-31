/****** Object:  StoredProcedure [dbo].[sp_UpdateLvd]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_UpdateLvd](
	@patient_no int,
	@lvdDate smalldatetime
)
 AS
update patient
	set last_office_visit_date = @lvdDate
	where patient_no = @patient_no
GO

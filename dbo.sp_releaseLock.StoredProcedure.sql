/****** Object:  StoredProcedure [dbo].[sp_releaseLock]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_releaseLock](@patient_no int)
 AS
update patient
	set isbeingedit = 0
	where patient_no = @patient_no
GO

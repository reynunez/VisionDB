/****** Object:  StoredProcedure [dbo].[sp_IsLock]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_IsLock](@patient_no int)
 AS
Select isbeingedit from patient where patient_no = @patient_no
GO

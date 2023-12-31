/****** Object:  StoredProcedure [dbo].[sp_GetPatientDOB]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/26/2017
-- Description:	Get Patient DOB
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPatientDOB]( 
	@patient_no int
)
AS
BEGIN
	Select convert(varchar(10),birth_date,101) as dob from patient where patient_no = @patient_no
END
GO

/****** Object:  StoredProcedure [dbo].[sp_GetIopCd]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 9/27/2017
-- Description:	Get IOP/CD from Last EMR Test
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetIopCd]( 
	@patient_no int
)
AS
BEGIN
	Select	top 1 
			('IOP ' + ltrim(rtrim(iopOD)) + '/'+ ltrim(rtrim(iopOS))) as iop 
			,('CD ' + ltrim(rtrim(cdOD)) + '/'+ ltrim(rtrim(cdOS))) as cd
	from	emrSpecialtyTest 
	where	patientid = @patient_no
	order	by testdate desc
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_EndDateDiagnosis]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/18/2020
-- Description: End Date Diagnosis History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_EndDateDiagnosis]
(
	@patient_no int,
	@user_cd varchar(20)
)
AS
BEGIN

    SET NOCOUNT ON

	Update	patient_diagnosis 
	set	diag_end = CURRENT_TIMESTAMP 
	where	ltrim(rtrim(user_cd)) = @user_cd
			and patient_no = @patient_no
END
GO

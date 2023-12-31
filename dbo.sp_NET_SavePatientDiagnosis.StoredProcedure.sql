/****** Object:  StoredProcedure [dbo].[sp_NET_SavePatientDiagnosis]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/18/2020
-- Description: Save Patient Diagnosis
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_SavePatientDiagnosis]
(
	@patient_no int,
	@user_cd varchar(100),
	@cd_key int
)
AS
BEGIN

    SET NOCOUNT ON
	IF NOT EXISTS(	Select	patient_no 
					from	patient_diagnosis 
					where	patient_no = @patient_no 
							and user_cd = @user_cd
						    and cd_key = @cd_key
							) BEGIN
		Insert	into patient_diagnosis(
								patient_no,
								user_cd,
								diag_date,
								diag_start,
								diag_end,
								cd_key,
								is_icd10
								)
		Values(
				@patient_no,
				@user_cd,
				CURRENT_TIMESTAMP,
				CURRENT_TIMESTAMP,
				NULL,
				@cd_key,
				1
			)
	END
END
GO

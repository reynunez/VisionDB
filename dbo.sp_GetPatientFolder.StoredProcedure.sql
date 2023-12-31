/****** Object:  StoredProcedure [dbo].[sp_GetPatientFolder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/15/2017
-- Description:	Get Patients Folder Name & Image Path
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPatientFolder](
	@patient_no integer,
	@type varchar(25) = 'name'
)
AS
BEGIN
	DECLARE @mPath varchar(100) = 'Z:\VomImages\VOM_PATIENT_FOLDERS\'
	IF @type = 'name' BEGIN
		Select  upper(ltrim(rtrim(last_name))) + '_' +
				upper(ltrim(rtrim(first_name))) + '_' +
				cast(year(birth_date) as varchar(4)) +
				RIGHT('0' + RTRIM(MONTH(birth_date)), 2)  +
				RIGHT('0' + RTRIM(DAY(birth_date)), 2) as patientfolder
		from	getPatients 
		where	patient_no = @patient_no
	END ELSE IF @type = 'signature' BEGIN
		Select  @mPath + 
				upper(ltrim(rtrim(last_name))) + '_' +
				upper(ltrim(rtrim(first_name))) + '_' +
				cast(year(birth_date) as varchar(4)) +
				RIGHT('0' + RTRIM(MONTH(birth_date)), 2)  +
				RIGHT('0' + RTRIM(DAY(birth_date)), 2) +
				'\Signatures\' as signature_path
		from	getPatients 
		where	patient_no = @patient_no
	END ELSE IF @type = 'path' BEGIN
		Select  @mPath +
				upper(ltrim(rtrim(last_name))) + '_' +
				upper(ltrim(rtrim(first_name))) + '_' +
				cast(year(birth_date) as varchar(4)) +
				RIGHT('0' + RTRIM(MONTH(birth_date)), 2)  +
				RIGHT('0' + RTRIM(DAY(birth_date)), 2) +
				'\' as patient_path
		from	getPatients 
		where	patient_no = @patient_no
	END 
END
GO

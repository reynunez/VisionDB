/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientsList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/28/2020
-- Description:	Get Patients List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientsList]
	@SearchPattern varchar(500),
	@active int = -1
AS
BEGIN
	SET NOCOUNT ON;

		IF ISNUMERIC(@SearchPattern) = 1 BEGIN
			Select	patient_no
					,patient_name
					,first_name
					,mid_name
					,last_name
					,birth_date
					,cell_phone
					,address
					,zip
					,eMail_address
					,last_office_visit_date
					,active
			from	v_patientsearchlist
			where	(patient_no = CAST(@SearchPattern AS bigint))
					and 1 = CASE WHEN @active = -1 THEN 1
								 WHEN active = @active THEN 1
								 WHEN active <> @active THEN 0
							 END
		END
		ELSE BEGIN
			IF LEFT(@SearchPattern,2) = '%@' BEGIN
				SET @SearchPattern = REPLACE(REPLACE(@SearchPattern,'@',''),'%','')
				Select	patient_no
						,patient_name
						,first_name
						,mid_name
						,last_name
						,birth_date
						,cell_phone
						,address
						,zip
						,eMail_address
						,last_office_visit_date
						,active
				from	v_patientsearchlist
				where	(CAST(birth_date as date) = CAST(@SearchPattern as date))
						and 1 = CASE WHEN @active = -1 THEN 1
									 WHEN active = @active THEN 1
									 WHEN active <> @active THEN 0
								 END
			END
			IF LEFT(@SearchPattern,2) = '%#' BEGIN
				SET @SearchPattern = REPLACE(REPLACE(@SearchPattern,'#',''),'%','')
				Select	patient_no
						,patient_name
						,first_name
						,mid_name
						,last_name
						,birth_date
						,cell_phone
						,address
						,zip
						,eMail_address
						,last_office_visit_date
						,active
				from	v_patientsearchlist
				where	(phone1 = @SearchPattern)
						and 1 = CASE WHEN @active = -1 THEN 1
									 WHEN active = @active THEN 1
									 WHEN active <> @active THEN 0
								 END
			END
			ELSE BEGIN
				Select	patient_no
						,patient_name
						,first_name
						,mid_name
						,last_name
						,birth_date
						,cell_phone
						,address
						,zip
						,eMail_address
						,last_office_visit_date
						,active
				from	v_patientsearchlist
				where	((rtrim(ltrim(first_name)) + ' ' + rtrim(ltrim(last_name))) like @SearchPattern
						or (rtrim(ltrim(last_name)) + ' ' + rtrim(ltrim(first_name))) like @SearchPattern)
						and 1 = CASE WHEN @active = -1 THEN 1
									 WHEN active = @active THEN 1
									 WHEN active <> @active THEN 0
								END
			END 
		END
END
GO

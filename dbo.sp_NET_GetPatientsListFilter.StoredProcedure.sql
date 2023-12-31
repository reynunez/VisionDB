/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientsListFilter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/28/2020
-- Description:	Get Patients List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientsListFilter]
	@patlist varchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	Select	patient_no
			,rtrim(ltrim(first_name)) + ' ' + rtrim(ltrim(last_name)) as patient_name
			,first_name
			,last_name
			,mid_name
			,entry_date
			,birth_date
			,last_office_visit_date
	from	patient
	where	patient_no IN(SELECT item from fnStringList2Table(REPLACE(@patlist,';',',')))
END
GO

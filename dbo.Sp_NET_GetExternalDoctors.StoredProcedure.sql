/****** Object:  StoredProcedure [dbo].[Sp_NET_GetExternalDoctors]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/12/2020
-- Description:	External Doctors Selection
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetExternalDoctors]
	@sp INTEGER = 0,
	@InList VARCHAR(2000) = ''
AS
BEGIN
	IF @sp = -1 BEGIN
		Select	doctorid as id
				,description as name
				,last_name 
				,first_name 
				,phone
				,specialty
				,case when isactive = 1 then 'Yes' else 'No' end as active
				,email
				,fax
		from	ext_doctors
		WHERE	1=1
				AND doctorid  IN(SELECT item from fnStringList2Table(REPLACE(@InList,'~',',')))
	END
	ELSE IF @sp = 0 BEGIN
		Select	doctorid as id
				,description as name
				,last_name 
				,first_name 
				,phone
				,specialty
				,case when isactive = 1 then 'Yes' else 'No' end as active
				,email
				,fax
		from	ext_doctors
	END
	ELSE IF @sp = 1 BEGIN
		Select	doctorid as id
				,description as name
				,last_name 
				,first_name 
				,phone
				,specialty
				,case when isactive = 1 then 'Yes' else 'No' end as active
				,email
				,fax
		from	ext_doctors
		where	specialtyid = 1
	END
	ELSE IF @sp = 2 BEGIN
		Select	doctorid as id
				,description as name
				,last_name 
				,first_name 
				,phone
				,specialty
				,case when isactive = 1 then 'Yes' else 'No' end as active
				,email
				,fax
		from	ext_doctors
		where	specialtyid = 2
	END
	ELSE IF @sp = 3 BEGIN
		Select	doctorid as id
				,description as name
				,phone
				,specialty
				,case when isactive = 1 then 'Yes' else 'No' end as active
				,email
				,fax
		from	ext_doctors
		where	specialtyid = 3
	END 
END
GO

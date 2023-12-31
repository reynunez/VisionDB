/****** Object:  StoredProcedure [dbo].[Sp_NET_GetExternalDoctorsFilter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/12/2020
-- Description:	External Doctors Selection Filtered
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetExternalDoctorsFilter]
	@doclist varchar(max)
AS
BEGIN
		Select	doctorid 
				,description as name
				,CASE WHEN LEN(dbo.split(description,' ',2) ) <= 2
					  THEN (dbo.split(description,' ',2) + ' ' + dbo.split(description,' ',3))
					  ELSE dbo.split(description,' ',2) END as lastname
				,dbo.split(description,' ',1) as firstname
				,phone
				,specialty
				,case when isactive = 1 then 'Yes' else 'No' end as active
				,email
				,fax
		from	ext_doctors
		where	doctorid IN(SELECT item from fnStringList2Table(REPLACE(@doclist,';',',')))
END
GO

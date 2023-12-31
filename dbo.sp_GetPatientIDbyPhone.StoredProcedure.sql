/****** Object:  StoredProcedure [dbo].[sp_GetPatientIDbyPhone]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/16/2018
-- Description:	Search Patients using phone No
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPatientIDbyPhone]( 
	@phone varchar(20)
)
AS
BEGIN
Select	address.patient_no
from	address
where	(replace(replace(replace(replace(replace(replace(address.phone1,'(',''),')',''),' ',''),'-',''),'.',''),'_','') = replace(replace(replace(replace(replace(replace(@phone,'(',''),')',''),' ',''),'-',''),'.',''),'_','') or
		 replace(replace(replace(replace(replace(replace(address.phone2,'(',''),')',''),' ',''),'-',''),'.',''),'_','') = replace(replace(replace(replace(replace(replace(@phone,'(',''),')',''),' ',''),'-',''),'.',''),'_',''))
END
GO

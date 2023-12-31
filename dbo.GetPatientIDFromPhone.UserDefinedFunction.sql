/****** Object:  UserDefinedFunction [dbo].[GetPatientIDFromPhone]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/16/2018
-- Description:	Return patient id from a phone
-- =============================================
CREATE FUNCTION [dbo].[GetPatientIDFromPhone] 
(	
	@phone varchar(20)
)
RETURNS TABLE 
AS
RETURN 
(
Select	address.patient_no
from	address
where	(replace(replace(replace(replace(replace(replace(address.phone1,'(',''),')',''),' ',''),'-',''),'.',''),'_','') = replace(replace(replace(replace(replace(replace(@phone,'(',''),')',''),' ',''),'-',''),'.',''),'_','') or
		 replace(replace(replace(replace(replace(replace(address.phone2,'(',''),')',''),' ',''),'-',''),'.',''),'_','') = replace(replace(replace(replace(replace(replace(@phone,'(',''),')',''),' ',''),'-',''),'.',''),'_',''))

)
GO

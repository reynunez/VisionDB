/****** Object:  StoredProcedure [dbo].[Sp_Get5PrescHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Sp_Get5PrescHeader]
@patient_no NVARCHAR (50)
AS
SET NOCOUNT ON

Select prescid,
       presctype,
       patient_no,
       prescdate,
       doctor,
       license, 
       case presctype 
         when 1 then 'Contact Lenses'
         when 2 then 'Ophtalmic Lenses'
         when 3 then 'Therapeutic'
       end as [typedesc],
	   void,
	   officeid,
	   orderprefix,
	   CASE WHEN voidreason IS NULL then '--'
		 else ltrim(rtrim(voidreason))
	   END as voidreason
from   prescheader
where patient_no = @patient_no 
order by prescdate DESC
GO

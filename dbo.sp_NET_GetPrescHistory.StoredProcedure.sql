/****** Object:  StoredProcedure [dbo].[sp_NET_GetPrescHistory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/31/2020
-- Description: Get Ophthalmic History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPrescHistory](
	@patient_no as integer
)
AS
BEGIN
	Select H.prescid,
		   CONVERT(DATE,H.prescdate,101) AS DATE,
		   COALESCE(H.doctor,'') AS DOCTOR,
		   case H.presctype 
			 when 2 then dbo.GetOphLine('R',H.prescid)
			 when 1 then dbo.GetClLine('R',H.prescid)
			 when 3 then dbo.GetThLine(H.prescid)
		   end as OD,
		   CASE WHEN H.void = 0 THEN 'NO' ELSE 'YES' END AS VOID,
		   CASE WHEN H.voidreason IS NULL then '--'
			 else ltrim(rtrim(voidreason))
		   END as VOIDREASON,
		   case H.presctype 
			 when 2 then dbo.GetOphLine('L',H.prescid)
			 when 1 then dbo.GetClLine('L',H.prescid)
			 else ''
		   end as OS,
		   case H.presctype 
			 when 1 then 'Contacts ' 
			 when 2 then 'Ophtalmic ' 
			 when 3 then 'Therapeutic ' 
		   end as PRESCTYPE,
		   O.presctype as type,
		   O.Usage,
		   case H.presctype 
			 when 2 then ''
			 when 1 then dbo.GetCLEvLine('R',H.prescid)
			 else ''
		   end as ORe,
		   case H.presctype 
			 when 2 then ''
			 when 1 then dbo.GetCLEvLine('L',H.prescid)
			 else ''
		   end as OSe
	from   prescheader H LEFT JOIN
		   prescoph O ON H.prescid = O.prescid and H.presctype = 2
	where patient_no = @patient_no 
	order by CONVERT(DATE,prescdate,101) ASC
END


GO

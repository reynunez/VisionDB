/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientCLRx]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/29/2020
-- Description: Get Contact Lenses Rx
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientCLRx](
	@patient_no as integer
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	DISTINCT
			CAST(COALESCE(CLr.SPH,0) AS varchar ) + ' ' +
			CAST(COALESCE(CLr.Cyl,0) AS varchar) + ' x ' +
			CAST(COALESCE(CLr.Axis,0) AS varchar) + ' + ' +
			CAST(COALESCE(CLr.Addition,0) AS varchar) + '  ' +
			CAST(COALESCE(CLr.BC,0) AS varchar) + '  ' +
			COALESCE(ltrim(rtrim(CLr.lensName)),'NA') + ' ' +
			COALESCE(ltrim(rtrim(CLr.color)),'NA')  as OD,
			CAST(COALESCE(CLl.SPH,0) AS varchar ) + ' ' +
			CAST(COALESCE(CLl.Cyl,0) AS varchar) + ' x ' +
			CAST(COALESCE(CLl.Axis,0) AS varchar) + ' + ' +
			CAST(COALESCE(CLl.Addition,0) AS varchar) + '  ' +
			CAST(COALESCE(CLl.BC,0) AS varchar) + '  ' +
			COALESCE(ltrim(rtrim(CLl.lensName)),'NA') + ' ' +
			COALESCE(ltrim(rtrim(CLl.color)),'NA') as OS,
			cast(PH.prescdate as date) as prescdate,
			PH.doctor,
			REPLACE(REPLACE(CLr.UPCC,SUBSTRING(CLr.UPCC, 0, CHARINDEX('|', CLr.UPCC)),''),'|','') as prescprice,
			coalesce(c.[list price],0) as clprice,
			PH.prescid,
			prescdate,
			cast(coalesce(clr.voidafter,CLl.voidafter) as date) as VoidAfter
	from	prescheader PH
			left join prescCL CLr on CLr.prescid = PH.prescid and PH.void = 0 and CLr.eye = 'R'
			left join prescCL CLl on CLl.prescid = PH.prescid and PH.void = 0 and CLl.eye = 'L'
			left join contactlens c ON (SUBSTRING(CLr.UPCC, 0, CHARINDEX('|', CLr.UPCC)) = c.upcc )
	where	PH.patient_no = @patient_no
			and PH.presctype = 1
			--and UPPER(CLr.lensStatus) = 'RX'
	Order	by PH.prescdate DESC

END
GO

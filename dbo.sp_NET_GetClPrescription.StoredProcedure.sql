/****** Object:  StoredProcedure [dbo].[sp_NET_GetClPrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/01/2020
-- Description: Get Contact Lenses Prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetClPrescription](
	@prescid as integer
)
AS
BEGIN

	select	DISTINCT
			p.eye
			,p.lensStatus as status
			,p.lensName
			,p.Sph 
			,p.Cyl 
			,p.Axis 
			,p.Addition 
			,p.BC 
			,coalesce(c.[list price] ,0) as price
			,p.color
			,coalesce(c.upcc ,'') as upcc
			,p.Manufacturer 
			,coalesce(c.cost ,0) as cost
			,p.prescid 
			,p.[or]
			,p.or2
			,p.Vclrdva
			,p.Vclrnva
			,p.Vclldva
			,p.Vcllnva
			,p.Vorrdva
			,p.Vorrnva
			,p.Vorldva
			,p.Vorlnva
			,SUBSTRING(p.UPCC, 0, CHARINDEX('|', p.UPCC)) as upcc
			,CASE WHEN coalesce(c.[list price],0) = 0
				THEN CAST(REPLACE(dbo.Split(p.UPCC,'|',2),',','') AS NUMERIC(18,2))
				ELSE coalesce(c.[list price],0)
			  END AS PRICE 
			,c.cpt 
	from	prescCL p join
			prescheader h ON p.prescid = h.prescid left join
			contactlens c ON (dbo.Split(p.UPCC,'|',1) = c.upcc ) 
	where	p.prescid = @prescid;

END
GO

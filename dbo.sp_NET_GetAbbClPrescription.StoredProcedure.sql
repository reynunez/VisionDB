/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbClPrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 05/10/2021
-- Description: Get Contact Lenses Prescription Abb Contacts
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbClPrescription](
	@prescid INT
	,@insurance_no INT = 0
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
			,p.Vorrdva
			,p.Vorrnva
			,p.Vorldva
			,p.Vorlnva
			,p.comments
			,SUBSTRING(p.UPCC, 0, CHARINDEX('|', p.UPCC)) as upcc
			,CASE WHEN coalesce(c.[list price],0) = 0
				THEN CAST(REPLACE(dbo.Split(p.UPCC,'|',2),',','') AS NUMERIC(18,2))
				ELSE coalesce(c.[list price],0)
			  END AS PRICE 
			,c.cpt 
			,c.PRODUCT_ID
			,c.CLNAME
			,c.SERIAL_ID 
			,c.SERIAL_NAME 
			,c.CLID 
			,m.modifier 
			,m.modifier2 
			,m.fee 
	from	prescCL p join
			prescheader h ON p.prescid = h.prescid 
			left join v_contactlens c ON c.upcc = SUBSTRING(p.UPCC, 0, CHARINDEX('|', p.UPCC))
			left join tblInsModifiers m ON case WHEN c.cpt = 'V2520' THEN 171 WHEN c.cpt = 'V2521' THEN 173 WHEN c.cpt = 'V2522' THEN 175 END = m.cptid and m.insurance_no = @insurance_no
	where	p.prescid = @prescid;

END
GO

/****** Object:  StoredProcedure [dbo].[Sp_NET_GetCLPresc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/29/2020
-- Description: Get Contact Lenses Rx
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetCLPresc](
@prescid INT
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	p.clprescid,
			p.prescid,
			p.lensstatus,
			p.eye,
			p.manufacturer,
			p.lensname,
			c.SERIAL_NAME as lenstype,
			p.color,
			p.sph,
			p.cyl,
			p.axis,
			p.addition,
			p.bc,
			SUBSTRING(p.UPCC, 0, CHARINDEX('|', p.UPCC)) as UPCC,
			p.sufamt,
			p.voidafter,
			p.refills ,
			p.refillsamt ,
			p.comments ,
			p.Vclrdva ,
			p.Vclrnva ,
			p.Vclldva ,
			p.Vcllnva ,
			p.Vorldva ,
			p.Vorlnva ,
			p.Vorldva ,
			p.Vorrnva ,
			p.kl001 ,
			p.kl002,
			p.kl003,
			p.kr001 ,
			p.kr002 ,
			p.kr003 ,
			p.presctype ,
			p.[or] ,
			p.or2 ,
			p.clid 
	from	prescCL p
	left join v_contactlens c ON c.UPCC = SUBSTRING(p.UPCC, 0, CHARINDEX('|', p.UPCC))
	where	p.prescid = @prescid
	order by prescid;

END
GO

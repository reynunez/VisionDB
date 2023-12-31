/****** Object:  View [dbo].[v_contactlens]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[v_contactlens] As
select	CLID
		,ms.MAN_ID AS MANUFACTURERID
		,ms.MAN_NAME as MANUFACTURERNAME
		,ms.SER_ID AS SERIAL_ID
		,ms.SER_NAME AS SERIAL_NAME
		,ms.SER_DAY_PER_LENS
		,ms.PRF_CONVERT
		,ms.PRF_DIAMETER AS DIAMETER
		,m.PRD_DESCRIPTION AS CLNAME	
		,case when ms.PRF_REV_DIAG_IND = 'R' THEN 0 ELSE 1 END AS TRIAL	
		,left(ms.STY_ID,1) AS STB	
		,ms.PRF_BASECURVE AS BC		
		,m.PRD_POWER AS SPH		
		,m.PRD_CYLINDER AS CYL		
		,m.PRD_AXIS AS AXS					
        ,m.PRD_ADDITION AS CLADD
		,m.PRD_COLOR AS COLOR		
		,m.PRD_CHECKDIGIT 
		,m.PRD_ID AS PRODUCT_ID
		,m.PRD_UPC_CODE AS UPCC
		,u.[UNIT_NAME]
		,u.[UNT_LENS_QTTY]
		,u.[UNT_PACK_QTTY]
		,p.COST  as cost
		,p.PRICE  as [list price]
		,case when ms.PRF_REV_DIAG_IND = 'R' THEN 0 ELSE 1 END AS ISTRIAL	
		,CASE
			WHEN left(ms.STY_ID,1) = 'S' THEN 'V2520'
			WHEN left(ms.STY_ID,1) = 'T' THEN 'V2521'
			WHEN left(ms.STY_ID,1) = 'B' THEN 'V2522'
		END as cpt
from	[dbo].[CLMASTER] m
		LEFT JOIN [dbo].[CLMAN_SER_UNIT] ms ON m.MAN_ID = ms.MAN_ID 
									   AND m.SER_ID = ms.SER_ID
									   AND m.STY_ID = ms.STY_ID
									   AND m.PRF_CONVERT = ms.PRF_CONVERT
									   AND m.PRF_DIAMETER = ms.PRF_DIAMETER
									   AND M.PRF_BASECURVE = ms.PRF_BASECURVE 
									   AND m.PRF_ID = ms.PRF_ID
									   AND m.PRF_REV_DIAG_IND = ms.PRF_REV_DIAG_IND
		LEFT JOIN  [dbo].[CLMAN_UNIT] u ON u.UNIT_ID = ms.UNIT_ID
									   AND u.MAN_ID = m.MAN_ID
		LEFT JOIN	[dbo].CLMAN_SER_UNIT_PRICE p ON m.SER_ID = p.SER_ID 
UNION

select	CLID
		,'' AS MANUFACTURERID
		,manufacturername as MANUFACTURERNAME
		,'' AS SERIAL_ID
		,'' AS SERIAL_NAME
		,0 AS SER_DAY_PER_LENS
		,'' AS PRF_CONVERT
		,diameter AS DIAMETER
		,clname AS CLNAME	
		,istrial AS TRIAL	
		,stb AS STB	
		,bc AS BC		
		,sph AS SPH		
		,cyl AS CYL		
		,axs AS AXS					
        ,cladd AS CLADD
		,color AS COLOR		
		,0 AS PRD_CHECKDIGIT 
		,'' AS PRODUCT_ID
		,upcc AS UPCC
		,'' AS UNIT_NAME
		,0 AS UNT_LENS_QTTY
		,0 AS UNT_PACK_QTTY
		,cost  as cost
		,[list price]
		,istrial AS ISTRIAL	
		,CASE
			WHEN stb = 'S' THEN 'V2520'
			WHEN stb = 'T' THEN 'V2521'
			WHEN stb = 'B' THEN 'V2522'
		END as cpt
FROM	contactlensplus

GO

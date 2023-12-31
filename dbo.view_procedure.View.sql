/****** Object:  View [dbo].[view_procedure]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_procedure]
AS
SELECT	TOP 100 PERCENT 
		pro_cpt_cd AS [code], 
		RTRIM(prd_desc) + ' - ' + RTRIM(pro_cpt_cd) AS [description], 
		prd_no, prd_fee AS [fee], 
		RTRIM(pro_cpt_cd) + '|' + RTRIM(prd_desc) + '|' + RTRIM(CONVERT(char, prd_no)) + '|' + LTRIM(RTRIM(CONVERT(char, prd_fee))) AS [boundCol]
FROM    dbo.Products
ORDER BY RTRIM(prd_desc) + ' - ' + RTRIM(pro_cpt_cd)
GO

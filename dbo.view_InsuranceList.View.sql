/****** Object:  View [dbo].[view_InsuranceList]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_InsuranceList]
AS
SELECT	TOP 100 PERCENT 
		insurance_no AS [code], 
		insurance_name AS [description], 
		insurance_coverage AS [coverage], 
		LTRIM(RTRIM(CONVERT(char, insurance_no))) + '|' + RTRIM(insurance_name) + '|' + LTRIM(RTRIM(CONVERT(char, insurance_coverage))) + '|' + LTRIM(RTRIM(CONVERT(char, insurance_type))) AS [boundCol]
FROM    dbo.insurance
ORDER BY insurance_name
GO

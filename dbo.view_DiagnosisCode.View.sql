/****** Object:  View [dbo].[view_DiagnosisCode]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[view_DiagnosisCode]
AS
SELECT	DISTINCT TOP 100 PERCENT 
		user_cd AS [code], 
		LTRIM(RTRIM(user_cd)) + ' - ' + diagnosis_descr AS [description]
FROM    dbo.diagnosis_join
ORDER BY LTRIM(RTRIM(user_cd)) + ' - ' + diagnosis_descr
GO

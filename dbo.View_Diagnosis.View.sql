/****** Object:  View [dbo].[View_Diagnosis]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_Diagnosis]
AS
SELECT	DISTINCT TOP 100 PERCENT 
		user_cd AS [code], 
		diagnosis_descr + N' -  ' + LTRIM(RTRIM(user_cd)) AS [description]
FROM    dbo.diagnosis_join
ORDER BY diagnosis_descr + N' -  ' + LTRIM(RTRIM(user_cd))
GO

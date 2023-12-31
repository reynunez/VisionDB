/****** Object:  StoredProcedure [dbo].[GetICDMostFrequent]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo NunezR
-- Create date: 10/05/2015
-- Description: Most Frequently Use
-- =============================================
CREATE PROCEDURE [dbo].[GetICDMostFrequent]
AS
BEGIN
	Select	distinct
			top 15
			(id + 3000) as id,
			[i9 code],
			[i10 code],
			[i10 description]
	from	dbo.diagcode
	Where	id in (
					Select top 25 (cd_key - 3000) as id from dbo.patient_diagnosis order by diag_date desc
					)
	GROUP	by id,[i9 code],[i10 code],[i10 description]
	ORDER	by [i9 code],[i10 code]
END
GO

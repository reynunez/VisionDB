/****** Object:  View [dbo].[viewDoctors]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewDoctors]
AS
SELECT	TOP 100 PERCENT 
		doctorid, 
		description,
		isactive
FROM    dbo.doctors
ORDER BY description
GO

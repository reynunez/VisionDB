/****** Object:  View [dbo].[viewInsurance]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewInsurance]
AS
SELECT	TOP 100 PERCENT 
		insurance_no, 
		insurance_name
FROM    dbo.insurance
ORDER BY insurance_name
GO

/****** Object:  View [dbo].[View_PatAddr]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_PatAddr]
AS
SELECT	dbo.patient.patient_no, 
		ISNULL(LTRIM(RTRIM(dbo.patient.first_name)), '') + ' ' + ISNULL(LTRIM(RTRIM(dbo.patient.mid_name)), '') + ' ' + ISNULL(LTRIM(RTRIM(dbo.patient.last_name)), '') AS [Name], 
		dbo.address.address1 AS [address], 
		dbo.address.city, 
		dbo.address.state, 
        dbo.address.zip
FROM    dbo.patient INNER JOIN
        dbo.address ON dbo.patient.patient_no = dbo.address.patient_no
WHERE   (NOT (ISNULL(LTRIM(RTRIM(dbo.patient.first_name)), '') + ' ' + ISNULL(LTRIM(RTRIM(dbo.patient.mid_name)), '') + ' ' + ISNULL(LTRIM(RTRIM(dbo.patient.last_name)), '') IS NULL))
GO

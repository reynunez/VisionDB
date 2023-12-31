/****** Object:  View [dbo].[ViewMailingLabels]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewMailingLabels]
AS
SELECT	DISTINCT 
        dbo.patient.first_name, 
		ISNULL(dbo.patient.mid_name, N'') AS [mid_name], 
		dbo.patient.last_name, 
		dbo.address.address1, 
        ISNULL(dbo.address.address2, N'') AS [Address2], 
		dbo.address.city, 
		dbo.address.state, 
		dbo.address.zip, 
		dbo.patient.last_office_visit_date
FROM    dbo.patient INNER JOIN
        dbo.address ON dbo.patient.patient_no = dbo.address.patient_no
WHERE   (NOT (dbo.address.address1 IS NULL)) AND (SUBSTRING(dbo.address.zip, 1, 3) = '331') AND (NOT (dbo.patient.last_office_visit_date IS NULL)) AND (dbo.address.address1 <> '')
GO

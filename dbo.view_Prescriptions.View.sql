/****** Object:  View [dbo].[view_Prescriptions]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_Prescriptions]
AS
SELECT	dbo.prescription.rxnumber, 
		dbo.presctype.description AS [type], 
		dbo.prescription.rxdate, 
		dbo.prescription.voidafter,
		dbo.prescription.patient_no
FROM    dbo.prescription INNER JOIN
        dbo.presctype ON dbo.prescription.rxtype = dbo.presctype.rxtype
GO

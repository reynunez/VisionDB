/****** Object:  View [dbo].[vw_ThPrescDetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================
-- Create View template for Azure SQL Database and Azure SQL Data Warehouse Database
-- =================================================================================

CREATE VIEW [dbo].[vw_ThPrescDetails] AS
Select	h.prescid
		,prescdate
		,d.description as presc_doctor
		,o.description as office
		,c.tradename
		,c.generic
		,c.manufacturer
		,c.preparation
		,c.howsupplied
		,c.voidafter
		,c.sig
from	prescheader h join
		prescth c ON h.prescid = c.prescid left join
		doctors d ON h.doctor = cast(d.doctorid as nvarchar(255)) left join
		office o ON o.officeid = h.officeid
GO

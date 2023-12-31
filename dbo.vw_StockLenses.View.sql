/****** Object:  View [dbo].[vw_StockLenses]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_StockLenses]
AS
SELECT	dbo.Lenses.lensid, 
		dbo.Lenses.Manufacturer, 
		dbo.Lenses.product_name, 
		dbo.lensestype.description AS [lens_type_desc], 
		dbo.Lenses.lens_type, 
        dbo.Lenses.material AS [material_desc], 
		dbo.Lenses.material, 
		dbo.Lenses.sku_number,
		dbo.Lenses.sphere_power, 
		dbo.Lenses.cylinder_power, 
        dbo.Lenses.add_power, 
		dbo.eyesselection.description AS [eye_selection_desc], 
		dbo.Lenses.eye_selection, 
		dbo.Lenses.price, 
		dbo.Lenses.cost
FROM    dbo.Lenses LEFT JOIN
        dbo.lensestype ON dbo.Lenses.lens_type = dbo.lensestype.type_abv LEFT JOIN
        dbo.lensesmaterial ON dbo.Lenses.material = dbo.lensesmaterial.value LEFT JOIN
        dbo.eyesselection ON dbo.Lenses.eye_selection = dbo.eyesselection.value
GO

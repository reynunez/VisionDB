/****** Object:  StoredProcedure [dbo].[sp_GetLensSourceData]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		R.Nunez
-- Create date: 06/14/2011
-- Description:	Xfer From Source to Stock
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLensSourceData]( 
	@spcid nvarchar(14)
)
AS
BEGIN
	Insert into lenses(
	Manufacturer,
	product_name,
	lens_type,
	material,
	sphere_power,
	cylinder_power,
	add_power,
	spcID,
	MFG,
	Class,
	[Product Name],
	Filter,
	Coating,
	[Coating Brand],
	[Right OPC],
	[Left OPC],
	Diameter,
	[Frnt Rad],
	[Bck Rad],
	[C Thk],
	[E Thk],
	[LRP in],
	[LRP down],
	[d index],
	[N Ref],
	[e index],
	Abbe,
	Density,
	[PRP out],
	[PRP up],
	ND)
	Select 
	Manufacturer,
	product_name,
	lens_type,
	material,
	sphere_power,
	cylinder_power,
	add_power,
	spcID,
	MFG,
	Class,
	[Product Name],
	Filter,
	Coating,
	[Coating Brand],
	[Right OPC],
	[Left OPC],
	Diameter,
	[Frnt Rad],
	[Bck Rad],
	[C Thk],
	[E Thk],
	[LRP in],
	[LRP down],
	[d index],
	[N Ref],
	[e index],
	Abbe,
	Density,
	[PRP out],
	[PRP up],
	ND
	From StockLensData where spcid = @spcid
END
GO

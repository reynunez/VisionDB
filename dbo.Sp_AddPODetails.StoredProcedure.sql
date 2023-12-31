/****** Object:  StoredProcedure [dbo].[Sp_AddPODetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		R.Nunez
-- Create date: 02/21/2011
-- Description:	Add PO Details
-- =============================================
CREATE PROCEDURE [dbo].[Sp_AddPODetails](
	@poID				int,
	@fpcID				nvarchar(14),
	@upc				nvarchar(14),
	@manufacturerName	nvarchar(50),
	@brandName			nvarchar(50),
	@DBL				numeric(18,2),
	@A					numeric(18,2),
	@B					numeric(18,2),
	@ED					numeric(18,2),
	@rimType			nvarchar(25),
	@material			nvarchar(50),
	@frameShape			nvarchar(15),
	@price				numeric(18,2),
	@Quantity			numeric(18,2),
	@total				numeric(18,2)
)
AS
BEGIN
	Insert into PODetails(
						poID,		
						fpcID,		
						upc,		
						manufacturerName,
						brandName,	
						DBL,		
						A,		
						B,		
						ED,		
						rimType,	
						material,	
						frameShape,	
						price,		
						Quantity,	
						total)
	Values(
			@poID,		
			@fpcID,		
			@upc,		
			@manufacturerName,
			@brandName,	
			@DBL,		
			@A,		
			@B,		
			@ED,		
			@rimType,	
			@material,	
			@frameShape,	
			@price,		
			@Quantity,	
			@total)

END
GO

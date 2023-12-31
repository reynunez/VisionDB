/****** Object:  StoredProcedure [dbo].[Sp_InsertPurchaseOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		R.Nunez
-- Create date: 2/21/2011
-- Description:	P.O Header
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertPurchaseOrder](
	@vendorName		nvarchar(100),
	@shipVia		nvarchar(100),
	@dateRequired	datetime,
	@description	nvarchar(100),
	@datePromissed	datetime
)
AS
BEGIN
	declare @orderDate datetime
	set @orderDate = getdate()
	Insert into PurchaseOrders(
								vendorName,
								shipVia,
								dateRequired,
								description,
								datePromissed,
								orderDate)
	Values(
			@vendorName,
			@shipVia,
			@dateRequired,
			@description,
			@datePromissed,
			@orderDate)
END
GO

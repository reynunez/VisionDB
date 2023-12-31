/****** Object:  StoredProcedure [dbo].[sp_NET_InsertAbbOrderDetail]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/02/2021
-- Description:	Procedure Insert Abb Order
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertAbbOrderDetail](
	@ordercode varchar(45),
	@ProductId varchar(20),
	@ProductName varchar(45),
	@Quantity INT,
	@CustomerPartId INT,
	@ExtendedPrice numeric(18, 2),
	@ItemComment varchar(50),
	@UnitPrice numeric(18, 2)
)
AS
BEGIN

		INSERT INTO AbbDetailOrder(ordercode ,
								ProductId ,
								ProductName,
								Quantity ,
								CustomerPartId ,
								ExtendedPrice ,
								ItemComment ,
								UnitPrice 
								)
		VALUES( @ordercode ,
				@ProductId ,
				@ProductName,
				@Quantity ,
				@CustomerPartId ,
				@ExtendedPrice ,
				@ItemComment ,
				@UnitPrice 
			)
END
GO

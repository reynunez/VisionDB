/****** Object:  StoredProcedure [dbo].[sp_NET_InsertAbbOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/02/2021
-- Description:	Procedure Insert Abb Order
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertAbbOrder](
	@OrderDate datetime,
	@ordercode [varchar](45) ,
	@ReferenceId varchar(20),
	@VUReferenceId varchar(20),
	@CustomerId varchar(20),
	@OrderStatus varchar(45),
	@ShippingAddresee varchar(100),
	@ShippingAddress1 varchar(100),
	@ShippingCity varchar(100),
	@ShippingStateCode varchar(50),
	@ShippingPostalCode varchar(20),
	@ShippingMethod varchar(25),
	@ShippingCharges numeric(18, 2),
	@TotalAmount numeric(18, 2),
	@PartnerTrackingId varchar(20),
	@ShipToPatient BIT
)
AS
BEGIN

		INSERT INTO AbbOrders(OrderDate ,
								ordercode,
								ReferenceId ,
								VUReferenceId ,
								CustomerId ,
								OrderStatus ,
								ShippingAddresee ,
								ShippingAddress1 ,
								ShippingCity ,
								ShippingStateCode ,
								ShippingPostalCode ,
								ShippingMethod ,
								ShippingCharges ,
								TotalAmount ,
								PartnerTrackingId ,
								ShipToPatient 
								)
		VALUES( @OrderDate ,
				@ordercode,
				@ReferenceId ,
				@VUReferenceId ,
				@CustomerId ,
				@OrderStatus ,
				@ShippingAddresee ,
				@ShippingAddress1 ,
				@ShippingCity ,
				@ShippingStateCode ,
				@ShippingPostalCode ,
				@ShippingMethod ,
				@ShippingCharges ,
				@TotalAmount ,
				CAST(ABS(CAST(CAST(NEWID() AS VARBINARY(5)) AS Bigint)) AS VARCHAR),
				@ShipToPatient 
			)
END
GO

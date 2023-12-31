/****** Object:  StoredProcedure [dbo].[sp_InsertShippingDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 04/15/2016
-- Description:	Maintain Shipping Records
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertShippingDetails](
	@patient_no int
	,@shipdate date
	,@tracking_number varchar(255)
	,@order_type varchar(50)
	,@orderid int
	,@service_type varchar(50)
	,@shipto_addressid int
	,@comments text
)
AS
BEGIN
	INSERT INTO dbo.shipping_details
	SELECT @patient_no as patient_no
	,@shipdate as shipdate
	,@tracking_number as tracking_number
	,@order_type as order_type
	,@orderid as orderid
	,@service_type as service_type
	,@shipto_addressid as shipto_addressid
	,@comments as comments
END
GO

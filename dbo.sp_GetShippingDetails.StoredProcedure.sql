/****** Object:  StoredProcedure [dbo].[sp_GetShippingDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 04/16/2016
-- Description:	Get Shipping Details
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetShippingDetails](
	@orderid int
)
AS
BEGIN
	Select	sd.*,
			case when sd.order_type=1 then 'Ophthalmic' else 'Contact Lens' End as order_type_desc,
			(sa.address1 + ' ' + sa.address2 + ' ' + sa.city + ',' + sa.zip) as shipto_address ,
			(ltrim(rtrim(pt.first_name)) + ' ' + ltrim(rtrim(pt.last_name))) as patient_name
	from	shipping_details sd left join 
			shipaddress sa ON sd.shipto_addressid = sa.address_no JOIN
			patient pt ON sd.patient_no = pt.patient_no
	where	sd.orderid = @orderid
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsuranceRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/21/2021
-- Description:	Procedure to get Insurances Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsuranceRecord](
	@insurance_no INT
)
AS
BEGIN

	Select	i.insurance_name 
			,i.insurance_address1 
			,i.insurance_address2 
			,i.insurance_city 
			,i.insurance_state 
			,i.insurance_zip_cd 
			,i.insurance_phone_no 
			,i.insurance_fax_no 
			,i.insurance_contact 
			,i.insurance_type 
			,i.payer_name 
			,i.payer_id 
			,i.active 
			,p.payername 
			,p.payer_number 
			,p.isactive
	from	insurance i
			join tbl_payer  p ON i.payer_id = p.payerid 
	Where	i.insurance_no = @insurance_no 

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_UpateInsAuthorization]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/30/2020
-- Description: Update Authorization Elements
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpateInsAuthorization](
	@appmt_no			int,
	@ins_authorization	varchar(45),
	@ins_benefits		varchar(45),
	@billingprov		varchar(100),
	@referring_prov		varchar(100),
	@rendering_prov		varchar(100),
	@payer				varchar(100),
	@appmtlocation		varchar(100),
	@insurance_no		int,
	@insurance_name		varchar(100) = ''
)
AS

BEGIN
	
	Update	appointment
	set		ins_authorization = @ins_authorization
			,ins_benefits = @ins_benefits
			,billingprov = @billingprov
			,referring_prov = @referring_prov
			,rendering_prov = @rendering_prov
			,payer = @payer
			,locationname = @appmtlocation
			,insurance_no = @insurance_no 
			,insurance_name = @insurance_name
	Where	appmt_no = @appmt_no

END
GO

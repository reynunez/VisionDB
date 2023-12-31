/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsAuthElements]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/30/2020
-- Description:Get Insurance Authorization Elements
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsAuthElements](
	@appmt_no INT
)
AS
		Select	a.insurance_no
				,p.insurance_no as insurance_id
				,a.ins_authorization
				,a.ins_benefits
				,a.billingprov
				,a.referring_prov
				,a.rendering_prov
				,a.payer
				,a.appmtlocation
				,a.locationname
				,a.insurance_name
		From	Appointment a
				left join patient_insurances p ON a.insurance_no = p.Ins_no 
		Where	a.appmt_no = @appmt_no

GO

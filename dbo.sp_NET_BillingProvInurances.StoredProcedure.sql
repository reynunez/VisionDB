/****** Object:  StoredProcedure [dbo].[sp_NET_BillingProvInurances]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/10/2021
-- Description:Get Billing Prov Insurance List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_BillingProvInurances](
	@BillingProvider_id INT = 0
)
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	DISTINCT
			h.INS_PARENT_LEVEL
			,h.INS_PARENT
			,h.INS_LEVEL
			,h.INS_ID as insruance_id
			,i.insurance_name
	FROM	V_INS_HIERARCHY h
			LEFT JOIN insurance i ON i.insurance_no = h.INS_ID
	WHERE	h.INS_LEVEL = 1
			AND h.INS_PARENT = @BillingProvider_id;

END
GO

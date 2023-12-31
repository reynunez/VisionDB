/****** Object:  StoredProcedure [dbo].[sp_NET_BillingProvInsLocations]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/10/2021
-- Description:Get Billing Prov Insurance Loc List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_BillingProvInsLocations](
	@insruance_id INT = 0,
	@BillingProvider_id INT = 0
)
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	DISTINCT
			h.LOC_PARENT_LEVEL
			,h.LOC_PARENT
			,h.LOC_LEVEL
			,h.LOC_ID as office_id
			,o.description as office_name
	FROM	V_INS_HIERARCHY h
			LEFT JOIN office o ON h.LOC_ID = o.officeid
	WHERE	h.LOC_LEVEL = 2
			AND h.LOC_PARENT = @insruance_id
			AND h.INS_PARENT = @BillingProvider_id;

END
GO

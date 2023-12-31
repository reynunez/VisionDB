/****** Object:  StoredProcedure [dbo].[sp_NET_BillingProvInsLocationsRend]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_BillingProvInsLocationsRend](
	@BillingProvider_id INT = 0,
	@insruance_id INT = 0,
	@office_id INT = 0
)
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	DISTINCT
			h.RP_PARENT_LEVEL
			,h.RP_PARENT
			,h.RP_LEVEL
			,h.RP_ID AS doctor_id
			,b.description as doctor_name
	FROM	V_INS_HIERARCHY h
			LEFT JOIN DOCTORS b ON h.RP_ID = b.doctorid
	WHERE	h.RP_LEVEL = 3
			AND h.INS_PARENT = @BillingProvider_id
			AND h.LOC_PARENT = @insruance_id
			AND h.RP_PARENT = @office_id;

END
GO

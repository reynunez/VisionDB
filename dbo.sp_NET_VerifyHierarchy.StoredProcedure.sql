/****** Object:  StoredProcedure [dbo].[sp_NET_VerifyHierarchy]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/10/2021
-- Description:G Verify Insurance Hierarchy
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_VerifyHierarchy](
	@INS_ID INT,
	@BP_ID INT,
	@LOC_ID INT,
	@RP_ID INT
)
AS
BEGIN

    SET NOCOUNT ON;
	IF EXISTS(
				SELECT	H.bp_id,
						B.NAME AS BILLING_PROVIDER,
						H.ins_id,
						I.INSURANCE_NAME,
						H.loc_id,
						O.DESCRIPTION AS LOCATION_NAME,
						H.rp_id ,
						D.DESCRIPTION AS DOCTOR_NAME
				FROM	V_INS_HIERARCHY H
						JOIN tbl_billing_provider B ON H.bp_id = B.ID
						JOIN INSURANCE I ON H.INS_ID = I.INSURANCE_NO
						JOIN OFFICE O ON H.LOC_ID = O.OFFICEID
						JOIN DOCTORS D ON H.RP_ID = D.DOCTORID
				WHERE	H.INS_ID = @INS_ID 
						AND H.BP_ID = @BP_ID
						AND H.LOC_ID = @LOC_ID
						AND H.RP_ID = @RP_ID
	) BEGIN
	SELECT 1 AS VALIDATE
	END ELSE BEGIN
	SELECT 0 AS VALIDATE
	END;
END
GO

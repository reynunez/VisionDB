/****** Object:  StoredProcedure [dbo].[sp_NET_GetIHierarchy]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/10/2021
-- Description:Get Insurance Hierarchy
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetIHierarchy](
	@INS_NAME VARCHAR(45)
)
AS
BEGIN

    SET NOCOUNT ON;

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
	WHERE	I.INSURANCE_NAME = @INS_NAME
	ORDER	BY 1,3,5,7;

END
GO

/****** Object:  UserDefinedFunction [dbo].[GetBillingProvider]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 1/16/2014
-- Description:	Get Billing Provider
-- =============================================
CREATE FUNCTION [dbo].[GetBillingProvider]
(
	@insurance_no int,
	@officeid int
)
RETURNS Varchar(100)
AS
BEGIN
	DECLARE @ResultVar varchar(100);

	SELECT	DISTINCT @ResultVar = B.NAME
	FROM	V_INS_HIERARCHY H
			JOIN tbl_billing_provider B ON H.bp_id = B.ID
			JOIN INSURANCE I ON H.INS_ID = I.INSURANCE_NO
			JOIN OFFICE O ON H.LOC_ID = O.OFFICEID
			JOIN DOCTORS D ON H.RP_ID = D.DOCTORID
	WHERE	I.INSURANCE_NO = @insurance_no
			AND O.OFFICEID = @officeid;

	RETURN @ResultVar

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_BillingProv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/10/2021
-- Description:Get Billing Prov List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_BillingProv]
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	h.parent_level
			,h.parent
			,h.mylevel
			,myid AS ID
			,b.name
	FROM	INS_HIERARCHY h
			LEFT JOIN tbl_billing_provider b ON h.myid = b.id
	where	h.mylevel = 0

END
GO

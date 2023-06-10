/****** Object:  StoredProcedure [dbo].[sp_NET_GetAllBillProv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/31/2021
-- Get Billing Provider All List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAllBillProv]
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	id,name 
	FROM	tbl_billing_provider
	where	active = 1

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetBillProv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/31/2021
-- Get Billing Provider List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetBillProv](
	@BProvID INT
)
AS
BEGIN

    SET NOCOUNT ON;

	SELECT	*
	FROM	tbl_billing_provider
	where	active = 1
			AND id = @BProvID

END
GO

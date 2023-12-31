/****** Object:  StoredProcedure [dbo].[sp_NET_GetLocReconTotal]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 03/30/2022
-- Description: Get Locations Reconciliation Totals
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetLocReconTotal]
(
	@recondate date
)
AS
BEGIN

    SET NOCOUNT ON

	Select	cast(recondate as date) as recondate
			,sum(cash) as cash
			,sum(other) as other
			,sum(itemscount ) as invoices
			,sum(rcash) as rcash
			,sum(rother) as rother
			,sum(dcash) as dcash
			,sum(dother) as dother
	from	tblDailyReconciliations
	where	cast(recondate as date) = cast(@recondate as date)
	group	by recondate;

END
GO

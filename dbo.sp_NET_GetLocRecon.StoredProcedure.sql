/****** Object:  StoredProcedure [dbo].[sp_NET_GetLocRecon]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 03/30/2022
-- Description: Get Locations Reconciliation
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetLocRecon]
(
	@recondate date
)
AS
BEGIN

    SET NOCOUNT ON

	Select	cast(r.recondate as date) as recondate
			,o.description as office
			,r.cash
			,r.other
			,r.itemscount as invoices
			,r.rcash
			,r.rother
			,r.dcash
			,r.dother
			,r.reconid 
	from	tblDailyReconciliations r
			join office o ON r.officeid = o.officeid
	where	cast(recondate as date) = cast(@recondate as date)

END
GO

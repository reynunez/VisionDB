/****** Object:  StoredProcedure [dbo].[sp_NET_DelLocRecon]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 03/31/2022
-- Description: Delete Locations Reconciliation
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_DelLocRecon]
(
	@reconid int
)
AS
BEGIN

    SET NOCOUNT ON

	delete from	tblDailyReconciliations 
	where	reconid = @reconid 

END
GO

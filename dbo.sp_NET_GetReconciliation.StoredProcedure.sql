/****** Object:  StoredProcedure [dbo].[sp_NET_GetReconciliation]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/24/2021
-- Description:	Get Daily Reconciliaiton
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetReconciliation](
	@recondate datetime ,
	@officeid int 
	)
AS
BEGIN
	SET NOCOUNT ON;

	Select	cash
			,other
			,itemscount 
			,rcash
			,rother
			,dcash
			,dother
			,comments 
	from	tblDailyReconciliations
	WHERE	recondate = @recondate 
			and officeid = @officeid 

END
GO

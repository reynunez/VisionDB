/****** Object:  StoredProcedure [dbo].[sp_NET_InsertReconciliation]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/24/2021
-- Description:	Insert Daily Reconciliaiton
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertReconciliation](
	@recondate datetime ,
	@cash numeric(18, 2) =0,
	@other numeric(18, 2) =0,
	@itemscount int =0,
	@rcash numeric(18, 2)=0 ,
	@rother numeric(18, 2) =0,
	@dcash numeric(18, 2) =0,
	@dother numeric(18, 2) =0,
	@officeid int =0,
	@comments varchar(max) =''
	)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS(
				SELECT	* 
				FROM	dbo.tblDailyReconciliations 
				WHERE	cast(recondate as date) = cast(@recondate as date)
						AND officeid = @officeid
	) BEGIN
				INSERT INTO dbo.tblDailyReconciliations(
														recondate,
														cash ,
														other,
														itemscount,
														rcash ,
														rother,
														dcash,
														dother,
														officeid,
														comments
														)
												Values(
														@recondate,
														@cash ,
														@other,
														@itemscount,
														@rcash ,
														@rother,
														@dcash,
														@dother,
														@officeid,
														@comments
														)
	END
	ELSE BEGIN
				UPDATE dbo.tblDailyReconciliations 
				SET	cash = @cash ,
					other = @other ,
					itemscount = @itemscount ,
					rcash = @rcash ,
					rother = @rother ,
					dcash = @dcash ,
					dother = @dother ,
					comments = @comments 
				where cast(recondate as date) = cast(@recondate as date) AND officeid = @officeid					
	END

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetPayers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/07/2020
-- Description:	Get Payers
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPayers]
AS

	Select	* 
	From	tbl_payer
	Order	by payername
GO

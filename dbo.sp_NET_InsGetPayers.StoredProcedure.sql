/****** Object:  StoredProcedure [dbo].[sp_NET_InsGetPayers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/04/2022
-- Description:	Get Insurance Payers
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsGetPayers]
AS

BEGIN
	SET NOCOUNT ON

	Select	distinct
			payer_Name 
	from	insurance
	where	payer_Name <> ''
	order	by payer_Name 
END
GO

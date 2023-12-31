/****** Object:  StoredProcedure [dbo].[sp_GetSalesmanPIN]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 8/28/2015
-- Description:	Get decrypted PIN
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSalesmanPIN](
	@salesmanid int
)
AS
BEGIN
	SET NOCOUNT ON;
	Select dbo.DecryptString(persidnumber,102) from salespeople where salesmanid = @salesmanid
END
GO

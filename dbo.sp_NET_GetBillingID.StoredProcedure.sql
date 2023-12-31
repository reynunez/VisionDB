/****** Object:  StoredProcedure [dbo].[sp_NET_GetBillingID]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/26/2020
-- Description:	Get Billing ID
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetBillingID] 
	@CODE varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

		select	id 
		from	tblcpt
		WHERE   code = @CODE
END
GO

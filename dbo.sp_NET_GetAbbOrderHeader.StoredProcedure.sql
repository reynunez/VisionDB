/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbOrderHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description: ABB Orders Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbOrderHeader](
	@DateFrom as date,
	@DateTo as date
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	*
	From	AbbOrders 
	Where	Cast(OrderDate as date) between @DateFrom  and  @DateTo

END
GO

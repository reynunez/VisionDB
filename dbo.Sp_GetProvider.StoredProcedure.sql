/****** Object:  StoredProcedure [dbo].[Sp_GetProvider]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetProvider]
WITH EXECUTE AS CALLER
AS
set nocount on
Select  provider from   dbo.invoicedetails where    provider <> '' group    by provider order by provider
GO

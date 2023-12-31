/****** Object:  StoredProcedure [dbo].[sp_GetInvPmts]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_GetInvPmts]
@Invoiceid INT, @payer NVARCHAR (25)
WITH EXECUTE AS CALLER
AS
Select payment
from   viewInvoicePayments 
where  invoiceid = @Invoiceid and payer = @payer
group  by payment
GO

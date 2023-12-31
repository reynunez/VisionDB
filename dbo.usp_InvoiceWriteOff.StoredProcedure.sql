/****** Object:  StoredProcedure [dbo].[usp_InvoiceWriteOff]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Invoices Write-Off Procedure Insert
	Procedure to take care of unpaid balances Insurances short paids
	Author: Reynaldo Nunez
	Date: 9/7/2013
*/
CREATE PROCEDURE [dbo].[usp_InvoiceWriteOff]
	@invoiceid	int,
	@wodate		VARCHAR(10),
	@womemo		varchar(Max),
	@woAmount	numeric(18,2)
AS
	Insert into InvWriteOff(invoiceid,wodate,womemo,woAmount)
	Values(@invoiceid,CAST(@wodate AS DATETIME),@womemo,@woAmount)
RETURN 0
GO

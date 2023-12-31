/****** Object:  UserDefinedFunction [dbo].[padInvoice]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[padInvoice] (@invoiceid int)  
RETURNS char(7)
AS  
BEGIN 
	declare @vReturn char(7)
	declare @cInvoiceId char(7)
	declare @nRepl int
	Set @cInvoiceId = convert(char,@invoiceid)
	Set @nRepl = 7-len(ltrim(rtrim(@cInvoiceId)))
	Set @vReturn = replicate('0',@nRepl) + ltrim(rtrim(@cInvoiceId))
	RETURN @vReturn
END
GO

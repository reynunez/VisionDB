/****** Object:  UserDefinedFunction [dbo].[getTotalAdjustments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[getTotalAdjustments](@InvoiceID as int)
RETURNS NUMERIC(18,2)
AS  
BEGIN 
	RETURN ISNULL((select CAST(sum(adjamt) AS NUMERIC(18,2)) from INVOICE_PMT where invoiceid = @InvoiceID group by invoiceid ),0)
END
GO

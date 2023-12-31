/****** Object:  StoredProcedure [dbo].[usp_SetInvoiceEDI]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Created by R.Nunez
	Date: 04/02/2014
	This procedure flag invoices processed for EDI

*/


CREATE PROCEDURE [dbo].[usp_SetInvoiceEDI]
	@invoiceid int
AS
	Update Invoice Set isEDI = 1 where invoiceid = @invoiceid 
RETURN 0
GO

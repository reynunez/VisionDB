/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvoicePayments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/23/2021
-- Description: Get Invoice Payments
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvoicePayments]
(
	@invoiceid INT
)
AS
BEGIN
	Select	case when isinsurance =1 then 'Insurance' else 'Patient' end as payor
			,paymentdate 
			,cashamt as cash
			,otheramt as other
			,adjamt as adjustment
			,totalpayment 
	from	INVOICE_PMT
	where	invoiceid = @invoiceid 

END
GO

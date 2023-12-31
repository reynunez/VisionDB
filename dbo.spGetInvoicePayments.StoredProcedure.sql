/****** Object:  StoredProcedure [dbo].[spGetInvoicePayments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetInvoicePayments](
	@Invoiceid	int,
	@Payer	nvarchar(10)
) AS

	declare @Payments decimal(13,2)
	declare @Cash decimal(13,2)
	declare @Check decimal(13,2)
	declare @Other decimal(13,2)

	if @Payer <> 'All'
		begin
			select  @Payments =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid  and payer = @Payer
			select @Cash =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid  and payer = @Payer and type = 'Cash'
			select @Check =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid  and payer = @Payer and type = 'Check'
			select @Other =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid  and payer = @Payer and type = 'Other'
		end
	else
		begin
			select  @Payments =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid  
			select @Cash =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid and  type = 'Cash'
			select @Check =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid  and type = 'Check'
			select @Other =  sum(payment) from viewInvoicePayments where invoiceid = @Invoiceid   and type = 'Other'
		end

	select isnull(@payments,0) as  [Payments], isnull(@Cash,0) as [Cash], isnull(@Check,0) as [Check], isnull(@Other,0) as [Other]
GO

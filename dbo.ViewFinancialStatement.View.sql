/****** Object:  View [dbo].[ViewFinancialStatement]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE VIEW [dbo].[ViewFinancialStatement]
AS
Select	Invoice.Invoiceid,
		Invoice.invdate,
		isnull(Invoice.pcharges,0) + isnull(Invoice.inscharges,0) as [InvTotal],
		isnull(Invoice.adjustments,0) + isnull(otheropitms,0) - isnull(Invoice.discount,0) - isnull(Invoice.credits,0) as [Adjustments],
		(((isnull(Invoice.pcharges,0)  + isnull(Invoice.inscharges,0)) - isnull(Invoice.discount,0)) - ((ISNULL(viewPayments.payments, 0)) + isnull(Invoice.cashamt,0) + isnull(Invoice.otheramt,0) + isnull(Invoice.checkamt,0)) + isnull(Invoice.adjustments,0) + isnull(Invoice.otheropitms,0) - isnull(Invoice.credits,0)) as [InvBalance],
		Invoice.invdate as [paymentdate],
		isnull(Invoice.cashamt,0) + isnull(Invoice.otheramt,0) + isnull(Invoice.checkamt,0) as [payment],
		isnull(viewPayments.type,case when (isnull(Invoice.cashamt,0) + isnull(Invoice.otheramt,0) + isnull(Invoice.checkamt,0))  > 0 then 'Patient' else '' End) as [type],
		Invoice.patient_no,
		'Creation' as [trantype]
from	Invoice	Left join
		viewPayments on Invoice.invoiceid = viewPayments.invoiceid
where	invoice.reference not in ('H','V','E')

Union

Select	invoice.invoiceid,
		invoice.invdate,
		isnull(Invoice.pcharges,0) + isnull(Invoice.inscharges,0) as [InvTotal],
		isnull(Invoice.adjustments,0) + isnull(otheropitms,0) - isnull(Invoice.discount,0) - isnull(Invoice.credits,0) as [Adjustments],
		(((isnull(Invoice.pcharges,0)  + isnull(Invoice.inscharges,0)) - isnull(Invoice.discount,0)) - ((ISNULL(viewPayments.payments, 0)) + isnull(Invoice.cashamt,0) + isnull(Invoice.otheramt,0) + isnull(Invoice.checkamt,0)) + isnull(Invoice.adjustments,0) + isnull(Invoice.otheropitms,0) - isnull(Invoice.credits,0)) as [InvBalance],
		payments.pydate as paymentdate,
		payments.payment,
		isnull(viewPayments.type,case when (((isnull(Invoice.pcharges,0)  + isnull(Invoice.inscharges,0)) - isnull(Invoice.discount,0)) - ((ISNULL(viewPayments.payments, 0)) + isnull(Invoice.cashamt,0) + isnull(Invoice.otheramt,0) + isnull(Invoice.checkamt,0)) + isnull(Invoice.adjustments,0) + isnull(Invoice.otheropitms,0) - isnull(Invoice.credits,0)) > 0 then 'Patient' else '' End) as [type],
		Invoice.patient_no,
		'payment' as [trantype]
From	payments Left join 
		invoice on payments.invoiceid = invoice.invoiceid Left join
		viewPayments on Invoice.invoiceid = viewPayments.invoiceid
where	invoice.reference not in ('H','V','E')

Union

Select	invoice.invoiceid,
		invoice.invdate,
		isnull(Invoice.pcharges,0) + isnull(Invoice.inscharges,0) as [InvTotal],
		isnull(Invoice.adjustments,0) + isnull(otheropitms,0) - isnull(Invoice.discount,0) - isnull(Invoice.credits,0) as [Adjustments],
		(((isnull(Invoice.pcharges,0)  + isnull(Invoice.inscharges,0)) - isnull(Invoice.discount,0)) - ((ISNULL(viewPayments.payments, 0)) + isnull(Invoice.cashamt,0) + isnull(Invoice.otheramt,0) + isnull(Invoice.checkamt,0)) + isnull(Invoice.adjustments,0) + isnull(Invoice.otheropitms,0) - isnull(Invoice.credits,0)) as [InvBalance],
		InvWriteOff.wodate as paymentdate,
		InvWriteOff.woAmount as payment,
		'Admin' as [type],
		Invoice.patient_no,
		'Write Off' as [trantype]
From	InvWriteOff Left join 
		invoice on InvWriteOff.invoiceid = invoice.invoiceid  Left join
		viewPayments on Invoice.invoiceid = viewPayments.invoiceid left join
		viewWriteOff on invoice.invoiceid = viewWriteOff.invoiceid
where	invoice.reference not in ('H','V','E')
GO

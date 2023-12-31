/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvPMTTotal]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 04/01/2023
-- Description: Get Invoice Payments Aggregation
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvPMTTotal]
(
	@INVOICE_DATE_FROM DATE,
	@INVOICE_DATE_TO DATE,
	@PMTTYPE INT = 0
)
AS
BEGIN

	IF @PMTTYPE = 0 BEGIN
		Select * From(
			Select	o.officeid
					,o.description AS OFFICE
					,sum(p.cashamt) as Cash
					,sum(p.otheramt) as OtherPmt
					,sum(p.adjamt) as adjustments
					,sum(p.totalpayment) as TotalPmt
			from	INVOICE_PMT p
					join INVOICE_HDR i on p.invoiceid = i.invoiceid
					join office o on i.officeid = o.officeid 
			Where	cast(p.paymentdate as date) between @INVOICE_DATE_FROM and @INVOICE_DATE_TO
			group	by o.officeid ,o.description
			UNION ALL
			Select	1000000 as officeid
					,'TOTAL' AS OFFICE
					,sum(p.cashamt) as Cash
					,sum(p.otheramt) as OtherPmt
					,sum(p.adjamt) as adjustments
					,sum(p.totalpayment) as TotalPmt
			from	INVOICE_PMT p
			Where	cast(p.paymentdate as date) between @INVOICE_DATE_FROM and @INVOICE_DATE_TO
		) Main
		order by officeid DESC
	END
	IF @PMTTYPE = 1 BEGIN
		Select * From(
			Select	o.officeid
					,o.description AS OFFICE
					,sum(p.cashamt) as Cash
					,sum(p.otheramt) as OtherPmt
					,sum(p.adjamt) as adjustments
					,sum(p.totalpayment) as TotalPmt
			from	INVOICE_PMT p
					join INVOICE_HDR i on p.invoiceid = i.invoiceid
					join office o on i.officeid = o.officeid
			Where	cast(paymentdate as date) between @INVOICE_DATE_FROM and @INVOICE_DATE_TO
					AND ispatient = 1
			group	by o.officeid ,o.description
			UNION ALL
			Select	1000000 as officeid
					,'TOTAL' AS OFFICE
					,sum(p.cashamt) as Cash
					,sum(p.otheramt) as OtherPmt
					,sum(p.adjamt) as adjustments
					,sum(p.totalpayment) as TotalPmt
			from	INVOICE_PMT p
			Where	cast(p.paymentdate as date) between @INVOICE_DATE_FROM and @INVOICE_DATE_TO
					AND ispatient = 1
		) Main
		order by officeid DESC
	END
	IF @PMTTYPE = 2 BEGIN
		Select * From(
		Select	o.officeid
				,o.description AS OFFICE
				,sum(p.cashamt) as Cash
				,sum(p.otheramt) as OtherPmt
				,sum(p.adjamt) as adjustments
				,sum(p.totalpayment) as TotalPmt
		from	INVOICE_PMT p
				join INVOICE_HDR i on p.invoiceid = i.invoiceid
				join office o on i.officeid = o.officeid
		Where	cast(paymentdate as date) between @INVOICE_DATE_FROM and @INVOICE_DATE_TO
				AND isinsurance = 1
		group	by o.officeid ,o.description
		UNION ALL
		Select	1000000 as officeid
				,'TOTAL' AS OFFICE
				,sum(p.cashamt) as Cash
				,sum(p.otheramt) as OtherPmt
				,sum(p.adjamt) as adjustments
				,sum(p.totalpayment) as TotalPmt
		from	INVOICE_PMT p
		Where	cast(p.paymentdate as date) between @INVOICE_DATE_FROM and @INVOICE_DATE_TO
				AND isinsurance = 1
		) Main
		order by officeid DESC
	END

END
GO

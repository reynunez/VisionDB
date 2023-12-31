/****** Object:  StoredProcedure [dbo].[sp_NET_GetPaymentsListSum]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/07/2022
-- Description: Get Payments List Summary
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPaymentsListSum](
	@PAYMENTDATE DATE,
	@OFFICEID INT
)
AS
BEGIN

	Select	CASE WHEN IP.isinsurance = 1 THEN 'Insurance' ELSE 'Patient' END AS RECEIVED_FROM
			,cast(SUM(IP.cashamt) as numeric(18,2)) AS CASH_PMT
			,cast(SUM(IP.otheramt) as numeric(18,2)) AS OTHER_PMT
			,cast(SUM(IP.adjamt) as numeric(18,2))  AS ADJUSTMENTS
			,cast(SUM(IP.totalpayment) as numeric(18,2)) AS TOTAL_PAYMENT
	from	INVOICE_PMT IP 
			LEFT JOIN INVOICE_HDR I ON I.invoiceid = IP.invoiceid 
	where	cast(paymentdate as DATE) = @PAYMENTDATE
			AND I.officeid = @OFFICEID
			AND I.INV_STATUS <> 'Voided'
	GROUP	BY CASE WHEN IP.isinsurance = 1 THEN 'Insurance' ELSE 'Patient' END
			

END
GO

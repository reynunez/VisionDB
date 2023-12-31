/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientFStatement]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/22/2021
-- Description: Get Patient Fin Statement
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientFStatement](
	@patient_no INT 
)
AS
BEGIN

    SET NOCOUNT ON;

	with patInv as(
	SELECT	cast(H.invoiceid as varchar) as invoiceid
			,CAST(H.officeid AS VARCHAR) AS officeid
			,CONVERT(varchar, H.invdate , 101) as invdate
			,H.INV_STATUS AS STATUS
			,CAST(ISNULL(H.inscharges ,0) AS NUMERIC(18,2)) AS inscharges
			,CAST(ISNULL(H.pcharges ,0) AS NUMERIC(18,2)) AS pcharges
			,dbo.getTotalAdjustments(H.invoiceid) AS adjustments
			,CAST(ISNULL(((H.inscharges + H.pcharges ) - H.adjustments),0) AS NUMERIC(18,2)) AS invtotal
			,dbo.getTotalPayment(H.invoiceid) as totalpayments
			,(((CAST(ISNULL(H.inscharges,0) AS NUMERIC(18,2)) + CAST(ISNULL(H.pcharges,0) AS NUMERIC(18,2))) - dbo.getTotalPayment(H.invoiceid)  )) AS BALANCE
	FROM	INVOICE_HDR H
			JOIN patient P ON H.patient_no = P.patient_no 
	where	H.patient_no = @patient_no
			AND H.INV_STATUS <> 'Voided'
	)

	SELECT	INVOICEID
			,OFFICEID
			,INVDATE
			,STATUS
			,INSCHARGES
			,PCHARGES
			,ADJUSTMENTS
			,INVTOTAL
			,TOTALPAYMENTS
			,BALANCE
	FROM	(
				select	*
				from	patInv
				UNION
				Select	'TOTALS' AS invoiceid
						,'' as officeid
						,'' as invdate
						,'' AS STATUS
						,CAST(ISNULL(SUM(INSCHARGES),0) AS NUMERIC(18,2)) AS inscharges
						,CAST(ISNULL(SUM(PCHARGES),0) AS NUMERIC(18,2)) AS pcharges
						,CAST(ISNULL(SUM(ADJUSTMENTS),0) AS NUMERIC(18,2)) AS adjustments
						,CAST(ISNULL(SUM(INVTOTAL),0) AS NUMERIC(18,2)) AS invtotal
						,CAST(ISNULL(SUM(TOTALPAYMENTS),0) AS NUMERIC(18,2)) AS totalpayments
						,CAST(ISNULL(SUM(BALANCE),0) AS NUMERIC(18,2)) AS BALANCE
				FROM	patInv
	) MAIN 
	ORDER BY invoiceid;	

END
GO

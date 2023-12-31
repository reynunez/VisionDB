/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvPMTList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 02/03/2021
-- Description: Get Invoice Payments List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvPMTList]
(
	@INVOICE_DATE_FROM DATE,
	@INVOICE_DATE_TO DATE,
	@STATUS VARCHAR(50) = '',

	@PATIENTNO INT = 0,
	@ORDER_ID INT = 0,
	@INVOICE_ID INT = 0,
	@ORDER_TYPE VARCHAR(10) = '',
	@OFFICEID INT = 0,
	@CREATEDBY VARCHAR(100) = '',
	@CPTCODE VARCHAR(50) = '',
	@REASONID INT = 0,
	@PAYER VARCHAR(20) = '',
	@PAYERS INT = 0
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(MAX) 
	DECLARE @SQL_StatemenTotal NVARCHAR(MAX)


	SET @SQL_StatemenTotal = '  Declare @CASH NUMERIC(18,2);
								Declare @OTHAMT NUMERIC(18,2);
								Declare @TOTPMT NUMERIC(18,2);
								Declare @TOTADJ NUMERIC(18,2);
								Declare @INVTOTAL NUMERIC(18,2);
								Select	DISTINCT
										@INVTOTAL = CAST(SUM(h.pcharges + h.inscharges) AS NUMERIC(18,2)),
										@CASH = CAST(SUM(p.cashamt) AS NUMERIC(18,2)),
										@OTHAMT = CAST(SUM(p.otheramt) AS NUMERIC(18,2)),
										@TOTADJ = CAST(SUM(p.adjamt) AS NUMERIC(18,2)),
										@TOTPMT = CAST(SUM(p.totalpayment) AS NUMERIC(18,2))
								FROM	INVOICE_HDR h
									LEFT JOIN INVOICE_PMT p ON h.invoiceid = p.invoiceid 
									LEFT JOIN office o ON h.officeid = o.officeid 
									LEFT JOIN patient pa ON pa.patient_no = h.patient_no
									LEFT JOIN INSURANCE i ON i.insurance_no = h.insurance_no
									LEFT JOIN tbl_payer py ON py.payerid = i.payer_id
								WHERE	1=1 '

	set @SQL_Statement = 'SELECT	DISTINCT
									h.invoiceid AS INVOICEID
									,cast(h.EFFDATE as date) as INVDATE
									,h.INV_STATUS AS INVSTATUS
									,o.description AS OFFICE
									,h.ORDER_TYPE 
									,h.order_id AS ORDERID
									,(LTRIM(RTRIM(pa.first_name )) + '' '' + LTRIM(RTRIM(pa.last_name  ))) AS PATIENT
									,Cast((h.inscharges + h.pcharges) as NUMERIC(18,2)) AS INVTOTAL
									,Cast(p.paymentdate as date) AS PMTDATE
									,Cast(p.cashamt as Numeric(18,2)) AS PMTCASH
									,Cast(p.otheramt as Numeric(18,2)) AS PMTOTHER
									,Cast(p.adjamt as Numeric(18,2)) AS PMTADJUSTMENT
									,Cast(p.totalpayment as Numeric(18,2)) AS TOTALPAYMENT
									,h.username AS CREATEDBY
									,case	when p.ispatient = 1 then ''Patient'' 
											When p.isinsurance = 1 then ''Insurance'' 
											else ''''
									end as Payer
									,dbo.GetBillingProvider(h.insurance_no,h.officeid) as BILLING_PROVIDER
									,py.Payername as PAYERS
							FROM	INVOICE_HDR h
									LEFT JOIN INVOICE_PMT p ON h.invoiceid = p.invoiceid 
									LEFT JOIN office o ON h.officeid = o.officeid 
									LEFT JOIN patient pa ON pa.patient_no = h.patient_no  
									LEFT JOIN appointment ap ON cast(h.EFFDATE as date) = cast(ap.appmtdate as date) and h.patient_no = ap.patient_no 
									LEFT JOIN (select distinct reasonid,name from tblreason ) ar on ar.reasonID = ap.appmtreason
									LEFT JOIN INSURANCE i ON i.insurance_no = h.insurance_no
									LEFT JOIN tbl_payer py ON py.payerid = i.payer_id
						WHERE	1=1 '

	SET @SQL_Statement = @SQL_Statement + 'AND h.INV_STATUS <> ''Voided''  '
	SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND h.INV_STATUS <> ''Voided''  '

	IF ((@PATIENTNO = 0 ) AND (@ORDER_ID = 0) AND (@INVOICE_ID = 0)) BEGIN
		IF @INVOICE_DATE_FROM <> '' AND @INVOICE_DATE_TO  <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND CAST(p.paymentdate as DATE) BETWEEN ' + '''' + CAST(@INVOICE_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@INVOICE_DATE_TO AS VARCHAR) + '''  '
			SET @SQL_StatemenTotal = @SQL_StatemenTotal +  + 'AND CAST(p.paymentdate as DATE) BETWEEN ' + '''' + CAST(@INVOICE_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@INVOICE_DATE_TO AS VARCHAR) + '''  '
		END
		IF @STATUS <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND h.INV_STATUS = ' + '''' + @STATUS + ''' '
			SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND h.INV_STATUS = ' + '''' + @STATUS + ''' '
		END
	END

	IF @PATIENTNO <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND h.patient_no = ' + CAST(@PATIENTNO AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND h.patient_no = ' + CAST(@PATIENTNO AS VARCHAR) + ' '
	END

	IF @INVOICE_ID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND h.invoiceid = ' + CAST(@INVOICE_ID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND h.invoiceid = ' + CAST(@INVOICE_ID AS VARCHAR) + ' '
	END

	IF (@ORDER_ID <> 0 AND @ORDER_TYPE <> '') BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND h.order_id = ' + CAST(@ORDER_ID AS VARCHAR) + ' AND h.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND h.order_id = ' + CAST(@ORDER_ID AS VARCHAR) + ' AND h.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
	END

	IF (@ORDER_ID = 0 AND @ORDER_TYPE <> '') BEGIN
		SET @SQL_Statement = @SQL_Statement + ' AND h.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + ' AND h.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
	END

	IF @CPTCODE <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND (Stuff((SELECT N'', '' + ITEM_CODE FROM INVOICE_ITEMS WHERE INVOICEID = h.invoiceid FOR XML PATH(''''),TYPE).value(''text()[1]'',''nvarchar(max)''),1,2,N'''')) like ' + '''%' + CAST(@CPTCODE  AS VARCHAR) + '%'''
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + + 'AND (Stuff((SELECT N'', '' + ITEM_CODE FROM INVOICE_ITEMS WHERE INVOICEID = h.invoiceid FOR XML PATH(''''),TYPE).value(''text()[1]'',''nvarchar(max)''),1,2,N'''')) like ' + '''%' + CAST(@CPTCODE  AS VARCHAR) + '%'''
	END

	IF @OFFICEID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
	END

	IF @REASONID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND ar.reasonID = ' + CAST(@REASONID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND ar.reasonID = ' + CAST(@REASONID AS VARCHAR) + ' '
	END

	IF @PAYERS <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND py.payerid = ' + CAST(@PAYERS AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND py.payerid = ' + CAST(@PAYERS AS VARCHAR) + ' '
	END

	IF @CREATEDBY <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND h.username = ' + '''' + @CREATEDBY + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND h.username = ' + '''' + @CREATEDBY + ''' '
	END

	IF @PAYER <> '' BEGIN
		IF @PAYER = 'Patient' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND p.ispatient = 1 ' 
			SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND p.ispatient = 1 ' 
		END
		IF @PAYER = 'Insurance' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND p.isinsurance = 1 ' 
			SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND p.isinsurance = 1 ' 
		END
	END

	SET @SQL_StatemenTotal = '  Declare @CASH NUMERIC(18,2);
							Declare @OTHAMT NUMERIC(18,2);
							Declare @TOTPMT NUMERIC(18,2);
							Declare @TOTADJ NUMERIC(18,2);
							Declare @INVTOTAL NUMERIC(18,2); 
							Select	DISTINCT
									@INVTOTAL = SUM(INVTOTAL),
									@CASH = SUM(PMTCASH),
									@OTHAMT = SUM(PMTOTHER),
									@TOTADJ = SUM(PMTADJUSTMENT),
									@TOTPMT = SUM(TOTALPAYMENT)
							FROM (' + @SQL_Statement + ') MAIN; '

	SET @SQL_Statement = @SQL_StatemenTotal + '; ' + @SQL_Statement + ' union all 
	Select NULL,NULL,'''','''','''',NULL,''TOTALS'',@INVTOTAL,NULL,@CASH,@OTHAMT,@TOTADJ,@TOTPMT,'''','''',NULL,NULL '

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

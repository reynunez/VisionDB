/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/15/2020
-- Description: Get Invoice List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvList]
(
	@INVOICE_DATE_FROM DATE,
	@INVOICE_DATE_TO DATE,
	@STATUS VARCHAR(50) = '',

	@PATIENTNO INT = 0,
	@ORDER_ID INT = 0,
	@INVOICE_ID INT = 0,
	@ORDER_TYPE VARCHAR(10) = '',
	@OFFICEID INT = 0,
	@CREATEDBY VARCHAR(200) = '',
	@CPTCODE VARCHAR(50) = '',
	@REASONID INT = 0,
	@DATETYPE VARCHAR(1) = 'E',
	@RENDERING VARCHAR(250) = '',
	@INSURANCE INT = 0,
	@DIAG VARCHAR(100) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(MAX) 
	DECLARE @SQL_StatemenTotal NVARCHAR(MAX)

	set @SQL_Statement = 'Select	DISTINCT
									IH.invoiceid as INVOICE_ID
									,IH.patient_no as PATIENT_NO
									,(LTRIM(RTRIM(p.first_name)) + '' '' + LTRIM(RTRIM(p.last_name ))) as PATIENT_NAME
									,cast(IH.EFFDATE as date) as INVOICE_DATE
									,CAST((IH.pcharges + IH.inscharges ) AS NUMERIC(18,2)) AS INVOICE_TOTAL
									,CAST(IH.pcharges AS NUMERIC(18,2)) AS PATIENT_AMOUNT
									,CAST(IH.inscharges AS NUMERIC(18,2)) AS INSURANCE_AMOUNT
									,o.officeid as OFFICEID
									,o.description as OFFICE
									,IH.INS_PLAN
									,IH.INS_BENEFITS
									,IH.INS_AUTH
									,ih.INV_STATUS AS STATUS
									,CAST((SELECT COALESCE(sum(cashamt),0) from INVOICE_PMT p WHERE p.invoiceid = IH.invoiceid ) AS NUMERIC(18,2)) as CASH
									,CAST((SELECT COALESCE(sum(otheramt),0) from INVOICE_PMT p WHERE p.invoiceid = IH.invoiceid ) AS NUMERIC(18,2)) as OTHER_PMT
									,CAST((SELECT COALESCE(sum(totalpayment),0) from INVOICE_PMT p WHERE p.invoiceid = IH.invoiceid ) AS NUMERIC(18,2)) as PAYMENTS
									,CAST((SELECT COALESCE(sum(adjamt),0) from INVOICE_PMT p WHERE p.invoiceid = IH.invoiceid ) AS NUMERIC(18,2)) as ADJUSTMENTS
									,CAST((
										(IH.pcharges + inscharges ) -
										((SELECT COALESCE(sum(totalpayment),0) from INVOICE_PMT p WHERE p.invoiceid = IH.invoiceid ) +
										 (SELECT COALESCE(sum(adjamt),0) from INVOICE_PMT p WHERE p.invoiceid = IH.invoiceid )
										)
									) AS NUMERIC(18,2)) AS INVOICE_BALANCE
									,IH.username as CREATED_BY
									,dbo.GetBillingProvider(IH.insurance_no,IH.officeid) as BILLING_PROVIDER
							from	INVOICE_HDR IH
									LEFT JOIN (select distinct invoiceid,rendprov from INVOICE_ITEMS) i ON IH.invoiceid = i.invoiceid
									LEFT JOIN (SELECT	INVOICEID,DIAG=STUFF (( SELECT DISTINCT '''', '''' + DIAGNOSIS FROM INVOICE_ITEMS t2 WHERE t2.INVOICEID = t1.INVOICEID FOR XML PATH('''')),1,1,'''') FROM INVOICE_ITEMS t1 GROUP BY INVOICEID) d ON IH.invoiceid = d.invoiceid
									LEFT JOIN office o ON IH.officeid = o.officeid 
									LEFT JOIN patient p ON p.patient_no = IH.patient_no   
									LEFT JOIN appointment ap ON cast(IH.EFFDATE as date) = cast(ap.appmtdate as date) and IH.patient_no = ap.patient_no 
									LEFT JOIN (select distinct reasonid,name from tblreason ) ar on ar.reasonID = ap.appmtreason
						WHERE	1=1 '

	IF ((@PATIENTNO = 0 ) AND (@ORDER_ID = 0) AND (@INVOICE_ID = 0)) BEGIN
		IF @INVOICE_DATE_FROM <> '' AND @INVOICE_DATE_TO  <> '' BEGIN
			IF @DATETYPE = 'I' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND CAST(IH.INVDATE as DATE) BETWEEN ' + '''' + CAST(@INVOICE_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@INVOICE_DATE_TO AS VARCHAR) + '''  '
			SET @SQL_StatemenTotal = @SQL_StatemenTotal +  + 'AND CAST(IH.INVDATE as DATE) BETWEEN ' + '''' + CAST(@INVOICE_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@INVOICE_DATE_TO AS VARCHAR) + '''  '
		END ELSE BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND CAST(IH.EFFDATE as DATE) BETWEEN ' + '''' + CAST(@INVOICE_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@INVOICE_DATE_TO AS VARCHAR) + '''  '
			SET @SQL_StatemenTotal = @SQL_StatemenTotal +  + 'AND CAST(IH.EFFDATE as DATE) BETWEEN ' + '''' + CAST(@INVOICE_DATE_FROM AS VARCHAR) + ''' AND ' + '''' + CAST(@INVOICE_DATE_TO AS VARCHAR) + '''  '
		END
		END
		IF @STATUS <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND IH.INV_STATUS = ' + '''' + @STATUS + ''' '
			SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND IH.INV_STATUS = ' + '''' + @STATUS + ''' '
		END
	END

	IF @PATIENTNO <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND IH.patient_no = ' + CAST(@PATIENTNO AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND IH.patient_no = ' + CAST(@PATIENTNO AS VARCHAR) + ' '
	END

	IF @INSURANCE <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND IH.INSURANCE_NO = ' + CAST(@INSURANCE AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND IH.INSURANCE_NO = ' + CAST(@INSURANCE AS VARCHAR) + ' '
	END

	IF @RENDERING <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND i.RENDPROV = ' + '''' + @RENDERING + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND i.RENDPROV = ' + '''' + @RENDERING + ''' '
	END

	IF @INVOICE_ID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND IH.invoiceid = ' + CAST(@INVOICE_ID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND IH.invoiceid = ' + CAST(@INVOICE_ID AS VARCHAR) + ' '
	END

	IF (@ORDER_ID <> 0 AND @ORDER_TYPE <> '') BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND IH.order_id = ' + CAST(@ORDER_ID AS VARCHAR) + ' AND IH.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND IH.order_id = ' + CAST(@ORDER_ID AS VARCHAR) + ' AND IH.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
	END

	IF (@ORDER_ID = 0 AND @ORDER_TYPE <> '') BEGIN
		SET @SQL_Statement = @SQL_Statement + ' AND IH.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + ' AND IH.ORDER_TYPE = ' + '''' + @ORDER_TYPE + ''' '
	END

	IF @CREATEDBY <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND IH.username = ' + '''' + @CREATEDBY + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND IH.username = ' + '''' + @CREATEDBY + ''' '
	END

	IF @CPTCODE <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND (Stuff((SELECT N'', '' + ITEM_CODE FROM INVOICE_ITEMS WHERE INVOICEID = IH.invoiceid FOR XML PATH(''''),TYPE).value(''text()[1]'',''nvarchar(max)''),1,2,N'''')) like ' + '''%' + CAST(@CPTCODE  AS VARCHAR) + '%'''
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + + 'AND (Stuff((SELECT N'', '' + ITEM_CODE FROM INVOICE_ITEMS WHERE INVOICEID = IH.invoiceid FOR XML PATH(''''),TYPE).value(''text()[1]'',''nvarchar(max)''),1,2,N'''')) like ' + '''%' + CAST(@CPTCODE  AS VARCHAR) + '%'''
	END

	IF @OFFICEID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND o.officeid = ' + CAST(@OFFICEID AS VARCHAR) + ' '
	END

	IF @DIAG <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND d.DIAG LIKE ' + '''' + '%' + @DIAG + '%' + ''' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND d.DIAG LIKE ' + '''' + '%' + @DIAG + '%' + ''' '
	END

	IF @REASONID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND ar.reasonID = ' + CAST(@REASONID AS VARCHAR) + ' '
		SET @SQL_StatemenTotal = @SQL_StatemenTotal + 'AND ar.reasonID = ' + CAST(@REASONID AS VARCHAR) + ' '
	END

	SET @SQL_StatemenTotal = 'Declare @INVCOUNT INT=0;
								Declare @INVTOTAL NUMERIC(18,2)=0;
								Declare @PATAMT NUMERIC(18,2)=0;
								Declare @INSAMT NUMERIC(18,2)=0;
								Declare @CASH NUMERIC(18,2)=0;
								Declare @OTHAMT NUMERIC(18,2)=0;
								Declare @TOTPMT NUMERIC(18,2)=0;
								Declare @TOTADJ NUMERIC(18,2)=0;
								Declare @BALANCE NUMERIC(18,2)=0; 
		SELECT	@INVCOUNT = COUNT(*)
		,@INVTOTAL = SUM(INVOICE_TOTAL)
		,@PATAMT = SUM(PATIENT_AMOUNT)
		,@INSAMT = SUM(INSURANCE_AMOUNT)
		,@CASH = SUM(CASH)
		,@OTHAMT = SUM(OTHER_PMT)
		,@TOTPMT = SUM(PAYMENTS)
		,@TOTADJ = SUM(ADJUSTMENTS)
		,@BALANCE = SUM(INVOICE_BALANCE)
	FROM (' + @SQL_Statement + ') MAIN; '

	SET @SQL_Statement = @SQL_StatemenTotal + '; ' + @SQL_Statement + ' union all 
	Select NULL,NULL,''TOTALS'',NULL,@INVTOTAL,@PATAMT,@INSAMT,NULL,'''','''','''','''','''',@CASH,@OTHAMT,@TOTPMT,@TOTADJ,@BALANCE,'''',NULL '

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

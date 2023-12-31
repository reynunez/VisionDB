/****** Object:  StoredProcedure [dbo].[sp_NET_GetEDIInvoicesHDR]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/20/2022
-- Description:	Get EDI Invoices List Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEDIInvoicesHDR](
	@DATEFROM DATE
	,@DATETO DATE
	,@OFFICEID INT = 0
	,@BILLINGPROV INT = 0
	,@INSURANCE_NO INT = 0
	,@PAYER_NAME VARCHAR(120) = ''
	,@INSBALANCE INT = 0
	,@SKIPEDI INT = 0
	,@CPTCODE VARCHAR(20) = ''
	,@ORDTYPE VARCHAR(10) = ''
)
AS

BEGIN

	SET NOCOUNT ON;
	DECLARE @SQL_Statement NVARCHAR(2000) 

	SET @SQL_Statement = 'SELECT  DISTINCT
							H.invoiceid AS INVOICEID
							,H.patient_no AS PATIENT_NO
							,LTRIM(RTRIM(P.FIRST_NAME)) + '' '' + LTRIM(RTRIM(P.LAST_NAME)) AS PATIENT_NAME
							,H.order_id AS ORDER_ID
							,H.INVDATE AS INVDATE
							,h.EFFDATE AS EFFDATE
							,H.officeid AS OFFICEID
							,(SELECT DOCTORID FROM DOCTORS WHERE DESCRIPTION = (SELECT TOP 1 [RENDPROV] FROM [dbo].[INVOICE_ITEMS] WHERE INVOICEID = H.invoiceid AND [RENDPROV]<>'''' )) AS RENDPROVID
							,(SELECT ID FROM tbl_billing_provider WHERE NAME = (SELECT TOP 1 BILLPROVIDER FROM [dbo].[INVOICE_ITEMS] WHERE INVOICEID = H.invoiceid AND BILLPROVIDER <> '''' )) AS BILLPROVIDER
							,H.INV_STATUS AS INV_STATUS
							,H.ORDER_TYPE
							,H.INSURANCE_NO
							,I.INSURANCE_NAME
							,O.description AS OFFICENAME
							,O.ADDRESS1
							,O.ADDRESS2
							,O.CITY
							,O.STATE
							,O.ZIP
							,H.pcharges as PATCHARGES
							,H.inscharges AS INSCHARGES
							,H.isedi
					FROM    INVOICE_HDR H 
							JOIN INVOICE_ITEMS D ON H.invoiceid = D.invoiceid
							LEFT JOIN OFFICE O ON H.OFFICEID = O.OFFICEID
							JOIN PATIENT P ON H.PATIENT_NO = P.PATIENT_NO
							LEFT JOIN INSURANCE I ON H.INSURANCE_NO = I.INSURANCE_NO
					WHERE   1=1 
							AND H.INV_STATUS = ''Open'' '

	---(SELECT ID FROM tbl_billing_provider WHERE NAME = (SELECT DISTINCT BILLPROVIDER FROM [dbo].[INVOICE_ITEMS] WHERE INVOICEID = H.invoiceid AND BILLPROVIDER <> '' )) AS BILLPROVIDER

	IF @CPTCODE  <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND LTRIM(RTRIM(D.ITEM_CODE)) = ' + '''' + @CPTCODE + '''' + ' '
	END
	
	IF @SKIPEDI = 1 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND H.isedi = 0 ' + ' '
	END

	IF @INSBALANCE = 1 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND H.inscharges > 0 ' + ' '
	END


	IF @DATEFROM <> '' AND @DATETO  <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND CAST(H.EFFDATE as DATE) BETWEEN ' + '''' + CAST(@DATEFROM AS VARCHAR) + ''' AND ' + '''' + CAST(@DATETO AS VARCHAR) + '''  '
	END

	IF @OFFICEID <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND O.OFFICEID = ' + CAST(@OFFICEID AS VARCHAR) + ' '
	END

	IF @BILLINGPROV <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND (SELECT ID FROM tbl_billing_provider WHERE NAME = (SELECT TOP 1 BILLPROVIDER FROM [dbo].[INVOICE_ITEMS] WHERE INVOICEID = H.invoiceid AND BILLPROVIDER <> '''' ))  = ' + CAST(@BILLINGPROV AS VARCHAR) + ' '
	END

	IF @INSURANCE_NO <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND H.INSURANCE_NO = ' + CAST(@INSURANCE_NO AS VARCHAR) + ' '
	END

	IF @PAYER_NAME  <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND H.INSURANCE_NO IN(select INSURANCE_NO from insurance where payer_name = ''' + LTRIM(RTRIM(@PAYER_NAME)) + ''') '
	END

	IF @ORDTYPE  <> '' BEGIN
		
		IF (@ORDTYPE = 'CL' OR @ORDTYPE = 'OPH')  SET @SQL_Statement = @SQL_Statement + 'AND H.ORDER_TYPE = ' + '''' + @ORDTYPE + '''' + ' '

		IF @ORDTYPE = 'BOTH' SET @SQL_Statement = @SQL_Statement + 'AND H.ORDER_TYPE <> ' + '''' + ''''  + ' '

		IF @ORDTYPE = 'NONE' SET @SQL_Statement = @SQL_Statement + 'AND H.ORDER_TYPE = ' + ''''  + ''''  + ' '
	

	END

	SET @SQL_Statement = @SQL_Statement + 'ORDER BY H.EFFDATE , H.INVOICEID DESC'

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

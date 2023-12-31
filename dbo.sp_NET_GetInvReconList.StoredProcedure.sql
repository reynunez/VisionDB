/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvReconList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/10/2021
-- Description: Get Incoices Reconciliation List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvReconList](
	@INVDATE DATE,
	@officeid INT
)
AS
BEGIN

	SELECT	invoiceid AS INVOICEID
			,LTRIM(RTRIM(P.FIRST_NAME)) + ' ' + LTRIM(RTRIM(P.LAST_NAME)) AS PATIENT
			,O.busname AS OFFICE
			,order_id AS ORDERID
			,cast(pcharges as numeric(18,2))  AS PATIENT_CHARGES
			,cast(inscharges as numeric(18,2)) AS INS_CHARGES
			,I.username AS CREATEDBY
			,I.INV_STATUS as STATUS
	FROM	INVOICE_HDR I
			LEFT JOIN patient P ON P.patient_no = I.patient_no 
			LEFT JOIN office O ON O.officeid = I.officeid 
	WHERE	CAST(I.effdate AS DATE) = @INVDATE 
			AND I.officeid = @officeid 
			AND I.INV_STATUS <> 'Voided'

END
GO

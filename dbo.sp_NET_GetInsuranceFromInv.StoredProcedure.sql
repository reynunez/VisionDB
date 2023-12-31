/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsuranceFromInv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/21/2022
-- Description:	Get Insurances in use by Invoices
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsuranceFromInv]
AS

	SET NOCOUNT ON;

	SELECT	INSURANCE_NO
			,INSURANCE_NAME
	FROM	INSURANCE
	WHERE	INSURANCE_NO IN( SELECT DISTINCT INSURANCE_NO FROM INVOICE_HDR WHERE INSURANCE_NO > 0)
			AND INSURANCE_NAME NOT LIKE '%ZZZ%'
	ORDER	BY INSURANCE_NAME
	;
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvDiagnosis]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/20/2022
-- Description:	Get EDI Invoices Diagnosis
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvDiagnosis](
	@INVOICEID INT
)
AS
BEGIN

	DECLARE @DIAGNOSIS_LIST VARCHAR(MAX) = ''
	DECLARE @DIAGNOSIS VARCHAR(100)

	DECLARE db_diagnosis CURSOR FOR
	SELECT DIAGNOSIS FROM INVOICE_ITEMS WHERE INVOICEID = @INVOICEID 

	OPEN db_diagnosis
	FETCH NEXT FROM db_diagnosis INTO @DIAGNOSIS
	SET @DIAGNOSIS_LIST = @DIAGNOSIS_LIST + @DIAGNOSIS

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @DIAGNOSIS_LIST = '' BEGIN
				SET @DIAGNOSIS_LIST = @DIAGNOSIS_LIST +  @DIAGNOSIS
			END
			ELSE BEGIN
				SET @DIAGNOSIS_LIST = @DIAGNOSIS_LIST + '|' + @DIAGNOSIS
			END

			FETCH NEXT FROM db_diagnosis INTO @DIAGNOSIS
		END

	CLOSE db_diagnosis
	DEALLOCATE db_diagnosis

	Select @DIAGNOSIS_LIST AS DIAGNOSIS_LIST
END
GO

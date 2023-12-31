/****** Object:  UserDefinedFunction [dbo].[udf_GetUnpaidBal]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 08/11/2010
-- Description:	Get unpaid balance from patient
-- =============================================
CREATE FUNCTION [dbo].[udf_GetUnpaidBal] 
(
	@patient_no int
)
RETURNS money
AS
BEGIN
	declare @rBalance money
	SELECT @rBalance = sum(balance) FROM viewInvoiceBalance where patient_no = @patient_no
	RETURN @rBalance

END
GO

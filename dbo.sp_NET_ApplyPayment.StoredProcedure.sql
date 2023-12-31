/****** Object:  StoredProcedure [dbo].[sp_NET_ApplyPayment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/01/2021
-- Description: Add Payment
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_ApplyPayment](
				@invoiceid		INT,
				@cashamt		MONEY,
				@otheramt		MONEY,
				@adjamt			MONEY,
				@totalpayment	MONEY,
				@isinsurance	BIT = 0,
				@ispatient		BIT = 0
)
AS

BEGIN

		Insert	into INVOICE_PMT(
				invoiceid,
				paymentdate,
				cashamt,
				otheramt,
				adjamt,
				totalpayment,
				isinsurance,
				ispatient
		)
		Values(
				@invoiceid,
				DATEADD(hh,-5,getdate()),
				@cashamt,
				@otheramt,
				@adjamt,
				@totalpayment,
				@isinsurance,
				@ispatient
		)

END
GO

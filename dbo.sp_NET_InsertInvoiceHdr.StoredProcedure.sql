/****** Object:  StoredProcedure [dbo].[sp_NET_InsertInvoiceHdr]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/19/2020
-- Description:	Create Invoice Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertInvoiceHdr]
(
    @patient_no int ,
	@order_id int ,
	@cashamt money ,
	@salestax money ,
	@pcharges money ,
	@inscharges money ,
	@adjustments money ,
	@comments text ,
	@officeid int ,
	@INV_STATUS varchar(25) ,
	@INS_PLAN varchar(100) ,
	@INS_BENEFITS varchar(100) ,
	@INS_AUTH varchar(100) ,
	@isEDI int = 0,
	@ORDER_TYPE VARCHAR(10),
	@USERNAME VARCHAR(100)='',
	@INSURANCE_NO INT = 0,
	@EFFDATE DATE =''
)
AS
BEGIN
		DECLARE @invdate DATETIME
		SET @invdate = DATEADD(hh,-5,getdate());

		IF @EFFDATE = '' BEGIN
			SET @EFFDATE = DATEADD(hh,-5,getdate());
		END

		INSERT INTO INVOICE_HDR(
						patient_no,
						order_id,
						invdate,
						cashamt,
						salestax,
						pcharges,
						inscharges,
						adjustments,
						comments,
						officeid,
						INV_STATUS,
						INS_PLAN,
						INS_BENEFITS,
						INS_AUTH,
						isEDI,
						ORDER_TYPE,
						USERNAME,
						INSURANCE_NO,
						EFFDATE 
						)
			Values(
					@patient_no,
					@order_id,
					@invdate,
					@cashamt,
					@salestax,
					@pcharges,
					@inscharges,
					@adjustments,
					@comments,
					@officeid,
					@INV_STATUS,
					@INS_PLAN,
					@INS_BENEFITS,
					@INS_AUTH,
					@isEDI,
					@ORDER_TYPE,
					@USERNAME,
					@INSURANCE_NO,
					@EFFDATE 
			);

			Select TOP 1 invoiceid from INVOICE_HDR order by invoiceid desc;
END
GO

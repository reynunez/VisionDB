/****** Object:  StoredProcedure [dbo].[sp_NET_InsertClOrderItems]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/29/2020
-- Description:	Create CL Order Items
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertClOrderItems]
(
	@ORDER_ID			INTEGER,
	@ITEM_CLASS			VARCHAR(50),
	@ITEM_CODE			VARCHAR(50),
	@ITEM_MODIFIER		VARCHAR(50),
	@ITEM_MODIFIER2		VARCHAR(50),
	@ITEM_DESCRIPTION	VARCHAR(100),
	@ITEM_UNITS			INTEGER,
	@ITEM_FEE			NUMERIC(18,2),
	@ITEM_PATIENT_P		INTEGER,
	@ITEM_PATIENT_D		NUMERIC(18,2),
	@ITEM_INSURANCE_D	NUMERIC(18,2),
	@ITEM_TOTAL			NUMERIC(18,2),
	@DIAGNOSIS			VARCHAR(100) = '',
	@RENDPROV			VARCHAR(100) = '',
	@RENDFACILITY		VARCHAR(100) = '',
	@PAYER				VARCHAR(100) = '',
	@REFERRING			VARCHAR(100) = '',
	@BILLPROVIDER		VARCHAR(100) = '',
	@ITEM_ID			VARCHAR(25) = NULL,
	@ITEM_DESC			VARCHAR(100) = NULL,
	@ITEM_SER_ID		VARCHAR(10) = NULL,
	@ITEM_SER_NAME		VARCHAR(100) = NULL,
	@VU_ITEM_ID			INT = 0
)
AS

BEGIN

	INSERT INTO CL_ORDER_ITEMS (
								ORDER_ID,
								ITEM_CLASS,
								ITEM_CODE,
								ITEM_MODIFIER,
								ITEM_MODIFIER2,
								ITEM_DESCRIPTION,
								ITEM_UNITS,
								ITEM_FEE,
								ITEM_PATIENT_P,
								ITEM_PATIENT_D,
								ITEM_INSURANCE_D,
								ITEM_TOTAL,
								DIAGNOSIS,
								RENDPROV,
								RENDFACILITY,
								PAYER,
								REFERRING,
								BILLPROVIDER,
								ITEM_ID,
								ITEM_DESC,
								ITEM_SER_ID,
								ITEM_SER_NAME,
								VU_ITEM_ID
							)
	VALUES(
			@ORDER_ID,	
			@ITEM_CLASS,			
			@ITEM_CODE,			
			@ITEM_MODIFIER,		
			@ITEM_MODIFIER2,		
			@ITEM_DESCRIPTION,	
			@ITEM_UNITS,			
			@ITEM_FEE,			
			@ITEM_PATIENT_P,		
			@ITEM_PATIENT_D,		
			@ITEM_INSURANCE_D,	
			@ITEM_TOTAL,			
			@DIAGNOSIS,			
			@RENDPROV,			
			@RENDFACILITY,		
			@PAYER,				
			@REFERRING,			
			@BILLPROVIDER,
			@ITEM_ID,
			@ITEM_DESC,
			@ITEM_SER_ID,
			@ITEM_SER_NAME,
			@VU_ITEM_ID
	)
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_InsertOphOrderItems]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/12/2020
-- Description:	Create Ophthalmic Order Items
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertOphOrderItems]
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
	@BILLPROVIDER		VARCHAR(100) = ''
)
AS

BEGIN

	INSERT INTO OPH_ORDER_ITEMS (
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
								BILLPROVIDER
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
			@BILLPROVIDER		
	)
END
GO

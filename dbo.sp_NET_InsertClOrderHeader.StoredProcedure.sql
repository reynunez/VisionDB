/****** Object:  StoredProcedure [dbo].[sp_NET_InsertClOrderHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/29/2020
-- Description:	Create CL Order Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertClOrderHeader]
(
	@OFFICEID				INTEGER,
	@PATIENT_NO				INTEGER,

	@PRESC_STATUS_OD		varchar(25)	NULL,
	@PRESC_SPH_OD			numeric(18, 2) NULL,
	@PRESC_CYL_OD			numeric(18, 2) NULL,
	@PRESC_AXIS_OD			numeric(18, 2) NULL,
	@PRESC_ADD_OD			numeric(18, 2) NULL,
	@PRESC_BC_OD			numeric(18, 2) NULL,

	@PRESC_STATUS_OS		varchar(25) NULL,
	@PRESC_SPH_OS			numeric(18, 2) NULL,
	@PRESC_CYL_OS			numeric(18, 2) NULL,
	@PRESC_AXIS_OS			numeric(18, 2) NULL,
	@PRESC_ADD_OS			numeric(18, 2) NULL,
	@PRESC_BC_OS			numeric(18, 2) NULL,

	@ORDER_COMMENT			VARCHAR(MAX) = '',
	@ORDER_RESP				VARCHAR(50),
	@ORDER_TRAY				VARCHAR(50),
	@ORDER_INS_PLAN			VARCHAR(100),
	@ORDER_INS_BENEFITS		VARCHAR(100) = '',
	@ORDER_INS_AUTH			VARCHAR(100) = '',
	@ORDER_PATIENT			VARCHAR(100),
	@ORDER_INSURANCE		VARCHAR(100),
	@ORDER_TOTAL			VARCHAR(100),
	@FLOWSTATUS				VARCHAR(50),
	@USERNAME				VARCHAR(100) = '',
	@PRESCID				INT = 0,
	@SHIPTOPATIENT			BIT = 0
)
AS
BEGIN

		INSERT INTO CL_ORDER_HDR(
							OFFICEID,
							PATIENT_NO,

							PRESC_STATUS_OD ,
							PRESC_SPH_OD ,
							PRESC_CYL_OD ,
							PRESC_AXIS_OD ,
							PRESC_ADD_OD ,
							PRESC_BC_OD ,

							PRESC_STATUS_OS ,
							PRESC_SPH_OS ,
							PRESC_CYL_OS ,
							PRESC_AXIS_OS ,
							PRESC_ADD_OS ,
							PRESC_BC_OS ,	

							ORDER_COMMENT,
							ORDER_RESP,
							ORDER_TRAY,
							ORDER_INS_PLAN,
							ORDER_INS_BENEFITS,
							ORDER_INS_AUTH,
							ORDER_DATE,
							ORDER_PATIENT,
							ORDER_INSURANCE,
							ORDER_TOTAL,
							FLOWSTATUS,
							USERNAME,
							PRESCID,
							SHIPTOPATIENT
							)
			Values(
					@OFFICEID,
					@PATIENT_NO,

					@PRESC_STATUS_OD ,
					@PRESC_SPH_OD ,
					@PRESC_CYL_OD ,
					@PRESC_AXIS_OD ,
					@PRESC_ADD_OD ,
					@PRESC_BC_OD ,

					@PRESC_STATUS_OS ,
					@PRESC_SPH_OS ,
					@PRESC_CYL_OS ,
					@PRESC_AXIS_OS ,
					@PRESC_ADD_OS ,
					@PRESC_BC_OS ,	

					@ORDER_COMMENT,		
					@ORDER_RESP,			
					@ORDER_TRAY,			
					@ORDER_INS_PLAN,		
					@ORDER_INS_BENEFITS,	
					@ORDER_INS_AUTH,	
					DATEADD(hh,-5,getdate()),
					@ORDER_PATIENT,
					@ORDER_INSURANCE,
					@ORDER_TOTAL,
					@FLOWSTATUS,
					@USERNAME,
					@PRESCID,
					@SHIPTOPATIENT
			);

			Select TOP 1 ORDER_ID from CL_ORDER_HDR order by ORDER_ID desc;
END
GO

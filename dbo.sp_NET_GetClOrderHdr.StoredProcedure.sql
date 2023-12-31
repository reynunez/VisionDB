/****** Object:  StoredProcedure [dbo].[sp_NET_GetClOrderHdr]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/03/2021
-- Description: Get CL Order Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetClOrderHdr](
	@ORDER_ID as integer
)
AS

BEGIN

	SELECT	PATIENT_NO
			,OFFICEID
			,PRESC_STATUS_OD
			,PRESC_SPH_OD
			,PRESC_CYL_OD
			,PRESC_AXIS_OD
			,PRESC_ADD_OD
			,PRESC_BC_OD
			,PRESC_STATUS_OS
			,PRESC_SPH_OS
			,PRESC_CYL_OS
			,PRESC_AXIS_OS
			,PRESC_ADD_OS
			,PRESC_BC_OS
			,'PRESCRIPTION:' +  cast([PRESCID] as varchar(25)) + CHAR(13)+CHAR(10) + [ORDER_COMMENT] AS ORDER_COMMENT
			,ORDER_TRAY
			,ORDER_DATE
			,ORDER_PATIENT
			,ORDER_INSURANCE
			,ORDER_TOTAL
			,FLOWSTATUS
			,ORDER_INS_PLAN
			,ORDER_INS_BENEFITS
			,ORDER_INS_AUTH
			,ORDER_INSURANCE
			,username
	  FROM	dbo.CL_ORDER_HDR
	  WHERE	ORDER_ID = @ORDER_ID

  END
GO

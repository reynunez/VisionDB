/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphOrderHdr]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/16/2020
-- Description:	Get Ophthalmic Order Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphOrderHdr]
(
	@ORDER_ID INT
)
AS

BEGIN
		SELECT		H.[ORDER_ID] ,
					H.[PATIENT_NO] ,
					H.[OFFICEID] ,
					H.[PRESC_PD_OD],
					H.[PRESC_SPH_OD],
					H.[PRESC_CYL_OD],
					H.[PRESC_AXIS_OD] ,
					H.[PRESC_DELTAH_OD],
					H.[PRESC_DELTAV_OD],
					H.[PRESC_ADD_OD],
					H.[PRESC_PD_OS],
					H.[PRESC_SPH_OS],
					H.[PRESC_CYL_OS],
					H.[PRESC_AXIS_OS] ,
					H.[PRESC_DELTAH_OS],
					H.[PRESC_DELTAV_OS],
					H.[PRESC_ADD_OS],
					H.[PRESC_USAGE] ,
					H.[FRAME_HEIGHT_OD],
					H.[FRAME_HEIGHT_OS],
					H.[FRAME_COLLECTION] ,
					H.[FRAME_STYLE] ,
					H.[FRAME_COLOR] ,
					H.[FRAME_A],
					H.[FRAME_DBL],
					H.[FRAME_B],
					H.[FRAME_ED],
					H.[FRAME_RIMTYPE] ,
					H.[FRAME_PRICE],
					H.[ORDER_STATUS] ,
					H.[ORDER_DESIGN] ,
					H.[ORDER_MATERIAL] ,
					H.[ORDER_LENS_ADD] ,
					('PRESCRIPTION:' +  cast(H.[PRESCID] as varchar(25))+ CHAR(13)+CHAR(10) + H.[ORDER_COMMENT]) + 
									 + CHAR(13)+CHAR(10) +'PRESC COMMENTS:'+ D.[comments]  AS ORDER_COMMENT,
					H.[ORDER_RESP] ,
					H.[ORDER_TRAY] ,
					H.[ORDER_INS_PLAN] ,
					H.[ORDER_INS_BENEFITS] ,
					H.[ORDER_INS_AUTH] ,
					H.[ORDER_DATE] ,
					H.[ORDER_PATIENT],
					H.[ORDER_INSURANCE],
					H.[ORDER_TOTAL],
					H.[FLOWSTATUS] ,
					H.[username] ,
					H.[PRESCID] ,
					H.[frameid],
					CASE WHEN len(f.trace)>0 THEN 1 ELSE 0 END as IsTrace,
					f.trace 
		FROM	OPH_ORDER_HDR H
				LEFT JOIN prescoph D ON H.PRESCID = D.prescid
				LEFT JOIN tblVUFrames f ON H.frameid = f.frameid 
		WHERE	ORDER_ID = @ORDER_ID 
END
GO

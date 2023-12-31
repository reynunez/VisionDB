/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateOrderFlowStatus]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/08/2021
-- Description:Update Orders Flow Setatus
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateOrderFlowStatus]
(
	@ORDERTYPE VARCHAR(10) ,
	@FLOWSTATUS VARCHAR(25),
	@ORDER_ID INT,
	@STATUS_CHANGE_LOCATION VARCHAR(100) = ''
)
AS

BEGIN

	IF @ORDERTYPE = 'OPH' BEGIN
		UPDATE	OPH_ORDER_HDR 
		SET		FLOWSTATUS = @FLOWSTATUS ,
				STATUS_CHANGE_DATE = DATEADD(hh,-5,getdate()),
				STATUS_CHANGE_LOCATION = @STATUS_CHANGE_LOCATION
		WHERE	ORDER_ID = @ORDER_ID 
	END
	ELSE BEGIN
		UPDATE	CL_ORDER_HDR 
		SET		FLOWSTATUS = @FLOWSTATUS ,
				STATUS_CHANGE_DATE = DATEADD(hh,-5,getdate()),
				STATUS_CHANGE_LOCATION = @STATUS_CHANGE_LOCATION
		WHERE	ORDER_ID = @ORDER_ID 
	END

END
GO

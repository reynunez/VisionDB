/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphOrderXtra]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/16/2020
-- Description:	Get Ophthalmic Order Xtra
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphOrderXtra]
(
	@ORDER_ID INT
)
AS

BEGIN
		SELECT	XTRA_DESCRIPTION
		FROM	OPH_ORDER_XTRA 
		WHERE	ORDER_ID = @ORDER_ID 
END
GO

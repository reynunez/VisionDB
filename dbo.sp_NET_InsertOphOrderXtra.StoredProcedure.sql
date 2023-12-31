/****** Object:  StoredProcedure [dbo].[sp_NET_InsertOphOrderXtra]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/12/2020
-- Description:	Create Ophthalmic Order Xtra
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertOphOrderXtra]
(
	@ORDER_ID			INTEGER,
	@XTRA_DESCRIPTION	VARCHAR(100)
)
AS

BEGIN

	INSERT INTO OPH_ORDER_XTRA(
								ORDER_ID,
								XTRA_DESCRIPTION
							)
	VALUES(
			@ORDER_ID,
			@XTRA_DESCRIPTION
	)
END
GO

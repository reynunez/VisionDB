/****** Object:  StoredProcedure [dbo].[sp_NET_InsertOphOrderTreat]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/12/2020
-- Description:	Create Ophthalmic Order Treatment
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertOphOrderTreat]
(
	@ORDER_ID			INTEGER,
	@TREAT_DESCRIPTION	VARCHAR(100)
)
AS

BEGIN

	INSERT INTO OPH_ORDER_TREAT(
								ORDER_ID,
								TREAT_DESCRIPTION
							)
	VALUES(
			@ORDER_ID,
			@TREAT_DESCRIPTION
	)
END
GO

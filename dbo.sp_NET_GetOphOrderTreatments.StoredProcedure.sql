/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphOrderTreatments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/28/2021
-- Description:	Get Oph Order Treat
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphOrderTreatments]
AS
	SET NOCOUNT ON;

	SELECT	DISTINCT
			TREAT_DESCRIPTION
	FROM	OPH_ORDER_TREAT;
GO

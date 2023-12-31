/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphOrderMaterial]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/28/2021
-- Description:	Get Oph Order Material
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphOrderMaterial]
AS
	SET NOCOUNT ON;

	SELECT	DISTINCT
			ORDER_MATERIAL
	FROM	[dbo].[OPH_ORDER_HDR]
	WHERE	ORDER_MATERIAL <> '';
GO

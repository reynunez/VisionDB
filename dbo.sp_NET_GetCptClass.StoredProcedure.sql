/****** Object:  StoredProcedure [dbo].[sp_NET_GetCptClass]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      REynaldo Nunez
-- Create Date: 11/26/2020
-- Description: Getg CPT Class Pulldown
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCptClass]
(
	@CLASS VARCHAR(50)
)
AS
BEGIN

    SET NOCOUNT ON

	SELECT	ID
			,DESCRIPTION
	FROM	tblcpt
	WHERE	UPPER(CLASS) = @CLASS;

END
GO

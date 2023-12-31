/****** Object:  StoredProcedure [dbo].[sp_NET_GetEDIIScripts]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/28/2022
-- Description:	Get EDI SCRIPTS
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEDIIScripts](
	@DATEFROM DATE
	,@DATETO DATE
)
AS

BEGIN

	SET NOCOUNT ON;

	SELECT  ID
			,SCRIPTDATE
			,DESCRIPTION
			,SAVEDSCRIPT
	FROM    tbl_editransactions
	WHERE	CAST(SCRIPTDATE as DATE) BETWEEN CAST(@DATEFROM AS DATE) AND CAST(@DATETO AS DATE)
END
GO

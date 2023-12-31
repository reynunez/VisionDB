/****** Object:  StoredProcedure [dbo].[sp_NET_GetEdiSequence]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 03/05/2022
-- Get EDI Sequence
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEdiSequence]
AS
BEGIN

    SET NOCOUNT ON;

	UPDATE tblEDISequence
	SET EDISEQUENCE = (EDISEQUENCE + 1)
	;

	SELECT EDISEQUENCE FROM tblEDISequence;


END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetVAList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/07/2020
-- Description: Retrieve Visual Exam Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetVAList]
AS
BEGIN

    SET NOCOUNT ON

    Select	*
	From	tblVisAnalysis
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetThCategory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/15/2020
-- Description: Get Therapeutics Category
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetThCategory]
AS
BEGIN

    SET NOCOUNT ON

	Select distinct category from druglist

END
GO

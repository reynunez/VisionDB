/****** Object:  StoredProcedure [dbo].[sp_NET_GetReasons]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get Event Reasons
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetReasons]
AS
BEGIN

    SET NOCOUNT ON;

    select reasonid,name from tblreason

END
GO

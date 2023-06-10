/****** Object:  StoredProcedure [dbo].[sp_NET_GetReasonsecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get Event Reason Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetReasonsecord](
	@reasonid int
)
AS
BEGIN

    SET NOCOUNT ON;

    select * from tblreason where reasonid = @reasonid

END
GO

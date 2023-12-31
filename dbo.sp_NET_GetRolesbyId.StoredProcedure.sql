/****** Object:  StoredProcedure [dbo].[sp_NET_GetRolesbyId]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description:Get Security Roles
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetRolesbyId]
(
	@ROLEID int
)
AS
BEGIN

    SET NOCOUNT ON

    SELECT * from VUMSRoles WHERE roleid = @ROLEID
END
GO

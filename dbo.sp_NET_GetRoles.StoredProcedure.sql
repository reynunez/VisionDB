/****** Object:  StoredProcedure [dbo].[sp_NET_GetRoles]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description:Get Security Roles
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetRoles]
AS
BEGIN

    SET NOCOUNT ON

    SELECT roleid,rolename from VUMSRoles
END
GO

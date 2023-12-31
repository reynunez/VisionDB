/****** Object:  StoredProcedure [dbo].[sp_NET_GetUser]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description:Get Security Users
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetUser](
	@UID integer
)
AS
BEGIN

    SET NOCOUNT ON;

    Select	k.* 
			,r.rolename
	from	VUMKeys k JOIN
			VUMSRoles r ON k.belongtoid = r.roleid
	where	K.uid = @UID

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetHashs]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/26/2020
-- Description: Program Security Keys
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetHashs]
(
	@key1 varchar(100),
	@key2 varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON
    SELECT	uid
			,k3hash
			,belongtoid
			,act
			,ad
			,istmp
	from	VUMKeys
	where	k1hash = @key1 and k2hash = @key2

END
GO

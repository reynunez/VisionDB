/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateUser]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description:Update Security Users
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateUser](
	@uid integer,
	@k1hash VARCHAR(100),
	@k2hash VARCHAR(100) = NULL,
	@k3hash VARCHAR(100),
	@belongtoid tinyint,
	@act tinyint,
	@istmp tinyint,
	@fnhash VARCHAR(100),
	@lnhash VARCHAR(100)
)
AS
BEGIN

    SET NOCOUNT ON;
	if (@k2hash = '' or @k2hash is NULL) BEGIN
		UPDATE	VUMKeys
		SET	k1hash = @k1hash,
			k3hash = @k3hash,
			belongtoid = @belongtoid,
			act = @act,
			fnhash = @fnhash,
			lnhash = @lnhash
		WHERE uid = @uid
	END
	ELSE BEGIN
		UPDATE	VUMKeys
		SET	k1hash = @k1hash,
			k3hash = @k3hash,
			belongtoid = @belongtoid,
			act = @act,
			fnhash = @fnhash,
			lnhash = @lnhash,
			k2hash = @k2hash,
			istmp = @istmp
		WHERE uid = @uid
	END

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_InsertUser]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description:Add Security Users
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertUser](
	@k1hash VARCHAR(100),
	@k2hash VARCHAR(100),
	@k3hash VARCHAR(100),
	@belongtoid tinyint,
	@act tinyint,
	@ad tinyint,
	@istmp tinyint,
	@fnhash VARCHAR(100),
	@lnhash VARCHAR(100)
)
AS
BEGIN

    SET NOCOUNT ON;

	Insert	into 
	VUMKeys(k1hash,
			k2hash,
			k3hash,
			belongtoid,
			act,
			ad,
			istmp,
			fnhash,
			lnhash
			)
	Values(
			@k1hash,
			@k2hash,
			@k3hash,
			@belongtoid,
			@act,
			@ad,
			@istmp,
			@fnhash,
			@lnhash
		)

END
GO

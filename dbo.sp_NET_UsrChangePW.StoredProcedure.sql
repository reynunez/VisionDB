/****** Object:  StoredProcedure [dbo].[sp_NET_UsrChangePW]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description: Change Security Password
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UsrChangePW](
	@uid int,
	@k2hash VARCHAR(100)
)
AS
BEGIN

    SET NOCOUNT ON;

	Update	VUMKeys
	set		k2hash = @k2hash,
			istmp = 0
	where	uid = @uid

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetEmrScript]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/07/2020
-- Description:Get EMR Script
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEmrScript](
	@scriptid as integer
)
AS
BEGIN

		SET NOCOUNT ON

		Select	scriptcontents 
		from	emrsavedscripts
		where	scriptid = @scriptid
END
GO

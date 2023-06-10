/****** Object:  StoredProcedure [dbo].[sp_NET_RemovePrescHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/30/2010
-- Description:	Remove Presc Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_RemovePrescHeader](
	@prescid int
)
AS
	BEGIN

    SET NOCOUNT ON;

	delete from prescheader where prescid = @prescid

	END
GO

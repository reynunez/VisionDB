/****** Object:  StoredProcedure [dbo].[sp_getlablogcontents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/12/2015,>
-- Description:	retrieve log file contents
-- =============================================
CREATE PROCEDURE [dbo].[sp_getlablogcontents]( 
	@logid integer
)
AS
BEGIN
	Select contents from lablog where logid = @logid
END
GO

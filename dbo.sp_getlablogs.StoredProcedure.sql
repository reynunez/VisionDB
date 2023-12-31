/****** Object:  StoredProcedure [dbo].[sp_getlablogs]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/12/2015,>
-- Description:	retrieve log file contents
-- =============================================
CREATE PROCEDURE [dbo].[sp_getlablogs]( 
	@createdate varchar(10)
)
AS
BEGIN
	Select	logid 
			,createdate
			,filename
			,case when ishold = 1 then 'Yes' Else 'No' End as filehold
			,movedate
	from	lablog where convert(varchar(10),createdate,101) = @createdate
END
GO

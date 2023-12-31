/****** Object:  StoredProcedure [dbo].[sp_MoveToLabLog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/11/2015
-- Description:	Update Move to Lab Machines
	-- =============================================
CREATE PROCEDURE [dbo].[sp_MoveToLabLog]( 
	@filename varchar(50),
	@createdate varchar(10)
)	
AS
BEGIN
	DECLARE @likefilename varchar(50)
	SET @likefilename = '%' + @filename + '%'
	Update lablog
	Set movedate = dateadd(hour,-4,getdate())
	where filename like @likefilename and convert(varchar(10),createdate,101) = @createdate and ishold = 1
END
GO

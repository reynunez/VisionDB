/****** Object:  StoredProcedure [dbo].[sp_NET_GetVUFranesList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 2023-04-30
-- Description: Get Framres List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetVUFranesList]
(
	@collectionName varchar(100) = '',
	@stylename varchar(100) = '',
	@color varchar(100) = '',
	@a numeric(18,2) = 0,
	@dbl numeric(18,2) = 0,
	@b numeric(18,2) = 0,
	@ed numeric(18,2) = 0,
	@frameid int = 0,
	@rimType varchar(100) = '',
	@trace smallint = 0,
	@PriceSign varchar(1) = '=' ,
	@Price numeric(18,2) = 0
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 
	set @SQL_Statement = 'select	frameid
									,manufacturerName
									,collectionName
									,stylename
									,colordescription
									,A
									,DBL
									,B
									,ED
									,CompletePrice
									,rimType
									,date_updated
									,trace
						from	tblVUFrames
						where	1=1 '
	IF @frameid = 0 BEGIN

		IF @collectionName <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND collectionName like ''%' + @collectionName +'%'' '
		END
		IF @stylename <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND stylename like ''%' + @stylename +'%'' '
		END
		IF @color <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND (colordescription like ''%' + @color +'%'' OR colordescription like ''%' + @color +'%'') '
		END
		IF @a <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND a = ' + cast(@a as varchar(20)) + ' '
		END
		IF @dbl <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND dbl = ' + cast(@dbl as varchar(20)) + ' '
		END	
		IF @b <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND b = ' + cast(@b as varchar(20)) + ' '
		END
		IF @ed <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND ed = ' + cast(@ed as varchar(20)) + ' '
		END
		IF @rimType <> '' BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND rimType like ''%' + @rimType +'%'' '
		END
		IF @trace = 1 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND LEN(TRACE) > 0 '
		END
		IF @trace = 2 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND LEN(TRACE) = 0 '
		END
		if @Price <> 0 BEGIN
			SET @SQL_Statement = @SQL_Statement + 'AND CompletePrice ' + @PriceSign + ' ' + cast(@Price as varchar(20)) + ' '
		END

		SET @SQL_Statement = @SQL_Statement + 'ORDER BY FRAMEID DESC'

		print @SQL_Statement
		Exec sp_executesql @SQL_Statement
	END
	ELSE BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND frameid = ' + cast(@frameid as varchar(20))
		SET @SQL_Statement = @SQL_Statement + ' ORDER BY FRAMEID DESC'
		print @SQL_Statement
		Exec sp_executesql @SQL_Statement
	END
END
GO

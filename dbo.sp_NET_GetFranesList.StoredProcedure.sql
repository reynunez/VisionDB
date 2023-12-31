/****** Object:  StoredProcedure [dbo].[sp_NET_GetFranesList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/24/2020
-- Description: Get Framres List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetFranesList]
(
	@collectionName varchar(100) = '',
	@stylename varchar(100) = '',
	@color varchar(100) = '',
	@a numeric(18,2) = 0,
	@dbl numeric(18,2) = 0,
	@b numeric(18,2) = 0,
	@ed numeric(18,2) = 0
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 
	set @SQL_Statement = 'select	collectionName
								,stylename
								,colordescription
								,A
								,DBL
								,B
								,ED
								,markukp as completeprice
								,rimType
						from	tblframes
						where	1=1 '

	IF @collectionName <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND collectionName like ''%' + @collectionName +'%'' '
	END
	IF @stylename <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND stylename like ''%' + @stylename +'%'' '
	END
	IF @color <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND (colordescription like ''%' + @color +'%'' OR colorCode like ''%' + @color +'%'') '
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
	print @SQL_Statement
	Exec sp_executesql @SQL_Statement
END
GO

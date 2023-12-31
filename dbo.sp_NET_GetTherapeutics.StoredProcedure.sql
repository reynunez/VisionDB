/****** Object:  StoredProcedure [dbo].[sp_NET_GetTherapeutics]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/15/2020
-- Description: Get Therapeutics
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetTherapeutics]
(
	@Category varchar(100) = '',
	@Name varchar(100) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 
	set @SQL_Statement = 'select	tradeName ,
									Generic ,
									Manufacturer ,
									Preparation ,
									pedriaticUse ,
									HowSupplied ,
									typicalDosing ,
									Indications ,
									cautions ,
									Category,
									subcategory ,
									thid
							from	druglist where 1=1 ';

	IF @Category <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND category like ''%' + @Category +'%'' '
	END
	IF @Name <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND tradeName like ''%' + @Name +'%'' ' + 'OR Generic like ''%' + @Name +'%'' '
	END

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

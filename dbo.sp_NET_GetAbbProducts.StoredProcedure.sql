/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbProducts]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 04/29/2021
-- Description: Get ABB Products
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbProducts]
(
	@SER_ID VARCHAR(10) = '',
	@PRF_BASECURVE NUMERIC(18,2) = 0,
	@PRF_DIAMETER NUMERIC(18,2) = 0,
	@PRD_POWER NUMERIC(18,2) = 0,
	@PRD_CYLINDER NUMERIC(18,2) = 0,
	@PRD_AXIS INT = 0
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 

	SET @SQL_Statement = '  select	MAN_NAME 
										,SER_NAME 
										,PRD_DESCRIPTION 
										,PRD_ID 
										,CLID as PART_ID
								from	CLMASTER 
								where	1 = 1'


	IF (@SER_ID <> '') BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND SER_ID = ' + '''' + @SER_ID + ''' '
	END

	IF @PRF_BASECURVE <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND PRF_BASECURVE = ' + CAST(@PRF_BASECURVE AS VARCHAR) + ' '
	END

	IF @PRF_DIAMETER <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND PRF_DIAMETER = ' + CAST(@PRF_DIAMETER AS VARCHAR) + ' '
	END

	IF @PRD_POWER <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND PRD_POWER = ' + CAST(@PRD_POWER AS VARCHAR) + ' '
	END

	IF @PRD_CYLINDER <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND PRD_CYLINDER = ' + CAST(@PRD_CYLINDER AS VARCHAR) + ' '
	END

	IF @PRD_AXIS <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND PRD_AXIS = ' + CAST(@PRD_AXIS AS VARCHAR) + ' '
	END

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

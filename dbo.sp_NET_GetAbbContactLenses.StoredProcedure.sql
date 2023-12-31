/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbContactLenses]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 05/07/2021
-- Description: Get Contact Lenses
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbContactLenses]
(
	@clname varchar(100) = '',
	@istrial int= 0,
	@bc numeric(18,2) = 0,
	@sph numeric(18,2) = 0,
	@cyl numeric(18,2) = 0,
	@axs int = 0,
	@cladd numeric(18,2) = 0,
	@manufacturername varchar(100) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 
	set @SQL_Statement = 'Select	clname as Name,
									sph as SPH,
									cyl as CYL,
									axs as AXIS,
									cladd as CLADD,
									bc as BC,
									coalesce([list price],0) as Price,
									case when istrial = 0 then ''No'' else ''Yes'' end as Trial,
									color as Other,
									upcc as UPCC,
									cpt as CPT,
									manufacturername as Manufacturer,
									clid,
									COALESCE(cost,0) AS cost
							from	V_contactlens
							where	1=1 '

	IF @clname <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND clname like ''%' + @clname +'%'' '
	END
	IF @manufacturername <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND MANUFACTURERNAME like ''%' + @manufacturername +'%'' '
	END
	IF @bc <> 0 BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND bc = ' + cast(@bc as varchar(20)) + ' '
	END

	SET @SQL_Statement = @SQL_Statement + 'AND sph = ' + cast(@sph as varchar(20)) + ' '

	SET @SQL_Statement = @SQL_Statement + 'AND cyl = ' + cast(@cyl as varchar(20)) + ' '

	SET @SQL_Statement = @SQL_Statement + 'AND axs = ' + cast(@axs as varchar(20)) + ' '

	SET @SQL_Statement = @SQL_Statement + 'AND cladd = ' + cast(@cladd as varchar(20)) + ' '

	print @SQL_Statement
	Exec sp_executesql @SQL_Statement

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_SearchCptCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/01/2021
-- Description: CPT Codes Search
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_SearchCptCodes](
	@DESCRIPTION VARCHAR(100) = '',
	@CPTCODES VARCHAR(25) = '',
	@INSURANCE_NO INT = 0
)
AS

BEGIN

    SET NOCOUNT ON

	DECLARE @SQL_Statement NVARCHAR(2000) 
	set @SQL_Statement = 'select	c.class
									,c.code 
									,case when m.modifier is NULL then c.modifier else m.modifier end as modifier
									,case when m.modifier2 is NULL then c.modifier2 else m.modifier2 end as modifier2
									,c.description 
									,case when m.fee is NULL then c.fee else m.fee end as fee
							from	tblcpt c
									left join tblInsModifiers m ON c.id = m.cptid and m.insurance_no = ' + CAST(@INSURANCE_NO as varchar) + ' ' +
							'where	1=1 '

	IF @DESCRIPTION <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND DESCRIPTION like ''%' + @DESCRIPTION +'%'' '
	END
	IF @CPTCODES <> '' BEGIN
		SET @SQL_Statement = @SQL_Statement + 'AND CODE like ''%' + @CPTCODES +'%'' '
	END
	print @SQL_Statement
	Exec sp_executesql @SQL_Statement
	
END
GO

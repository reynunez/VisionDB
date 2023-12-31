/****** Object:  StoredProcedure [dbo].[sp_NET_GetCPTList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/01/2020
-- Description: Get CPT List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCPTList]
(
	@cptlist varchar(2000) = '',
	@insurance_no INT = 0
)
AS
BEGIN

    SET NOCOUNT ON

    Select	c.class
			,c.code 
			,case when m.modifier is NULL then c.modifier else m.modifier end as modifier
			,case when m.modifier2 is NULL then c.modifier2 else m.modifier2 end as modifier2
			,c.description 
			,case when m.fee is NULL then c.fee else m.fee end as fee
			,i.icd as match_icd
	from	tblcpt c
			left join tblcpticd i ON c.code = i.code and c.modifier = i.modifier and c.modifier2 = i.modifier2 
			left join tblInsModifiers m ON c.id = m.cptid and m.insurance_no = @insurance_no
	where	c.code IN(select item from SplitString(@cptlist,','))
END
GO

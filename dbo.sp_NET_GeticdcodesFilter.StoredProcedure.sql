/****** Object:  StoredProcedure [dbo].[sp_NET_GeticdcodesFilter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get ICD Codes Filtered
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GeticdcodesFilter](
	@patlist varchar(max)
)
AS
BEGIN

    SET NOCOUNT ON;
	Select	DIAGNOSIS_ID as id
			,ICD_CODE
			,SHORT_DESCRIPTION
			,LONG_DESCRIPTION
	from	tbl_icd_codes
	where	DIAGNOSIS_ID IN(SELECT item from fnStringList2Table(REPLACE(@patlist,';',',')))

END
GO

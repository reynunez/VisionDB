/****** Object:  StoredProcedure [dbo].[sp_NET_GetCptCodesFilter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get CPT Codes Filterred
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCptCodesFilter](
	@patlist varchar(max)
)
AS
BEGIN

    SET NOCOUNT ON;

    select	id
			,code
			,modifier
			, description 
	from	tblcpt
	where	id IN(SELECT item from fnStringList2Table(REPLACE(@patlist,';',',')))

END
GO

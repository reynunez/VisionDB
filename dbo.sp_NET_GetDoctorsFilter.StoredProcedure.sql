/****** Object:  StoredProcedure [dbo].[sp_NET_GetDoctorsFilter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get Doctors List Filterred
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDoctorsFilter](
	@patlist varchar(max)
)
AS
BEGIN

    SET NOCOUNT ON;

    select	doctorid
			,description 
	from	doctors 
	where	isactive = 1
			AND doctorid IN(SELECT item from fnStringList2Table(REPLACE(@patlist,';',',')))

END
GO

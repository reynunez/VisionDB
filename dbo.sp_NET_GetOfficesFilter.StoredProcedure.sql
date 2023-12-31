/****** Object:  StoredProcedure [dbo].[sp_NET_GetOfficesFilter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/28/2020
-- Description:	Procedure to get operational locations Filtered
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOfficesFilter](
	@patlist varchar(max)
)
AS
	SET NOCOUNT ON;
	Select	officeid
			,description
	from	Office 
	where	isoperational = 1
			and officeid IN(SELECT item from fnStringList2Table(REPLACE(@patlist,';',',')))
GO

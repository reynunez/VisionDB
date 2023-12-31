/****** Object:  UserDefinedFunction [dbo].[GetThLine]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/31/2020
-- Description:	Return patient Oph Presc
-- =============================================
CREATE FUNCTION [dbo].[GetThLine] 
(	
	@prescid int
)
RETURNS Varchar(1000)
AS
BEGIN

	DECLARE @LINE VARCHAR(1000)

	Select	@LINE = COALESCE(eye,'NA') + ' - ' +
			ltrim(rtrim(COALESCE(tradename,''))) + ' ' +
			ltrim(rtrim(COALESCE(sig,'')))
	from	prescth
	where	prescid = @prescid
	RETURN @LINE

END
GO

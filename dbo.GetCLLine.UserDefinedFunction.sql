/****** Object:  UserDefinedFunction [dbo].[GetCLLine]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/31/2020
-- Description:	Return patient Contact Lens Presc
-- =============================================
CREATE FUNCTION [dbo].[GetCLLine] 
(	
	@Eye VARCHAR(1),
	@prescid int
)
RETURNS Varchar(1000)
AS
BEGIN
	DECLARE @LINE VARCHAR(1000)
	IF @Eye = 'R' BEGIN
		Select	@LINE = CAST(COALESCE(SPH,0) AS varchar ) + ' ' +
			CAST(COALESCE(Cyl,0) AS varchar) + ' x ' +
			CAST(COALESCE(Axis,0) AS varchar) + ' + ' +
			CAST(COALESCE(Addition,0) AS varchar) + '  ' +
			CAST(COALESCE(BC,0) AS varchar) + '  ' +
			COALESCE(ltrim(rtrim(lensName)),'NA') + ' ' +
			COALESCE(ltrim(rtrim(color)),'NA')
		from	prescCL 
		where	prescid = @prescid
				and Eye  = 'R'
	END
	ELSE BEGIN
		Select	@LINE = CAST(COALESCE(SPH,0) AS varchar ) + ' ' +
			CAST(COALESCE(Cyl,0) AS varchar) + ' x ' +
			CAST(COALESCE(Axis,0) AS varchar) + ' + ' +
			CAST(COALESCE(Addition,0) AS varchar) + '  ' +
			CAST(COALESCE(BC,0) AS varchar) + '  ' +
			COALESCE(ltrim(rtrim(lensName)),'NA') + ' ' +
			COALESCE(ltrim(rtrim(color)),'NA')
		from	prescCL 
		where	prescid = @prescid
				and Eye = 'L' 
	END
	RETURN @LINE
END
GO

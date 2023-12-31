/****** Object:  UserDefinedFunction [dbo].[GetOphLine]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/31/2020
-- Description:	Return patient Oph Presc
-- =============================================
CREATE FUNCTION [dbo].[GetOphLine] 
(	
	@Eye VARCHAR(1),
	@prescid int
)
RETURNS Varchar(1000)
AS
BEGIN
	DECLARE @LINE VARCHAR(1000)
	IF @Eye = 'R' BEGIN
		Select	@LINE = CAST(COALESCE(sphr,0) AS varchar ) + ' ' +
				CAST(COALESCE(cylr,0) AS varchar) + ' x ' +
				CAST(COALESCE(axisr,0) AS varchar) + ' ' +
				COALESCE(vcrdva,'') + '     + ' +
				CAST(COALESCE(addr,0) AS varchar) + '  ' +
				COALESCE(vcrnva,'')  + '     ' +
				CAST(COALESCE(prism1r,0) AS varchar) + ' ' +
				CAST(COALESCE(base1r,'') AS varchar) + '/' +
				CAST(COALESCE(prism2r,0) AS varchar) + ' ' +
				CAST(COALESCE(base2r,'') AS varchar) + '    ' +
				CAST(COALESCE(distpdr,0) AS varchar) + '/' +
				CAST(COALESCE(nearpdr,0) AS varchar) + '   ' +
				'K ' + CAST(COALESCE(kr001,0) AS varchar) + '  ' +
				CAST(COALESCE(kr002,0) AS varchar) + ' x ' +
				CAST(COALESCE(kr003,0) AS varchar) 
		from	prescoph 
		where	prescid = @prescid
	END
	ELSE BEGIN
		Select	@LINE = CAST(COALESCE(sphl,0) AS varchar ) + ' ' +
				CAST(COALESCE(cyll,0) AS varchar) + ' x ' +
				CAST(COALESCE(axisl,0) AS varchar) + ' ' +
				COALESCE(vcldva,'') + '     + ' +
				CAST(COALESCE(addl,0) AS varchar) + '  ' +
				COALESCE(vclnva,'')  + '     ' +
				CAST(COALESCE(prism1l,0) AS varchar) + ' ' +
				CAST(COALESCE(base1l,'') AS varchar) + '/' +
				CAST(COALESCE(prism2l,0) AS varchar) + ' ' +
				CAST(COALESCE(base2l,'') AS varchar) + '    ' +
				CAST(COALESCE(distpdl,0) AS varchar) + '/' +
				CAST(COALESCE(nearpdl,0) AS varchar) + '   ' +
				'K ' + CAST(COALESCE(kl001,0) AS varchar) + '  ' +
				CAST(COALESCE(kl002,0) AS varchar) + ' x ' +
				CAST(COALESCE(kl003,0) AS varchar)
		from	prescoph 
		where	prescid = @prescid
	END
	RETURN @LINE
END
GO

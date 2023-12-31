/****** Object:  UserDefinedFunction [dbo].[GetCLEvLine]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/07/2021
-- Description:	Return patient Contact Lens Eval
-- =============================================
CREATE FUNCTION [dbo].[GetCLEvLine] 
(	
	@Eye VARCHAR(1),
	@prescid int
)
RETURNS Varchar(1000)
AS
BEGIN
	DECLARE @LINE VARCHAR(1000)
	IF @Eye = 'R' BEGIN
		Select	@LINE = CAST(COALESCE(Vclrdva,'') AS varchar ) + '/' +
			CAST(COALESCE(Vclrnva,'') AS varchar) + '/' +
			CAST(COALESCE([or],'') AS varchar) + '/' +
			CAST(COALESCE(Vorrdva,'') AS varchar) + '/' +
			CAST(COALESCE(Vorrnva,'') AS varchar)
		from	prescCL 
		where	prescid = @prescid
				and Eye  = 'R'
	END
	ELSE BEGIN
		 Select	@LINE = CAST(COALESCE(VclLdva,'') AS varchar ) + '/' +
			CAST(COALESCE(VclLnva,'') AS varchar) + '/' +
			CAST(COALESCE([or2],'') AS varchar) + '/' +
			CAST(COALESCE(VorLdva,'') AS varchar) + '/' +
			CAST(COALESCE(VorLnva,'') AS varchar)
		from	prescCL 
		where	prescid = @prescid
				and Eye = 'L' 
	END
	RETURN @LINE
END
GO

/****** Object:  UserDefinedFunction [dbo].[getPyType]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getPyType] (@pyType int)  
RETURNS char(10)
 AS
BEGIN 
	declare @rValue char(10)
	if @pytype = 0
		begin
			Set @rValue = 'Check'
		end
	else if @pytype = 1
		begin
			Set @rValue = 'Cash'
		end 
	else
		begin
			Set @rValue = 'Other'
		end
	RETURN @rValue
END
GO

/****** Object:  UserDefinedFunction [dbo].[getPayee]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getPayee](@pyType smallint)
RETURNS VARCHAR(25)
AS  
BEGIN 
	declare @pyReturn VARCHAR(25)
	if @pyType = 0 begin
		Set @pyReturn = 'Patient Payment'
	end
	else if @pyType = 1 begin
		Set @pyReturn = 'Insurance Payment'
	end
	RETURN @pyReturn
END
GO

/****** Object:  UserDefinedFunction [dbo].[getPayer]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getPayer] (@payer int)  
RETURNS char(10)
 AS
BEGIN 
	declare @rValue char(10)
	if @payer = 0
		begin
			Set @rValue = 'Patient'
		end
	else
		begin
			Set @rValue = 'Insurance'
		end
	RETURN @rValue
END
GO

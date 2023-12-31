/****** Object:  UserDefinedFunction [dbo].[getPaymentType]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[getPaymentType](@pmtType smallint)
RETURNS VARCHAR(25)
AS  
BEGIN 
	declare @pmtReturn VARCHAR(25)
	if @pmtType = 0 begin
		Set @pmtReturn = "Check"
	end
	else if @pmtType = 1 begin
		Set @pmtReturn = "Cash"
	end
	else if @pmtType = 2 begin
		Set @pmtReturn = "Other"
	end
	RETURN @pmtReturn
END
GO

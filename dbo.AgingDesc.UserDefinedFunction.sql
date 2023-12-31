/****** Object:  UserDefinedFunction [dbo].[AgingDesc]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AgingDesc] (@Days int)  
RETURNS char(10)
AS  
BEGIN 
	DECLARE @vReturn char(10)
	if (@days >= 0 and @days <= 90) begin
		Set @vReturn =  'Current'
	end
	if @days > 90 begin
		Set @vReturn = 'Past Due'
	end
	RETURN  @vReturn
END
GO

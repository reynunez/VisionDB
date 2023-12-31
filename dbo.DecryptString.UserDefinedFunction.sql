/****** Object:  UserDefinedFunction [dbo].[DecryptString]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: 1/16/2014
-- Description: Decrypt
-- =============================================
CREATE FUNCTION [dbo].[DecryptString] 
(
	@cString varchar(100),
	@Key int
)
RETURNS varchar(100)
AS
BEGIN
	Declare @RetValue varchar(100),
			@nCnt int,
			@cCh varchar(1),
			@rCh varchar(1)
			
	set @nCnt = 1
	set @RetValue = ''
			
	While @nCnt <= len(@cString) begin
		set @cCh = substring(@cString,@nCnt,1)
		set @rCh = char(Ascii(@cCh) - @Key)
		set @RetValue = @RetValue + @rCh
		set @nCnt = @nCnt + 1
	end			
			
			
	RETURN @RetValue

END
GO

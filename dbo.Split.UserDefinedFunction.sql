/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/20/2011
-- Description:	String Parser
-- =============================================
CREATE FUNCTION [dbo].[Split]
(
	@String VARCHAR(1000), 
	@Delimiter VARCHAR(5),
	@Position SMALLINT
)
RETURNS nvarchar(500)
AS
BEGIN
	Declare	@OccurenceId SMALLINT,			-- Keep count of the parsed element
			@SplitValue NVARCHAR(500),		-- Return Element Value Variable
			@SplitLength INT				-- Delimiter finder

	SET @OccurenceId = 1

	WHILE LEN(@String) > 0 
	BEGIN 
		SET @SplitValue = ''	-- Initialize element value
		-- Find delimiter position and initialize element variable.  If no delimiter then return full string length value
		Set @SplitLength = (CASE CHARINDEX(@Delimiter,@String) WHEN 0 THEN LEN(@String) ELSE CHARINDEX(@Delimiter,@String) -1 END) 
		-- Locate String being delimited
		Set @SplitValue = SUBSTRING(@String,1,@SplitLength) 

		IF (@OccurenceId = @Position) BEGIN
			SET @String = ''
		END
		ELSE BEGIN
			Set @String = SUBSTRING(@String,@SplitLength + 2 ,1000) 
		END

		IF LEN(@String) <> 0 BEGIN
			SET @OccurenceId = @OccurenceId + 1		
		END

	END

	IF (@OccurenceId < @Position) BEGIN
		SET @SplitValue = ''
	END

	RETURN @SplitValue
END
GO

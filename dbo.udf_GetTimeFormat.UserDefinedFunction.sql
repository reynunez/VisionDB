/****** Object:  UserDefinedFunction [dbo].[udf_GetTimeFormat]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 6/19/2012
-- Description:	To Sort Time
-- =============================================
CREATE FUNCTION [dbo].[udf_GetTimeFormat]
(
	@TimeStamp varchar(20)
)
RETURNS varchar(20)
AS
BEGIN
	Declare @hour int
	Declare @min int
	Declare @fHour varchar(2)
	Declare @fMin varchar(2)
	Declare @NewTime varchar(20)

	set @hour = substring(@TimeStamp,1,charindex(':',@TimeStamp,1)-1)
	set @min =  substring(@TimeStamp,charindex(':',@TimeStamp,1)+1,2)

	if right(@TimeStamp,3) = 'P.M' Begin
		if @hour <> 12 begin
			set @hour = @hour + 12
		end
	end
	set @fHour = right(replicate('0',2) + convert(varchar(2),@hour),2)
	set @fMin = right(replicate('0',2) + convert(varchar(2),@min),2)
	set @NewTime = @fHour + ':' + @fMin
	Return @NewTime

END
GO

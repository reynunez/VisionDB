/****** Object:  UserDefinedFunction [dbo].[GetOfficeName]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 1/16/2014
-- Description:	Get Office Name
-- =============================================
CREATE FUNCTION [dbo].[GetOfficeName]
(
	@OfficeID int
)
RETURNS Varchar(100)
AS
BEGIN
	DECLARE @ResultVar varchar(100)
	Select @ResultVar = description from office where officeid = @OfficeID

	RETURN @ResultVar

END
GO

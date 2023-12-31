/****** Object:  UserDefinedFunction [dbo].[udf_GetNumberOfAppointments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_GetNumberOfAppointments] 
(
 @appmtDate smalldatetime,
 @appmttime varchar(15),
 @officeID int = 0
)
RETURNS int
AS
BEGIN
 Declare @retAppmt int
 IF @appmttime = '' BEGIN
    SET @appmttime = '0:00 A:M'
 END 

 if @officeID = 0 BEGIN
  Select @retAppmt = Count(*) from dbo.appointment where appmtdate = @appmtDate and appmttime = @appmttime
 END
 ELSE BEGIN
  Select @retAppmt = Count(*) from dbo.appointment where appmtdate = @appmtDate and appmttime = @appmttime and appmtlocation = @officeID
 END
 RETURN @retAppmt

END
GO

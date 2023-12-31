/****** Object:  StoredProcedure [dbo].[sp_GetAppmtDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAppmtDetails]( 
 @appmtDate varchar(10), 
 @appmtTime varchar(15),
 @officeID int = 0
)
AS
BEGIN
 if @officeID = 0 BEGIN
  Select * from view_Appointments where appmtdate = convert(smalldatetime,@appmtDate) and appmttime = @appmtTime
 END
 ELSE BEGIN
  Select * from view_Appointments where appmtdate = convert(smalldatetime,@appmtDate) and appmttime = @appmtTime and officeid = @officeID
 END
END
GO

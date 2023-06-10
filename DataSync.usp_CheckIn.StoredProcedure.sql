/****** Object:  StoredProcedure [DataSync].[usp_CheckIn]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [DataSync].[usp_CheckIn]
@Id INT
WITH EXECUTE AS CALLER
AS
Update tblVOMMaBIT
Set CheckInDateTime = dateadd(hh,-5,Getdate())
Where id = @Id
GO

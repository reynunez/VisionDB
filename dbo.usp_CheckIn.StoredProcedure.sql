/****** Object:  StoredProcedure [dbo].[usp_CheckIn]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[usp_CheckIn](
	@Id INT,
	@cLocation INT = 0,
	@LocationID INT = 0
)
WITH EXECUTE AS CALLER
AS
Update tblVOMMaBIT
Set CheckInDateTime = dateadd(hh,-5,Getdate()), cLocation = @cLocation, locationID = @LocationID
Where id = @Id
GO

/****** Object:  StoredProcedure [DataSync].[usp_CheckOut]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [DataSync].[usp_CheckOut]
@Id INT
WITH EXECUTE AS CALLER
AS
Update tblVOMMaBIT
Set CheckOutDateTime = dateadd(hh,-5,Getdate())
Where id = @Id
GO

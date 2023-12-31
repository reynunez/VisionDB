/****** Object:  StoredProcedure [dbo].[sp_LastDoctorSignature]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[sp_LastDoctorSignature]
@doctorid INT
WITH EXECUTE AS CALLER
AS
Set Nocount on

Update doctors
Set lastrecordedsig = getdate()
Where doctorid = @doctorid
RETURN 0
GO

/****** Object:  StoredProcedure [dbo].[sp_LastVisitRecorded]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_LastVisitRecorded]
@Patient_no INT
WITH EXECUTE AS CALLER
AS
Set Nocount on

Update Patient
Set last_office_visit_date = DATEADD(hh,-5,getdate())
Where Patient_no = @Patient_no
GO

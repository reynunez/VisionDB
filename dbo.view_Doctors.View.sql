/****** Object:  View [dbo].[view_Doctors]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[view_Doctors]
AS
Select *
from Doctors
where doctorid <> 23 and isactive = 1
GO

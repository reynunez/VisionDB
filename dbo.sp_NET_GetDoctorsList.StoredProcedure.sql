/****** Object:  StoredProcedure [dbo].[sp_NET_GetDoctorsList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/12/2020
-- Description:	Get Active Doctors List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetDoctorsList]

AS
BEGIN
	select	doctorid
			,description as name
	from	doctors 
	where	isactive = 1
END
GO

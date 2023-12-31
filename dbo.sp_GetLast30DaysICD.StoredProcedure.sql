/****** Object:  StoredProcedure [dbo].[sp_GetLast30DaysICD]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/01/2017
-- Description:	Get Last 30 days Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLast30DaysICD] 

AS
BEGIN
		Select	distinct
				Last30days.user_cd,
				last30days.diag_date
				from (					
						Select	*
						from	patient_diagnosis 
						where	convert(varchar(10),diag_date,101) between dateadd(dd,-30,DATEADD(hh,-5,getdate())) and getdate()  
				)as Last30days
				order by last30days.diag_date desc
END
GO

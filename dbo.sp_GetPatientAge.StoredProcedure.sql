/****** Object:  StoredProcedure [dbo].[sp_GetPatientAge]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/29/2017
-- Description:	Get Propper Date
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPatientAge]( 
	@patient_dob date 
)
AS
BEGIN
	Select datediff(yyyy,@patient_dob,getdate()) - Case when month(@patient_dob) > month(getdate()) then 1 else 0 end as patient_age
END
GO

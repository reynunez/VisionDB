/****** Object:  StoredProcedure [dbo].[GetICD10MostFrequent]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo NunezR
-- Create date: 10/05/2015
-- Description: Most Frequently Use
-- =============================================
CREATE PROCEDURE [dbo].[GetICD10MostFrequent]
AS
BEGIN
	Declare @Result TABLE
	(
		user_cd varchar(20), diag_date date
	)
	Insert into @Result Exec sp_GetLast30DaysICD

	Select	icd_code
			,short_description
			,DIAGNOSIS_ID
	from	[dbo].[TBL_ICD_CODES]
	where icd_code IN(
						Select top 15 user_cd from @Result
					)
END
GO

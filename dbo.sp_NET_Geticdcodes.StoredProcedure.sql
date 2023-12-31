/****** Object:  StoredProcedure [dbo].[sp_NET_Geticdcodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get ICD Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_Geticdcodes]
AS
BEGIN

    SET NOCOUNT ON;
	Select	DIAGNOSIS_ID as id
			,ICD_CODE
			,SHORT_DESCRIPTION
			,LONG_DESCRIPTION
	from	tbl_icd_codes
	where	(group_code IN('C69','D31','H01','H02','H04','H05','H10','H15','H16','H17','H18',
							'H20','H21','H25','H26','H27','H30','H31','H33','H34','H35','H40',
							'H43','H44','H47','H51','H52','H53','H54','H55','H57','H59','T74',
							'T36','X00','Y92','Y93','V01','R51','H46','G35','G36','G37','H32',
							'N04','N08','N18','N52','E10','E11','H36','R51','G35','E08','E09'
							))
			OR (group_code LIKE 'R*')
			OR (group_code LIKE 'S*')
			OR (group_code LIKE 'T*')
			OR (group_code >= 'Z00' AND group_code <= 'Z99')

END
GO

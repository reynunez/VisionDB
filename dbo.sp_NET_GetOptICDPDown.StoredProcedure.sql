/****** Object:  StoredProcedure [dbo].[sp_NET_GetOptICDPDown]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get Opt/Opht Codes Pull Down
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOptICDPDown]
AS
BEGIN

    SET NOCOUNT ON;


	Select	icd_code as CODE,
			LTRIM(RTRIM(icd_code)) + ' ' + LTRIM(RTRIM(short_description))  as DIAGNOSIS
	from	tbl_icd_codes
	where	icd_code IN('A54.31','A54.32','A54.33','A54.39',
				'B00.52',
				'E08.36','E09.36','E10.36','E11.36',
				'H52.01','H52.02','H52.03','H52.11','H52.12','H52.4',
				'H54.8',
				'H00.11','H00.12','H00.14','H00.15','H01.021','H01.022','H01.024','H01.025','H02.031','H02.032','H02.34','H02.035',
				'H43.11','H43.12','H43.13',
				'H33.311','H33.312','H33.313','H35.31',
				'H57.11','H57.12','H57.13',
				'H27.01','H27.02','H27.03',
				'H40.011','H40.012','H40.013',
				'T15.01XA','T15.02XA',
				'S05.01XA','S05.02XA',
				'Z01.00','Z01.01',
				'Z83.518','Z00.121','Z00.129','Z00.121','Z13.5'
				)
		OR group_code IN('C69','D31','H01','H02','H04','H05','H10','H15','H16','H17','H18','H20',
					'H25','H26','H27','H30','H31','H33','H34','H35','H40','H43','H44','H47',
					'H51','H52','H53','H54','H55','H57','H59','R00','T74','T36','X00','Y92',
					'Y93','V01'
					) 
		ORDER BY icd_code,short_description 

END
GO

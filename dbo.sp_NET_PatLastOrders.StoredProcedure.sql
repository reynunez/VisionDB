/****** Object:  StoredProcedure [dbo].[sp_NET_PatLastOrders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/29/2022
-- Description: Get Patient Last Orders
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_PatLastOrders]
(
	@PAR_DATE_1 DATE = '',
	@PAR_DATE_2 DATE = '',
	@PAR_ORDER INT = 0,
	@PAR_PRESC INT = 0,
	@PAR_LIKE VARCHAR(200) = ''
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@DATE_1 DATE,@DATE_2 DATE,@ORDER INT,@PRESC INT,@LIKE VARCHAR'

SET	@SQLString = N'
				with last_sales_by_patient As
				(
				select	O.*
						,ROW_NUMBER() OVER (PARTITION BY O.PATIENT_NO ORDER BY O.ORDER_DATE DESC) AS ROW_NUMBER
				FROM	CL_ORDER_HDR O
				)

				SELECT	O.ORDER_ID 
						,O.ORDER_DATE 
						,O.PRESCID
						,PH.prescdate
						,CAST(PR.voidafter AS DATE) AS VOID_AFTER
						,CASE WHEN CAST(PR.voidafter AS DATE) < GETDATE() THEN ''INACTIVE'' ELSE ''ACTIVE'' END AS PRESC_ACTIVE
						,O.PATIENT_NO 
						,LTRIM(RTRIM(P.first_name )) + '' '' + LTRIM(RTRIM(P.last_name  )) AS PATIENT_NAME
						,p.birth_date AS PATIENT_DOB
						,REPLACE(OIR.ITEM_DESCRIPTION,''R-'','''') AS CL_NAME_RIGHT
						,REPLACE(OIL.ITEM_DESCRIPTION,''L-'','''')  AS CL_NAME_LEFT
						,O.OFFICEID AS LOCATION_ID
						,L.description AS LOCATION_NAME
						,ltrim(rtrim(coalesce(P.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(P.last_name,'''') )) + ''|'' +
						ltrim(rtrim(coalesce(P.first_name,'''') ))  + ''|'' +
						ltrim(rtrim(coalesce(P.last_name,'''') )) + ''|'' + 
						ltrim(rtrim(coalesce(CAST(O.ORDER_ID AS VARCHAR(50)),'''') )) + ''|'' + 
						ltrim(rtrim(coalesce(CAST(O.ORDER_DATE AS DATE),'''') )) +  ''|'' + 
						ltrim(rtrim(coalesce(CAST(PH.prescdate AS DATE),'''') )) +  ''|'' + 
						ltrim(rtrim(coalesce(CAST(PL.voidafter AS DATE),'''') )) +  ''|'' + 
						ltrim(rtrim(coalesce(P.email_address,''''))) + ''|'' + 
						ltrim(rtrim(coalesce(A.phone1,''''''''))) + ''|'' + 
						cast(p.patient_no as varchar) as payload
				FROM	last_sales_by_patient O
						JOIN CL_ORDER_ITEMS OIR	ON O.ORDER_ID = OIR.ORDER_ID and SUBSTRING(OIR.ITEM_DESCRIPTION,1,1) = ''R''
						JOIN CL_ORDER_ITEMS OIL	ON O.ORDER_ID = OIL.ORDER_ID and SUBSTRING(OIL.ITEM_DESCRIPTION,1,1) = ''L''
						JOIN prescCL PR ON O.PRESCID = PR.prescid AND PR.Eye = ''R''
						JOIN prescCL PL ON O.PRESCID = PL.prescid AND PL.Eye = ''L''
						JOIN prescheader PH ON O.PRESCID = PH.prescid 
						JOIN patient P ON O.PATIENT_NO = P.patient_no 
						LEFT JOIN address A ON P.patient_no = A.patient_no 
						LEFT JOIN office L ON O.OFFICEID = L.officeid 
				WHERE	ROW_NUMBER = 1 ' +
				CASE 
					WHEN @PAR_ORDER = 1 THEN ''
					WHEN @PAR_ORDER = 2 THEN 'AND (O.PRESC_STATUS_OD <> ''Trial'' OR O.PRESC_STATUS_OS <> ''Trial'') '
					WHEN @PAR_ORDER = 3 THEN 'AND (O.PRESC_STATUS_OD = ''Trial'' OR O.PRESC_STATUS_OS = ''Trial'') '
					ELSE ''
				END +
				CASE 
					WHEN @PAR_PRESC = 1 THEN 'AND (CASE WHEN CAST(PR.voidafter AS DATE) < GETDATE() THEN ''INACTIVE'' ELSE ''ACTIVE'' END) = ''ACTIVE'' '
					WHEN @PAR_PRESC = 2 THEN 'AND (CASE WHEN CAST(PR.voidafter AS DATE) < GETDATE() THEN ''INACTIVE'' ELSE ''ACTIVE'' END) = ''INACTIVE'' '
					WHEN @PAR_PRESC = 3 THEN ' '
					ELSE ' '
				END +
				CASE WHEN (@PAR_DATE_1 <> '' AND @PAR_DATE_2 <> '') THEN 'and CAST(O.ORDER_DATE as DATE)  BETWEEN @DATE_1 AND @DATE_2' 
					 ELSE '' 
				END + 
				CASE WHEN @PAR_LIKE <> '' THEN ' and (OIR.ITEM_DESCRIPTION like ''%' +  @PAR_LIKE + '%'' OR OIL.ITEM_DESCRIPTION like ''%' + @PAR_LIKE + '%'')' 
					ELSE '' 
				END +
				' ORDER BY O.ORDER_DATE DESC'

--print @SQLString
EXECUTE sp_executesql @SQLString,@ParmDefinition,@DATE_1=@PAR_DATE_1,@DATE_2=@PAR_DATE_2,@ORDER=@PAR_ORDER,@PRESC=@PAR_PRESC,@LIKE=@PAR_LIKE;

END
GO

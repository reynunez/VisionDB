/****** Object:  StoredProcedure [dbo].[sp_NET_GetPrescOrders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/16/2022
-- Description: Get Presc Orders
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPrescOrders]
(
	@PAR_DATE_1 DATE = '',
	@PAR_DATE_2 DATE = '',
	@PAR_QUERYID INT = -1,
	@PAR_DESCLIKE VARCHAR(200) = ''
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@DATE_1 DATE,@DATE_2 DATE,@QUERYID INT,@DESCLIKE VARCHAR'

SET	@SQLString = N'select DISTINCT 
				m.patient_no 
				,ltrim(rtrim(coalesce(p.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(p.last_name,'''') )) AS patient_name
				,m.prescid 
				,m.prescdate 
				,m.ORDER_ID 
				,m.ORDER_DATE 
				,replace(replace(iR.ITEM_DESCRIPTION,''R-'',''''),''L-'','''') as ITEM_DESCRIPTION_R
				,iR.ITEM_UNITS  AS ITEM_UNITS_R
				,replace(replace(iL.ITEM_DESCRIPTION,''R-'',''''),''L-'','''') as ITEM_DESCRIPTION_L
				,iL.ITEM_UNITS AS ITEM_UNITS_L
				,ltrim(rtrim(coalesce(p.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
				ltrim(rtrim(coalesce(p.first_name,'''') ))  + ''|'' +
				ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' + 
				ltrim(rtrim(coalesce(CAST(m.ORDER_ID AS VARCHAR(50)),'''') )) + ''|'' + 
				ltrim(rtrim(coalesce(CAST(m.ORDER_DATE AS DATE),'''') )) +  ''|'' + 
				ltrim(rtrim(coalesce(CAST(m.prescdate AS DATE),'''') )) +  ''|'' + 
				ltrim(rtrim(coalesce(CAST(m.voidafter AS DATE),'''') )) +  ''|'' + 
				ltrim(rtrim(coalesce(p.email_address,''''))) + ''|'' + 
				ltrim(rtrim(coalesce(ad.phone1,''''))) + ''|'' + 
				cast(p.patient_no as varchar) as payload
		from (
			select	DISTINCT
					ph.prescid 
					,ph.prescdate 
					,ph.patient_no 
					,ph.void 
					,pd.voidafter 
					,SUBSTRING(pd.UPCC, 0, CHARINDEX(''|'', pd.UPCC)) as UPCC
					,oh.ORDER_ID 
					,oh.ORDER_DATE 
					,oh.OFFICEID 
					,oh.PRESC_BC_OS 
					,oh.PRESC_CYL_OS 
					,oh.PRESC_SPH_OS 
					,oh.PRESC_STATUS_OS 
					,oh.PRESC_ADD_OS 
					,oh.PRESC_AXIS_OS 
					,oh.PRESC_BC_OD 
					,oh.PRESC_CYL_OD
					,oh.PRESC_SPH_OD
					,oh.PRESC_STATUS_OD 
					,oh.PRESC_ADD_OD 
					,oh.PRESC_AXIS_OD 
			from	prescheader ph
					left join CL_ORDER_HDR oh on ph.prescid = oh.PRESCID 
					join prescCL pd on ph.prescid = pd.prescid and (cast(voidafter as date) ' +
					CASE @PAR_QUERYID WHEN 0 THEN '> GETDATE() OR ph.void = 0) ' 
									WHEN  1 THEN '< (GETDATE() -1) OR ph.void = 1) '
									WHEN  2 THEN '> GETDATE() OR ph.void = 0) '
									WHEN  3 THEN '< (GETDATE() -1) OR ph.void = 1) '
					END +
			'where	1=1 ' +
			CASE WHEN (@PAR_DATE_1 <> '' AND @PAR_DATE_2 <> '') THEN 'and CAST(ph.prescdate as DATE)  BETWEEN @DATE_1 AND @DATE_2' ELSE '' END + ' 
			AND NOT oh.ORDER_ID is NULL ' +

		') m 
		left join patient p on p.patient_no = m.patient_no
		left join address ad on ad.patient_no = p.patient_no
		left join CL_ORDER_ITEMS iR on m.ORDER_ID = iR.ORDER_ID and SUBSTRING(iR.ITEM_DESCRIPTION,1,1) = ''R''
		left join CL_ORDER_ITEMS iL on m.ORDER_ID = iL.ORDER_ID and SUBSTRING(iL.ITEM_DESCRIPTION,1,1) = ''L''
		join (select DISTINCT upcc,istrial from v_contactlens) c on m.UPCC = c.upcc and c.istrial <> 1 
		where 1=1 ' + 
		CASE @PAR_QUERYID WHEN 0 THEN 'AND m.order_id is NULL ' 
						WHEN  1 THEN 'AND m.order_id is NULL '
						WHEN  2 THEN 'AND NOT m.order_id is NULL '
						WHEN  3 THEN 'AND NOT m.order_id is NULL '
		END +		
		CASE WHEN @PAR_DESCLIKE <> '' THEN ' and (iR.ITEM_DESC like ''%' +  @PAR_DESCLIKE + '%'' OR iL.ITEM_DESC like ''%' + @PAR_DESCLIKE + '%'')' ELSE '' END +
		' order by m.prescid ASC'

--print @SQLString
EXECUTE sp_executesql @SQLString,@ParmDefinition,@DATE_1=@PAR_DATE_1,@DATE_2=@PAR_DATE_2,@QUERYID=@PAR_QUERYID,@DESCLIKE=@PAR_DESCLIKE;

END
GO

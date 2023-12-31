/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsuranceModifiers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/02/2022
-- Description:	Procedure to get Insurances Modifiers
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsuranceModifiers]
AS

BEGIN


Select	DISTINCT
		m.inscptid 
		,m.insurance_no 
		,i.insurance_name 
		,m.cptcode 
		,c.description 
		,m.modifier 
		,m.modifier2 
		,m.fee
		,m.cptid
From	tblInsModifiers m
		left join insurance i ON m.insurance_no = i.insurance_no 
		left join tblcpt c ON m.cptid = c.id 

END
GO

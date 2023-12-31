/****** Object:  StoredProcedure [dbo].[sp_NET_GetBillingCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/26/2020
-- Description:	Get Billing Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetBillingCodes] 
	@IDlist varchar(max)
	,@Insurance_no INT = 0
AS
BEGIN
	SET NOCOUNT ON;
	SET @IDlist = REPLACE(@IDlist,';',',')

		select	c.class
				,c.code as cptcode
				,case when m.modifier is NULL then c.modifier else m.modifier end as modifier
				,case when m.modifier2 is NULL then c.modifier2 else m.modifier2 end as modifier2
				,c.description 
				,case when m.fee is NULL then c.fee else m.fee end as fee
		from	tblcpt c
				left join tblInsModifiers m ON c.id = m.cptid and m.insurance_no = @Insurance_no
		WHERE   ID  IN(SELECT item from fnStringList2Table(REPLACE(@IDlist,';',',')))
		order	by class

	/*
		select	class
				,code as cptcode
				,modifier 
				,modifier2 
				,description 
				,fee 
		from	tblcpt
		WHERE   ID  IN(SELECT item from fnStringList2Table(REPLACE(@IDlist,';',',')))
		order	by class */
END
GO

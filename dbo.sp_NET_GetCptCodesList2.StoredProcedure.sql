/****** Object:  StoredProcedure [dbo].[sp_NET_GetCptCodesList2]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/28/2020
-- Description:	Procedure to get CPT Codes for Pulldown 2
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCptCodesList2]
AS
	SET NOCOUNT ON;
	Select distinct code,ltrim(rtrim(code)) + ' ' + ltrim(rtrim(description)) + ' | MOD: ' + ltrim(rtrim(modifier)) + ' | MOD2: ' + ltrim(rtrim(modifier2 )) + '| FEE: ' + ltrim(rtrim(fee)) + ' | ID: ' + cast(id as varchar) as description from tblcpt ;

	select * from cptcodes
GO

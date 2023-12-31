/****** Object:  StoredProcedure [dbo].[Sp_NET_GetExtDocDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/12/2020
-- Description:	External Doctors Selection
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetExtDocDetails]
	@doctorid int
AS
BEGIN
	SET NOCOUNT ON

	Select	ltrim(rtrim(description )) + char(10) + char(13) +
			CASE WHEN trim(rtrim(address1))='' THEN '' ELSE ltrim(rtrim(address1)) + char(10) + char(13) END +
			CASE WHEN trim(rtrim(address2))='' THEN '' ELSE ltrim(rtrim(address2)) + char(10) + char(13) END +
			CASE WHEN (ltrim(rtrim(city))  + ltrim(rtrim(state))  + ltrim(rtrim(zip))) ='' THEN '' ELSE ltrim(rtrim(city)) + ',' + ltrim(rtrim(state)) + ' ' + ltrim(rtrim(zip)) + char(10) + char(13) END +
			'Phone:' + ltrim(rtrim(phone)) + char(10) + char(13) +
			'Fax:' + ltrim(rtrim(fax)) as details
	from	ext_doctors
	Where	doctorid = @doctorid;

end
GO

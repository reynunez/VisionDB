/****** Object:  StoredProcedure [dbo].[sp_NET_GetCptCodesList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/28/2020
-- Description:	Procedure to get CPT Codes for Pulldown
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCptCodesList]
AS
	SET NOCOUNT ON;
	Select distinct code,ltrim(rtrim(code)) + ' ' + ltrim(rtrim(description)) as description from cptcodes ;
GO

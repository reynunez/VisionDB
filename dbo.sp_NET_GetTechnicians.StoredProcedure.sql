/****** Object:  StoredProcedure [dbo].[sp_NET_GetTechnicians]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/28/2020
-- Description:	Procedure to get operational locations
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetTechnicians]
AS
BEGIN
	SET NOCOUNT ON;


	Select	salesmanid,
			name 
	from	salespeople 
	where	commision = 6

END
GO

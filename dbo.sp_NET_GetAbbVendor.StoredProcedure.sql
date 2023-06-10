/****** Object:  StoredProcedure [dbo].[sp_NET_GetAbbVendor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 04/28/2021
-- Description: Get Abb Vendor List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAbbVendor]
AS
BEGIN

    SET NOCOUNT ON

	Select	distinct
			MAN_ID 
			,MAN_NAME 
	from	[dbo].[CLMAN_SER_UNIT]

END
GO

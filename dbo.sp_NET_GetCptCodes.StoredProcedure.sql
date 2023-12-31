/****** Object:  StoredProcedure [dbo].[sp_NET_GetCptCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/13/2020
-- Description:Get CPT Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCptCodes]
AS
BEGIN

    SET NOCOUNT ON;
    Select	class
			,code 
			,modifier 
			,modifier2
			,description 
			,fee
			,id
	from	tblcpt
	order	by class;

END
GO

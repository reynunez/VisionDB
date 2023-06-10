/****** Object:  StoredProcedure [dbo].[sp_NET_GetEyeTestList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Eye Test lIST
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEyeTestList]
AS
BEGIN

    SET NOCOUNT ON

		Select	* 
		from	tblEyeExamEyeTest 
		order	by listorder
END
GO

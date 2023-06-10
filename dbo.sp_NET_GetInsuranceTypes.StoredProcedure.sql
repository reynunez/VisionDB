/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsuranceTypes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/21/2021
-- Description:	Procedure to get Insurances Types
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsuranceTypes]
AS
	SET NOCOUNT ON;
	Select	instypeid
			,description 
	from	instype 
GO

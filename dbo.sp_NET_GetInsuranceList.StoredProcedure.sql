/****** Object:  StoredProcedure [dbo].[sp_NET_GetInsuranceList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/21/2021
-- Description:	Procedure to get Insurances
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInsuranceList]
AS
	SET NOCOUNT ON;
	Select	insurance_no
			,insurance_name 
	from	insurance 
	where	active = 1
	order	by insurance_name
GO

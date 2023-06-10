/****** Object:  StoredProcedure [dbo].[sp_NET_GetOfficeList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/21/2021
-- Description:	Procedure to Get all Locations
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOfficeList]
AS
	SET NOCOUNT ON;
	Select	officeid
			,description
	from	Office
GO

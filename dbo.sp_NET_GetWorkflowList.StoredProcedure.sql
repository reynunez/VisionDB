/****** Object:  StoredProcedure [dbo].[sp_NET_GetWorkflowList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/22/2022
-- Description:	Get Workflows
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetWorkflowList]
AS
	SET NOCOUNT ON;

	Select	code
			,description
	from	tblworkflow 
GO

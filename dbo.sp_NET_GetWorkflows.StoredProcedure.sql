/****** Object:  StoredProcedure [dbo].[sp_NET_GetWorkflows]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/28/2021
-- Description:	Get Workflows
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetWorkflows]
AS
	SET NOCOUNT ON;

	Select	'onboarding' as value, 'Boarded' as description
	union
	Select	'tech' as value, 'Technician' as description
	union
	Select	'floor' as value, 'Floor' as description
	union
	Select	'exam' as value, 'Exam Room' as description
	union
	Select	'checkout' as value, 'Checked Out' as description
	union
	Select	'noshow' as value, 'No Show' as description
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetAppmtReason]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/22/2020
-- Description:	Appointment Reasons List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetAppmtReason]
AS
BEGIN

	SET NOCOUNT ON;

	select  DISTINCT
			reasonid
			,name
			,CASE WHEN description = 'Eye Exam' THEN (DESCRIPTION + ' '  + NAME) ELSE DESCRIPTION END AS DESCRIPTION
	from	tblreason
	where	name <> ''
			and active = 1
	order	by name

END
GO

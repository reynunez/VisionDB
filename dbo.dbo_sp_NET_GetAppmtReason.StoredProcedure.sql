/****** Object:  StoredProcedure [dbo].[dbo_sp_NET_GetAppmtReason]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/22/2020
-- Description:	Appointment Reasons List
-- =============================================
CREATE PROCEDURE [dbo].[dbo_sp_NET_GetAppmtReason]
AS
BEGIN

	SET NOCOUNT ON;

	select reasonid
			,name
	from	tblreason
	where	name <> ''

END
GO

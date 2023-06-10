/****** Object:  StoredProcedure [dbo].[sp_NET_GetSavedEmailMsgs]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Saved Email Messages
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetSavedEmailMsgs]
AS
BEGIN

    SET NOCOUNT ON

		Select	emailMsgId
				,Title
		from	tblEmailMsgs 

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetEmailMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/30/2022
-- Description: Retrieve Individual Email Msg
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEmailMsg](
	@emailMsgId int
)
AS
BEGIN

    SET NOCOUNT ON

		Select	Subject ,
				Contents
		from	tblEmailMsgs 
		where	emailMsgId = @emailMsgId

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_GetThisEmailMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/26/2022
-- Description: Retrieve Saved Email Message
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetThisEmailMsg]
(
	@emailMsgId INT
)
AS
BEGIN

    SET NOCOUNT ON

		Select	Title  
				,Subject
				,Contents 
		from	tblEmailMsgs 
		where	emailMsgId = @emailMsgId
END
GO

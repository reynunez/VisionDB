/****** Object:  StoredProcedure [dbo].[sp_NET_GetThisTextMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/26/2022
-- Description: Retrieve Saved Text Message
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetThisTextMsg]
(
	@TextMsgid INT
)
AS
BEGIN

    SET NOCOUNT ON

		Select	Title  
				,Contents 
		from	tblTextMsgs 
		where	TextMsgid = @TextMsgid
END
GO

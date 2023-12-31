/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertTxtMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2021
-- Description:	Insert/Update Text Messages
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertTxtMsg](
	@TextMsgid INT
	,@Title VARCHAR(100)
	,@Contents TEXT
)
AS
BEGIN
	IF @TextMsgid = 0 BEGIN
			Insert into tblTextMsgs(
					Title  
					,Contents 
					)
			Values(
					@Title
					,@Contents
			)
	END
	ELSE BEGIN

		Update tblTextMsgs
			Set Title = @Title
			,Contents = @Contents
		WHERE TextMsgId = @TextMsgid
	END

END
GO

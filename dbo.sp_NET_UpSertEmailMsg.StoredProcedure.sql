/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertEmailMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2021
-- Description:	Insert/Update Email Messages
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertEmailMsg](
	@emailMsgId INT
	,@Title VARCHAR(100)
	,@Subject VARCHAR(100)
	,@Contents TEXT
)
AS
BEGIN
	IF @emailMsgId = 0 BEGIN
			Insert into tblEmailMsgs(
					Title  
					,Subject
					,Contents 
					)
			Values(
					@Title
					,@Subject
					,@Contents
			)
	END
	ELSE BEGIN

		Update tblEmailMsgs
			Set Title = @Title
			,Subject = @Subject
			,Contents = @Contents
		WHERE emailMsgId = @emailMsgId
	END

END
GO

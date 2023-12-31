/****** Object:  StoredProcedure [dbo].[sp_NET_GetLastTextMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Last Text Message
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetLastTextMsg]
AS
BEGIN

    SET NOCOUNT ON

		Select	top 1 TextMsgId AS LastRecord
		from	tblTextMsgs 
		order	by TextMsgId Desc

END
GO

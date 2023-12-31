/****** Object:  StoredProcedure [dbo].[sp_NET_GetLastEmailMsg]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/29/2020
-- Description: Retrieve Last Email Message
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetLastEmailMsg]
AS
BEGIN

    SET NOCOUNT ON

		Select	top 1 emailMsgId AS LastRecord
		from	tblEmailMsgs 
		order	by emailMsgId Desc

END
GO

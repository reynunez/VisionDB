/****** Object:  StoredProcedure [dbo].[Sp_NET_logErrors]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/24/2020
-- Description: VUM Errors Log
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_logErrors]
(
	@errMessage varchar(max),
	@module varchar(50),
	@sub varchar(50)
)
AS
BEGIN
    SET NOCOUNT ON

	Insert into tblVUMLogs(logdatetime,logmodule,logsub,logerrmessage)
	Values(DATEADD(hh,-5,getdate()),@module,@sub,@errMessage)

END
GO

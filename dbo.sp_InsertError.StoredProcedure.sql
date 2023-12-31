/****** Object:  StoredProcedure [dbo].[sp_InsertError]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 09/08/2017
-- Description:	Error Log Insert
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertError](
	@errorcode varchar(25),
	@errordescription varchar(max),
	@errorsource varchar(100),
	@errormodule varchar(100),
	@errorsubroutine varchar(100),
	@errordate date,
	@errortime time
)
AS
BEGIN
	Insert into errorlogs
	Select @errorcode,@errordescription,@errorsource,@errormodule,@errorsubroutine,@errordate,@errortime
END
GO

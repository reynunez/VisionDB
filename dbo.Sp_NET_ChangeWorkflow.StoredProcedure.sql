/****** Object:  StoredProcedure [dbo].[Sp_NET_ChangeWorkflow]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2021-01-17>
-- Description:	Change Appointments Workflow
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_ChangeWorkflow] 
	@appmt_no integer, 
	@workflow varchar(50)
AS
BEGIN
	Update dbo.appointment
	set workflow = @workflow
	where appmt_no = @appmt_no

END
GO

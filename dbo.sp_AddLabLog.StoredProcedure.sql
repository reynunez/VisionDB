/****** Object:  StoredProcedure [dbo].[sp_AddLabLog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 9/11/2015
-- Description:	Lab Files logs
-- =============================================
CREATE procedure [dbo].[sp_AddLabLog](
	@filename varchar(50),
	@contents text,
	@ishold bit = 0
)
as
begin tran
	insert into lablog(
		createdate,
		filename,
		contents,
		ishold,
		movedate
		)
	values(
		dateadd(hour,-4,getdate()),
		@filename,
		@contents,
		@ishold,
		null
		)	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

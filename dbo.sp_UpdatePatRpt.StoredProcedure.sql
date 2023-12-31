/****** Object:  StoredProcedure [dbo].[sp_UpdatePatRpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_UpdatePatRpt](
	@preportid int,
	@handc smallint,
	@sendbym smallint,
	@sendbyf smallint,
	@toname char(45),
	@fordesc char(45),
	@rptdate datetime,
	@history text,
	@findings text,
	@disposition text,
	@toffyes smallint,
	@toffno smallint,
	@returndate datetime,
	@nextapp smallint,
	@emergency smallint,
	@urgent smallint,
	@routine smallint
)
as
begin tran
	
	update patientrpt set
		handc = @handc,
		sendbym = @sendbym,
		sendbyf = @sendbyf,
		toname = @toname,
		fordesc = @fordesc,
		rptdate = @rptdate,
		history = @history,
		findings = @findings,
		disposition = @disposition,
		toffyes = @toffyes,
		toffno = @toffno,
		returndate = @returndate,
		nextapp = @nextapp,
		emergency = @emergency,
		urgent = @urgent,
		routine = @routine
	where preportid = @preportid

	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

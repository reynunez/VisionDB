/****** Object:  StoredProcedure [dbo].[sp_AddPatRpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AddPatRpt](
	@patient_no int,
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
	
	insert into patientrpt(
		patient_no,
		handc ,
		sendbym,
		sendbyf,
		toname,
		fordesc,
		rptdate,
		history ,
		findings,
		disposition,
		toffyes,
		toffno,
		returndate,
		nextapp,
		emergency,
		urgent,
		routine
		)
	values(
		@patient_no,
		@handc ,
		@sendbym,
		@sendbyf,
		@toname,
		@fordesc,
		@rptdate,
		@history ,
		@findings,
		@disposition,
		@toffyes,
		@toffno,
		@returndate,
		@nextapp,
		@emergency,
		@urgent,
		@routine
		)	

	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

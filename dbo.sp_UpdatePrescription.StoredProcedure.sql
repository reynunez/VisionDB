/****** Object:  StoredProcedure [dbo].[sp_UpdatePrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_UpdatePrescription](
	@rxnumber int,
	@rxtype int,
	@lsph numeric(18,2),
	@lcyl numeric(18,2),
	@laxis numeric(18,2),
	@lbasec numeric(18,2),
	@ldiameter numeric(18,2),
	@rsph numeric(18,2),
	@rcyl numeric(18,2),
	@raxis numeric(18,2),
	@rbasec numeric(18,2),
	@rdiameter numeric(18,2),
	@sv smallint,	
	@bf smallint,
	@prog smallint,
	@uv smallint,
	@scratchc smallint,
	@antiref smallint,
	@polishe smallint,
	@ploycarb smallint,
	@highidx smallint,
	@cldesc char(45),
	@rxdate datetime,
	@refill smallint,
	@refillqty smallint,
	@voidafter datetime,
	@sufficient smallint,
	@eyedescr char(12),
	@eyedescl char(12),
	@addr char(10) = '',
	@addl char(10) = '',
	@otherr varchar(50) = '',
	@otherl varchar(50)= '',
	@pd1 varchar(10) = '',
	@pd2 varchar(10) = ''
)
as
begin tran
	update prescription set
		rxtype = @rxtype,
		lsph = @lsph,
		lcyl = @lcyl, 
		laxis = @laxis,
		lbasec = @lbasec, 
		ldiameter = @ldiameter,
		rsph = @rsph, 
		rcyl = @rcyl, 
		raxis = @raxis, 
		rbasec = @rbasec, 
		rdiameter = @rdiameter,
		sv = @sv, 
		bf = @bf, 
		prog = @prog,
		uv = @uv, 
		scratchc = @scratchc,
		antiref = @antiref, 
		polishe = @polishe, 
		ploycarb = @ploycarb,
		highidx = @highidx, 
		cldesc = @cldesc, 
		rxdate = @rxdate,
		refill = @refill, 
		refillqty = @refillqty,
		voidafter = @voidafter,
		sufficient = @sufficient,
		eyedescr = @eyedescr,
		eyedescl = @eyedescl,
		addr = @addr,
		addl = @addl,
		otherr = @otherr,
		otherl = @otherl,
		pd1 = @pd1,
		pd2 = @pd2
	where rxnumber = @rxnumber
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

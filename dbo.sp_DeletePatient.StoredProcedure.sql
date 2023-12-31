/****** Object:  StoredProcedure [dbo].[sp_DeletePatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Procedure [dbo].[sp_DeletePatient](
	@patient_no int
)
As
declare @ThisDate datetime
select @ThisDate = DATEADD(hh,-5,getdate())
begin tran
	delete from patient
	where patient_no = @patient_no
		
	if @@error <> 0 begin
		rollback tran
	end
	
	delete from address 
	where patient_no = @patient_no
	
	if @@error <> 0 begin
		rollback tran
	end
	
	delete from patient_insurances
	where patient_no = @patient_no
	
	if @@error <> 0 begin
		rollback tran
	end
	
commit tran
GO

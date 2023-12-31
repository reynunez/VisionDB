/****** Object:  StoredProcedure [dbo].[sp_AddReferral]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12-21-14
-- Description:	Referrals Add Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddReferral] 
	@doctorselection varchar(1000),
	@patient_no int ,
	@patientinfo varchar(1000) ,
	@createdby int ,
	@disposition text ,
	@reason text,
	@drname varchar(100) ,
	@drnumber int,
	@drfax varchar(20)
AS
BEGIN
	Insert into dbo.referrals(doctorselection,patient_no,patientinfo,createdby,disposition,reason,datecreated,drname,drnumber,drfax)
	Values(@doctorselection,@patient_no,@patientinfo,@createdby,@disposition,@reason,dateadd(Hh,-5,current_timestamp),@drname,@drnumber,@drfax)
END
GO

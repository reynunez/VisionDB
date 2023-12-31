/****** Object:  StoredProcedure [dbo].[sp_CreatePrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/19/2010
-- Description:	Create the Prescription Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreatePrescription](
	@presctype int,
	@patient_no int,
	@doctor varchar(65),
	@license varchar(20),
	@officeid int = NULL
)
AS
	Declare @orderprefix varchar(10)
	set @orderprefix = (Select top 1 orderprefix from office where officeid = @officeid)
	Insert into prescheader(presctype,patient_no,prescdate,doctor,license,officeid,orderprefix)
	Values(@presctype,@patient_no,dateadd(hh,-5,Getdate()),@doctor,@license,@officeid,@orderprefix)

	Select prescid from prescheader order by prescid desc
GO

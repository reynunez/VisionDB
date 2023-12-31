/****** Object:  StoredProcedure [dbo].[sp_NET_InsertPrescHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/30/2010
-- Description:	Create Presc Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertPrescHeader](
	@patient_no int,
	@presctype int,
	@doctor varchar(65),
	@license varchar(20),
	@officeid int = NULL
)
AS
	BEGIN

    SET NOCOUNT ON;

	DECLARE @prescid int

	Insert into prescheader(presctype,patient_no,prescdate,doctor,license,officeid,orderprefix)
	Values(@presctype,@patient_no,DATEADD(hh,-5,getdate()),@doctor,@license,@officeid,null);

	Select TOP 1 @prescid = prescid from prescheader order by prescid desc;

	Select @prescid as prescriptionid;

	END
GO

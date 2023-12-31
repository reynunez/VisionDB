/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertPreAppointment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      REynaldo Nunez
-- Create Date: 07/28/2022
-- Description: Appointment UpSert Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertPreAppointment]
(
	@pre_appmt_no INT,
	@patient_no INT, 
	@appmtdate SMALLDATETIME, 
	@appmttime VARCHAR(20),
	@appmtlocation INT, 
	@appmtreason INT, 
	@is_cancel BIT, 
	@is_resched BIT, 
	@insurance_no INT
)
AS
BEGIN

    SET NOCOUNT ON
	DECLARE @ADDNOTES VARCHAR(MAX)

	IF @pre_appmt_no = 0 BEGIN
			 insert into preappointment(patient_no, 
					appmtdate, 
					appmttime,
					appmtlocation, 
					appmtreason, 
					createdate, 
					is_cancel, 
					is_resched, 
					insurance_no,
					is_converted
				   )
				Values( @patient_no,
				  @appmtdate,
				  @appmttime,
				  @appmtlocation,
				  @appmtreason,
				  DATEADD(hh,-5,getdate()),
				  @is_cancel, 
				  @is_resched, 
				  @insurance_no ,
				  0
				  );

		END
		ELSE BEGIN


			UPDATE preappointment
			SET	  appmtdate = @appmtdate,
				  appmttime = @appmttime,
				  appmtlocation = @appmtlocation,
				  appmtreason = @appmtreason,
				  is_cancel = @is_cancel,
				  is_resched = @is_resched,
				  insurance_no = @insurance_no
			WHERE pre_appmt_no = @pre_appmt_no;

		END
END
GO

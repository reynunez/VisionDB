/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertAppointment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      REynaldo Nunez
-- Create Date: 08/06/2020
-- Description: Appointment UpSert Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertAppointment]
(
	@appmt_no INT = 0,
	@patient_no INT, 
	@appmtdoctor INT, 
	@appmtdate SMALLDATETIME, 
	@appmttime VARCHAR (20), 
	@appmtlocation INT, 
	@appmtreason INT, 
	@offduty VARCHAR (10)='', 
	@returntowork SMALLDATETIME = null, 
	@letterto VARCHAR (50) = '', 
	@note VARCHAR (255) = '', 
	@salesmanid INT,
	@isWalkin bit = 0,
	@insurance_no INT,
	@ins_authorization VARCHAR(45) = '',
	@ins_benefits VARCHAR(45) = '',
	@billingprov VARCHAR(100) = '',
	@locationname VARCHAR(100) = '',
	@insurance_name  VARCHAR(100) = '',
	@username varchar(100) = '',
	@workflow varchar(50) = 'noshow'
)
AS
BEGIN

    SET NOCOUNT ON
	DECLARE @ADDNOTES VARCHAR(MAX)

	IF @appmt_no = 0 BEGIN
			 insert into appointment(patient_no,
				   appmtdoctor,
				   appmtdate,
				   appmttime,
				   appmtlocation,
				   appmtreason,
				   offduty,
				   returntowork,
				   letterto,
				   note,
				   salesmanid,
				   createdate,
				   isWalkin,
				   insurance_no ,
				   ins_authorization,
				   ins_benefits,
				   billingprov,
				   locationname,
				   insurance_name,
				   username,
				   workflow,
				   DATE_CREATED 
				   )
				Values( @patient_no,
				  @appmtdoctor,
				  @appmtdate,
				  @appmttime,
				  @appmtlocation,
				  @appmtreason,
				  @offduty,
				  @returntowork,
				  @letterto,
				  @note,
				  @salesmanid,
				  DATEADD(hh,-5,getdate()),
				  @isWalkin,
				  @insurance_no ,
				  @ins_authorization,
				  @ins_benefits,
				  @billingprov,
				  @locationname,
				  @insurance_name,
				  @username,
				  @workflow,
				  DATEADD(hh,-5,getdate())
				  );

				SELECT @ADDNOTES = NOTES FROM PATIENT WHERE patient_no = @patient_no 
				SET @ADDNOTES = @ADDNOTES + CHAR(13) + CHAR(10) +
								'---- NEW APPOINTMENT --------------------------------' +  CHAR(13) + CHAR(10) +
								'DATE:' + CAST(@appmtdate AS VARCHAR(12)) + ' TIME:' + @appmttime  +  CHAR(13) + CHAR(10) +
								'NOTE:' + @note +  CHAR(13) + CHAR(10) +
								'---- END NEW APPOINTMENT -----------------------------';

				UPDATE PATIENT SET NOTES = LTRIM(RTRIM(@ADDNOTES)) WHERE patient_no = @patient_no ;

		END
		ELSE BEGIN


			UPDATE appointment
			SET	  appmtdoctor = @appmtdoctor,
				  appmtdate = @appmtdate,
				  appmttime = @appmttime,
				  appmtlocation = @appmtlocation,
				  appmtreason = @appmtreason,
				  offduty = @offduty,
				  returntowork = @returntowork,
				  letterto = @letterto,
				  note = @note,
				  salesmanid = @salesmanid,
				  isWalkin = @isWalkin,
				  insurance_no = @insurance_no ,
				  ins_authorization = @ins_authorization,
				  ins_benefits = @ins_benefits,
				  billingprov = @billingprov,
				  locationname = @locationname ,
				  insurance_name = @insurance_name,
				  username = @username
			WHERE appmt_no = @appmt_no;

				SELECT @ADDNOTES = NOTES FROM PATIENT WHERE patient_no = @patient_no 
				SET @ADDNOTES = @ADDNOTES + CHAR(13) + CHAR(10) +
								'---- NEW APPOINTMENT --------------------------------' +  CHAR(13) + CHAR(10) +
								'DATE:' + CAST(@appmtdate AS VARCHAR(12)) + ' TIME:' + @appmttime  +  CHAR(13) + CHAR(10) +
								'NOTE:' + @note +  CHAR(13) + CHAR(10) +
								'---- END NEW APPOINTMENT -----------------------------';

				UPDATE PATIENT SET NOTES = LTRIM(RTRIM(@ADDNOTES)) WHERE patient_no = @patient_no;

		END
END
GO

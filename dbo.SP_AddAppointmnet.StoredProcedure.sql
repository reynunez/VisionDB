/****** Object:  StoredProcedure [dbo].[SP_AddAppointmnet]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AddAppointmnet]
	@patient_no INT, 
	@appmtdoctor INT, 
	@appmtdate SMALLDATETIME, 
	@appmttime VARCHAR (20), 
	@appmtlocation INT, 
	@appmtreason INT, 
	@offduty VARCHAR (10)='', 
	@returntowork SMALLDATETIME=null, 
	@letterto VARCHAR (50)='', 
	@note VARCHAR (255)='', 
	@salesmanid INT,
	@isWalkin bit = 0
AS
BEGIN

 declare @cDate smalldatetime
 set @cDate = convert(varchar(10),dateadd(hh,-5,Getdate()),101)


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
	   isWalkin
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
      @cDate,
	  @isWalkin
      )
END
GO

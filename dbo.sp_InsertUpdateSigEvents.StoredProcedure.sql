/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateSigEvents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertUpdateSigEvents]
@eventseq INT=0, 
@eventid INT, 
@eventdate DATETIME, 
@patient_no INT, 
@orderinfo NVARCHAR (200)=null,
@sigtype INT=0
AS
BEGIN
 IF (@eventseq = 0) BEGIN
  INSERT INTO dbo.SignatureEvents(eventid,
          eventdate,
          patient_no,
          orderinfo,
		  sigtype 
          )
  VALUES( @eventid,
    @eventdate,
    @patient_no,
    @orderinfo,
	@sigtype
    )
 END
 ELSE BEGIN
  UPDATE dbo.SignatureEvents
  SET eventid = @eventid,
   eventdate = @eventdate,
   patient_no = @patient_no,
   orderinfo = @orderinfo
  WHERE eventseq = @eventseq

 END

 Exec sp_LastVisitRecorded @patient_no

END
GO

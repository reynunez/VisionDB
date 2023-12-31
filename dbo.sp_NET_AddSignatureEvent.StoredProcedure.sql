/****** Object:  StoredProcedure [dbo].[sp_NET_AddSignatureEvent]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez	
-- Create Date: 06/26/2020
-- Description: Add Events Signatures
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_AddSignatureEvent]
(
	@eventid INT, 
	@patient_no INT, 
	@orderinfo NVARCHAR (200)=null,
	@sigDocument varchar(100),
	@sigtype INT=0
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	  INSERT INTO dbo.SignatureEvents(
			  eventid,
			  eventdate,
			  patient_no,
			  orderinfo,
			  sigDocument,
			  sigtype 
			  )
	  VALUES( 
		@eventid,
		DATEADD(hh,-5,getdate()),
		@patient_no,
		@orderinfo,
		@sigDocument,
		@sigtype
		)

END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_InsertEncProcedures]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/08/2020
-- Description:Get EMR Script
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertEncProcedures](
	@patientid integer,
	@appointmentid integer,
	@class varchar(50),
	@cptcode varchar(50),
	@cptmodifier varchar(50),
	@cptmodifier2 varchar(50),
	@cptdescription varchar(200),
	@cptfee numeric(18,2)
)
AS
BEGIN

		SET NOCOUNT ON

		IF NOT EXISTS(	SELECT * 
					FROM encounterprocedures 
					WHERE class = @class 
						  AND cptcode = @cptcode
						  AND cptmodifier = @cptmodifier
						  AND cptmodifier = @cptmodifier2
						  AND patientid = @patientid
					) BEGIN

			INSERT INTO encounterprocedures(
									patientid,
									encounterdate,
									appointmentid,
									class,
									cptcode,
									cptmodifier,
									cptmodifier2,
									cptdescription,
									fee
									)
			VALUES(
									@patientid,
									DATEADD(hour,-5,GETDATE()),
									@appointmentid,
									@class,
									@cptcode,
									@cptmodifier,
									@cptmodifier2,
									@cptdescription,
									@cptfee
									)
		END
END
GO

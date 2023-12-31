/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateConfig]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 12/18/2020
-- Description:Update Program Config Values
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateConfig]
(
	@EMAIL_Login VARCHAR(100),
	@EMAIL_Password VARCHAR(25),
	@EMAIL_Address VARCHAR(250),
	@EMAIL_Outgoing VARCHAR(100),
	@EMAIL_Incoming VARCHAR(100),
	@EMAIL_Port INT,
	@LAB_McledFolder VARCHAR(250),
	@INV_Tax NUMERIC(18,2),
	@SMSUSER VARCHAR(50),
	@SMSKEY VARCHAR(50),
	@SMSORDER VARCHAR(MAX),
	@SMSAPPMT VARCHAR(MAX),
	@ORTHOKEMAIL VARCHAR(MAX),
	@PROMOEMAIL VARCHAR(MAX),
	@BILLING_PROV VARCHAR(120),
	@RENDERING_PROV VARCHAR(120),
	@REFERRING_PROV VARCHAR(120),
	@ST_PRIMNUM VARCHAR(50),
	@ST_TOKEN VARCHAR(50),
	@ST_ORDERMSG VARCHAR(MAX),
	@ST_APPMSG VARCHAR(MAX)
)
AS

BEGIN
		UPDATE APP_CONFIG
		SET EMAIL_Login = @EMAIL_Login,
			EMAIL_Password = @EMAIL_Password,
			EMAIL_Address = @EMAIL_Address,
			EMAIL_Outgoing = @EMAIL_Outgoing,
			EMAIL_Incoming = @EMAIL_Incoming,
			EMAIL_Port = @EMAIL_Port,
			LAB_McledFolder = @LAB_McledFolder,
			INV_Tax = @INV_Tax,
			SMSUSER = @SMSUSER,
			SMSKEY = @SMSKEY,
			SMSORDER = @SMSORDER ,
			SMSAPPMT = @SMSAPPMT ,
			ORTHOKEMAIL = @ORTHOKEMAIL,
			PROMOEMAIL = @PROMOEMAIL,
			BILLING_PROV = @BILLING_PROV,
			RENDERING_PROV = @RENDERING_PROV,
			REFERRING_PROV = @REFERRING_PROV,
			ST_PRIMNUM = @ST_PRIMNUM,
			ST_TOKEN = @ST_TOKEN,
			ST_ORDERMSG = @ST_ORDERMSG,
			ST_APPMSG = @ST_APPMSG
		WHERE configid = 1
END
GO

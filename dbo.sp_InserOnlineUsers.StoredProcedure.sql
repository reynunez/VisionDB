/****** Object:  StoredProcedure [dbo].[sp_InserOnlineUsers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: Janurary 13, 2017
-- Description:	Online VOM security adding users
-- =============================================
CREATE PROCEDURE [dbo].[sp_InserOnlineUsers] 
	@username varchar(65),
	@userlogin varchar(35),
	@userreference varchar(20),
	@app_001 bit = 0,
	@app_002 bit = 0,
	@app_003 bit = 0,
	@app_004 bit = 0,
	@app_005 bit = 0,
	@app_006 bit = 0,
	@app_007 bit = 0,
	@orders_001 bit = 0,
	@orders_002 bit = 0,
	@orders_003 bit = 0,
	@orders_004 bit = 0,
	@patients varchar(100) = 'All',
	@inventory_001 bit = 0,
	@reports_001 bit = 0,
	@reports_002 bit = 0,
	@pat_001 bit = 0,
	@pat_002 bit = 0,
	@pat_003 bit = 0,
	@pat_004 bit = 0,
	@pat_005 bit = 0,
	@pat_006 bit = 0,
	@pat_007 bit = 0,
	@pat_008 bit = 0,
	@isActive bit = 1,
	@position varchar(100) = '',
	@location varchar(100) = ''
AS
BEGIN
	Insert into onlinereference
	Select dbo.EncryptString(@username,79) as username,
			dbo.EncryptString(@userlogin,76) as userlogin,
			dbo.EncryptString(@userreference,82) as userreference,
			null as logintime,
			@app_001 as app_001,
			@app_002 as app_002,
			@app_003 as app_003,
			@app_004 as app_004,
			@app_005 as app_005,
			@app_006 as app_006,
			@app_007 as app_007,
			@orders_001 as orders_001,
			@orders_002 as orders_002,
			@orders_003 as orders_003,
			@orders_004 as orders_004,
			@patients as patients,
			@inventory_001 as inventory_001,
			@reports_001 as reports_001,
			@pat_001 as pat_001,
			@pat_002 as pat_002,
			@pat_003 as pat_003,
			@pat_004 as pat_004,
			@pat_005 as pat_005,
			@pat_006 as pat_006,
			@pat_007 as pat_007,
			@isActive as isActive,
			dbo.EncryptString(@position,85) as position,
			dbo.EncryptString(@location,85) as location,
			@reports_002 as reports_002,
			@pat_008 as pat_008
		  ;
END
GO

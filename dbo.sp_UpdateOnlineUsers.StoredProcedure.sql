/****** Object:  StoredProcedure [dbo].[sp_UpdateOnlineUsers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: Janurary 21, 2017
-- Description:	Online VOM security updating users
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateOnlineUsers] 
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
	@location varchar(100) = '',
	@id integer
As
BEGIN
	Update dbo.onlinereference
	Set		userlogin = dbo.EncryptString(@userlogin,76) ,
			userreference = dbo.EncryptString(@userreference,82) ,
			app_001 = @app_001,
			app_002 = @app_002,
			app_003 = @app_003,
			app_004 = @app_004,
			app_005 = @app_005,
			app_006 = @app_006,
			app_007 = @app_007,
			orders_001 = @orders_001,
			orders_002 = @orders_002,
			orders_003 = @orders_003,
			orders_004 = @orders_004,
			patients = @patients,
			inventory_001 = @inventory_001,
			reports_001 = @reports_001,
			reports_002 = @reports_002,
			pat_001 = @pat_001,
			pat_002 = @pat_002,
			pat_003 = @pat_003,
			pat_004 = @pat_004,
			pat_005 = @pat_005,
			pat_006 = @pat_006,
			pat_007 = @pat_007,
			pat_008 = @pat_008,
			isActive = @isActive,
			position = dbo.EncryptString(@position,85) ,
			location = dbo.EncryptString(@location, 85)
		Where id = @id
		  ;
END
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertOnlineCLOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/26.2016
-- Description:	Create Online Orders Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertOnlineCLOrder](
-- Main Order Parameters
--=======================
	@ordertype int,
	@patient_no int,
	@ordertotal decimal(8,2),
	@orderdetails varchar(2000) = '',
	@officeID int,
	@orderstatus int = 1,
	@userid int = 0,
	@olorder int,
	@olnotes text,
	@tray varchar(20)='',
	@presc_id int = 0,
--- Prescription Details Right Eye
--==================================
	@rlensStatus varchar(10)='',
	@rEye varchar(10)='',
	@rManufacturer varchar(65)='',
	@rlensName varchar(65)='',
	@rLenstype varchar(50)='',
	@rColor varchar(50)='',
	@rSph numeric(8, 2) = 0,
	@rCyl numeric(8, 2) = 0,
	@rAxis smallint = 0,
	@rAddition numeric(8, 2) = 0,
	@rBC numeric(8, 2) = 0,
	@rUPCC varchar(25)='',
	@rsufamt bit=0,
	@rvoidafter datetime='',
	@rrefills bit=0,
	@rrefillsamt smallint=0,
	@rcomments nvarchar(4000)='',
	@ror varchar(30) = NULL,
	@rVclrdva varchar(10) = NULL,
	@rVclrnva varchar(10) = NULL,
	@rVclldva varchar(10) = NULL,
	@rVcllnva varchar(10) = NULL,
	@rVorrdva varchar(10) = NULL,
	@rVorrnva varchar(10) = NULL,
	@rVorldva varchar(10) = NULL,
	@rVorlnva varchar(10) = NULL,
	@rkr001 numeric(8, 2) = NULL,
	@rkr002 numeric(8, 2) = NULL,
	@rkr003 numeric(8, 2) = NULL,
	@rkl001 numeric(8, 2) = NULL,
	@rkl002 numeric(8, 2) = NULL,
	@rkl003 numeric(8, 2) = NULL,
	@rpresctype varchar(50) = NULL,
	@ror2 varchar(30) = NULL,
--- Prescription Details Left Eye
--==================================
	@llensStatus varchar(10)='',
	@lEye varchar(10)='',
	@lManufacturer varchar(65)='',
	@llensName varchar(65)='',
	@lLenstype varchar(50)='',
	@lColor varchar(50)='',
	@lSph numeric(8, 2) = 0,
	@lCyl numeric(8, 2) = 0,
	@lAxis smallint = 0,
	@lAddition numeric(8, 2) = 0,
	@lBC numeric(8, 2) = 0,
	@lUPCC varchar(25)='',
	@lsufamt bit=0,
	@lvoidafter datetime='',
	@lrefills bit=0,
	@lrefillsamt smallint=0,
	@lcomments nvarchar(4000)='',
	@lor varchar(30) = NULL,
	@lVclrdva varchar(10) = NULL,
	@lVclrnva varchar(10) = NULL,
	@lVclldva varchar(10) = NULL,
	@lVcllnva varchar(10) = NULL,
	@lVorrdva varchar(10) = NULL,
	@lVorrnva varchar(10) = NULL,
	@lVorldva varchar(10) = NULL,
	@lVorlnva varchar(10) = NULL,
	@lkr001 numeric(8, 2) = NULL,
	@lkr002 numeric(8, 2) = NULL,
	@lkr003 numeric(8, 2) = NULL,
	@lkl001 numeric(8, 2) = NULL,
	@lkl002 numeric(8, 2) = NULL,
	@lkl003 numeric(8, 2) = NULL,
	@lpresctype varchar(50) = NULL,
	@lor2 varchar(30) = NULL,
-- Order Details Right Eye
--=======================
	@rstatus varchar(10)='',
	@reye2 varchar(10)='',
	@rmanufacturer2 varchar(65)='',
	@rname varchar(65)='',
	@rlenstype2 varchar(50)='',
	@rcolor2 varchar(50)='',
	@rsph2 Numeric(8, 2) = 0,
	@rcyl2 Numeric(8, 2) = 0,
	@raxis2 smallint = 0,
	@raddition2 Numeric(8, 2) = 0,
	@rBC2 Numeric(8, 2) = 0,
	@rUPCC2 nvarchar(25)='',
	@rQty smallint = 0,
	@rprice Numeric(18, 2)  = 0,
	@rcost Numeric(18, 2)  = 0,
-- Order Details Right Eye
--=======================
	@lstatus varchar(10)='',
	@leye2 varchar(10)='',
	@lmanufacturer2 varchar(65)='',
	@lname varchar(65)='',
	@llenstype2 varchar(50)='',
	@lcolor2 varchar(50)='',
	@lsph2 Numeric(8, 2) = 0,
	@lcyl2 Numeric(8, 2) = 0,
	@laxis2 smallint = 0,
	@laddition2 Numeric(8, 2) = 0,
	@lBC2 Numeric(8, 2) = 0,
	@lUPCC2 nvarchar(25)='',
	@lQty smallint = 0,
	@lprice Numeric(18, 2)  = 0,
	@lcost Numeric(18, 2)  = 0
)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @trancount int;
	SET @trancount = @@trancount;
BEGIN TRY
    IF @trancount = 0
      BEGIN TRANSACTION
    ELSE
      SAVE TRANSACTION sp_InsertOnlineOphOrder
	  ;

	-- Prescription
	declare @prescid int,
			@orderprefix varchar(5)
	;
			
	Select @orderprefix = orderprefix from office where officeid = @officeID
	;
	
	if @presc_id = 0
	Insert into prescheader(presctype,patient_no,prescdate,doctor,license,officeid,orderprefix)
	Values(1,@patient_no,dateadd(hh,-5,Getdate()),1,'',@officeID,@orderprefix)
	;
	
	if @presc_id = 0
	Select top 1 @prescid = prescid from prescheader order by prescid desc
	;

	if @presc_id <> 0
	Set @prescid = @presc_id
	;
	---------------------------------------------------------------------------------------------

	-- Prescription Details Right Eye
	if ((@presc_id = 0) and (@rlensName <> '') )
			Insert into prescCL(prescid,lensStatus,Eye,Manufacturer,lensName,Lenstype,Color,Sph,Cyl,Axis,Addition,BC,UPCC,sufamt,voidafter,refills,refillsamt,comments,[or],or2,Vclrdva,Vclrnva,Vclldva,Vcllnva,Vorrdva,Vorrnva,Vorldva,Vorlnva,kr001,kr002,kr003,kl001,kl002,kl003,presctype )
			Values(@prescid,@rlensStatus,@rEye,@rManufacturer,@rlensName,@rLenstype,@rColor,@rSph,@rCyl,@rAxis,@rAddition,@rBC,@rUPCC,@rsufamt,@rvoidafter,@rrefills,@rrefillsamt,@rcomments,@ror,@ror2,@rVclrdva,@rVclrnva,@rVclldva,@rVcllnva,@rVorrdva,@rVorrnva,@rVorldva,@rVorlnva,@rkr001,@rkr002,@rkr003,@rkl001,@rkl002,@rkl003,@rpresctype )
	;
	-- Prescription Details Left Eye
	if ((@presc_id = 0) and (@LlensName <> '' ))
			Insert into prescCL(prescid,lensStatus,Eye,Manufacturer,lensName,Lenstype,Color,Sph,Cyl,Axis,Addition,BC,UPCC,sufamt,voidafter,refills,refillsamt,comments,[or],or2,Vclrdva,Vclrnva,Vclldva,Vcllnva,Vorrdva,Vorrnva,Vorldva,Vorlnva,kr001,kr002,kr003,kl001,kl002,kl003,presctype )
			Values(@prescid,@llensStatus,@lEye,@lManufacturer,@llensName,@lLenstype,@lColor,@lSph,@lCyl,@lAxis,@lAddition,@lBC,@lUPCC,@lsufamt,@lvoidafter,@lrefills,@lrefillsamt,@lcomments,@lor,@lor2,@lVclrdva,@lVclrnva,@lVclldva,@lVcllnva,@lVorrdva,@lVorrnva,@lVorldva,@lVorlnva,@lkr001,@lkr002,@lkr003,@lkl001,@lkl002,@lkl003,@lpresctype )
	;
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- Create Main Order
	declare @orderdate datetime,
			@orderid integer;

	set @orderdate = dateadd(hh,-5,Getdate());

	Insert into Orders(ordertype,orderdate,patient_no,ordertotal,orderstatus,orderdetails,officeid,userid,olorder,comments,tray,vomonline)
	Values(@ordertype,@orderdate,@patient_no,@ordertotal,@orderstatus,@orderdetails,@officeID,@userid,@olorder,@olnotes,@tray,1)
	;

	Select top 1 @orderid = orderid from orders order by orderid desc
	;
	------------------------------------------------------------------------------------------------------------------------------------
	-- Create Order Details Right Eye
	IF @rname <> ''
	Insert into clorders(orderid,status,eye,manufacturer,name,lenstype,color,sph,cyl,axis,addition,BC,UPCC,Qty,price,cost)
	Values(@orderid,@rstatus,@reye2,@rmanufacturer2,@rname,@rlenstype2,@rcolor2,@rsph2,@rcyl2,@raxis2,@raddition2,@rBC2,@rUPCC2,@rQty,@rprice,@rcost)
	;
	-- Create Order Details Left Eye
	IF @Lname <> ''
	Insert into clorders(orderid,status,eye,manufacturer,name,lenstype,color,sph,cyl,axis,addition,BC,UPCC,Qty,price,cost)
	Values(@orderid,@lstatus,@leye2,@lmanufacturer2,@lname,@llenstype2,@lcolor2,@lsph2,@lcyl2,@laxis2,@laddition2,@lBC2,@lUPCC2,@lQty,@lprice,@lcost)
	;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   lbexit:
      IF @trancount = 0
      COMMIT;
	  Select @orderid as order_id,@prescid as prescription_id
END TRY
BEGIN CATCH
DECLARE @error int,
        @message varchar(4000),
        @xstate int;

    SELECT
      @error = ERROR_NUMBER(),
      @message = ERROR_MESSAGE(),
      @xstate = XACT_STATE();

    IF @xstate = -1
      ROLLBACK;
    IF @xstate = 1 AND @trancount = 0
      ROLLBACK
    IF @xstate = 1 AND @trancount > 0
      ROLLBACK TRANSACTION sp_InsertOnlineOphOrder;

    RAISERROR ('sp_InsertOnlineCLOrder: %d: %s', 16, 1, @error, @message);
END CATCH
END
GO

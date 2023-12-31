/****** Object:  StoredProcedure [dbo].[sp_InsertOnlineOphOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 11/22.2016
-- Description:	Create Online Orders Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertOnlineOphOrder](
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
-- Insert Lab Lens  Orders Parameters
--==============================
	@lenstype varchar(50),
	@manufacturer varchar(65),
	@name varchar(65),
	@material varchar(65),
	@price decimal(18, 2),
	@style varchar(20) = '',
	@lind numeric(18,2) = 0,
	@cost decimal(18, 2) = 0,
	-- Insert Stock Frames Order Details
	--==================================
	@type nvarchar(50),
	@manufacturer2 varchar(65),
	@model nvarchar(65),
	@color nvarchar(50),
	@A decimal(8,2) = 0,
	@dbl decimal(8,2) = 0,
	@B decimal(8,2) = 0,
	@ED decimal(18,2) = 0,
	@Temple decimal(8,2) = 0,
	@Price2 decimal(18,2) = 0,
	@ordertype2 nvarchar(50) = '',
	@jobtype nvarchar(50) = '',
	@dbc decimal(8, 2)=0,
	@dec decimal(8, 2)=0,
	@mbs decimal(8, 2)=0,
	@eye2 int = 0,
	@circunference decimal(8, 2)=0,
	@colorcode nvarchar(35)='',
	@collectionname nvarchar(50)='',
	@frameshape nvarchar(50)='',
	@material2 nvarchar(50)='',
	@rimtype nvarchar(50)='',
	@havecase bit=0,
	@upc nvarchar(20) = '',
	@ToOrder bit = 0,
	@fpcID nvarchar(14) = '',
	@cost2 decimal(18,2) =0,
	-- Prescription
	--================
	@nsphr numeric(8, 2) = 0,
	@nsphl numeric(8, 2) = 0,
	@ncylr numeric(8, 2) = 0,
	@ncyll numeric(8, 2) = 0,
	@nAxisr smallint = 0,
	@nAxisl smallint = 0,
	@nAddr numeric(8, 2) = 0,
	@nAddl numeric(8, 2) = 0,
	@nDistpdr numeric(8, 2) = 0,
	@nDistpdl numeric(8, 2) = 0,
	@nNearpdr numeric(8, 2) = 0,
	@nNearpdl numeric(8, 2) = 0,
	@nPrism1r numeric(8, 2) = 0,
	@nPrism1l numeric(8, 2) = 0,
	@nPrism2r numeric(8, 2) = 0,
	@nPrism2l numeric(8, 2) = 0,
	@nBase1r varchar(15) = '',
	@nBase1l varchar(15) = '',
	@nBase2r varchar(15) = '',
	@nBase2l varchar(15) = '',
	@nUsage varchar(50) = '',
	@nLenstype varchar(50) = '',
	@nsufamt bit = 0,
	@nvoidafter datetime,
	@nrefills bit = 0,
	@nrefillsamt smallint = 0,
	@ncomments Nvarchar(4000) = '',
	@nvsrdva varchar(10) = NULL,
	@nvsrnva varchar(10)=  NULL,
	@nvsldva varchar(10) = NULL,
	@nvslnva varchar(10) = NULL,
	@nvcrdva varchar(10) = NULL,
	@nvcrnva varchar(10) = NULL,
	@nvcldva varchar(10) = NULL,
	@nvclnva varchar(10) = NULL,
	@nkr001 numeric(8, 2) = NULL,
	@nkr002 numeric(8, 2) = NULL,
	@nkr003 numeric(8, 2) = NULL,
	@nkl001 numeric(8, 2) = NULL,
	@nkl002 numeric(8, 2) = NULL,
	@nkl003 numeric(8, 2) = NULL,
	@npresctype varchar(50) = NULL,
	@nrHOA varchar(10) = NULL,
	@nlHOA varchar(10) = NULL,
	-- Order Details
	--=================
	@osphr Numeric(8, 2) = 0,
	@osphl Numeric(8, 2) = 0,
	@ocylr Numeric(8, 2) = 0,
	@ocyll Numeric(8, 2) = 0,
	@oaxisr smallint  = 0,
	@oaxisl smallint = 0,
	@oaddr Numeric(8, 2) = 0,
	@oaddl Numeric(8, 2) = 0,
	@odistpdr Numeric(8, 2) = 0,
	@odistpdl Numeric(8, 2) = 0,
	@onearpdr Numeric(8, 2) = 0,
	@onearpdl Numeric(8, 2) = 0,
	@oprism1r smallint = 0,
	@oprism1l smallint = 0,
	@obase1r varchar(15) = '',
	@obase1l varchar(15) = '',
	@oprism2r smallint = 0,
	@oprism2l smallint = 0,
	@obase2r varchar(15) = '',
	@obase2l varchar(15) = '',
	@oheightr smallint = 0,
	@oheightl smallint = 0,
	@othicknessr smallint = 0,
	@othicknessl smallint = 0,
	@othicknesstyper varchar(45) = NULL,
	@othicknesstypel varchar(45) = NULL,
	@otreatment1 varchar(250) = NULL,
	@otreatment2 varchar(250) = NULL,
	@otreatment3 varchar(250) = NULL,
	@otreatment4 varchar(250) = NULL,
	@otreatment5 varchar(250) = NULL,
	@otreatment6 varchar(250) = NULL,
	@oprescid varchar(25) = NULL,
	@ousage varchar(50) = NULL

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
	declare	@prescid integer,
			@orderprefix varchar(5);

	Select @orderprefix = orderprefix from office where officeid = @officeID
	;

	Insert into prescheader(presctype,patient_no,prescdate,doctor,license,officeid,orderprefix)
	Values(2,@patient_no,dateadd(hh,-5,Getdate()),1,'',@officeID,@orderprefix)
	;
	Select top 1 @prescid = prescid from prescheader order by prescid desc
	;
	---------------------------------------------------------------------------------------------

	-- Prescription Details
	Insert into prescoph(prescid,sphr,sphl,cylr,cyll,Axisr,Axisl,Addr,Addl,Distpdr,Distpdl,Nearpdr,Nearpdl,Prism1r,Prism1l,Prism2r,Prism2l,Base1r,Base1l,Base2r,Base2l,Usage,Lenstype,sufamt,voidafter,refills,refillsamt,comments,vsrdva,vsrnva,vsldva,vslnva,vcrdva,vcrnva,vcldva,vclnva,kr001,kr002,kr003,kl001,kl002,kl003,presctype,rHOA,lHOA)
	Values(@prescid,@nsphr,@nsphl,@ncylr,@ncyll,@nAxisr,@nAxisl,@nAddr,@nAddl,@nDistpdr,@nDistpdl,@nNearpdr,@nNearpdl,@nPrism1r,@nPrism1l,@nPrism2r,@nPrism2l,@nBase1r,@nBase1l,@nBase2r,@nBase2l,@nUsage,@nLenstype,@nsufamt,@nvoidafter,@nrefills,@nrefillsamt,@ncomments,@nvsrdva,@nvsrnva,@nvsldva,@nvslnva,@nvcrdva,@nvcrnva,@nvcldva,@nvclnva,@nkr001,@nkr002,@nkr003,@nkl001,@nkl002,@nkl003,@npresctype,@nrHOA,@nlHOA)
	;
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- Create Main Order
	declare @orderdate datetime,
			@orderid integer;

	set @orderdate = dateadd(hh,-5,Getdate());

	Insert into Orders(ordertype,orderdate,patient_no,ordertotal,orderstatus,orderdetails,officeid,userid,olorder,olnotes)
	Values(@ordertype,@orderdate,@patient_no,@ordertotal,@orderstatus,@orderdetails,@officeID,@userid,@olorder,@olnotes)
	;

	Select top 1 @orderid = orderid from orders order by orderid desc
	;
	---------------------------------------------------------------------------------------------------------

	-- Lab Lens Orders
	Insert into llorders(orderid,lenstype,manufacturer,name,material,price,cost,style,lind)
	Values(@orderid,@lenstype,@manufacturer,@name,@material,@price,@cost,@style,@lind)
	;
	Insert into llorders(orderid,lenstype,manufacturer,name,material,price,cost,style,lind)
	Values(@orderid,@lenstype,@manufacturer,@name,@material,@price,@cost,@style,@lind)
	;
	------------------------------------------------------------------------------------------------------------------------------------

	-- Stock Frames Orders
	insert into sforders(orderid,type,manufacturer,model,color,A,dbl,B,ED,Temple,Price,ordertype,jobtype,dbc,dec,mbs,eye,circunference,colorcode,collectionname,frameshape,material,rimtype,havecase,upc,toorder,fpcID,cost)
	Values(@orderid,@type,@manufacturer2,@model,@color,@A,@dbl,@B,@ED,@Temple,@Price2,@ordertype2,@jobtype,@dbc,@dec,@mbs,@eye2,@circunference,@colorcode,@collectionname,@frameshape,@material2,@rimtype,@havecase,@upc,@ToOrder,@fpcID,@cost2)
	;
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- Order Details
	Insert into ophorderdetails(orderid,sphr,sphl,cylr,cyll,axisr,axisl,addr,addl,distpdr,distpdl,nearpdr,nearpdl,prism1r,prism1l,base1r,base1l,prism2r,prism2l,base2r,base2l,heightr,heightl,thicknessr,thicknessl,thicknesstyper,thicknesstypel,treatment1,treatment2,treatment3,treatment4,treatment5,treatment6,prescid,usage)
	Values(@orderid,@osphr,@osphl,@ocylr,@ocyll,@oaxisr,@oaxisl,@oaddr,@oaddl,@odistpdr,@odistpdl,@onearpdr,@onearpdl,@oprism1r,@oprism1l,@obase1r,@obase1l,@oprism2r,@oprism2l,@obase2r,@obase2l,@oheightr,@oheightl,@othicknessr,@othicknessl,@othicknesstyper,@othicknesstypel,@otreatment1,@otreatment2,@otreatment3,@otreatment4,@otreatment5,@otreatment6,@oprescid,@ousage)
	;
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
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

    RAISERROR ('sp_InsertOnlineOphOrder: %d: %s', 16, 1, @error, @message);
END CATCH
END
GO

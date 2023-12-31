/****** Object:  StoredProcedure [dbo].[sp_InsertCLPrescRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/19/2010
-- Description:	Contact Lenses Records
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertCLPrescRecord](
	@prescid int,
	@lensStatus varchar(10),
	@Eye varchar(10),
	@Manufacturer varchar(65),
	@lensName varchar(65),
	@Lenstype varchar(50),
	@Color varchar(50),
	@Sph numeric(8, 2) = 0,
	@Cyl numeric(8, 2) = 0,
	@Axis smallint = 0,
	@Addition numeric(8, 2) = 0,
	@BC numeric(8, 2) = 0,
	@UPCC varchar(25),
	@sufamt bit,
	@voidafter datetime,
	@refills bit,
	@refillsamt smallint,
	@comments nvarchar(4000),
	@or varchar(30) = NULL,
	@Vclrdva varchar(10) = NULL,
	@Vclrnva varchar(10) = NULL,
	@Vclldva varchar(10) = NULL,
	@Vcllnva varchar(10) = NULL,
	@Vorrdva varchar(10) = NULL,
	@Vorrnva varchar(10) = NULL,
	@Vorldva varchar(10) = NULL,
	@Vorlnva varchar(10) = NULL,
	@kr001 numeric(8, 2) = NULL,
	@kr002 numeric(8, 2) = NULL,
	@kr003 numeric(8, 2) = NULL,
	@kl001 numeric(8, 2) = NULL,
	@kl002 numeric(8, 2) = NULL,
	@kl003 numeric(8, 2) = NULL,
	@presctype varchar(50) = NULL,
	@or2 varchar(30) = NULL
)
As
	Insert into prescCL(prescid,lensStatus,Eye,Manufacturer,lensName,Lenstype,Color,Sph,Cyl,Axis,Addition,BC,UPCC,sufamt,voidafter,refills,refillsamt,comments,[or],or2,Vclrdva,Vclrnva,Vclldva,Vcllnva,Vorrdva,Vorrnva,Vorldva,Vorlnva,kr001,kr002,kr003,kl001,kl002,kl003,presctype )
	Values(@prescid,@lensStatus,@Eye,@Manufacturer,@lensName,@Lenstype,@Color,@Sph,@Cyl,@Axis,@Addition,@BC,@UPCC,@sufamt,@voidafter,@refills,@refillsamt,@comments,@or,@or2,@Vclrdva,@Vclrnva,@Vclldva,@Vcllnva,@Vorrdva,@Vorrnva,@Vorldva,@Vorlnva,@kr001,@kr002,@kr003,@kl001,@kl002,@kl003,@presctype )
GO

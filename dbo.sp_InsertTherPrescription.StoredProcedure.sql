/****** Object:  StoredProcedure [dbo].[sp_InsertTherPrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/19/2010
-- Description:	Insert Therapeutic Presc Records
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertTherPrescription](
	@prescid int ,
	@tradename varchar(50) ,
	@generic varchar(50) ,
	@manufacturer varchar(65) ,
	@preparation varchar(50) ,
	@howsupplied varchar(50) ,
	@sig varchar(Max) ,
	@suffamt bit ,
	@voidafter datetime ,
	@refills bit ,
	@refillsamt smallint,
	@comments nvarchar(4000)
)
As
	Insert into prescth(prescid,tradename,generic,manufacturer,preparation,howsupplied,sig,suffamt,voidafter,refills,refillsamt,comments)
	Values(@prescid,@tradename,@generic,@manufacturer,@preparation,@howsupplied,@sig,@suffamt,@voidafter,@refills,@refillsamt,@comments)
GO

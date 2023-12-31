/****** Object:  StoredProcedure [dbo].[sp_AddNewOffice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AddNewOffice]
	@description NVARCHAR (50), 
	@busname CHAR (45), 
	@address1 CHAR (45), 
	@address2 CHAR (45), 
	@City CHAR (25), 
	@state CHAR (2), 
	@zip CHAR (10), 
	@sqlserver CHAR (45), 
	@phone CHAR (15), 
	@fax CHAR (15), 
	@orderprefix NVARCHAR (10)=null, 
	@taxid NVARCHAR (20)=null, 
	@voicent NVARCHAR (10)=null,
	@isOperational Bit = 1
AS
begin tran
 insert into office(
  description,
  busname,
  address1,
  address2,
  City,
  state,
  zip,
  sqlserver,
  phone,
  fax,
  orderprefix,
  taxid,
  voicent,
  isOperational)
 Values(
  @description,
  @busname,
  @address1,
  @address2,
  @City,
  @state,
  @zip,
  @sqlserver,
  @phone,
  @fax,
  @orderprefix,
  @taxid,
  @voicent,
  @isOperational)
 if @@error <> 0 begin
  rollback tran
 end
commit tran
GO

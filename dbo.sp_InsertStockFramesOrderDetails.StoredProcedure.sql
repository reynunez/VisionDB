/****** Object:  StoredProcedure [dbo].[sp_InsertStockFramesOrderDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/01/2010
-- Description:	Insert Stock Frame Order Details
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertStockFramesOrderDetails](
	@orderid int,
	@type nvarchar(50),
	@manufacturer varchar(65),
	@model nvarchar(65),
	@color nvarchar(50),
	@A decimal(8,2) = 0,
	@dbl decimal(8,2) = 0,
	@B decimal(8,2) = 0,
	@ED decimal(18,2) = 0,
	@Temple decimal(8,2) = 0,
	@Price decimal(18,2) = 0,
	@ordertype nvarchar(50) = '',
	@jobtype nvarchar(50) = '',
	@dbc decimal(8, 2)=0,
	@dec decimal(8, 2)=0,
	@mbs decimal(8, 2)=0,
	@eye int = 0,
	@circunference decimal(8, 2)=0,
	@colorcode nvarchar(35)='',
	@collectionname nvarchar(50)='',
	@frameshape nvarchar(50)='',
	@material nvarchar(50)='',
	@rimtype nvarchar(50)='',
	@havecase bit=0,
	@upc nvarchar(20) = '',
	@ToOrder bit = 0,
	@fpcID nvarchar(14) = '',
	@cost decimal(18,2) =0
)
AS
	insert into sforders(orderid,type,manufacturer,model,color,A,dbl,B,ED,Temple,Price,ordertype,jobtype,dbc,dec,mbs,eye,circunference,colorcode,collectionname,frameshape,material,rimtype,havecase,upc,toorder,fpcID,cost)
	Values(@orderid,@type,@manufacturer,@model,@color,@A,@dbl,@B,@ED,@Temple,@Price,@ordertype,@jobtype,@dbc,@dec,@mbs,@eye,@circunference,@colorcode,@collectionname,@frameshape,@material,@rimtype,@havecase,@upc,@ToOrder,@fpcID,@cost)
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCLOrderDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/01/2010
-- Description:	Contact Lenses Order Details Insert
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertCLOrderDetails](
	@orderid int,
	@status varchar(10),
	@eye varchar(10),
	@manufacturer varchar(65),
	@name varchar(65),
	@lenstype varchar(50),
	@color varchar(50),
	@sph Numeric(8, 2) = 0,
	@cyl Numeric(8, 2) = 0,
	@axis smallint = 0,
	@addition Numeric(8, 2) = 0,
	@BC Numeric(8, 2) = 0,
	@UPCC nvarchar(25),
	@Qty smallint = 0,
	@price Numeric(18, 2)  = 0,
	@cost Numeric(18, 2)  = 0
)
AS
	Insert into clorders(orderid,status,eye,manufacturer,name,lenstype,color,sph,cyl,axis,addition,BC,UPCC,Qty,price,cost)
	Values(@orderid,@status,@eye,@manufacturer,@name,@lenstype,@color,@sph,@cyl,@axis,@addition,@BC,@UPCC,@Qty,@price,@cost)
GO

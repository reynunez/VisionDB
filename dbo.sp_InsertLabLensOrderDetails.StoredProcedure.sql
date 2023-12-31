/****** Object:  StoredProcedure [dbo].[sp_InsertLabLensOrderDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertLabLensOrderDetails](
	@orderid int,
	@lenstype varchar(50),
	@manufacturer varchar(65),
	@name varchar(65),
	@material varchar(65),
	@price decimal(18, 2),
	@style varchar(20) = '',
	@lind numeric(18,2) = 0,
	@cost decimal(18, 2) = 0
)
AS
	Insert into llorders(orderid,lenstype,manufacturer,name,material,price,cost,style,lind)
	Values(@orderid,@lenstype,@manufacturer,@name,@material,@price,@cost,@style,@lind)
GO

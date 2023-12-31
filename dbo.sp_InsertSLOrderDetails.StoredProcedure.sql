/****** Object:  StoredProcedure [dbo].[sp_InsertSLOrderDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/01/2010
-- Description:	Sotck Lenses Details Order
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertSLOrderDetails](
	@orderid int,
	@lenstype varchar(50),
	@eye varchar(10),
	@manufacturer varchar(65),
	@lname varchar(65),
	@material varchar(65),
	@sph decimal(8,2) = 0,
	@cyl decimal(8,2) = 0,
	@addition decimal(8,2) =0,
	@price decimal(18,2) = 0,
	@UPCC nvarchar(20) = '',
	@cost decimal(18,2) = 0,
	@index numeric(18,2) = 0,
	@style nvarchar(50) = '',
	@tbase nvarchar(11) = '',
	@ct numeric(18,2) = 0,
	@et numeric(18,2) = 0
)
AS
	insert into slorders(orderid,lenstype,eye,manufacturer,lname,material,sph,cyl,addition,price,cost,UPCC,[index],style,tbase,ct,et)
	Values(@orderid,@lenstype,@eye,@manufacturer,@lname,@material,@sph,@cyl,@addition,@price,@cost,@UPCC,@index,@style,@tbase,@ct,@et)
GO

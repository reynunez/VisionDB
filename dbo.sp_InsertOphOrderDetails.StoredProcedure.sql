/****** Object:  StoredProcedure [dbo].[sp_InsertOphOrderDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/01/2010
-- Description:	Ophthalmic Lenses Line item details Insert
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertOphOrderDetails](
	@orderid int,
	@sphr Numeric(8, 2) = 0,
	@sphl Numeric(8, 2) = 0,
	@cylr Numeric(8, 2) = 0,
	@cyll Numeric(8, 2) = 0,
	@axisr smallint  = 0,
	@axisl smallint = 0,
	@addr Numeric(8, 2) = 0,
	@addl Numeric(8, 2) = 0,
	@distpdr Numeric(8, 2) = 0,
	@distpdl Numeric(8, 2) = 0,
	@nearpdr Numeric(8, 2) = 0,
	@nearpdl Numeric(8, 2) = 0,
	@prism1r Numeric(8, 2) = 0,
	@prism1l Numeric(8, 2) = 0,
	@base1r varchar(15),
	@base1l varchar(15),
	@prism2r Numeric(8, 2) = 0,
	@prism2l Numeric(8, 2) = 0,
	@base2r varchar(15),
	@base2l varchar(15),
	@heightr smallint = 0,
	@heightl smallint = 0,
	@thicknessr smallint = 0,
	@thicknessl smallint = 0,
	@thicknesstyper varchar(45),
	@thicknesstypel varchar(45),
	@treatment1 varchar(250),
	@treatment2 varchar(250),
	@treatment3 varchar(250),
	@treatment4 varchar(250) = NULL,
	@treatment5 varchar(250) = NULL,
	@treatment6 varchar(250) = NULL,
	@prescid varchar(25) = NULL,
	@usage varchar(50) = NULL
)
AS
	Insert into ophorderdetails(orderid,sphr,sphl,cylr,cyll,axisr,axisl,addr,addl,distpdr,distpdl,nearpdr,nearpdl,prism1r,prism1l,base1r,base1l,prism2r,prism2l,base2r,base2l,heightr,heightl,thicknessr,thicknessl,thicknesstyper,thicknesstypel,treatment1,treatment2,treatment3,treatment4,treatment5,treatment6,prescid,usage)
	Values(@orderid,@sphr,@sphl,@cylr,@cyll,@axisr,@axisl,@addr,@addl,@distpdr,@distpdl,@nearpdr,@nearpdl,@prism1r,@prism1l,@base1r,@base1l,@prism2r,@prism2l,@base2r,@base2l,@heightr,@heightl,@thicknessr,@thicknessl,@thicknesstyper,@thicknesstypel,@treatment1,@treatment2,@treatment3,@treatment4,@treatment5,@treatment6,@prescid,@usage)
GO

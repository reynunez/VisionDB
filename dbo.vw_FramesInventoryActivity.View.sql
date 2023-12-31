/****** Object:  View [dbo].[vw_FramesInventoryActivity]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================
-- Frames Inventory
-- Reynaldo Nunez 02/14/2016
-- ==========================================


CREATE VIEW [dbo].[vw_FramesInventoryActivity] AS
Select	office.description as officename,
		dbo.GetQuantityOnHand(rTrim(fsd.fpcID),1,fsd.officeid) as qtyOnHand,
		dbo.GetQuantityOnOrder(rTrim(fsd.fpcID), 1,fsd.officeid) as QtyOnOrder,
		fsd.manufacturerName,
		fsd.collectionName,
		fsd.styleName,
		fsd.colordescription,
		fsd.colorCode,
		fsd.A,
		fsd.DBL,
		fsd.DBC,
		fsd.B,
		fsd.ED,
		fsd.temple,
		fsd.rimType,
		fsd.material,
		fsd.circunference,
		fsd.eye,
		fsd.frameshape,
		fsd.markup,
		fsd.upc,
		fsd.havecase,
		fsd.fpcID,
		fsd.officeid,
		fsd.MBS,
		fsd.completeprice,
		trans.total_orders AS transactions
from	FramesStockData fsd left join office on office.officeid = fsd.officeid LEFT JOIN
		(Select	it.officeid
				,it.fpcID
				,sum(it.quantity) as total_orders
		From	invtransactions it
		where	quantity > 0
		group	by officeid,fpcid		
		) as trans ON fsd.fpcID = trans.fpcID AND fsd.officeid = trans.officeid
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertContacts]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/17/2020
-- Description: Adding/Update a Contact Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertContacts]
(
		@clid integer = 0,
		@manufacturername varchar(100),
		@clname varchar(100),
		@cost numeric(18,2),
		@list_price numeric(18,2),
		@trial varchar(1),
		@stb varchar(1) = '',
		@bc numeric(18,2),
		@sph numeric(18,2),
		@cyl numeric(18,2),
		@axs integer,
		@cladd numeric(18,2),
		@istrial integer,
		@color varchar(50),
		@upcc varchar(100)
)
AS
    SET NOCOUNT ON

	BEGIN

	IF @clid = 0 BEGIN
		Insert	into contactlens(
								manufacturername,
								clname,
								cost,
								[list price],
								trial,
								stb,
								bc,
								sph,
								cyl,
								axs,
								cladd,
								istrial,
								color,
								upcc
								)
						Values(
								@manufacturername,
								@clname,
								@cost,
								@list_price,
								@trial,
								@stb,
								@bc,
								@sph,
								@cyl,
								@axs,
								@cladd,
								@istrial,
								@color,
								@upcc
								)
	END 
	ELSE BEGIN
		UPDATE contactlens
		SET manufacturername = @manufacturername,
			clname = @clname,
			cost = @cost,
			[list price] = @list_price,
			trial = @trial,
			stb = @stb,
			bc = @bc,
			sph = @sph,
			cyl = @cyl,
			axs = @axs,
			cladd = @cladd,
			istrial = @istrial,
			color = @color,
			upcc = @upcc
		WHERE clid = @clid
	END

	END;
GO

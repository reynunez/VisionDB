/****** Object:  StoredProcedure [dbo].[sp_InsertOphPrescRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/19/2010
-- Description:	Create Ophthalmic Presc Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertOphPrescRecord](
	@prescid int,
	@sphr numeric(8, 2) = 0,
	@sphl numeric(8, 2) = 0,
	@cylr numeric(8, 2) = 0,
	@cyll numeric(8, 2) = 0,
	@Axisr smallint = 0,
	@Axisl smallint = 0,
	@Addr numeric(8, 2) = 0,
	@Addl numeric(8, 2) = 0,
	@Distpdr numeric(8, 2) = 0,
	@Distpdl numeric(8, 2) = 0,
	@Nearpdr numeric(8, 2) = 0,
	@Nearpdl numeric(8, 2) = 0,
	@Prism1r numeric(8, 2) = 0,
	@Prism1l numeric(8, 2) = 0,
	@Prism2r numeric(8, 2) = 0,
	@Prism2l numeric(8, 2) = 0,
	@Base1r varchar(15),
	@Base1l varchar(15),
	@Base2r varchar(15),
	@Base2l varchar(15),
	@Usage varchar(50),
	@Lenstype varchar(50),
	@sufamt bit,
	@voidafter datetime,
	@refills bit,
	@refillsamt smallint,
	@comments Nvarchar(4000),
	@vsrdva varchar(10) = NULL,
	@vsrnva varchar(10)=  NULL,
	@vsldva varchar(10) = NULL,
	@vslnva varchar(10) = NULL,
	@vcrdva varchar(10) = NULL,
	@vcrnva varchar(10) = NULL,
	@vcldva varchar(10) = NULL,
	@vclnva varchar(10) = NULL,
	@kr001 numeric(8, 2) = NULL,
	@kr002 numeric(8, 2) = NULL,
	@kr003 numeric(8, 2) = NULL,
	@kl001 numeric(8, 2) = NULL,
	@kl002 numeric(8, 2) = NULL,
	@kl003 numeric(8, 2) = NULL,
	@presctype varchar(50) = NULL,
	@rHOA varchar(10) = NULL,
	@lHOA varchar(10) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

	Insert	into	prescoph(
								prescid,
								sphr,
								sphl,
								cylr,
								cyll,
								Axisr,
								Axisl,
								Addr,
								Addl,
								Distpdr,
								Distpdl,
								Nearpdr,
								Nearpdl,
								Prism1r,
								Prism1l,
								Prism2r,
								Prism2l,
								Base1r,
								Base1l,
								Base2r,
								Base2l,
								Usage,
								Lenstype,
								sufamt,
								voidafter,
								refills,
								refillsamt,
								comments,
								vsrdva,
								vsrnva,
								vsldva,
								vslnva,
								vcrdva,
								vcrnva,
								vcldva,
								vclnva,
								kr001,
								kr002,
								kr003,
								kl001,
								kl002,
								kl003,
								presctype,
								rHOA,
								lHOA
							)
					Values(
							@prescid,
							@sphr,
							@sphl,
							@cylr,
							@cyll,
							@Axisr,
							@Axisl,
							@Addr,
							@Addl,
							@Distpdr,
							@Distpdl,
							@Nearpdr,
							@Nearpdl,
							@Prism1r,
							@Prism1l,
							@Prism2r,
							@Prism2l,
							@Base1r,
							@Base1l,
							@Base2r,
							@Base2l,
							@Usage,
							@Lenstype,
							@sufamt,
							@voidafter,
							@refills,
							@refillsamt,
							@comments,
							@vsrdva,
							@vsrnva,
							@vsldva,
							@vslnva,
							@vcrdva,
							@vcrnva,
							@vcldva,
							@vclnva,
							@kr001,
							@kr002,
							@kr003,
							@kl001,
							@kl002,
							@kl003,
							@presctype,
							@rHOA,
							@lHOA
						);
END
GO

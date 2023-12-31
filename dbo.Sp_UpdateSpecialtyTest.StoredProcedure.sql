/****** Object:  StoredProcedure [dbo].[Sp_UpdateSpecialtyTest]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12/27/2014
-- Description:	EMR Specialty Test Add
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdateSpecialtyTest]
	@testid int,
	@testdate date,
	@iopOD nvarchar(100),
	@iopOS nvarchar(100),
	@iopComment nvarchar(100),
	@dfeOD nvarchar(100),
	@dfeOS nvarchar(100),
	@dfeComment nvarchar(100),
	@topoOD nvarchar(100),
	@topoOS nvarchar(100),
	@topoComment nvarchar(100),
	@rbutOD nvarchar(100),
	@rbutOS nvarchar(100),
	@rbutComment nvarchar(100),
	@aspOD nvarchar(100),
	@aspOS nvarchar(100),
	@aspComment nvarchar(100),
	@pspOD nvarchar(100),
	@pspOS nvarchar(100),
	@pspComment nvarchar(100),	
	@plugsOD nvarchar(100),
	@plugsOS nvarchar(100),
	@plugsComment nvarchar(100),		
	@diOD nvarchar(100),
	@diOS nvarchar(100),
	@diComment nvarchar(100),	
	@gonioOD nvarchar(100),
	@gonioOS nvarchar(100),
	@gonioComment nvarchar(100),
	@octonhOD nvarchar(100),
	@octonhOS nvarchar(100),
	@octonhComment nvarchar(100),	
	@octmacOD nvarchar(100),
	@octmacOS nvarchar(100),
	@octmacComment nvarchar(100),	
	@octasOD nvarchar(100),
	@octasOS nvarchar(100),
	@octasComment nvarchar(100),
	@vfOD nvarchar(100),
	@vfOS nvarchar(100),
	@vfComment nvarchar(100),
	@cctOD nvarchar(100),
	@cctOS nvarchar(100),
	@cctComment nvarchar(100),
	@cdOD nvarchar(100),
	@cdOS nvarchar(100),
	@cdComment nvarchar(100),
	@doctorid integer = 1,
	@rdoctorid integer = 1
		
AS
BEGIN
	SET NOCOUNT ON;
	Update dbo.emrSpecialtyTest
		Set	testdate = @testdate,
			iopOD = @iopOD ,
			iopOS = @iopOS ,
			iopComment = @iopComment ,
			dfeOD = @dfeOD ,
			dfeOS = @dfeOS ,
			dfeComment = @dfeComment ,
			topoOD = @topoOD ,
			topoOS = @topoOS ,
			topoComment = @topoComment ,
			rbutOD = @rbutOD ,
			rbutOS = @rbutOS ,
			rbutComment = @rbutComment ,
			aspOD = @aspOD ,
			aspOS = @aspOS ,
			aspComment = @aspComment ,
			pspOD = @pspOD ,
			pspOS = @pspOS ,
			pspComment = @pspComment ,	
			plugsOD = @plugsOD ,
			plugsOS = @plugsOS ,
			plugsComment = @plugsComment ,		
			diOD = @diOD ,
			diOS = @diOS ,
			diComment = @diComment ,	
			gonioOD = @gonioOD ,
			gonioOS = @gonioOS ,
			gonioComment = @gonioComment ,
			octonhOD = @octonhOD ,
			octonhOS = @octonhOS ,
			octonhComment = @octonhComment ,	
			octmacOD = @octmacOD ,
			octmacOS = @octmacOS ,
			octmacComment = @octmacComment ,	
			octasOD = @octasOD ,
			octasOS = @octasOS ,
			octasComment = @octasComment ,
			vfOD = @vfOD ,
			vfOS = @vfOS ,
			vfComment = @vfComment ,
			cctOD = @cctOD ,
			cctOS = @cctOS ,
			cctComment = @cctComment ,	
			cdOD = @cdOD ,
			cdOS = @cdOS ,
			cdComment = @cdComment ,
			doctorid = @doctorid,
			rdoctorid = @rdoctorid,
			updatedate = dateadd(Hh,-5,current_timestamp)
		Where testid = @testid
END
GO

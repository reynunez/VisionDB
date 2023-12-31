/****** Object:  StoredProcedure [dbo].[SP_NET_GetVisualAccuity]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		R.Nunez
-- Create date: 01/12/2021
-- Change to a different calculation (Per Mario) 12/29/2011,Updated 5/3/2012
-- Description:	Obtain Visual Accuity
-- =============================================
CREATE PROCEDURE [dbo].[SP_NET_GetVisualAccuity]( 
		@Age numeric(18,2),
		@Sphere numeric(18,2),
		@Cyl numeric(18,2),
		@Sel tinyint,
		@RXFinalAdd numeric(18,2) = 0,
		@Axis int = 0,
		@NearWrkDist numeric(18,2) = 0,
		@IntWrkDist numeric(18,2) = 0,
		@Usage Varchar(25)=''
)
AS
BEGIN
DECLARE @sDVA varchar(10),
		@sNVA varchar(10),
		@AgeCalc numeric(18,2),
		@SphEquDva numeric(18,2),
		@ACC numeric(18,2),
		@RESERVE numeric(18,2),
		@AccDist numeric(18,2),
		@AccNear numeric(18,2),
		@CalcAdd numeric(18,2),
		@Intermediate numeric(18,2),
		@Near numeric(18,2),
		@Distance numeric(18,2),
		@IntNear numeric(18,2),
		@IntNear2 numeric(18,2),		
		@IntWrkDist2 numeric(18,2),
		@NearWrkDist2 numeric(18,2),
		@WorkingRatio numeric(18,2),
		@WorkingRatio2 numeric(18,2),		
		@WDAdditional numeric(18,2),
		@DistNear numeric(18,2),
		@DistNear2 numeric(18,2),
		@DistInterm numeric(18,2),
		@DistInterm2 numeric(18,2),
		@VertexSph numeric(18,2),
		@VertexSphEq numeric(18,2),
		@CLSph numeric(18,2),
		@CylCanOnlyEnd numeric(18,2),
		@rSphere numeric(18,2),
		@rAdd numeric(18,2),
		@ConcordDesktopSph numeric(18,2),
		@ConcordDesktopAdd numeric(18,2)
		
	SET NOCOUNT ON;
	
	-- Case Cylinder is entered as positive
	/*

	IF @Cyl > 0 BEGIN
		SET @Sphere = (@Sphere + @Cyl)
		SET @Cyl = (@Cyl * -1)
		IF (@Axis >= 0 AND @Axis <= 90) BEGIN
			SET @Axis = @Axis + 90
		END
		IF (@Axis >= 91 AND @Axis <= 180) BEGIN
			SET @Axis = @Axis - 90
		END
	END
	*/

	-- Calculations
	Set @NearWrkDist2 = 100/@NearWrkDist
	Set @WDAdditional = @NearWrkDist2 - 2.5	
	Set @SphEquDva = (@Sphere+((@Cyl)/2))
	Set @AgeCalc = @Age/3
	Set @ACC = (18-@AgeCalc)
	Select @RESERVE = Case when @ACC < 0 then 0 else @ACC end
	Set @AccDist = Case when @SphEquDva > 0 then (@RESERVE-@SphEquDva) else @SphEquDva end
	Set @AccNear = Case when @SphEquDva > -1.75 then (@RESERVE-(@SphEquDva+3)) else 0.25 end
	Set @CalcAdd = Case when (2.5-(@RESERVE/2)) > 0 then (2.5-(@RESERVE/2)) else 0 end

	
	----- Calc sDVA -----------------------------
	IF (@AccDist < 0) BEGIN
		Select TOP 1 @sDVA = value from VisAcc where  scale <= ABS(@AccDist) ORDER BY scale desc
	END
	ELSE BEGIN
		SET @sDVA = '20/20'
	END
	--------------------------------------------
	
	----- Calc sNVA -----------------------------
	IF (@AccNear < 0) BEGIN
		Select TOP 1 @sNVA = value from VisAcc where  scale <= ABS(@AccNear) ORDER BY scale desc
	END
	ELSE BEGIN
		SET @sNVA = '20/20'
	END
	--------------------------------------------	
	
	-- Calculations	
	Set @WorkingRatio = @NearWrkDist/@IntWrkDist
	Set @Intermediate = @Sphere + (@RXFinalAdd * @WorkingRatio) + @WDAdditional
	Set @Distance = @Sphere	
	Set @Near = @Sphere + (@RXFinalAdd - 0.25) + @WDAdditional
	Set @IntNear = @Sphere + (@RXFinalAdd * @WorkingRatio) + @WDAdditional
	Set @IntNear2 = (@RXFinalAdd * (1-@WorkingRatio))+@WDAdditional
	Set @DistNear = @Sphere	
	Set @DistNear2 = @RXFinalAdd + @WDAdditional
	Set @DistInterm = @Sphere
	Set @DistInterm2 = 	(@RXFinalAdd *@WorkingRatio)+@WDAdditional
	Set @IntWrkDist2 = 100/@IntWrkDist
	Set @WorkingRatio2 = @IntWrkDist2	/@NearWrkDist2
	
	-- Calculations CL
	Set @VertexSph = (@Sphere/(1-0.012*@Sphere))
	Set @VertexSphEq = (@SphEquDva/(1-0.012*@SphEquDva))
	

	Set @CLSph = Case when @Cyl > -1 then @VertexSphEq else @VertexSph end
	Set @CylCanOnlyEnd = @Cyl

	Set @ConcordDesktopSph = @IntNear + @IntNear2
	Set @ConcordDesktopAdd = @IntNear2

	Set @rSphere =	Case When @Usage = 'DIST' then cast((round(@Distance * 4, 0)/4) as decimal(11,2))
					When @Usage = 'INT' then cast((round(@Intermediate * 4, 0)/4) as decimal(11,2))
					When @Usage = 'NEAR' then cast((round(@Near * 4, 0)/4) as decimal(11,2))
					When @Usage = 'Distance / Near' then cast((round(@DistNear * 4, 0)/4) as decimal(11,2))
					When @Usage = 'INT/NEAR' then cast((round(@IntNear * 4, 0)/4) as decimal(11,2))
					When @Usage = 'DIST/INT' then cast((round(@DistInterm * 4, 0)/4) as decimal(11,2))
					When @Usage = 'Led Desk' then cast((round(@IntNear * 4, 0)/4) as decimal(11,2))
					Else 0
					end 	

	Set @rAdd =	Case When @Usage = 'DIST' then 0
					 When @Usage = 'INT' then 0
					 When @Usage = 'NEAR' then 0
					 When @Usage = 'Distance / Near' then cast((round(@DistNear2 * 4, 0)/4) as decimal(11,2))
					 When @Usage = 'INT/NEAR' then cast((round(@IntNear2 * 4, 0)/4) as decimal(11,2))
					 When @Usage = 'DIST/INT' then cast((round(@DistInterm2 * 4, 0)/4) as decimal(11,2))
					 When @Usage = 'Led Desk' then cast((round(@IntNear2 * 4, 0)/4) as decimal(11,2))
					 Else 0
					 end 		



	PRINT 'Usage:' + @Usage
	PRINT 'Age:' + cast(@Age as varchar(10))
	PRINT 'SphEqu dva:' + Cast(@SphEquDva as Varchar(10))
	PRINT 'ACC:' + Cast(@ACC as Varchar(10))
	PRINT 'Reserve:' + Cast(@RESERVE as Varchar(10))
	PRINT 'sDVA:' + Cast(@sDVA as Varchar(10))
	PRINT 'sNVA:' + Cast(@sNVA as Varchar(10))	
	PRINT 'Acc Dist:' + Cast(@AccDist as Varchar(10))
	PRINT 'Acc Near' + Cast(@AccNear as Varchar(10))
	PRINT 'Calc Addition:' + Cast(@CalcAdd as Varchar(10))
	PRINT 'RX Final Add:' + Cast(@RXFinalAdd as Varchar(10))
	PRINT 'Distance:' + Cast(@Distance as Varchar(10))
	PRINT 'Intermediate:' + Cast(@Intermediate as Varchar(10))
	PRINT 'Near:' + Cast(@Near	 as Varchar(10))
	PRINT 'Dist/Near:' + Cast(@DistNear as Varchar(10))
	PRINT 'Dist/Near 2:' + Cast(@DistNear2 as Varchar(10))
	PRINT 'Intermediate/Near:' + Cast(@IntNear as Varchar(10))
	PRINT 'Intermediate/Near 2:' + Cast(@IntNear2 as Varchar(10))
	PRINT 'Distance/Intermediate:' + Cast(@DistInterm as Varchar(10))
	PRINT 'Distance/Intermediate 2:' + Cast(@DistInterm2 as Varchar(10))
	PRINT 'Int Working Dist:' + Cast(@IntWrkDist as Varchar(10))
	PRINT 'Int Working Dist 2:' + Cast(@IntWrkDist2 as Varchar(10))
	PRINT 'Near Working Dist:' + Cast(@NearWrkDist as Varchar(10))
	PRINT 'Near Working Dist 2:' + Cast(@NearWrkDist2 as Varchar(10))
	PRINT 'Working Ratio:' + Cast(@WorkingRatio as Varchar(10))
	PRINT 'Working Ratio 2:' + Cast(@WorkingRatio2 as Varchar(10))	
	PRINT 'Vertex Sphere:' + Cast(@VertexSph as Varchar(10))
	PRINT 'Vertex Sphere Eq:' + Cast(@VertexSphEq as Varchar(10))
	PRINT 'CL Sphere:' + Cast(@CLSph as Varchar(10))
	PRINT 'Cyl Can only end:' + Cast(@CylCanOnlyEnd as Varchar(10))
	PRINT 'Returned Sphere:' + Cast(@rSphere as Varchar(10))
	
	
	Select	@sDVA as [SDVA],
			@sNVA as [SNVA],
			@rSphere as [rSphere],
			@rAdd as [rAdd],
			@IntWrkDist2 as [IntWrkDistDiop],
			@NearWrkDist2 as [NearWrkDistDiop], 
			@VertexSph  as [VertexSphEq]

END
GO

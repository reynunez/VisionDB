/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateTh]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: Dec-25-2014
-- Description:	Insert/Update for Therapeutic Drug List
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdateTh](
	@thid int,
	@Category nvarchar(50),
	@subcategory nvarchar(50),
	@tradeName nvarchar(50),
	@Generic nvarchar(50),
	@Manufacturer nvarchar(50),
	@Preparation nvarchar(50),
	@pedriaticUse nvarchar(50),
	@HowSupplied nvarchar(50),
	@typicalDosing nvarchar(50),
	@Indications nvarchar(max),
	@cautions nvarchar(250),
	@comments nvarchar(max)
)
AS
BEGIN
	IF @thid = 0 BEGIN
		Insert into druglist(
			Category ,
			subcategory ,
			tradeName ,
			Generic ,
			Manufacturer ,
			Preparation ,
			pedriaticUse ,
			HowSupplied ,
			typicalDosing ,
			Indications ,
			cautions ,
			comments)
		Values(
			@Category ,
			@subcategory ,
			@tradeName ,
			@Generic ,
			@Manufacturer ,
			@Preparation ,
			@pedriaticUse ,
			@HowSupplied ,
			@typicalDosing ,
			@Indications ,
			@cautions ,
			@comments)	
	END 
	ELSE BEGIN
			Update druglist
			Set 	Category = @Category ,
				subcategory = @subcategory ,
				tradeName = @tradeName ,
				Generic = @Generic ,
				Manufacturer = @Manufacturer ,
				Preparation = @Preparation ,
				pedriaticUse = @pedriaticUse ,
				HowSupplied = @HowSupplied ,
				typicalDosing = @typicalDosing ,
				Indications = @Indications ,
				cautions = @cautions ,
				comments = @comments
			Where	thid = @thid
	END
END
GO

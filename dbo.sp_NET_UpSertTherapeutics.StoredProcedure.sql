/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertTherapeutics]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/17/2021
-- Description: Get Therapeutics
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertTherapeutics]
(
	@thid INT = 0,
	@tradeName VARCHAR(50) = '',
	@Generic VARCHAR(50) = '',
	@Manufacturer VARCHAR(50) = '',
	@Preparation VARCHAR(50) = '',
	@pedriaticUse VARCHAR(50) = '',
	@HowSupplied VARCHAR(50) = '',
	@typicalDosing VARCHAR(50) = '',
	@Indications VARCHAR(MAX) = '',
	@cautions VARCHAR(250) = '',
	@Category VARCHAR(50) = '',
	@subcategory VARCHAR(50) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	IF @thid > 0 BEGIN
		Update druglist
		SET 	tradeName = @tradeName ,
				Generic = @Generic ,
				Manufacturer = @Manufacturer ,
				Preparation = @Preparation ,
				pedriaticUse = @pedriaticUse ,
				HowSupplied = @HowSupplied ,
				typicalDosing = @typicalDosing ,
				Indications = @Indications ,
				cautions = @cautions ,
				Category = @Category ,
				subcategory = @subcategory 
		WHERE	thid = @thid
	END
	ELSE BEGIN
		INSERT INTO druglist(Category,subcategory ,tradeName,Generic,Manufacturer,Preparation,pedriaticUse,HowSupplied,typicalDosing,Indications,cautions,comments)
		Values(@Category,@subcategory,@tradeName,@Generic,@Manufacturer,@Preparation,@pedriaticUse,@HowSupplied,@typicalDosing,@Indications,@cautions,'')
	END

END
GO

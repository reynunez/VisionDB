/****** Object:  StoredProcedure [dbo].[sp_NET_UpsertPatientInsurance]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/30/2020
-- Description:	Add/Update New Patient Insurance
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpsertPatientInsurance]
	@isNew BIT,
	@Ins_no INT,
	@patient_no INT,
	@insurance_no INT,
	@insured_id NVARCHAR(20),
	@policy_group_no NVARCHAR(20),
	@iauthorization CHAR(45),
	@benefits CHAR(45),
	@isDefault BIT,
	@isDisabled BIT
AS
BEGIN
	SET NOCOUNT ON;

	IF @isNew = 1 BEGIN
		INSERT INTO patient_insurances(
			patient_no ,
			insurance_no ,
			insured_id ,
			policy_group_no ,
			iauthorization ,
			benefits ,
			isDefault ,
			isDisabled,
			date_creaated,
			date_disabled)
		VALUES(
			@patient_no ,
			@insurance_no ,
			@insured_id ,
			@policy_group_no ,
			@iauthorization ,
			@benefits ,
			@isDefault ,
			@isDisabled,
			DATEADD(hh,-5,getdate()),
			NULL
			);
	END
	ELSE BEGIN
		UPDATE patient_insurances
		SET insured_id = @insured_id,
			policy_group_no = @policy_group_no
		WHERE Ins_no = @Ins_no;
	END
END
GO

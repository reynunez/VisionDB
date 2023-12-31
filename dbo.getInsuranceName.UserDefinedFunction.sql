/****** Object:  UserDefinedFunction [dbo].[getInsuranceName]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[getInsuranceName](@patient_no int)
RETURNS CHAR(60)
AS  
BEGIN 
	declare @insReturn CHAR(60)
	SELECT DISTINCT @insReturn =  dbo.insurance.insurance_name
	FROM         dbo.patient_insurances INNER JOIN
              	      dbo.insurance ON dbo.patient_insurances.insurance_no = dbo.insurance.insurance_no
	WHERE     (dbo.patient_insurances.patient_no = @patient_no)
	RETURN @insReturn
END
GO

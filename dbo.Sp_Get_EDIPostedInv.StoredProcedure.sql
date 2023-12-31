/****** Object:  StoredProcedure [dbo].[Sp_Get_EDIPostedInv]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 6/5/2012
-- Description:	Selection list for the EDI 836
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Get_EDIPostedInv](
	@DateFrom	datetime,
	@DateTo		datetime,
	@ProvID		int,
	@insurance_name varchar(200) = ''
)
AS
	BEGIN
	IF @insurance_name = '' BEGIN
		SELECT	DISTINCT 
				Invoice.invoiceid, 
				Invoice.invdate, 
				Invoice.postdate, 
				Invoice.inscharges, 
				Invoice.ibalance, 
				Invoice.provider, 
				Invoice.providerid,
				patient.first_name, 
				patient.last_name, 
				patient.birth_date, 
				patient.ss_no, 
				insurance.insurance_name, 
				insurance.insurance_account_no, 
				insurance.Availity,
				invoice.isedi
		FROM    Invoice left JOIN
				patient ON Invoice.patient_no = patient.patient_no left JOIN
				insurance ON Invoice.insurance_no = insurance.insurance_no
		WHERE   Invoice.providerid = @ProvID and Invoice.postdate between @DateFrom and @DateTo
	END
	ELSE BEGIN
		SELECT	DISTINCT 
				Invoice.invoiceid, 
				Invoice.invdate, 
				Invoice.postdate, 
				Invoice.inscharges, 
				Invoice.ibalance, 
				Invoice.provider, 
				Invoice.providerid,
				patient.first_name, 
				patient.last_name, 
				patient.birth_date, 
				patient.ss_no, 
				insurance.insurance_name, 
				insurance.insurance_account_no, 
				insurance.Availity,
				invoice.isedi
		FROM    Invoice left JOIN
				patient ON Invoice.patient_no = patient.patient_no left JOIN
				insurance ON Invoice.insurance_no = insurance.insurance_no
		WHERE   Invoice.providerid = @ProvID and Invoice.postdate between @DateFrom and @DateTo AND insurance.insurance_name = @insurance_name
	END
END
GO

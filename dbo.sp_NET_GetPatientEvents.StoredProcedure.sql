/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientEvents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/30/2020
-- Description:	GetPatientEvents
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientEvents]
	@patient_no integer
AS
BEGIN

	Select	CONVERT(DATE,eventdate,101) as eventdate
			,description + ' Order No:' + case when coalesce(orderinfo,'') <> '' then dbo.Split(orderinfo,'|',1) else '' end as description
	from	Vw_SignatureEvents where patient_no = @patient_no and cast(eventdate as date) < cast('2021-01-17' as date)
	
	Union

	Select	CONVERT(DATE,eventdate,101) as eventdate
			,description + ' Order No:' + case when coalesce(orderinfo,'') <> '' then dbo.Split(orderinfo,'|',1) else '' end as description
	from	Vw_Net_SignatureEvents where patient_no = @patient_no and cast(eventdate as date) >= cast('2021-01-17' as date)
END
GO

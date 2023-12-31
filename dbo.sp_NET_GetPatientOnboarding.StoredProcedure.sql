/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientOnboarding]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2023-03-11
-- Description:	Get Patient Record for OnBoarding
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientOnboarding]
	@patient_no int
AS
BEGIN
	Select	p.* 
			,pcp.description as pcp
			,pcp.doctorid as pcpid
			,pcp.description as primarycare
			,phm.description as pharmacyname
			,phm.doctorid as pharmacyid
			,omd.description as omdname
			,omd.doctorid as omdid
			,addr.address_no 
			,addr.address1
			,addr.address2
			,addr.city
			,addr.state
			,addr.zip
			,addr.phone1 as cellphone
			,addr.phone2 as phone
			,nextAppmtDate = (SELECT top 1 appmtdate FROM [dbo].[appointment] where patient_no = @patient_no order by appmtdate desc)
			,nextAppmtTime = (SELECT top 1 appmttime FROM [dbo].[appointment] where patient_no = @patient_no order by appmtdate desc)
			,nextAppmtLoc = (SELECT top 1 appmtlocation FROM [dbo].[appointment] where patient_no = @patient_no order by appmtdate desc)
			,insurance_name = (SELECT top 1 COALESCE(Insurance_name,'') FROM [dbo].[appointment] where patient_no = @patient_no order by appmtdate desc)
			,insurance_id = (SELECT top 1 Insurance_no FROM [dbo].[appointment] where patient_no = @patient_no order by appmtdate desc)
	from	patient p left join
			ext_doctors pcp on pcp.doctorid = p.npcp left join
			ext_doctors phm on phm.doctorid = p.pharmacy left join
			ext_doctors omd on omd.doctorid = p.nomd left join
			address addr on addr.patient_no = p.patient_no
	where	p.patient_no = @patient_no
END
GO

/****** Object:  StoredProcedure [dbo].[sp_NET_InsertObboard]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/05/2020
-- Description: On Boarding Creation
-- =============================================

CREATE PROCEDURE [dbo].[sp_NET_InsertObboard]
(
		@patient_no int,
		@reasfvid INT = 0,
		@reasfvother varchar(50) = '' ,
		@primarycid INT = 0,
		@primarycphone varchar(16) = '',
		@pharmid INT= 0 ,
		@pharmphone varchar(16) = '',
		@ophthid INT = 0,
		@ophthphone varchar(16) = '',
		@allergies varchar(1000) = '',
		@medicines varchar(1000) = '',
		@hypertension INT = 0,
		@cholesterol INT = 0,
		@thyroid INT = 0,
		@heart INT = 0,
		@mhOther INT = 0,
		@mhtohersel varchar(100) = '',
		@smokeryn INT = 0,
		@smokerppd INT = 0,
		@smokeryrs INT = 0,
		@diabetesys INT = 0,
		@diabetest1yrs INT = 0,
		@diabetest2yrs INT = 0,
		@diabeteslastsl varchar(10) = '',
		@diabetesa1c varchar(10) = '' ,
		@pregnantyn INT = 0,
		@lvisitid INT = 0,
		@lvisitnumber INT = 0,
		@lvisitdoctor varchar(50) = '',
		@contactlensid INT = 0,
		@condcataract INT = 0,
		@condeyeinj INT = 0,
		@condiritisuve INT = 0,
		@conddryeye INT = 0,
		@condglaucoma INT = 0,
		@condretde INT = 0,
		@condstrabism INT = 0,
		@condlazye INT = 0,
		@condretdetach INT = 0,
		@condmacdeg INT = 0,
		@condother INT = 0,
		@condtxtother varchar(50) = '',
		@droparttears INT = 0,
		@dropgraucomad INT = 0,
		@dropsallergy INT = 0,
		@dropsother INT = 0,
		@dropstxtother varchar(50) ,
		@prevscataract INT ,
		@prevsretina INT = 0 ,
		@prevscorrective INT = 0,
		@prevsglaucoma INT = 0,
		@prevscornea INT = 0,
		@prevsother INT = 0,
		@prevstxtother varchar(50) = '',
		@fohcataract INT = 0,
		@fohglaucoma INT = 0,
		@fohmacdeg INT = 0,
		@fohretdetach INT = 0,
		@fohretpig INT = 0,
		@fohother INT = 0,
		@fohtxtother varchar(50) = '',
		@IsWeb INT = 0,
		@pat_personal varchar(max) = '',
		@pat_medical varchar(max) = ''
)
AS
BEGIN

    SET NOCOUNT ON

	DECLARE @webNote varchar(250) 

	IF @IsWeb = 0 BEGIN
		SET @webNote = ''
	END
	ELSE BEGIN
		SET @webNote = 'Created Online - ' + CAST(DATEADD(hh,-5,getdate()) AS VARCHAR(20))
	END

		Insert into tblonboarding(
			patient_no,
			createdate,
			updatedate,
			last_updated,
			reasfvid ,
			reasfvother ,
			primarycid ,
			primarycphone ,
			pharmid ,
			pharmphone ,
			ophthid ,
			ophthphone ,
			allergies ,
			medicines ,
			hypertension ,
			cholesterol ,
			thyroid ,
			heart ,
			mhOther ,
			mhtohersel ,
			smokeryn ,
			smokerppd ,
			smokeryrs ,
			diabetesys ,
			diabetest1yrs ,
			diabetest2yrs ,
			diabeteslastsl ,
			diabetesa1c ,
			pregnantyn ,
			lvisitid ,
			lvisitnumber ,
			lvisitdoctor ,
			contactlensid ,
			condcataract ,
			condeyeinj ,
			condiritisuve ,
			conddryeye ,
			condglaucoma ,
			condretde ,
			condstrabism ,
			condlazye,
			condretdetach ,
			condmacdeg ,
			condother ,
			condtxtother ,
			droparttears ,
			dropgraucomad ,
			dropsallergy ,
			dropsother ,
			dropstxtother ,
			prevscataract ,
			prevsretina ,
			prevscorrective ,
			prevsglaucoma ,
			prevscornea ,
			prevsother ,
			prevstxtother ,
			fohcataract ,
			fohglaucoma ,
			fohmacdeg ,
			fohretdetach ,
			fohretpig ,
			fohother ,
			fohtxtother,
			pat_personal,
			pat_medical,
			isWeb,
			webNote
		)
		Values(
			@patient_no,
			DATEADD(hh,-5,getdate()),
			DATEADD(hh,-5,getdate()),
			DATEADD(hh,-5,getdate()),
			@reasfvid  ,
			@reasfvother  ,
			@primarycid  ,
			@primarycphone  ,
			@pharmid  ,
			@pharmphone  ,
			@ophthid  ,
			@ophthphone  ,
			@allergies  ,
			@medicines  ,
			@hypertension  ,
			@cholesterol  ,
			@thyroid  ,
			@heart  ,
			@mhOther  ,
			@mhtohersel  ,
			@smokeryn  ,
			@smokerppd  ,
			@smokeryrs  ,
			@diabetesys  ,
			@diabetest1yrs  ,
			@diabetest2yrs  ,
			@diabeteslastsl  ,
			@diabetesa1c  ,
			@pregnantyn  ,
			@lvisitid  ,
			@lvisitnumber  ,
			@lvisitdoctor  ,
			@contactlensid  ,
			@condcataract  ,
			@condeyeinj  ,
			@condiritisuve  ,
			@conddryeye  ,
			@condglaucoma  ,
			@condretde  ,
			@condstrabism  ,
			@condlazye ,
			@condretdetach  ,
			@condmacdeg  ,
			@condother  ,
			@condtxtother  ,
			@droparttears  ,
			@dropgraucomad  ,
			@dropsallergy  ,
			@dropsother  ,
			@dropstxtother  ,
			@prevscataract  ,
			@prevsretina  ,
			@prevscorrective  ,
			@prevsglaucoma  ,
			@prevscornea  ,
			@prevsother  ,
			@prevstxtother  ,
			@fohcataract  ,
			@fohglaucoma  ,
			@fohmacdeg  ,
			@fohretdetach  ,
			@fohretpig  ,
			@fohother  ,
			@fohtxtother,
			@pat_personal,
			@pat_medical,
			@IsWeb,
			@webNote
		);

			Update Patient
			SET npcp = @primarycid,
				pharmacy = @pharmid,
				nomd = @ophthid
			WHERE patient_no = @patient_no;	

END
GO

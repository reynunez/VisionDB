/****** Object:  View [dbo].[Vw_VomTasks]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Vw_VomTasks] AS
Select	taskid
		,taskdescription
		,(Select dbo.decryptstring(username,76) as username from tblVOMMaBIT where id = assignfrom) as  assignfrom
		,(Select dbo.decryptstring(username,76) as username from tblVOMMaBIT where id = assignto) as assignto
		,area
		,areaid
		,areatext
		,priorityid
		,statusid
		,comments
		,datecreated
		,convert(varchar(20),datecreated,100) as f_datecreated
		,dateupdated
		,convert(varchar(20),dateupdated,100) as f_dateupdated
		,started
		,convert(varchar(20),started,100) as f_started
		,ended
		,convert(varchar(20),ended,100) as f_ended
		,(Select dbo.decryptstring(username,76) as username from tblVOMMaBIT where id = changedby) as changedby
		,accepted
		,Case
			When statusid in (2,5) Then Abs(Datediff(Hh,started,current_timestamp))
			When statusid in (1,4) then 0
			When statusid = 3 Then Abs(Datediff(Hh,datecreated,ended))
			Else 0
		End as Elapsed,
		Case 
			When statusid = 1 then 'New'
			When statusid = 2 then 'In Progress'
			When statusid = 3 then 'Completed'
			When statusid = 4 then 'Cancelled'
			When statusid = 5 then 'On Hold'
		End as nstatus,
		Case
			When priorityid = 0 then 'High'
			When priorityid = 1 then 'Normal'
			When priorityid = 0 then 'Low'
			Else 'Normal'
		End as npriority
from	vomtasks
GO

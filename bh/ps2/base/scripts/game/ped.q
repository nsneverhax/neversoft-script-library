GameObj_AnimTree = {
	Type = DegenerateBlend
	id = Body
}
GameObj_StandardAnimBranch = {
	Type = TimerType
	id = BodyTimer
	anim = anim
	anim_events = AnimEvents
	speed = speed
	start = start
	[
		{
			Type = Source
			anim = anim
		}
	]
}
Ped_Flip = 0x24d8810d
Ped_SetAnimCycleMode = 0x24d8810d
Ped_GetAnimDuration = 0x24d8810d
Ped_AnimComplete = 0x24d8810d
Ped_WaitAnim = 0x24d8810d
Ped_WaitAnimFinished = 0x24d8810d
Ped_Anim_Command = 0x24d8810d
Ped_PlayAnim = 0x24d8810d
Ped_AddDegenerateBlendBranch = 0x24d8810d
Ped_InitStaticAnimTree = 0x24d8810d

script gameobj_init_animtree 
	if GotParam \{Profile}
		AddParams <Profile>
	endif
	if GotParam \{AnimTargets}
		Anim_InitTree {
			Tree = <Tree>
			DefaultCommandTarget = <DefaultCommandTarget>
			NodeIdDeclaration = <AnimTargets>
			params = <AnimTreeParams>
			animEventTableName = <animEventTableName>
		}
		anim_enable \{OFF}
	endif
endscript

script GameObj_PlayAnim \{target = Body
		Tree = $GameObj_StandardAnimBranch
		TimerType = Play
		speed = 1.0
		start = 0.0
		AnimEvents = OFF
		BlendDuration = -1.0}
	if NOT GotParam \{anim}
		Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	anim_enable
	Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
		Tree = <Tree>
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = <TimerType>
			start = <start>
			AnimEvents = <AnimEvents>
		}
	}
endscript

script GameObj_WaitAnimFinished \{Timer = BodyTimer}
	Anim_Command target = <Timer> Command = Timer_WaitAnimComplete
endscript

script GameObj_WaitAnim 
	Anim_Command target = BodyTimer Command = Timer_Wait params = {<...>}
endscript

script GameObj_AnimComplete \{Timer = BodyTimer}
	if Anim_Command target = <Timer> Command = Timer_IsAnimComplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script CreateObjLabel 
	Obj_GetID
	SpawnScriptLater MaintainObjLabel params = {objID = <objID>}
endscript

script MaintainObjLabel 
	<id> = (<objID> + 5)
	begin
	if CompositeObjectExists Name = <objID>
		<objID> :Obj_GetPosition
		formatText TextName = text qs(0x0bc409e2) a = <objID> nowarning
		if ObjectExists id = <id>
			SetScreenElementProps id = <id> text = <text> pos3D = (<Pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		else
			create_object_label id = <id> text = <text> pos3D = (<Pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		endif
	else
		if ScreenElementExists id = <id>
			DestroyScreenElement id = <id>
		endif
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript

script ped_disable_bones 
endscript

script ped_enable_bones 
endscript

script Ped_InitBehaviorFromProfile 
	if GotParam \{BehaviorInitScript}
		<BehaviorInitScript>
	endif
endscript

script create_ped_label 
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement {
		id = <id>
		Type = TextBlockElement
		parent = root_window
		font = fontgrid_text_a3
		text = qs(0x03ac90f0)
		Scale = 1.0
		Pos = (0.0, 0.0)
		rgba = [0 128 0 128]
		dims = (250.0, 0.0)
		allow_expansion
		just = [center top]
	}
endscript

script destroy_ped_label 
	if ObjectExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script destroy_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT InNetGame
			if IsCOIMInited

				CleanupGlobalPedNodeArray Name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript

script spawn_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT InNetGame
			if IsCOIMInited

				ParseGlobalPedNodeArray Name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript

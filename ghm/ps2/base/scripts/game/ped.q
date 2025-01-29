ped_use_GELAI = 0
Ped_StaticAnimTree = {
	Type = PartialSwitch
	id = PedBlendRoot
	[
		{
			Type = DegenerateBlend
			id = PedFAMAnimParentNode
		}
		{
			Type = DegenerateBlend
			id = PedMainAnimParentNode
		}
	]
}
Ped_StaticAnimTreeWithFace = {
	Type = Ik
	[
		{
			Type = ApplyDifference
			id = PedWithFace
			[
				{
					Type = DegenerateBlend
					id = Face
				}
				{
					Type = PartialSwitch
					id = PedBlendRoot
					[
						{
							Type = DegenerateBlend
							id = PedFAMAnimParentNode
						}
						{
							Type = DegenerateBlend
							id = PedMainAnimParentNode
						}
					]
				}
			]
		}
	]
}
Ped_AnimBranch_Standard = {
	Type = param_timer_type
	id = BodyTimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = On
	[
		{
			id = BodySource
			Type = Source
			anim = param_anim
		}
	]
}
Ped_AnimBranch_LookAt = {
	id = LookAtController
	Type = DifferenceLookAt
	params = param_lookat_params
	target = param_lookat_target
	[
		{
			$Ped_AnimBranch_Standard
		}
	]
}
Ped_AnimBranch_FAMStandard = {
	Type = param_timer_type
	id = FamTimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = On
	[
		{
			id = PedFAMAnimNode
			Type = Source
			anim = param_anim
		}
	]
}
Ped_AnimBranch_FAMEmpty = {
	Type = Blank
}
Ped_AnimBranch_Flipped = {
	Type = Flip
	id = BodyFlip
	[
		{
			$Ped_AnimBranch_Standard
		}
	]
}
Ped_AnimBranch_Overlay = {
	Type = param_timer_type
	id = BodyTimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = On
	[
		{
			id = BodyOverlay
			Type = Overlay
			anim = param_overlay
			[
				{
					id = BodySource
					Type = Source
					anim = param_anim
				}
			]
		}
	]
}
GameObj_AnimTree = {
	Type = DegenerateBlend
	id = Body
}
GameObj_RagdollAnimTree = {
	Type = ragdoll
	[
		{
			Type = DegenerateBlend
			id = Body
		}
	]
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

script Ped_InitStaticAnimTree \{Tree = $Ped_StaticAnimTree}
	Anim_UnInitTree
	Anim_InitTree Tree = <Tree> NodeIdDeclaration = [
		PedMainAnimParentNode
		PedFAMAnimParentNode
		PedBlendRoot
		FamTimer
		PedFAMAnimNode
		BodyTimer
		BodySource
		BodyOverlay
		LookAtController
		PedWithFace
		Face
		faceidle_timer
		face_timer
		face_source
	]
endscript

script Ped_AddDegenerateBlendBranch 
	Ped_Anim_Command \{Command = DegenerateBlend_AddBranch
		params = {
			Tree = $Ped_AnimBranch_Standard
			params = {
				param_timer_type = Play
				param_anim = Ped_M_Idle1
			}
		}}
	Anim_UpdatePose
	Anim_Command \{Command = DegenerateBlend_SetNextBlendDuration
		params = {
			0.0
		}}
endscript

script Ped_PlayAnim \{anim = 0
		target = PedMainAnimParentNode
		Tree = $Ped_AnimBranch_Standard
		Source = BodySource
		Flipped = 0}
	if GotParam \{norestart}
		if Ped_Anim_Command target = <Source> Command = Source_AnimEquals params = {<anim>}
			return
		endif
	endif
	timer_type = Play
	if GotParam \{cycle}
		timer_type = cycle
	endif
	if GotParam \{Wobble}
		timer_type = Wobble
	endif
	if (<Flipped> = 1)
		<Tree> = Ped_AnimBranch_Flipped
	endif
	if GotParam \{PartialAnimOverlay}
		Ped_Anim_Command target = Ped_AnimBranch_Overlay Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendPeriod>
			Tree = <Tree> params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_overlay = <PartialAnimOverlay>
				param_speed = <speed>
				param_start = <start>
			}
		}
	else
		Ped_Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendPeriod>
			Tree = <Tree> params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_speed = <speed>
				param_start = <start>
				param_lookat_params = <lookat_params>
				param_lookat_target = <lookat_target>
			}
		}
	endif
	if (DEBUG_PEDINFO = 1)
		SetTags LastAnim = <anim>
	endif
endscript

script Ped_Anim_Command 
	Anim_Command <...>
	Obj_GetID
	GetSingleTag \{board_id}
	if GotParam \{board_id}
		if IsCreated <board_id>
			<board_id> :Anim_Command <...>
		endif
	endif
endscript

script Ped_WaitAnimFinished \{Timer = BodyTimer}
	Ped_Anim_Command target = <Timer> Command = Timer_Wait
endscript

script Ped_WaitAnim 
	Ped_Anim_Command target = BodyTimer Command = Timer_Wait params = {<...>}
endscript

script Ped_AnimComplete \{Timer = BodyTimer}
	if Anim_Command target = <Timer> Command = Timer_IsAnimComplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script Ped_AnimEquals 
	if Anim_Command target = BodySource Command = Source_AnimEquals params = {<...>}
		return \{1}
	endif
	return \{0}
endscript

script Ped_GetAnimDuration \{Timer = BodyTimer}
	Anim_Command target = <Timer> Command = Timer_GetAnimDuration
	return <Duration>
endscript

script Ped_SetAnimCycleMode 
	timer_type = cycle
	if GotParam \{OFF}
		timer_type = Play
	endif
	Anim_Command \{target = BodySource
		Command = Source_GetAnimName}
	anim = <AnimName>
	Anim_Command \{target = BodyTimer
		Command = Timer_GetFrameFactor}
	start = <framefactor>
	Anim_Command target = PedMainAnimParentNode Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <BlendPeriod>
		Tree = $Ped_AnimBranch_Standard params = {
			param_timer_type = <timer_type>
			param_anim = <anim>
			param_speed = <speed>
			param_start = <start>
		}
	}
endscript

script Ped_Flip 
endscript

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

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

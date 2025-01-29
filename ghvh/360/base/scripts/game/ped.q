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

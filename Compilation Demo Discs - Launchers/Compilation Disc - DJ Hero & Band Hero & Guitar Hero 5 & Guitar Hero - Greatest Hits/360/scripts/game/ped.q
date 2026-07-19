GameObj_AnimTree = {
	type = DegenerateBlend
	id = Body
}
GameObj_RagdollAnimTree = {
	type = ragdoll
	[
		{
			type = DegenerateBlend
			id = Body
		}
	]
}
GameObj_StandardAnimBranch = {
	type = TimerType
	id = BodyTimer
	Anim = Anim
	anim_events = AnimEvents
	Speed = Speed
	start = start
	[
		{
			type = Source
			Anim = Anim
		}
	]
}

script gameobj_init_animtree 
	if GotParam \{profile}
		AddParams <profile>
	endif
	if GotParam \{AnimTargets}
		Anim_InitTree {
			Tree = <Tree>
			DefaultCommandTarget = <DefaultCommandTarget>
			NodeIdDeclaration = <AnimTargets>
			params = <AnimTreeParams>
		}
		Anim_Enable \{off}
	endif
endscript

script GameObj_PlayAnim \{target = Body
		Tree = $GameObj_StandardAnimBranch
		TimerType = Play
		Speed = 1.0
		start = 0.0
		AnimEvents = off
		BlendDuration = -1.0}
	if NOT GotParam \{Anim}
		Anim_GetDefaultAnimName
		Anim = <DefaultAnimName>
	endif
	Anim_Enable
	Anim_Command target = <target> command = DegenerateBlend_AddBranch params = {
		Tree = <Tree>
		BlendDuration = <BlendDuration>
		params = {
			Anim = <Anim>
			Speed = <Speed>
			TimerType = <TimerType>
			start = <start>
			AnimEvents = <AnimEvents>
		}
	}
endscript

script GameObj_WaitAnimFinished \{Timer = BodyTimer}
	Anim_Command target = <Timer> command = Timer_WaitAnimComplete
endscript

script GameObj_WaitAnim 
	Anim_Command target = BodyTimer command = Timer_Wait params = {<...>}
endscript

script GameObj_AnimComplete \{Timer = BodyTimer}
	if Anim_Command target = <Timer> command = Timer_IsAnimComplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script CreateObjLabel 
	Obj_GetID
	SpawnScriptLater MaintainObjLabel params = {ObjID = <ObjID>}
endscript

script MaintainObjLabel 
	<id> = (<ObjID> + 5)
	begin
	if CompositeObjectExists name = <ObjID>
		<ObjID> :Obj_GetPosition
		FormatText TextName = text qs("\L%a") a = <ObjID> nowarning
		if ObjectExists id = <id>
			SetScreenElementProps id = <id> text = <text> pos3D = (<pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		else
			create_object_label id = <id> text = <text> pos3D = (<pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		endif
	else
		if ScreenElementExists id = <id>
			DestroyScreenElement id = <id>
		endif
		break
	endif
	Wait \{1
		frame}
	repeat
endscript

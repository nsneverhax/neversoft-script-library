viewerobj_components = [
	{
		Component = viewerobj
		geom_heap = DebugHeap
	}
	{
		Component = Suspend
	}
	{
		Component = motion
	}
	{
		Component = Sound
	}
]
viewerobj_AnimTree = {
	type = ModelViewer
	id = ModelViewerNode
	[
		{
			type = Cycle
			id = CycleNode
			Anim = param_anim
			enable_anim_events
			[
				{
					type = Source
					id = SourceNode
					Anim = param_anim
				}
			]
		}
	]
}

script viewerobj_set_anim 
	Anim_UnInitTree
	if NOT Anim_AnimExists Anim = <AnimName>
		printf qs("\LBad anim name: %a") a = <AnimName>
		Anim_GetDefaultAnimName
		if Anim_AnimExists Anim = <DefaultAnimName>
			AnimName = <DefaultAnimName>
		endif
	endif
	printf qs("\LSet anim: %a") a = <AnimName>
	Anim_InitTree {
		Tree = $viewerobj_AnimTree
		NodeIdDeclaration = [
			ModelViewerNode
			CycleNode
			SourceNode
		]
		params = {
			param_anim = <AnimName>
		}
	}
endscript

script viewerobj_set_anim_speed 
	Anim_Command \{command = ModelViewer_Play
		target = ModelViewerNode}
	Anim_Command command = Timer_SetSpeed target = CycleNode params = {Speed = <Speed>}
endscript

script viewerobj_reload_anim 
	printstruct <...>
	Anim_UnInitTree
	ReloadAnim filename = <filename> Anim = <AnimName>
	viewerobj_set_anim <...>
endscript

script viewerobj_step_frame 
	Anim_Command \{command = Timer_SetSpeed
		target = CycleNode
		params = {
			Speed = 1.0
		}}
	Anim_Command command = ModelViewer_Step target = ModelViewerNode params = <...>
endscript

script viewer_obj_get_panel_info 
	Anim_Command \{command = Source_GetAnimName
		target = SourceNode}
	if Anim_Command \{command = ModelViewer_IsStopped
			target = ModelViewerNode}
		Speed = 0.0
	else
		Anim_Command \{command = Timer_GetSpeed
			target = CycleNode}
	endif
	Anim_Command \{command = Timer_GetCurrentAnimTime
		target = CycleNode}
	Anim_Command \{command = Timer_GetAnimDuration
		target = CycleNode}
	FormatText TextName = line1 qs("\LNAME: %n") n = <AnimName> DontAssertForChecksums
	FormatText TextName = line2 qs("\LSPEED: %s") s = <Speed>
	FormatText TextName = line3 qs("\LTIME: %t of %d") t = <CurrentTime> d = <duration>
	CurrentTime = ((<CurrentTime> * 60) + 1)
	duration = (<duration> * 60)
	CastToInteger \{CurrentTime}
	CastToInteger \{duration}
	FormatText TextName = line4 qs("\LFRAME: %t of %d") t = <CurrentTime> d = <duration>
	return <...>
endscript
generic_model_anim_tree = {
	type = DegenerateBlend
	id = RootNode
}
generic_model_anim_branch = {
	type = param_timer_type
	id = TimerNode
	Speed = param_speed
	start = param_start
	Anim = param_anim
	[
		{
			type = Source
			id = SourceNode
			Anim = param_anim
		}
	]
}
generic_model_anim_branch_flipped = {
	type = flip
	id = FlipNode
	[
		{
			generic_model_anim_branch
		}
	]
}

script ModelViewer_InitAnimTree 
	Anim_UnInitTree
	Anim_InitTree \{Tree = $generic_model_anim_tree
		NodeIdDeclaration = [
			RootNode
			TimerNode
			SourceNode
			FlipNode
		]}
endscript

script ModelViewer_PlayAnim \{Anim = 0
		target = RootNode
		Tree = $generic_model_anim_branch
		Flipped = 0}
	timer_type = Play
	if GotParam \{Cycle}
		timer_type = Cycle
	endif
	if (<Flipped> = 1)
		<Tree> = generic_model_anim_branch_flipped
	endif
	Anim_Command {
		target = <target>
		command = DegenerateBlend_AddBranch
		params = {
			BlendDuration = <BlendPeriod>
			Tree = <Tree>
			params = {
				param_timer_type = <timer_type>
				param_anim = <Anim>
				param_speed = <Speed>
				param_start = <start>
			}
		}
	}
endscript

script ModelViewer_WaitAnimFinished \{Timer = TimerNode}
	Anim_Command target = <Timer> command = Timer_Wait
endscript

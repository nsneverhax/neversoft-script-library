viewerobj_components = [
	{
		component = ViewerObj
		geom_heap = debugheap
	}
	{
		component = Suspend
	}
	{
		component = motion
	}
	{
		component = Sound
	}
]
viewerobj_AnimTree = {
	type = ModelViewer
	id = ModelViewerNode
	[
		{
			type = Cycle
			id = CycleNode
			anim = param_anim
			enable_anim_events
			[
				{
					type = Source
					id = SourceNode
					anim = param_anim
				}
			]
		}
	]
}

script viewerobj_set_anim 
	Anim_UnInitTree
	if NOT Anim_AnimExists anim = <AnimName>
		printf qs(0xeed66399) a = <AnimName>
		Anim_GetDefaultAnimName
		if Anim_AnimExists anim = <defaultAnimName>
			AnimName = <defaultAnimName>
		endif
	endif
	printf qs(0xd40eece1) a = <AnimName>
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
	Anim_Command \{Command = ModelViewer_Play
		target = ModelViewerNode}
	Anim_Command Command = Timer_SetSpeed target = CycleNode params = {speed = <speed>}
endscript

script viewerobj_reload_anim 
	printstruct <...>
	Anim_UnInitTree
	ReloadAnim FileName = <FileName> anim = <AnimName>
	viewerobj_set_anim <...>
endscript

script viewerobj_step_frame 
	Anim_Command \{Command = Timer_SetSpeed
		target = CycleNode
		params = {
			speed = 1.0
		}}
	Anim_Command Command = ModelViewer_Step target = ModelViewerNode params = <...>
endscript

script viewer_obj_get_panel_info 
	Anim_Command \{Command = Source_GetAnimName
		target = SourceNode}
	if Anim_Command \{Command = ModelViewer_IsStopped
			target = ModelViewerNode}
		speed = 0.0
	else
		Anim_Command \{Command = Timer_GetSpeed
			target = CycleNode}
	endif
	Anim_Command \{Command = Timer_GetCurrentAnimTime
		target = CycleNode}
	Anim_Command \{Command = Timer_GetAnimDuration
		target = CycleNode}
	FormatText TextName = line1 qs(0x2b70644a) n = <AnimName> DontAssertForChecksums
	FormatText TextName = line2 qs(0xfb66f706) s = <speed>
	FormatText TextName = line3 qs(0x870bf224) t = <CurrentTime> d = <Duration>
	CurrentTime = ((<CurrentTime> * 60) + 1)
	Duration = (<Duration> * 60)
	CastToInteger \{CurrentTime}
	CastToInteger \{Duration}
	FormatText TextName = line4 qs(0x0c0feaaf) t = <CurrentTime> d = <Duration>
	return <...>
endscript
generic_model_anim_tree = {
	type = DegenerateBlend
	id = RootNode
}
generic_model_anim_branch = {
	type = param_timer_type
	id = TimerNode
	speed = param_speed
	start = param_start
	anim = param_anim
	[
		{
			type = Source
			id = SourceNode
			anim = param_anim
		}
	]
}
generic_model_anim_branch_flipped = {
	type = Flip
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

script ModelViewer_PlayAnim \{anim = 0
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
		Command = DegenerateBlend_AddBranch
		params = {
			BlendDuration = <BlendPeriod>
			Tree = <Tree>
			params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_speed = <speed>
				param_start = <start>
			}
		}
	}
endscript

script ModelViewer_WaitAnimFinished \{timer = TimerNode}
	Anim_Command target = <timer> Command = Timer_Wait
endscript

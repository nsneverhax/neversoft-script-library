viewerobj_components = [
	{
		component = viewerobj
		geom_heap = heap_debug
	}
	{
		component = suspend
	}
	{
		component = motion
	}
	{
		component = sound
	}
]
viewerobj_animtree = {
	type = modelviewer
	id = modelviewernode
	[
		{
			type = cycle
			id = cyclenode
			anim = param_anim
			enable_anim_events
			[
				{
					type = source
					id = sourcenode
					anim = param_anim
				}
			]
		}
	]
}

script viewerobj_set_anim 
	anim_uninittree
	if NOT anim_animexists anim = <animname>
		printf qs(0xeed66399) a = <animname>
		anim_getdefaultanimname
		if anim_animexists anim = <defaultanimname>
			animname = <defaultanimname>
		endif
	endif
	printf qs(0xd40eece1) a = <animname>
	anim_inittree {
		tree = $viewerobj_animtree
		nodeiddeclaration = [
			modelviewernode
			cyclenode
			sourcenode
		]
		params = {
			param_anim = <animname>
		}
	}
endscript

script viewerobj_set_anim_speed 
	anim_command \{command = modelviewer_play
		target = modelviewernode}
	anim_command command = timer_setspeed target = cyclenode params = {speed = <speed>}
endscript

script viewerobj_reload_anim 
	printstruct <...>
	anim_uninittree
	reloadanim filename = <filename> anim = <animname>
	viewerobj_set_anim <...>
endscript

script viewerobj_step_frame 
	anim_command \{command = timer_setspeed
		target = cyclenode
		params = {
			speed = 1.0
		}}
	anim_command command = modelviewer_step target = modelviewernode params = <...>
endscript

script viewer_obj_get_panel_info 
	anim_command \{command = source_getanimname
		target = sourcenode}
	if anim_command \{command = modelviewer_isstopped
			target = modelviewernode}
		speed = 0.0
	else
		anim_command \{command = timer_getspeed
			target = cyclenode}
	endif
	anim_command \{command = timer_getcurrentanimtime
		target = cyclenode}
	anim_command \{command = timer_getanimduration
		target = cyclenode}
	formattext textname = line1 qs(0x2b70644a) n = <animname> dontassertforchecksums
	formattext textname = line2 qs(0xfb66f706) s = <speed>
	formattext textname = line3 qs(0x870bf224) t = <currenttime> d = <duration>
	currenttime = ((<currenttime> * 60) + 1)
	duration = (<duration> * 60)
	casttointeger \{currenttime}
	casttointeger \{duration}
	formattext textname = line4 qs(0x0c0feaaf) t = <currenttime> d = <duration>
	return <...>
endscript
generic_model_anim_tree = {
	type = degenerateblend
	id = rootnode
}
generic_model_anim_branch = {
	type = param_timer_type
	id = timernode
	speed = param_speed
	start = param_start
	anim = param_anim
	[
		{
			type = source
			id = sourcenode
			anim = param_anim
		}
	]
}
generic_model_anim_branch_flipped = {
	type = flip
	id = flipnode
	[
		{
			generic_model_anim_branch
		}
	]
}

script modelviewer_initanimtree 
	anim_uninittree
	anim_inittree \{tree = $generic_model_anim_tree
		nodeiddeclaration = [
			rootnode
			timernode
			sourcenode
			flipnode
		]}
endscript

script modelviewer_playanim \{anim = 0
		target = rootnode
		tree = $generic_model_anim_branch
		flipped = 0}
	timer_type = play
	if gotparam \{cycle}
		timer_type = cycle
	endif
	if (<flipped> = 1)
		<tree> = generic_model_anim_branch_flipped
	endif
	anim_command {
		target = <target>
		command = degenerateblend_addbranch
		params = {
			blendduration = <blendperiod>
			tree = <tree>
			params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_speed = <speed>
				param_start = <start>
			}
		}
	}
endscript

script modelviewer_waitanimfinished \{timer = timernode}
	anim_command target = <timer> command = timer_wait
endscript

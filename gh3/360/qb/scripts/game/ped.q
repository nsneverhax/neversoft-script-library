ped_use_gelai = 0
ped_staticanimtree = {
	type = partialswitch
	id = pedblendroot
	[
		{
			type = degenerateblend
			id = pedfamanimparentnode
		}
		{
			type = degenerateblend
			id = pedmainanimparentnode
		}
	]
}
ped_staticanimtreewithface = {
	type = ik
	[
		{
			type = applydifference
			id = pedwithface
			[
				{
					type = degenerateblend
					id = face
				}
				{
					type = partialswitch
					id = pedblendroot
					[
						{
							type = degenerateblend
							id = pedfamanimparentnode
						}
						{
							type = degenerateblend
							id = pedmainanimparentnode
						}
					]
				}
			]
		}
	]
}
ped_animbranch_standard = {
	type = param_timer_type
	id = bodytimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = bodysource
			type = source
			anim = param_anim
		}
	]
}
ped_animbranch_lookat = {
	id = lookatcontroller
	type = differencelookat
	params = param_lookat_params
	target = param_lookat_target
	[
		{
			$ped_animbranch_standard
		}
	]
}
ped_animbranch_famstandard = {
	type = param_timer_type
	id = famtimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = pedfamanimnode
			type = source
			anim = param_anim
		}
	]
}
ped_animbranch_famempty = {
	type = blank
}
ped_animbranch_flipped = {
	type = flip
	id = bodyflip
	[
		{
			$ped_animbranch_standard
		}
	]
}
ped_animbranch_overlay = {
	type = param_timer_type
	id = bodytimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = bodyoverlay
			type = overlay
			anim = param_overlay
			[
				{
					id = bodysource
					type = source
					anim = param_anim
				}
			]
		}
	]
}
gameobj_animtree = {
	type = degenerateblend
	id = body
}
gameobj_ragdollanimtree = {
	type = ragdoll
	[
		{
			type = degenerateblend
			id = body
		}
	]
}
gameobj_standardanimbranch = {
	type = timertype
	id = bodytimer
	anim = anim
	anim_events = animevents
	speed = speed
	start = start
	[
		{
			type = source
			anim = anim
		}
	]
}

script ped_initstaticanimtree \{tree = $ped_staticanimtree}
	anim_uninittree
	anim_inittree tree = <tree> nodeiddeclaration = [
		pedmainanimparentnode
		pedfamanimparentnode
		pedblendroot
		famtimer
		pedfamanimnode
		bodytimer
		bodysource
		bodyoverlay
		lookatcontroller
		pedwithface
		face
		faceidle_timer
		face_timer
		face_source
	]
endscript

script ped_adddegenerateblendbranch 
	ped_anim_command \{command = degenerateblend_addbranch
		params = {
			tree = $ped_animbranch_standard
			params = {
				param_timer_type = play
				param_anim = ped_m_idle1
			}
		}}
	anim_updatepose
	anim_command \{command = degenerateblend_setnextblendduration
		params = {
			0.0
		}}
endscript

script ped_playanim \{anim = 0
		target = pedmainanimparentnode
		tree = $ped_animbranch_standard
		source = bodysource
		flipped = 0}
	if gotparam \{norestart}
		if ped_anim_command target = <source> command = source_animequals params = {<anim>}
			return
		endif
	endif
	timer_type = play
	if gotparam \{cycle}
		timer_type = cycle
	endif
	if gotparam \{wobble}
		timer_type = wobble
	endif
	if (<flipped> = 1)
		<tree> = ped_animbranch_flipped
	endif
	if gotparam \{partialanimoverlay}
		ped_anim_command target = ped_animbranch_overlay command = degenerateblend_addbranch params = {
			blendduration = <blendperiod>
			tree = <tree> params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_overlay = <partialanimoverlay>
				param_speed = <speed>
				param_start = <start>
			}
		}
	else
		ped_anim_command target = <target> command = degenerateblend_addbranch params = {
			blendduration = <blendperiod>
			tree = <tree> params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_speed = <speed>
				param_start = <start>
				param_lookat_params = <lookat_params>
				param_lookat_target = <lookat_target>
			}
		}
	endif
	if (debug_pedinfo = 1)
		settags lastanim = <anim>
	endif
endscript

script ped_anim_command 
	anim_command <...>
	obj_getid
	getsingletag \{board_id}
	if gotparam \{board_id}
		if iscreated <board_id>
			<board_id> :anim_command <...>
		endif
	endif
endscript

script ped_waitanimfinished \{timer = bodytimer}
	ped_anim_command target = <timer> command = timer_wait
endscript

script ped_waitanim 
	ped_anim_command target = bodytimer command = timer_wait params = {<...>}
endscript

script ped_animcomplete \{timer = bodytimer}
	if anim_command target = <timer> command = timer_isanimcomplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script ped_animequals 
	if anim_command target = bodysource command = source_animequals params = {<...>}
		return \{1}
	endif
	return \{0}
endscript

script ped_getanimduration \{timer = bodytimer}
	anim_command target = <timer> command = timer_getanimduration
	return <duration>
endscript

script ped_setanimcyclemode 
	timer_type = cycle
	if gotparam \{off}
		timer_type = play
	endif
	anim_command \{target = bodysource
		command = source_getanimname}
	anim = <animname>
	anim_command \{target = bodytimer
		command = timer_getframefactor}
	start = <framefactor>
	anim_command target = pedmainanimparentnode command = degenerateblend_addbranch params = {
		blendduration = <blendperiod>
		tree = $ped_animbranch_standard params = {
			param_timer_type = <timer_type>
			param_anim = <anim>
			param_speed = <speed>
			param_start = <start>
		}
	}
endscript

script ped_flip 
endscript

script gameobj_init_animtree 
	if gotparam \{profile}
		addparams <profile>
	endif
	if gotparam \{animtargets}
		anim_inittree {
			tree = <tree>
			defaultcommandtarget = <defaultcommandtarget>
			nodeiddeclaration = <animtargets>
			params = <animtreeparams>
			animeventtablename = <animeventtablename>
		}
		anim_enable \{off}
	endif
endscript

script gameobj_playanim \{target = body
		tree = $gameobj_standardanimbranch
		timertype = play
		speed = 1.0
		start = 0.0
		animevents = off
		blendduration = -1.0}
	if NOT gotparam \{anim}
		anim_getdefaultanimname
		anim = <defaultanimname>
	endif
	anim_enable
	anim_command target = <target> command = degenerateblend_addbranch params = {
		tree = <tree>
		blendduration = <blendduration>
		params = {
			anim = <anim>
			speed = <speed>
			timertype = <timertype>
			start = <start>
			animevents = <animevents>
		}
	}
endscript

script gameobj_waitanimfinished \{timer = bodytimer}
	anim_command target = <timer> command = timer_waitanimcomplete
endscript

script gameobj_waitanim 
	anim_command target = bodytimer command = timer_wait params = {<...>}
endscript

script gameobj_animcomplete \{timer = bodytimer}
	if anim_command target = <timer> command = timer_isanimcomplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script createobjlabel 
	obj_getid
	spawnscriptlater maintainobjlabel params = {objid = <objid>}
endscript

script maintainobjlabel 
	<id> = (<objid> + 5)
	begin
	if compositeobjectexists name = <objid>
		<objid> :obj_getposition
		formattext textname = text "%a" a = <objid> nowarning
		if objectexists id = <id>
			setscreenelementprops id = <id> text = <text> pos3d = (<pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		else
			create_object_label id = <id> text = <text> pos3d = (<pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		endif
	else
		if screenelementexists id = <id>
			destroyscreenelement id = <id>
		endif
		break
	endif
	wait \{1
		frame}
	repeat
endscript

script ped_disable_bones 
endscript

script ped_enable_bones 
endscript

script ped_initbehaviorfromprofile 
	if gotparam \{behaviorinitscript}
		<behaviorinitscript>
	endif
endscript

script create_ped_label 
	setscreenelementlock \{id = root_window
		off}
	createscreenelement {
		id = <id>
		type = textblockelement
		parent = root_window
		font = text_a1
		text = ""
		scale = 1.0
		pos = (0.0, 0.0)
		rgba = [0 128 0 128]
		dims = (250.0, 0.0)
		allow_expansion
		just = [center top]
	}
endscript

script destroy_ped_label 
	if objectexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script destroy_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if iscoiminited
				printf \{"destroy_global_peds_in_zone called"}
				cleanupglobalpednodearray name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript

script spawn_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if iscoiminited
				printf \{"spawn_global_peds_in_zone called"}
				parseglobalpednodearray name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript

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
		formattext textname = text qs(0x0bc409e2) a = <objid> nowarning
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

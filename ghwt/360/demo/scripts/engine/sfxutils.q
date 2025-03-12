
script flashsounds 
	enableremovesoundentry \{enable}
	stars
	printf \{qs(0x1565cdb1)}
	unloadpak \{'zones/global/global_sfx.pak'
		heap = heap_audio}
	waitunloadpak \{'zones/global/global_sfx.pak'}
	loadpak \{'zones/global/global_sfx.pak'
		no_vram
		heap = heap_audio}
	stars
	printf \{qs(0x2f7fe05d)}
endscript
sfxprevieweventtree_fam = {
	type = fam
	[
		{
			type = source
			anim = sk9_skater_default
		}
	]
}

script sfxcreatetestfamobject 
	if compositeobjectexists \{sfxprevieweventobject}
		sfxprevieweventobject :die
	endif
	skater :obj_getposition
	skater :obj_getquat
	createcompositeobject priority = coim_priority_permanent heap = generic {
		components = [{component = setdisplaymatrix} {component = animtree}
			{component = skeleton} {component = model}
			{component = agent} {component = fam}]
		params = {name = sfxprevieweventobject pos = <pos> orientation = <quat> clonefrom = skater
			skeletonname = sk9_skater species = human voice_profile = teenmaleskater1 sex = male
			notice_radius = 6.0 agent_stats = stats_player faction = $faction_test}
	}
	sfxprevieweventobject :anim_inittree \{tree = sfxprevieweventtree_fam
		nodeiddeclaration = [
			fam
		]}
endscript

script sfxcreatetestobject 
	if compositeobjectexists \{sfxprevieweventobject}
		sfxprevieweventobject :die
	endif
	getcurrentcameraobject
	<camid> :obj_getposition
	<camid> :obj_getquat
	pos = (<pos> + (10 * <quat>))
	createcompositeobject priority = coim_priority_permanent heap = generic {
		components = [{component = sound}]
		params = {name = sfxprevieweventobject pos = <pos> orientation = <quat>}
	}
endscript

script sfxdestroytestobject 
	if compositeobjectexists \{sfxprevieweventobject}
		sfxprevieweventobject :die
	endif
endscript

script previewsoundevent 
	extendcrc <event> '_container' out = container_name
	if structurecontains structure = $<container_name> command
		printf qs(0xf80d42ac) s = <event>
		if checksumequals a = ($<container_name>.command) b = playsound
			printf \{qs(0xf19fe69b)}
			soundevent event = <event>
		elseif checksumequals a = ($<container_name>.command) b = obj_playsound
			printf \{qs(0xfb51125d)}
			sfxcreatetestobject
			soundevent event = <event> object = sfxprevieweventobject
		elseif checksumequals a = ($<container_name>.command) b = agent_playvo
			printf \{qs(0x5b7098dd)}
			<buss> = master
			sfxcreatetestfamobject
			soundevent event = <event> object = sfxprevieweventobject <...>
		else
			printf \{qs(0x06a01c00)}
		endif
		waittime = 0
		begin
		if NOT (issoundeventplaying <event>)
			break
		endif
		if (<waittime> > 200)
			stopsoundevent <event>
			break
		endif
		wait \{0.1
			seconds}
		waittime = (<waittime> + 1)
		repeat
		sfxdestroytestobject
	else
		printf qs(0x3154d6a7) s = <container_name>
	endif
endscript

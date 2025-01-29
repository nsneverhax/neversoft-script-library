
script flashsounds 
	enableremovesoundentry \{enable}
	stars
	printf \{"Flashing global_sfx pak"}
	unloadpak \{'zones/global/global_sfx.pak'
		heap = heap_audio
		localized}
	waitunloadpak \{'zones/global/global_sfx.pak'}
	loadpak \{'zones/global/global_sfx.pak'
		no_vram
		heap = heap_audio
		localized}
	stars
	printf \{"Sfx Pak flashing done."}
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
			{component = agent} {component = fam} {component = stream}]
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
		printf "Previewing SoundEvent %s" s = <event>
		if checksumequals a = ($<container_name>.command) b = playsound
			printf \{"Playsound!"}
			soundevent event = <event>
		elseif checksumequals a = ($<container_name>.command) b = obj_playsound
			printf \{"Obj_Playsound!"}
			sfxcreatetestobject
			soundevent event = <event> object = sfxprevieweventobject
		elseif checksumequals a = ($<container_name>.command) b = agent_playvo
			printf \{"Agent_PlayVO!"}
			<stream_priority> = 1
			<logic_priority> = 50
			<animate_mouth> = true
			<buss_id> = `default`
			<no_pitch_mod> = false
			<use_pos_info> = true
			<can_use_stream> = true
			<dropoff> = 50
			<dropoff_function> = standard
			sfxcreatetestfamobject
			soundevent event = <event> object = sfxprevieweventobject <...>
		else
			printf \{"Sound Event Command is invalid"}
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
		printf "sound event does not exist: %s" s = <container_name>
	endif
endscript

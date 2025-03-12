cas_object_name_list = [
	cas_musician1
	cas_musician2
	cas_musician3
	cas_musician4
]
cas_queue_min_frames_between_jobs = 12
cas_queue_min_frames_between_jobs_fast_cas = 6

script cas_queue_add_request 
	requireparams \{[
			appearance
			player
		]
		all}
	printscriptinfo 'cas_queue_add_request %d' d = <player>
	if ((<player> < 1) || (<player> > 4))
		scriptassert \{'player must be 1-4'}
	endif
	index = (<player> - 1)
	generatechecksumfromstruct \{structname = appearance}
	if NOT structurecontains structure = ($cas_queue_player_info [<index>]) pos
		cas_set_object_node_pos player = <player>
	endif
	player_info = ($cas_queue_player_info [<index>])
	if NOT gotparam \{force_update}
		if structurecontains structure = <player_info> object
			printf \{'has old object'}
			old_object = (<player_info>.object)
		endif
		if cas_queue_is_busy \{characters_only}
			if (($cas_queue_current_job.current_player_index) = <index>)
				if (($cas_queue_current_job.appearance_checksum) = <structure_checksum>)
					if NOT gotparam \{in_cas}
						printf \{'cas_queue_add_request - Already have this appearance'}
						return
					endif
				endif
				if gotparam \{in_cas}
					if gotparam \{old_object}
						if compositeobjectexists name = <old_object>
							if <old_object> :ishidden
								printf \{'Object is hidden in CAS. Fixing instrument havok freakout...'}
								instrument_havok_fix = 1
							endif
						endif
					endif
				endif
				if NOT gotparam \{instrument_havok_fix}
					cascancelloading
					cancelled_loading = 1
					printf 'Cancelled existing load on %d' d = <player>
				endif
				if gotparam \{old_object}
					if compositeobjectexists name = <old_object>
						if NOT <old_object> :getsingletag body_checksum
							scriptassert \{'body_checksum missing from object'}
						endif
						current_body_checksum = <body_checksum>
					endif
				endif
			endif
		endif
		if NOT gotparam \{cancelled_loading}
			if gotparam \{old_object}
				if compositeobjectexists name = <old_object>
					if NOT <old_object> :getsingletag appearance_checksum
						scriptassert \{'appearance_checksum missing from object'}
					endif
					if NOT <old_object> :getsingletag body_checksum
						scriptassert \{'body_checksum missing from object'}
					endif
					if (<appearance_checksum> = <structure_checksum>)
						if NOT gotparam \{in_cas}
							printf \{'cas_queue_add_request - Already have this appearance in old cancelled object'}
							return
						endif
					endif
					current_body_checksum = <body_checksum>
				endif
			endif
		endif
	endif
	printf 'Kicking off a new load for %d' d = <player>
	fast_cas_update = 0
	if gotparam \{in_cas}
		get_body_checksum_from_appearance appearance = <appearance>
		if gotparam \{current_body_checksum}
			if (<current_body_checksum> = <body_checksum>)
				fast_cas_update = 1
			endif
		endif
	endif
	getlogicframe
	get_is_female_from_appearance appearance = <appearance>
	player_info = {
		<player_info>
		pending_appearance = <appearance>
		pending_instrument = <instrument>
		pending_is_female = <is_female>
		requested_frame = <logicframe>
		fast_cas_update = <fast_cas_update>
		hide_old_character = <hide_old_character>
	}
	setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = <player_info>
	spawnscriptnow cas_queue_update params = {new_request_index = <index>}
endscript

script cas_queue_kill_player 
	requireparams \{[
			player
		]
		all}
	printf 'cas_queue_kill_player %d' d = <player>
	if ((<player> < 1) || (<player> > 4))
		scriptassert \{'player must be 1-4'}
	endif
	index = (<player> - 1)
	if cas_queue_is_busy \{characters_only}
		if (($cas_queue_current_job.current_player_index) = <index>)
			cascancelloading
			if structurecontains \{structure = $cas_queue_current_job
					old_object}
				old_object = ($cas_queue_current_job.old_object)
				if compositeobjectexists name = <old_object>
					cas_queue_internal_destroy_object object = <old_object> kill_pending_jobs
					return
				endif
			endif
		endif
	endif
	if cas_player_has_character_object player = <player>
		cas_queue_internal_destroy_object object = <character_object> kill_pending_jobs
	endif
	player_info = ($cas_queue_player_info [<index>])
	cas_queue_remove_job_details player_info = <player_info> index = <index>
endscript

script cas_cancel_loading_callback 
	if ($cas_queue_waiting_to_start = 1)
		change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
endscript

script cancel_all_cas_loads 
	if cas_queue_is_busy \{characters_only}
		active_player = ($cas_queue_current_job.current_player_index)
	else
		active_player = 999
	endif
	if gotparam \{except}
		except = (<except> -1)
	else
		except = 999
	endif
	i = 0
	begin
	if (<i> != <except>)
		if (<i> = <active_player>)
			cascancelloading
		else
			player_info = ($cas_queue_player_info [<i>])
			cas_queue_remove_job_details player_info = <player_info> index = <i>
			if gotparam \{kill}
				if structurecontains structure = <player_info> requested_frame
					cas_queue_kill_player player = (<i> + 1)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat 4
	if gotparam \{kill}
		if (<active_player> <= 4)
			if NOT (<active_player> = <except>)
				cas_queue_kill_player player = (<active_player> + 1)
			endif
		endif
	endif
endscript

script cas_queue_update 
	printf \{'cas_queue_update'}
	setscriptcannotpause
	if scriptisrunning \{updatecurrentcasmodelspawned}
		printf \{'cas_queue_is_busy: UpdateCurrentCASModelSpawned is running'}
		return
	endif
	if gotparam \{new_request_index}
		cas_start_loading_anim player_index = <new_request_index>
	endif
	if cas_queue_is_busy
		return
	endif
	onexitrun \{cas_queue_update_death}
	if ($cas_queue_lock = 1)
		scriptassert \{'cas_queue_lock'}
	endif
	change \{cas_queue_lock = 1}
	cas_queue_rawpak_update
	if cas_queue_get_next_entry
		cas_start_loading_anim player_index = <index>
		player_info = ($cas_queue_player_info [<index>])
		fast_cas_update = (<player_info>.fast_cas_update)
		new_appearance = (<player_info>.pending_appearance)
		new_instrument = (<player_info>.pending_instrument)
		hide_old_character = (<player_info>.hide_old_character)
		cas_queue_prepare_new_object player_info = <player_info>
		cas_queue_start_job new_object = <new_object> old_object = <old_object> index = <index>
		min_frames = ($cas_queue_min_frames_between_jobs)
		if (<fast_cas_update> = 1)
			min_frames = ($cas_queue_min_frames_between_jobs_fast_cas)
		endif
		if ($cas_queue_waiting_to_start_cancelled = 1)
			scriptassert \{'This should never be set here'}
		endif
		change \{cas_queue_waiting_to_start = 1}
		begin
		getlogicframe
		waited = (<logicframe> - ($cas_queue_last_job_frame))
		if (<waited> >= <min_frames>)
			break
		endif
		if ($cas_queue_waiting_to_start_cancelled = 1)
			break
		endif
		wait \{1
			gameframe}
		printf \{'Waiting due to CAS queue spamming...'}
		repeat
		change cas_queue_last_job_frame = <logicframe>
		change \{cas_queue_waiting_to_start = 0}
		if ($cas_queue_waiting_to_start_cancelled = 0)
			if (<fast_cas_update> = 1)
				cas_queue_fast_update {
					cas_object = <new_object>
					appearance = <new_appearance>
					instrument = <new_instrument>
				}
			else
				cas_queue_build_new_character {
					index = <index>
					old_object = <old_object>
					new_object = <new_object>
					profile = {
						name = 'frontendguy'
						appearance = <new_appearance>
					}
					instrument = <new_instrument>
					hide_old_character = <hide_old_character>
				}
			endif
		else
			printf \{'Cancelled during the waiting_to_start'}
			change \{cas_queue_waiting_to_start_cancelled = 0}
		endif
		if ($cas_queue_waiting_to_start_cancelled = 1)
			scriptassert \{'This should never be set here'}
		endif
		player_info = ($cas_queue_player_info [<index>])
		if NOT structurecontains structure = <player_info> requested_frame
			cas_stop_loading_anim player_index = <index>
		endif
		change \{cas_queue_current_job = {
			}}
		change \{cas_queue_lock = 0}
		spawnscriptnow \{cas_queue_update}
	endif
	change \{cas_queue_lock = 0}
	onexitrun \{nullscript}
endscript

script cas_queue_update_death 
	scriptassert \{'cas_queue_update_death - My death is a sorry thing indeed'}
endscript

script cas_queue_rawpak_update 
	if existspakmanmap \{map = cas_rawpaks}
		begin
		if ($cas_queue_rawpak = none)
			break
		endif
		current_loading_rawpak = ($cas_queue_rawpak)
		change \{cas_queue_rawpak = none}
		if NOT existspakmanmap \{map = cas_rawpaks}
			printf \{'rawpak map deleted before we got a chance to load... bailing'}
			return
		endif
		if NOT cas_rawpak_check_current check = <current_loading_rawpak>
			setpakmancurrent map = cas_rawpaks pak = <current_loading_rawpak>
			cas_rawpak_wait_for_load
		endif
		repeat
	endif
endscript

script cas_queue_get_next_entry 
	getarraysize \{$cas_queue_player_info}
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if structurecontains structure = <player_info> requested_frame
		frame = (<player_info>.requested_frame)
		if NOT gotparam \{earliest_frame}
			earliest_frame = <frame>
		endif
		if (<frame> <= <earliest_frame>)
			earliest_frame = <frame>
			earliest_frame_index = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if gotparam \{earliest_frame_index}
		return true index = <earliest_frame_index>
	endif
endscript

script cas_queue_prepare_new_object 
	if structurecontains structure = <player_info> object
		old_object = (<player_info>.object)
	endif
	if (<player_info>.fast_cas_update = 1)
		if NOT compositeobjectexists name = <old_object>
			scriptassert 'Cannot fast update on %d' d = <old_object>
		endif
		new_object = <old_object>
		removeparameter \{old_object}
	else
		if cas_queue_get_unused_object
			new_object = <unused_object>
		else
			if NOT gotparam \{old_object}
				scriptassert \{'We should have an old object if all objects are in use'}
			endif
			cas_queue_internal_destroy_object object = <old_object>
			new_object = <old_object>
			removeparameter \{old_object}
		endif
		if compositeobjectexists name = <new_object>
			scriptassert \{'Some logic issue here, this object should not exist'}
		endif
	endif
	return old_object = <old_object> new_object = <new_object>
endscript

script cas_queue_start_job 
	requireparams \{[
			index
			new_object
		]}
	player_info = ($cas_queue_player_info [<index>])
	generatechecksumfromstruct struct = (<player_info>.pending_appearance)
	appearance_checksum = <structure_checksum>
	get_body_checksum_from_appearance appearance = (<player_info>.pending_appearance)
	is_female = (<player_info>.pending_is_female)
	change cas_queue_current_job = {
		new_object = <new_object>
		old_object = <old_object>
		current_player_index = <index>
		appearance_checksum = <appearance_checksum>
		body_checksum = <body_checksum>
		is_female = <is_female>
	}
	cas_queue_remove_job_details player_info = <player_info> index = <index> startedjob
endscript

script cas_queue_remove_job_details 
	removecomponent \{structure_name = player_info
		name = pending_appearance}
	removecomponent \{structure_name = player_info
		name = pending_instrument}
	removecomponent \{structure_name = player_info
		name = pending_is_female}
	removecomponent \{structure_name = player_info
		name = requested_frame}
	removecomponent \{structure_name = player_info
		name = fast_cas_update}
	removecomponent \{structure_name = player_info
		name = hide_old_character}
	setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = <player_info>
	if NOT gotparam \{startedjob}
		cas_stop_loading_anim player_index = <index>
	endif
endscript

script cas_queue_build_new_character 
	player_info = ($cas_queue_player_info [<index>])
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'band_mode')
		hide_old_character = 1
	elseif ((<stack> [0].base_name) = 'character_hub')
		hide_old_character = 1
	endif
	if gotparam \{hide_old_character}
		if gotparam \{old_object}
			if compositeobjectexists name = <old_object>
				cas_queue_internal_destroy_object object = <old_object>
			endif
		endif
	endif
	if create_frontend_musician {
			profile = <profile>
			name = <new_object>
			async = 1
			pos = (<player_info>.pos)
			dir = (<player_info>.dir)
		}
		stars
		printf 'Loaded new musician for %d' d = (<index>)
		stars
		player_info = ($cas_queue_player_info [<index>])
		<new_object> :obj_setposition position = (<player_info>.pos)
		<new_object> :obj_setorientation dir = (<player_info>.dir)
		player_info = {
			<player_info>
			object = <new_object>
		}
		setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = <player_info>
		if gotparam \{old_object}
			if compositeobjectexists name = <old_object>
				cas_queue_internal_destroy_object object = <old_object>
			endif
		endif
		formattext checksumname = aliasname 'cas_player%d' d = (<index> + 1)
		assignalias id = <new_object> alias = <aliasname>
		if ($band_mode_mode = none)
		else
			band_playanim name = <new_object> anim = popin no_wait
		endif
	else
		stars
		printf 'Cancelled new musician for %d' d = (<index>)
		stars
		if compositeobjectexists name = <new_object>
			cas_queue_internal_destroy_object object = <new_object>
		endif
	endif
endscript

script cas_queue_new_character_profile 
	requireparams \{[
			id
			player
			savegame
		]
		all}
	printstruct <...>
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	cas_queue_add_request appearance = (<profile_struct>.appearance) player = <player> force_update = <force_update> hide_old_character = <hide_old_character>
endscript

script cas_queue_get_unused_object 
	getarraysize \{$cas_object_name_list}
	i = 0
	begin
	object = ($cas_object_name_list [<i>])
	if NOT compositeobjectexists name = <object>
		return true unused_object = <object>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_queue_internal_destroy_object 
	destroy_band_member name = <object>
	getarraysize \{$cas_queue_player_info}
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if structurecontains structure = <player_info> object
		if ((<player_info>.object) = <object>)
			removecomponent \{structure_name = player_info
				name = object}
			if gotparam \{kill_pending_jobs}
				cas_queue_remove_job_details player_info = <player_info> index = <i>
			else
				setarrayelement arrayname = cas_queue_player_info globalarray index = <i> newvalue = <player_info>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_queue_is_busy 
	if structurecontains \{structure = $cas_queue_current_job
			new_object}
		return true busy_player = ($cas_queue_current_job.current_player_index)
	endif
	if gotparam \{in_queue_too}
		if cas_queue_get_next_entry
			return \{true}
		endif
	endif
	if NOT gotparam \{characters_only}
		if ($cas_queue_lock = 1)
			return \{true}
		endif
	endif
	return \{false}
endscript

script cas_queue_wait 
	begin
	if NOT cas_queue_is_busy in_queue_too <...>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script cas_destroy_all_characters 
	printscriptinfo \{channel = cas_debug
		'cas_destroy_all_characters'}
	cas_queue_kill_player \{player = 1}
	cas_queue_kill_player \{player = 2}
	cas_queue_kill_player \{player = 3}
	cas_queue_kill_player \{player = 4}
endscript

script cas_player_has_character_object 
	if ((<player> < 1) || (<player> > 4))
		scriptassert \{'player must be 1-4'}
	endif
	index = (<player> - 1)
	player_info = ($cas_queue_player_info [<index>])
	if structurecontains structure = <player_info> object
		if compositeobjectexists name = (<player_info>.object)
			return true character_object = (<player_info>.object)
		endif
	endif
	return \{false}
endscript

script cas_get_is_female 
	if ((<player> < 1) || (<player> > 4))
		scriptassert \{'player must be 1-4'}
	endif
	index = (<player> - 1)
	player_info = ($cas_queue_player_info [<index>])
	if structurecontains structure = <player_info> pending_is_female
		printf \{'Pending gender queried'}
		return is_female = (<player_info>.pending_is_female)
	endif
	if cas_queue_is_busy \{characters_only}
		if (($cas_queue_current_job.current_player_index) = <index>)
			printf \{'In process gender queried'}
			return is_female = ($cas_queue_current_job.is_female)
		endif
	endif
	if NOT structurecontains structure = <player_info> object
		printstruct <player_info>
		printstruct ($cas_queue_current_job)
		printf \{'player has no current object'}
		return \{is_female = 0}
	endif
	old_object = (<player_info>.object)
	if NOT compositeobjectexists name = <old_object>
		scriptassert \{'Player object doesnt exist'}
	endif
	if NOT <old_object> :getsingletag is_female
		scriptassert \{'is_female missing from object'}
	endif
	printf \{'Object gender queried'}
	return is_female = <is_female>
endscript

script cas_queue_fast_update instrument = ($cas_current_instrument) async = 1
	caswaitforcomposite
	begin
	if NOT scriptisrunning \{updatecurrentcasmodelspawned}
		break
	endif
	wait \{1
		gameframe}
	repeat
	castemporariesflush
	if <cas_object> :buildcasmodel {
			use_cache
			async = <async>
			appearance = <appearance>
			buildscriptparams = {
				<buildscriptparams>
				instrument = <instrument>
			}
		}
		<cas_object> :unhide
		return \{true}
	else
		<cas_object> :unhide
		return \{false}
	endif
endscript

script cas_set_object_node_pos \{instrument = none}
	requireparams \{[
			player
		]
		all}
	index = (<player> - 1)
	if gotparam \{node}
		getwaypointpos name = <node>
		getwaypointdir name = <node>
	else
		if getinstrumentnodename instrument = <instrument>
			getwaypointpos name = <instrument_node_name>
			getwaypointdir name = <instrument_node_name>
		else
			getwaypointpos \{name = $cas_node_name}
			getwaypointdir \{name = $cas_node_name}
		endif
	endif
	if ($autolaunch_cas_artist = 1)
		if getnode \{z_objviewer_trg_01}
			printf \{qs(0xde4aa76d)
				channel = cas_artist}
			<pos> = (<node>.pos)
			<dir> = (0.0, 0.0, 1.0)
			spawnscriptnow cas_wait_and_move params = {pos = <pos> dir = <dir> player = <player>}
		endif
	endif
	player_info = ($cas_queue_player_info [<index>])
	player_info = {
		<player_info>
		pos = <pos>
		dir = <dir>
	}
	setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = <player_info>
	if cas_player_has_character_object player = <player>
		newpos = <pos>
		<character_object> :obj_getposition
		<character_object> :obj_setposition position = <newpos>
		if NOT (<pos> = <newpos>)
			<character_object> :obj_setorientation dir = <dir>
		endif
	endif
endscript

script cas_wait_and_move 
	index = (<player> - 1)
	begin
	if structurecontains structure = ($cas_queue_player_info [<index>]) object
		<object> = ($cas_queue_player_info [<index>].object)
		<object> :obj_setposition position = <pos>
		<object> :obj_setorientation dir = <dir>
		break
	endif
	wait \{1
		gameframe}
	repeat 120
endscript

script cas_queue_block 
	begin
	if NOT cas_queue_is_busy in_queue_too <...>
		return
	endif
	casblockforloading
	casblockforcomposite
	wait \{1
		gameframe}
	repeat
endscript

script cas_get_loading_id 
	formattext checksumname = id 'cas_loading_clock_%d' d = <player_index> addtostringlookup = true
	return id = <id>
endscript

script cas_start_loading_anim 
	printscriptinfo \{'cas_start_loading_anim'}
	cas_get_loading_id player_index = <player_index>
	get_cas_loading_pos player_index = <player_index>
	if screenelementexists id = <id>
		<id> :obj_killspawnedscript name = kill_watch_timer
		<id> :se_setprops pos = <pos>
		<id> :obj_spawnscriptnow watch_animate_in params = {time = 0.2}
	else
		make_watch_timer id = <id> pos = <pos>
	endif
endscript

script cas_stop_loading_anim 
	cas_get_loading_id player_index = <player_index>
	if screenelementexists id = <id>
		<id> :obj_spawnscriptnow kill_watch_timer
	endif
endscript

script kill_watch_timer 
	setscriptcannotpause
	watch_animate_out \{time = 0.2}
	wait \{0.2
		seconds}
	die
endscript

script get_cas_loading_pos 
	requireparams \{[
			player_index
		]
		all}
	if (<player_index> > 3)
		scriptassert 'out of range %i' i = <player_index>
	endif
	switch ($cas_loading_setup)
		case band
		switch <player_index>
			case 0
			return \{pos = (-375.0, -375.0)}
			case 1
			return \{pos = (-150.0, -375.0)}
			case 2
			return \{pos = (75.0, -375.0)}
			case 3
			return \{pos = (300.0, -375.0)}
		endswitch
		case h2h
		switch <player_index>
			case 0
			return \{pos = (-375.0, -375.0)}
			case 1
			return \{pos = (300.0, -375.0)}
		endswitch
		case single
		return \{pos = (260.0, -375.0)}
		default
		scriptassert 'unknown %s' s = ($cas_loading_setup)
	endswitch
	scriptassert '%s %d' s = ($cas_loading_setup) d = <player_index>
endscript

script set_cas_loading_setup 
	requireparams \{[
			setup
		]
		all}
	change cas_loading_setup = <setup>
	i = 0
	begin
	cas_get_loading_id player_index = <i>
	if screenelementexists id = <id>
		get_cas_loading_pos player_index = <i>
		<id> :se_setprops pos = <pos>
	endif
	i = (<i> + 1)
	repeat 4
endscript

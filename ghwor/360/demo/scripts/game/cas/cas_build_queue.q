cas_object_name_list = [
	musician1
	musician2
	musician3
	musician4
]
cas_queue_min_frames_between_jobs = 12
cas_queue_min_frames_between_jobs_fast_cas = 6

script cas_queue_add_request character_id = ($cas_current_profile) instrument = none has_mic = 0 persistent_band = 0
	requireparams \{[
			appearance
		]
		all}
	if NOT gotparam \{player}
		requireparams \{[
				index
			]
			all}
		player = -1
	endif
	if NOT gotparam \{savegame}
		savegame = ($cas_current_savegame)
	endif
	if NOT gotparam \{character_id}
		character_id = ($cas_current_profile)
	endif
	if NOT gotparam \{index}
		if ((<player> < 1) || (<player> > 4))
			scriptassert 'player must be 1-4. player = %p' p = <player>
		endif
		index = (<player> - 1)
	endif
	get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = <has_mic>}
	player_info = ($cas_queue_player_info [<index>])
	if NOT gotparam \{force_update}
		if structurecontains structure = <player_info> object
			old_object = (<player_info>.object)
		endif
		if cas_queue_is_busy
			if (($cas_queue_current_job.current_player_index) = <index>)
				if (($cas_queue_current_job.appearance_checksum) = <new_appearance_checksum>)
					printf \{'cas_queue_add_request - Already have this appearance'}
					return \{false}
				endif
				cascancelloading
				cancelled_loading = 1
				printf 'Cancelled existing load on %d' d = <player>
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
					if <old_object> :getsingletag appearance_checksum
						if (<appearance_checksum> = <new_appearance_checksum>)
							printf \{'cas_queue_add_request - Already have this appearance in old cancelled object'}
							cas_queue_remove_job_details player_info = <player_info> index = <index>
							return \{false
								character_is_finished = 1}
						endif
					endif
					if NOT <old_object> :getsingletag body_checksum
						scriptassert \{'body_checksum missing from object'}
					endif
					current_body_checksum = <body_checksum>
				else
					printf \{'Old object does not exist'}
				endif
			endif
		endif
	endif
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
	printf 'Building character %c' c = <character_id>
	get_is_female_from_appearance appearance = <appearance>
	player_info = {
		<player_info>
		pending_appearance = <appearance>
		pending_instrument = <instrument>
		pending_is_female = <is_female>
		requested_frame = <logicframe>
		fast_cas_update = <fast_cas_update>
		hide_old_character = <hide_old_character>
		appearance_checksum = <new_appearance_checksum>
		character_id = <character_id>
		savegame = <savegame>
		player = <player>
		has_mic = <has_mic>
		stored_character_index = <stored_character_index>
	}
	setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = <player_info>
	spawnscriptnow cas_queue_update params = {new_request_index = <index> persistent_band = <persistent_band>}
	return \{true}
endscript

script cas_queue_kill_player 
	requireparams \{[
			player
		]
		all}
	if ((<player> < 1) || (<player> > 4))
		scriptassert \{'player must be 1-4'}
	endif
	index = (<player> - 1)
	if cas_queue_is_busy
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

script cas_queue_update 
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
	if cas_queue_get_next_entry
		cas_start_loading_anim player_index = <index>
		player_info = ($cas_queue_player_info [<index>])
		fast_cas_update = (<player_info>.fast_cas_update)
		new_appearance = (<player_info>.pending_appearance)
		new_instrument = (<player_info>.pending_instrument)
		hide_old_character = (<player_info>.hide_old_character)
		character_id = (<player_info>.character_id)
		savegame = (<player_info>.savegame)
		appearance_checksum = (<player_info>.appearance_checksum)
		has_mic = (<player_info>.has_mic)
		cas_queue_prepare_new_object player_info = <player_info> index = <index>
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
		if (<persistent_band> = 1)
			break
		endif
		wait \{1
			gameframe}
		printf \{'Waiting due to CAS queue spamming...'}
		repeat
		blockforscript \{updatecurrentcasmodelspawned}
		change cas_queue_last_job_frame = <logicframe>
		change \{cas_queue_waiting_to_start = 0}
		if ($cas_queue_waiting_to_start_cancelled = 0)
			if (<fast_cas_update> = 1)
				cas_queue_fast_update {
					cas_object = <new_object>
					appearance = <new_appearance>
					instrument = <new_instrument>
					appearance_checksum = <appearance_checksum>
				}
			else
				cas_queue_build_new_character {
					index = <index>
					old_object = <old_object>
					new_object = <new_object>
					profile = {
						appearance = <new_appearance>
					}
					instrument = <new_instrument>
					hide_old_character = <hide_old_character>
					appearance_checksum = <appearance_checksum>
					character_id = <character_id>
					savegame = <savegame>
					has_mic = <has_mic>
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
		if ($testing_strings = true)
			if (<new_instrument> = guitar || <new_instrument> = guitar_and_vocals)
				set_guitar_string_properties appearance = <new_appearance> info_struct = musician1_info name = musician1
			elseif (<new_instrument> = bass || <new_instrument> = bass_and_vocals)
				set_bass_string_properties appearance = <new_appearance> info_struct = musician1_info name = musician1
			endif
			bandmanager_createstrings \{name = musician1}
		endif
		change \{cas_queue_current_job = {
			}}
		change \{cas_queue_lock = 0}
		spawnscriptnow cas_queue_update params = {persistent_band = <persistent_band>}
	endif
	change \{cas_queue_lock = 0}
	onexitrun \{nullscript}
endscript

script cas_queue_update_death 
	scriptassert \{'cas_queue_update_death - My death is a sorry thing indeed'}
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
	requireparams \{[
			player_info
			index
		]
		all}
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
		if NOT gotparam \{old_object}
			formattext checksumname = new_object 'musician%i' i = (<index> + 1)
		else
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
	get_body_checksum_from_appearance appearance = (<player_info>.pending_appearance)
	is_female = (<player_info>.pending_is_female)
	change cas_queue_current_job = {
		new_object = <new_object>
		old_object = <old_object>
		current_player_index = <index>
		appearance_checksum = (<player_info>.appearance_checksum)
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
	removecomponent \{structure_name = player_info
		name = character_id}
	removecomponent \{structure_name = player_info
		name = savegame}
	removecomponent \{structure_name = player_info
		name = appearance_checksum}
	removecomponent \{structure_name = player_info
		name = has_mic}
	setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = <player_info>
	if NOT gotparam \{startedjob}
		cas_stop_loading_anim player_index = <index>
	endif
endscript

script cas_queue_build_new_character \{instrument = none}
	player_info = ($cas_queue_player_info [<index>])
	if gotparam \{hide_old_character}
		if gotparam \{old_object}
			if compositeobjectexists name = <old_object>
				cas_queue_internal_destroy_object object = <old_object>
			endif
		endif
	endif
	if create_band_member {
			profile_struct = <profile>
			name = <new_object>
			async = 1
			pos = (<player_info>.pos)
			dir = (<player_info>.dir)
			instrument = <instrument>
			appearance_checksum = <appearance_checksum>
			player = (<player_info>.player)
			id = <character_id>
			savegame = <savegame>
			with_mic = <has_mic>
			stored_character_index = (<player_info>.stored_character_index)
		}
		if ($is_in_cas = 0)
			persistent_band_move_and_orient_band_member name = <new_object>
		endif
		stars
		printf 'Loaded new musician for %d' d = (<index>)
		stars
		player_info = ($cas_queue_player_info [<index>])
		if structurecontains structure = <player_info> pos
			<new_object> :obj_setposition position = (<player_info>.pos)
		endif
		if structurecontains structure = <player_info> dir
			<new_object> :obj_setorientation dir = (<player_info>.dir)
		endif
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
	else
		stars
		printf 'Cancelled new musician for %d' d = (<index>)
		stars
		if compositeobjectexists name = <new_object>
			cas_queue_internal_destroy_object object = <new_object>
		endif
	endif
endscript

script cas_queue_new_character_profile \{id = !q1768515945
		player = !i1768515945
		savegame = !i1768515945}
	printstruct <...>
	characterprofilegetstruct name = <id> savegame = <savegame>
	cas_queue_add_request {
		appearance = (<profile_struct>.appearance)
		player = <player>
		force_update = <force_update>
		hide_old_character = <hide_old_character>
		instrument = <instrument>
		character_id = <id>
		savegame = <savegame>
		player = <player>
	}
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
	printscriptinfo \{'cas_destroy_all_characters'}
	cas_queue_kill_player \{player = 1}
	cas_queue_kill_player \{player = 2}
	cas_queue_kill_player \{player = 3}
	cas_queue_kill_player \{player = 4}
endscript

script cas_player_has_character_object 
	if ((<player> < 1) || (<player> > 4))
		return \{false}
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
	if cas_queue_is_busy
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
	castemporariesflush
	<cas_object> :obj_spawnscriptnow buildcasmodel params = {
		async = <async>
		appearance = <appearance>
		buildscript = modelbuilder_build_model
		buildscriptparams = {
			<buildscriptparams>
			instrument = <instrument>
		}
		appearance_checksum = <appearance_checksum>
		use_cache = 1
	}
	if (<async> = 1)
		blockforscript \{buildcasmodel}
	endif
	if ($g_cas_model_build_success = 1)
		fix_animation_struct_for_avatar object = <cas_object> instrument = <instrument>
		return \{true}
	else
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
		getwaypointquat name = <node>
	else
		if getinstrumentnodename instrument = <instrument>
			getwaypointpos name = <instrument_node_name>
			getwaypointquat name = <instrument_node_name>
		else
			getwaypointpos \{name = $cas_node_name}
			getwaypointquat \{name = $cas_node_name}
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
			<character_object> :obj_setorientation quat = <quat>
		endif
	endif
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
	requireparams \{[
			player_index
		]
		all}
	cas_get_loading_id player_index = <player_index>
	get_cas_loading_pos player_index = <player_index>
	if cas_loading_needs_recreation player_index = <player_index>
		if screenelementexists id = <id>
			<id> :die
		endif
	endif
	if screenelementexists id = <id>
		<id> :obj_killspawnedscript name = kill_watch_timer
		<id> :removetags [dying]
		<id> :se_setprops pos = <pos>
		<id> :obj_spawnscriptnow watch_animate_in params = {time = 0.2}
	else
		if ($cas_loading_setup = lobby)
			if band_lobby_get_watch_timer_parent cas_player_index = <player_index>
				make_watch_timer parent = <parent> id = <id> pos = <pos>
			else
				printf 'No lobby created yet %a' a = <player_index>
				make_watch_timer id = <id> pos = <pos>
			endif
		else
			make_watch_timer id = <id> pos = <pos>
		endif
	endif
endscript

script cas_loading_needs_recreation 
	requireparams \{[
			player_index
		]
		all}
	cas_get_loading_id player_index = <player_index>
	if screenelementexists id = <id>
		<id> :se_getparentid
		current_parent_id = <parent_id>
	else
		current_parent_id = none
	endif
	if ($cas_loading_setup = lobby)
		if band_lobby_get_watch_timer_parent cas_player_index = <player_index>
			desired_parent_id = <parent>
		else
			return \{false}
		endif
	else
		desired_parent_id = root_window
	endif
	if (<desired_parent_id> != <current_parent_id>)
		return \{true}
	else
		return \{false}
	endif
endscript

script cas_stop_loading_anim 
	requireparams \{[
			player_index
		]
		all}
	cas_get_loading_id player_index = <player_index>
	if screenelementexists id = <id>
		<id> :obj_spawnscriptnow kill_watch_timer
	endif
endscript

script kill_watch_timer 
	settags \{dying = 1}
	setscriptcannotpause
	if (($cas_loading_setup) != hidden)
		watch_animate_out \{time = 0.2}
		wait \{0.2
			seconds}
	endif
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
		case lobby
		if NOT band_lobby_get_watch_timer_parent cas_player_index = <player_index>
			return \{pos = (2000.0, -375.0)}
		endif
		return \{pos = (50.0, -50.0)}
		case single
		return \{pos = (760.0, 0.0)}
		case hidden
		return \{pos = (2000.0, -375.0)}
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
		if cas_loading_needs_recreation player_index = <i>
			if <id> :getsingletag dying
				<id> :die
			else
				<id> :die
				cas_start_loading_anim player_index = <i>
			endif
		else
			get_cas_loading_pos player_index = <i>
			<id> :se_setprops pos = <pos>
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script cas_queue_external_destroy_object 
	requireparams \{[
			name
		]
		all}
	getarraysize \{$cas_queue_player_info}
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if structurecontains structure = <player_info> object
		if (<name> = (<player_info>.object))
			removecomponent \{structure_name = player_info
				name = object}
			setarrayelement arrayname = cas_queue_player_info globalarray index = <i> newvalue = <player_info>
			return
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_queue_cancel_loading 
	if structurecontains structure = ($cas_queue_current_job) appearance_checksum
		change cas_queue_current_job = {
			($cas_queue_current_job)
			appearance_checksum = cancelled
		}
	endif
	if ($cas_queue_waiting_to_start = 1)
		change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
endscript

script set_all_character_viewports_on 
	getarraysize \{$cas_object_name_list}
	i = 0
	begin
	new_object = (($cas_object_name_list) [<i>])
	if compositeobjectexists name = <new_object>
		printf 'Setting visibility on %s for all viewports' s = <new_object>
		character_hide_particle_systems object_name = <new_object>
		<new_object> :obj_setvisibility all
		character_unhide_particle_systems object_name = <new_object>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

cas_object_name_list = [
	musician1
	musician2
	musician3
	musician4
]
cas_queue_min_frames_between_jobs = 12
cas_queue_min_frames_between_jobs_fast_cas = 6

script cas_queue_add_request character_id = ($cas_current_profile) instrument = None has_mic = 0 persistent_band = 0
	Change cas_build_model_request = (($cas_build_model_request) + 1)
	RequireParams \{[
			appearance
		]
		all}
	if NOT GotParam \{Player}
		RequireParams \{[
				index
			]
			all}
		Player = -1
	endif
	if NOT GotParam \{savegame}
		savegame = ($cas_current_savegame)
	endif
	if NOT GotParam \{character_id}
		character_id = ($cas_current_profile)
	endif
	printscriptinfo 'cas_queue_add_request %d %a %b' d = <Player> a = <character_id> b = <instrument>
	if NOT GotParam \{index}
		if ((<Player> < 1) || (<Player> > 4))
			ScriptAssert 'player must be 1-4. player = %p' p = <Player>
		endif
		index = (<Player> - 1)
	endif
	get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = <has_mic>}
	player_info = ($cas_queue_player_info [<index>])
	if NOT GotParam \{force_update}
		if StructureContains structure = <player_info> object
			old_object = (<player_info>.object)
		endif
		if cas_queue_is_busy
			if (($cas_queue_current_job.current_player_index) = <index>)
				if (($cas_queue_current_job.appearance_checksum) = <new_appearance_checksum>)
					printf \{'cas_queue_add_request - Already have this appearance'}
					return \{FALSE}
				endif
				cascancelloading
				cancelled_loading = 1
				printf 'Cancelled existing load on %d' d = <Player>
				if GotParam \{old_object}
					if CompositeObjectExists Name = <old_object>
						if NOT <old_object> :GetSingleTag body_checksum
							ScriptAssert \{'body_checksum missing from object'}
						endif
						current_body_checksum = <body_checksum>
					endif
				endif
			endif
		endif
		if NOT GotParam \{cancelled_loading}
			if GotParam \{old_object}
				if CompositeObjectExists Name = <old_object>
					if <old_object> :GetSingleTag appearance_checksum
						if (<appearance_checksum> = <new_appearance_checksum>)
							printf \{'cas_queue_add_request - Already have this appearance in old cancelled object'}
							cas_queue_remove_job_details player_info = <player_info> index = <index>
							return \{FALSE
								character_is_finished = 1}
						endif
					endif
					if NOT <old_object> :GetSingleTag body_checksum
						ScriptAssert \{'body_checksum missing from object'}
					endif
					current_body_checksum = <body_checksum>
				else
					printf \{'Old object does not exist'}
				endif
			endif
		endif
	endif
	printf 'Kicking off a new load for %d' d = <Player>
	fast_cas_update = 0
	if GotParam \{in_cas}
		get_body_checksum_from_appearance appearance = <appearance>
		if GotParam \{current_body_checksum}
			if (<current_body_checksum> = <body_checksum>)
				fast_cas_update = 1
			endif
		endif
	endif
	getlogicframe
	printf 'Building character %c' c = <character_id>
	get_is_female_from_appearance appearance = <appearance>
	if GotParam \{old_object}
		ExtendCrc <old_object> '_Info' out = info_struct
		<old_part> = ($<info_struct>.part)
		if ((<instrument> = drum) && (<old_part> != drum))
			<fast_cas_update> = 0
		elseif ((<instrument> != drum) && (<old_part> = drum))
			<fast_cas_update> = 0
		endif
	endif
	<new_player_info> = {
		pending_appearance = <appearance>
		pending_instrument = <instrument>
		pending_is_female = <is_female>
		requested_frame = <logicframe>
		fast_cas_update = <fast_cas_update>
		hide_old_character = <hide_old_character>
		appearance_checksum = <new_appearance_checksum>
		character_id = <character_id>
		savegame = <savegame>
		Player = <Player>
		has_mic = <has_mic>
		stored_character_index = <stored_character_index>
	}
	<player_info> = (<player_info> + <new_player_info>)
	SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
	SpawnScriptNow cas_queue_update params = {new_request_index = <index> persistent_band = <persistent_band>}
	return \{true}
endscript

script cas_queue_kill_player 
	RequireParams \{[
			Player
		]
		all}
	if ((<Player> < 1) || (<Player> > 4))
		ScriptAssert \{'player must be 1-4'}
	endif
	index = (<Player> - 1)
	if cas_queue_is_busy
		if (($cas_queue_current_job.current_player_index) = <index>)
			cascancelloading
			if StructureContains \{structure = $cas_queue_current_job
					old_object}
				old_object = ($cas_queue_current_job.old_object)
				if CompositeObjectExists Name = <old_object>
					cas_queue_internal_destroy_object object = <old_object> kill_pending_jobs
					return
				endif
			endif
		endif
	endif
	if cas_player_has_character_object Player = <Player>
		cas_queue_internal_destroy_object object = <character_object> kill_pending_jobs
	endif
	player_info = ($cas_queue_player_info [<index>])
	cas_queue_remove_job_details player_info = <player_info> index = <index>
endscript

script cas_queue_update 
	printf 'cas_queue_update : %a' a = ($cas_build_model_cancelled_for_mode_change)
	if ($cas_build_model_cancelled_for_mode_change = 1)
		cascancelloading
		printf \{'In cas_queue_update: CHANGING MODE'}
		return
	endif
	setscriptcannotpause
	if ScriptIsRunning \{updatecurrentcasmodelspawned}
		printf \{'cas_queue_is_busy: UpdateCurrentCASModelSpawned is running'}
		return
	endif
	if GotParam \{new_request_index}
		cas_start_loading_anim player_index = <new_request_index>
	endif
	if cas_queue_is_busy
		return
	endif
	OnExitRun \{cas_queue_update_death}
	if ($cas_queue_lock = 1)
		ScriptAssert \{'cas_queue_lock'}
	endif
	Change \{cas_queue_lock = 1}
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
			ScriptAssert \{'This should never be set here'}
		endif
		Change \{cas_queue_waiting_to_start = 1}
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
		Wait \{1
			gameframe}
		printf \{'Waiting due to CAS queue spamming...'}
		repeat
		blockforscript \{updatecurrentcasmodelspawned}
		Change cas_queue_last_job_frame = <logicframe>
		Change \{cas_queue_waiting_to_start = 0}
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
					Profile = {
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
			Change \{cas_queue_waiting_to_start_cancelled = 0}
		endif
		if ($cas_queue_waiting_to_start_cancelled = 1)
			ScriptAssert \{'This should never be set here'}
		endif
		player_info = ($cas_queue_player_info [<index>])
		if NOT StructureContains structure = <player_info> requested_frame
			cas_stop_loading_anim player_index = <index>
		endif
		if ($testing_strings = true)
			if (<new_instrument> = guitar || <new_instrument> = guitar_and_vocals)
				set_guitar_string_properties appearance = <new_appearance> info_struct = musician1_info Name = musician1
			elseif (<new_instrument> = bass || <new_instrument> = bass_and_vocals)
				set_bass_string_properties appearance = <new_appearance> info_struct = musician1_info Name = musician1
			endif
			bandmanager_createstrings \{Name = musician1}
		endif
		Change \{cas_queue_current_job = {
			}}
		Change \{cas_queue_lock = 0}
		SpawnScriptNow cas_queue_update params = {persistent_band = <persistent_band>}
	endif
	Change \{cas_queue_lock = 0}
	OnExitRun \{nullscript}
endscript

script cas_queue_update_death 
	ScriptAssert \{'cas_queue_update_death - My death is a sorry thing indeed'}
endscript

script cas_queue_get_next_entry 
	GetArraySize \{$cas_queue_player_info}
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if StructureContains structure = <player_info> requested_frame
		Frame = (<player_info>.requested_frame)
		if NOT GotParam \{earliest_frame}
			earliest_frame = <Frame>
		endif
		if (<Frame> <= <earliest_frame>)
			earliest_frame = <Frame>
			earliest_frame_index = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if GotParam \{earliest_frame_index}
		return true index = <earliest_frame_index>
	endif
endscript

script cas_queue_prepare_new_object 
	RequireParams \{[
			player_info
			index
		]
		all}
	if StructureContains structure = <player_info> object
		old_object = (<player_info>.object)
	endif
	if (<player_info>.fast_cas_update = 1)
		if NOT CompositeObjectExists Name = <old_object>
			ScriptAssert 'Cannot fast update on %d' d = <old_object>
		endif
		new_object = <old_object>
		RemoveParameter \{old_object}
	else
		if NOT GotParam \{old_object}
			formatText checksumName = new_object 'musician%i' i = (<index> + 1)
		else
			cas_queue_internal_destroy_object object = <old_object>
			new_object = <old_object>
			RemoveParameter \{old_object}
		endif
		if CompositeObjectExists Name = <new_object>
			ScriptAssert \{'Some logic issue here, this object should not exist'}
		endif
	endif
	return old_object = <old_object> new_object = <new_object>
endscript

script cas_queue_start_job 
	RequireParams \{[
			index
			new_object
		]}
	player_info = ($cas_queue_player_info [<index>])
	get_body_checksum_from_appearance appearance = (<player_info>.pending_appearance)
	is_female = (<player_info>.pending_is_female)
	Change cas_queue_current_job = {
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
	RemoveComponent \{structure_name = player_info
		Name = pending_appearance}
	RemoveComponent \{structure_name = player_info
		Name = pending_instrument}
	RemoveComponent \{structure_name = player_info
		Name = pending_is_female}
	RemoveComponent \{structure_name = player_info
		Name = requested_frame}
	RemoveComponent \{structure_name = player_info
		Name = fast_cas_update}
	RemoveComponent \{structure_name = player_info
		Name = hide_old_character}
	RemoveComponent \{structure_name = player_info
		Name = character_id}
	RemoveComponent \{structure_name = player_info
		Name = savegame}
	RemoveComponent \{structure_name = player_info
		Name = appearance_checksum}
	RemoveComponent \{structure_name = player_info
		Name = has_mic}
	SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
	if NOT GotParam \{startedjob}
		cas_stop_loading_anim player_index = <index>
	endif
endscript

script cas_queue_build_new_character \{instrument = None}
	player_info = ($cas_queue_player_info [<index>])
	if GotParam \{hide_old_character}
		if GotParam \{old_object}
			if CompositeObjectExists Name = <old_object>
				cas_queue_internal_destroy_object object = <old_object>
			endif
		endif
	endif
	if create_band_member {
			profile_struct = <Profile>
			Name = <new_object>
			async = 1
			Pos = (<player_info>.Pos)
			Dir = (<player_info>.Dir)
			instrument = <instrument>
			appearance_checksum = <appearance_checksum>
			Player = (<player_info>.Player)
			id = <character_id>
			savegame = <savegame>
			with_mic = <has_mic>
			stored_character_index = (<player_info>.stored_character_index)
		}
		if ($is_in_cas = 0)
			persistent_band_move_and_orient_band_member Name = <new_object>
		endif
		player_info = ($cas_queue_player_info [<index>])
		if StructureContains structure = <player_info> Pos
			<new_object> :Obj_SetPosition position = (<player_info>.Pos)
		endif
		if StructureContains structure = <player_info> Dir
			<new_object> :Obj_SetOrientation Dir = (<player_info>.Dir)
		endif
		player_info = {
			<player_info>
			object = <new_object>
		}
		SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
		if GotParam \{old_object}
			if CompositeObjectExists Name = <old_object>
				cas_queue_internal_destroy_object object = <old_object>
			endif
		endif
		formatText checksumName = aliasname 'cas_player%d' d = (<index> + 1)
		AssignAlias id = <new_object> alias = <aliasname>
	else
		printf 'Cancelled new musician for %d' d = (<index>)
		if ($cas_build_model_cancelled_for_mode_change = 1)
			printf \{'UNLOADING ASSETS FOR CHANGING MODES'}
			<new_object> :modelbuilder_unload
			blockforscript \{modelbuilder_unload}
		endif
		if CompositeObjectExists Name = <new_object>
			cas_queue_internal_destroy_object object = <new_object>
		endif
	endif
endscript

script cas_queue_new_character_profile \{id = !q1768515945
		Player = !i1768515945
		savegame = !i1768515945}
	characterprofilegetstruct Name = <id> savegame = <savegame>
	cas_queue_add_request {
		appearance = (<profile_struct>.appearance)
		Player = <Player>
		force_update = <force_update>
		hide_old_character = <hide_old_character>
		instrument = <instrument>
		character_id = <id>
		savegame = <savegame>
		Player = <Player>
	}
endscript

script cas_queue_internal_destroy_object 
	destroy_band_member Name = <object>
	GetArraySize \{$cas_queue_player_info}
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if StructureContains structure = <player_info> object
		if ((<player_info>.object) = <object>)
			RemoveComponent \{structure_name = player_info
				Name = object}
			if GotParam \{kill_pending_jobs}
				cas_queue_remove_job_details player_info = <player_info> index = <i>
			else
				SetArrayElement ArrayName = cas_queue_player_info globalarray index = <i> NewValue = <player_info>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cas_queue_is_busy 
	if StructureContains \{structure = $cas_queue_current_job
			new_object}
		return true busy_player = ($cas_queue_current_job.current_player_index)
	endif
	if GotParam \{in_queue_too}
		if cas_queue_get_next_entry
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script cas_queue_wait 
	begin
	if NOT cas_queue_is_busy in_queue_too <...>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script cas_destroy_all_characters 
	cas_queue_kill_player \{Player = 1}
	cas_queue_kill_player \{Player = 2}
	cas_queue_kill_player \{Player = 3}
	cas_queue_kill_player \{Player = 4}
endscript

script cas_player_has_character_object 
	if ((<Player> < 1) || (<Player> > 4))
		return \{FALSE}
	endif
	index = (<Player> - 1)
	player_info = ($cas_queue_player_info [<index>])
	if StructureContains structure = <player_info> object
		if CompositeObjectExists Name = (<player_info>.object)
			return true character_object = (<player_info>.object)
		endif
	endif
	return \{FALSE}
endscript

script cas_get_is_female 
	if ((<Player> < 1) || (<Player> > 4))
		ScriptAssert \{'player must be 1-4'}
	endif
	index = (<Player> - 1)
	player_info = ($cas_queue_player_info [<index>])
	if StructureContains structure = <player_info> pending_is_female
		printf \{'Pending gender queried'}
		return is_female = (<player_info>.pending_is_female)
	endif
	if cas_queue_is_busy
		if (($cas_queue_current_job.current_player_index) = <index>)
			printf \{'In process gender queried'}
			return is_female = ($cas_queue_current_job.is_female)
		endif
	endif
	if NOT StructureContains structure = <player_info> object
		printf \{'player has no current object'}
		return \{is_female = 0}
	endif
	old_object = (<player_info>.object)
	if NOT CompositeObjectExists Name = <old_object>
		ScriptAssert \{'Player object doesnt exist'}
	endif
	if NOT <old_object> :GetSingleTag is_female
		ScriptAssert \{'is_female missing from object'}
	endif
	printf \{'Object gender queried'}
	return is_female = <is_female>
endscript

script cas_queue_fast_update instrument = ($cas_current_instrument) async = 1
	caswaitforcomposite
	<cas_object> :Obj_SpawnScriptNow buildcasmodel params = {
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
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script cas_set_object_node_pos \{instrument = None}
	RequireParams \{[
			Player
		]
		all}
	index = (<Player> - 1)
	if GotParam \{node}
		GetWaypointPos Name = <node>
		getwaypointquat Name = <node>
	else
		if getinstrumentnodename instrument = <instrument>
			GetWaypointPos Name = <instrument_node_name>
			getwaypointquat Name = <instrument_node_name>
		else
			GetWaypointPos \{Name = $cas_node_name}
			getwaypointquat \{Name = $cas_node_name}
		endif
	endif
	player_info = ($cas_queue_player_info [<index>])
	player_info = {
		<player_info>
		Pos = <Pos>
		Dir = <Dir>
	}
	SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
	if cas_player_has_character_object Player = <Player>
		newpos = <Pos>
		<character_object> :Obj_GetPosition
		<character_object> :Obj_SetPosition position = <newpos>
		if NOT (<Pos> = <newpos>)
			<character_object> :Obj_SetOrientation Quat = <Quat>
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
	Wait \{1
		gameframe}
	repeat
endscript

script cas_get_loading_id 
	formatText checksumName = id 'cas_loading_clock_%d' d = <player_index> AddToStringLookup = true
	return id = <id>
endscript

script cas_start_loading_anim 
	RequireParams \{[
			player_index
		]
		all}
	cas_get_loading_id player_index = <player_index>
	get_cas_loading_pos player_index = <player_index>
	if cas_loading_needs_recreation player_index = <player_index>
		if ScreenElementExists id = <id>
			<id> :Die
		endif
	endif
	if ScreenElementExists id = <id>
		<id> :Obj_KillSpawnedScript Name = kill_watch_timer
		<id> :RemoveTags [dying]
		<id> :se_setprops Pos = <Pos>
		<id> :Obj_SpawnScriptNow watch_animate_in params = {time = 0.2}
	else
		if ($cas_loading_setup = lobby)
			if band_lobby_get_watch_timer_parent cas_player_index = <player_index>
				make_watch_timer parent = <parent> id = <id> Pos = <Pos>
			else
				printf 'No lobby created yet %a' a = <player_index>
				make_watch_timer id = <id> Pos = <Pos>
			endif
		else
			make_watch_timer id = <id> Pos = <Pos>
		endif
	endif
endscript

script cas_loading_needs_recreation 
	RequireParams \{[
			player_index
		]
		all}
	cas_get_loading_id player_index = <player_index>
	if ScreenElementExists id = <id>
		<id> :se_getparentid
		current_parent_id = <parent_id>
	else
		current_parent_id = None
	endif
	if ($cas_loading_setup = lobby)
		if band_lobby_get_watch_timer_parent cas_player_index = <player_index>
			desired_parent_id = <parent>
		else
			return \{FALSE}
		endif
	else
		desired_parent_id = root_window
	endif
	if (<desired_parent_id> != <current_parent_id>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script cas_stop_loading_anim 
	RequireParams \{[
			player_index
		]
		all}
	cas_get_loading_id player_index = <player_index>
	if ScreenElementExists id = <id>
		<id> :Obj_SpawnScriptNow kill_watch_timer
	endif
endscript

script kill_watch_timer 
	SetTags \{dying = 1}
	setscriptcannotpause
	if (($cas_loading_setup) != hidden)
		watch_animate_out \{time = 0.2}
		Wait \{0.2
			Seconds}
	endif
	Die
endscript

script get_cas_loading_pos 
	RequireParams \{[
			player_index
		]
		all}
	if (<player_index> > 3)
		ScriptAssert 'out of range %i' i = <player_index>
	endif
	switch ($cas_loading_setup)
		case lobby
		if NOT band_lobby_get_watch_timer_parent cas_player_index = <player_index>
			return \{Pos = (2000.0, -375.0)}
		endif
		return \{Pos = (50.0, -50.0)}
		case single
		return \{Pos = (760.0, 0.0)}
		case hidden
		return \{Pos = (2000.0, -375.0)}
		default
		ScriptAssert 'unknown %s' s = ($cas_loading_setup)
	endswitch
	ScriptAssert '%s %d' s = ($cas_loading_setup) d = <player_index>
endscript

script set_cas_loading_setup 
	RequireParams \{[
			setup
		]
		all}
	Change cas_loading_setup = <setup>
	i = 0
	begin
	cas_get_loading_id player_index = <i>
	if ScreenElementExists id = <id>
		if cas_loading_needs_recreation player_index = <i>
			if <id> :GetSingleTag dying
				<id> :Die
			else
				<id> :Die
				cas_start_loading_anim player_index = <i>
			endif
		else
			get_cas_loading_pos player_index = <i>
			<id> :se_setprops Pos = <Pos>
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script cas_queue_external_destroy_object 
	RequireParams \{[
			Name
		]
		all}
	GetArraySize \{$cas_queue_player_info}
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if StructureContains structure = <player_info> object
		if (<Name> = (<player_info>.object))
			RemoveComponent \{structure_name = player_info
				Name = object}
			SetArrayElement ArrayName = cas_queue_player_info globalarray index = <i> NewValue = <player_info>
			return
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cas_queue_cancel_loading 
	if StructureContains structure = ($cas_queue_current_job) appearance_checksum
		Change cas_queue_current_job = {
			($cas_queue_current_job)
			appearance_checksum = cancelled
		}
	endif
	if ($cas_queue_waiting_to_start = 1)
		Change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
endscript

script set_all_character_viewports_on 
	GetArraySize \{$cas_object_name_list}
	i = 0
	begin
	new_object = (($cas_object_name_list) [<i>])
	if CompositeObjectExists Name = <new_object>
		printf 'Setting visibility on %s for all viewports' s = <new_object>
		<new_object> :obj_setvisibility all
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

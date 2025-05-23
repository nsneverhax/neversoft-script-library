cas_object_name_list = [
	cas_musician1
	cas_musician2
	cas_musician3
	cas_musician4
]
cas_queue_min_frames_between_jobs = 12
cas_queue_min_frames_between_jobs_fast_cas = 6

script cas_queue_add_request 
	RequireParams \{[
			appearance
			Player
		]
		all}
	printscriptinfo 'cas_queue_add_request %d' d = <Player>
	if ((<Player> < 1) || (<Player> > 4))
		ScriptAssert \{'player must be 1-4'}
	endif
	index = (<Player> - 1)
	generatechecksumfromstruct \{structname = appearance}
	if NOT StructureContains structure = ($cas_queue_player_info [<index>]) Pos
		cas_set_object_node_pos Player = <Player>
	endif
	player_info = ($cas_queue_player_info [<index>])
	if NOT GotParam \{force_update}
		if StructureContains structure = <player_info> object
			printf \{'has old object'}
			old_object = (<player_info>.object)
		endif
		if cas_queue_is_busy \{characters_only}
			if (($cas_queue_current_job.current_player_index) = <index>)
				if (($cas_queue_current_job.appearance_checksum) = <structure_checksum>)
					if NOT GotParam \{in_cas}
						printf \{'cas_queue_add_request - Already have this appearance'}
						return
					endif
				endif
				if GotParam \{in_cas}
					if GotParam \{old_object}
						if CompositeObjectExists Name = <old_object>
							if <old_object> :ishidden
								printf \{'Object is hidden in CAS. Fixing instrument havok freakout...'}
								instrument_havok_fix = 1
							endif
						endif
					endif
				endif
				if NOT GotParam \{instrument_havok_fix}
					cascancelloading
					cancelled_loading = 1
					printf 'Cancelled existing load on %d' d = <Player>
				endif
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
					if NOT <old_object> :GetSingleTag appearance_checksum
						ScriptAssert \{'appearance_checksum missing from object'}
					endif
					if NOT <old_object> :GetSingleTag body_checksum
						ScriptAssert \{'body_checksum missing from object'}
					endif
					if (<appearance_checksum> = <structure_checksum>)
						if NOT GotParam \{in_cas}
							printf \{'cas_queue_add_request - Already have this appearance in old cancelled object'}
							return
						endif
					endif
					current_body_checksum = <body_checksum>
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
	SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
	SpawnScriptNow cas_queue_update params = {new_request_index = <index>}
endscript

script cas_queue_kill_player 
	RequireParams \{[
			Player
		]
		all}
	printf 'cas_queue_kill_player %d' d = <Player>
	if ((<Player> < 1) || (<Player> > 4))
		ScriptAssert \{'player must be 1-4'}
	endif
	index = (<Player> - 1)
	if cas_queue_is_busy \{characters_only}
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

script cas_cancel_loading_callback 
	if ($cas_queue_waiting_to_start = 1)
		Change \{cas_queue_waiting_to_start_cancelled = 1}
	endif
endscript

script cancel_all_cas_loads 
	if cas_queue_is_busy \{characters_only}
		active_player = ($cas_queue_current_job.current_player_index)
	else
		active_player = 999
	endif
	if GotParam \{except}
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
			if GotParam \{kill}
				if StructureContains structure = <player_info> requested_frame
					cas_queue_kill_player Player = (<i> + 1)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat 4
	if GotParam \{kill}
		if (<active_player> <= 4)
			if NOT (<active_player> = <except>)
				cas_queue_kill_player Player = (<active_player> + 1)
			endif
		endif
	endif
endscript

script cas_queue_update 
	printf \{'cas_queue_update'}
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
		Wait \{1
			gameframe}
		printf \{'Waiting due to CAS queue spamming...'}
		repeat
		Change cas_queue_last_job_frame = <logicframe>
		Change \{cas_queue_waiting_to_start = 0}
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
					Profile = {
						Name = 'frontendguy'
						appearance = <new_appearance>
					}
					instrument = <new_instrument>
					hide_old_character = <hide_old_character>
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
		Change \{cas_queue_current_job = {
			}}
		Change \{cas_queue_lock = 0}
		SpawnScriptNow \{cas_queue_update}
	endif
	Change \{cas_queue_lock = 0}
	OnExitRun \{nullscript}
endscript

script cas_queue_update_death 
	ScriptAssert \{'cas_queue_update_death - My death is a sorry thing indeed'}
endscript

script cas_queue_rawpak_update 
	if existspakmanmap \{map = cas_rawpaks}
		begin
		if ($cas_queue_rawpak = None)
			break
		endif
		current_loading_rawpak = ($cas_queue_rawpak)
		Change \{cas_queue_rawpak = None}
		if NOT existspakmanmap \{map = cas_rawpaks}
			printf \{'rawpak map deleted before we got a chance to load... bailing'}
			return
		endif
		if NOT cas_rawpak_check_current check = <current_loading_rawpak>
			SetPakManCurrent map = cas_rawpaks pak = <current_loading_rawpak>
			cas_rawpak_wait_for_load
		endif
		repeat
	endif
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
		if cas_queue_get_unused_object
			new_object = <unused_object>
		else
			if NOT GotParam \{old_object}
				ScriptAssert \{'We should have an old object if all objects are in use'}
			endif
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
	generatechecksumfromstruct struct = (<player_info>.pending_appearance)
	appearance_checksum = <structure_checksum>
	get_body_checksum_from_appearance appearance = (<player_info>.pending_appearance)
	is_female = (<player_info>.pending_is_female)
	Change cas_queue_current_job = {
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
	SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
	if NOT GotParam \{startedjob}
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
	if GotParam \{hide_old_character}
		if GotParam \{old_object}
			if CompositeObjectExists Name = <old_object>
				cas_queue_internal_destroy_object object = <old_object>
			endif
		endif
	endif
	if create_frontend_musician {
			Profile = <Profile>
			Name = <new_object>
			async = 1
			Pos = (<player_info>.Pos)
			Dir = (<player_info>.Dir)
		}
		stars
		printf 'Loaded new musician for %d' d = (<index>)
		stars
		player_info = ($cas_queue_player_info [<index>])
		<new_object> :Obj_SetPosition position = (<player_info>.Pos)
		<new_object> :Obj_SetOrientation Dir = (<player_info>.Dir)
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
		if ($band_mode_mode = None)
		else
			Band_PlayAnim Name = <new_object> anim = popin no_wait
		endif
	else
		stars
		printf 'Cancelled new musician for %d' d = (<index>)
		stars
		if CompositeObjectExists Name = <new_object>
			cas_queue_internal_destroy_object object = <new_object>
		endif
	endif
endscript

script cas_queue_new_character_profile 
	RequireParams \{[
			id
			Player
			savegame
		]
		all}
	printstruct <...>
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	cas_queue_add_request appearance = (<profile_struct>.appearance) Player = <Player> force_update = <force_update> hide_old_character = <hide_old_character>
endscript

script cas_queue_get_unused_object 
	GetArraySize \{$cas_object_name_list}
	i = 0
	begin
	object = ($cas_object_name_list [<i>])
	if NOT CompositeObjectExists Name = <object>
		return true unused_object = <object>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
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
	if NOT GotParam \{characters_only}
		if ($cas_queue_lock = 1)
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
	printscriptinfo \{channel = cas_debug
		'cas_destroy_all_characters'}
	cas_queue_kill_player \{Player = 1}
	cas_queue_kill_player \{Player = 2}
	cas_queue_kill_player \{Player = 3}
	cas_queue_kill_player \{Player = 4}
endscript

script cas_player_has_character_object 
	if ((<Player> < 1) || (<Player> > 4))
		ScriptAssert \{'player must be 1-4'}
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
	if cas_queue_is_busy \{characters_only}
		if (($cas_queue_current_job.current_player_index) = <index>)
			printf \{'In process gender queried'}
			return is_female = ($cas_queue_current_job.is_female)
		endif
	endif
	if NOT StructureContains structure = <player_info> object
		printstruct <player_info>
		printstruct ($cas_queue_current_job)
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
	begin
	if NOT ScriptIsRunning \{updatecurrentcasmodelspawned}
		break
	endif
	Wait \{1
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
		GetWaypointDir Name = <node>
	else
		if getinstrumentnodename instrument = <instrument>
			GetWaypointPos Name = <instrument_node_name>
			GetWaypointDir Name = <instrument_node_name>
		else
			GetWaypointPos \{Name = $cas_node_name}
			GetWaypointDir \{Name = $cas_node_name}
		endif
	endif
	if ($autolaunch_cas_artist = 1)
		if GetNode \{z_objviewer_trg_01}
			printf \{qs(0xde4aa76d)
				channel = cas_artist}
			<Pos> = (<node>.Pos)
			<Dir> = (0.0, 0.0, 1.0)
			SpawnScriptNow cas_wait_and_move params = {Pos = <Pos> Dir = <Dir> Player = <Player>}
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
			<character_object> :Obj_SetOrientation Dir = <Dir>
		endif
	endif
endscript

script cas_wait_and_move 
	index = (<Player> - 1)
	begin
	if StructureContains structure = ($cas_queue_player_info [<index>]) object
		<object> = ($cas_queue_player_info [<index>].object)
		<object> :Obj_SetPosition position = <Pos>
		<object> :Obj_SetOrientation Dir = <Dir>
		break
	endif
	Wait \{1
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
	Wait \{1
		gameframe}
	repeat
endscript

script cas_get_loading_id 
	formatText checksumName = id 'cas_loading_clock_%d' d = <player_index> AddToStringLookup = true
	return id = <id>
endscript

script cas_start_loading_anim 
	printscriptinfo \{'cas_start_loading_anim'}
	cas_get_loading_id player_index = <player_index>
	get_cas_loading_pos player_index = <player_index>
	if ScreenElementExists id = <id>
		<id> :Obj_KillSpawnedScript Name = kill_watch_timer
		<id> :se_setprops Pos = <Pos>
		<id> :Obj_SpawnScriptNow watch_animate_in params = {time = 0.2}
	else
		make_watch_timer id = <id> Pos = <Pos>
	endif
endscript

script cas_stop_loading_anim 
	cas_get_loading_id player_index = <player_index>
	if ScreenElementExists id = <id>
		<id> :Obj_SpawnScriptNow kill_watch_timer
	endif
endscript

script kill_watch_timer 
	setscriptcannotpause
	watch_animate_out \{time = 0.2}
	Wait \{0.2
		Seconds}
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
		case Band
		switch <player_index>
			case 0
			return \{Pos = (-375.0, -375.0)}
			case 1
			return \{Pos = (-150.0, -375.0)}
			case 2
			return \{Pos = (75.0, -375.0)}
			case 3
			return \{Pos = (300.0, -375.0)}
		endswitch
		case h2h
		switch <player_index>
			case 0
			return \{Pos = (-375.0, -375.0)}
			case 1
			return \{Pos = (300.0, -375.0)}
		endswitch
		case single
		return \{Pos = (260.0, -375.0)}
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
		get_cas_loading_pos player_index = <i>
		<id> :se_setprops Pos = <Pos>
	endif
	i = (<i> + 1)
	repeat 4
endscript

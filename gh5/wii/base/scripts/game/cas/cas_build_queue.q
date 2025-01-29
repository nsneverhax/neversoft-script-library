cas_object_name_list = [
	musician1
	musician2
	musician3
	musician4
]
cas_queue_min_frames_between_jobs = 12
cas_queue_min_frames_between_jobs_fast_cas = 6

script cas_queue_add_request character_id = ($cas_current_profile) instrument = None has_mic = 0
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
			printf \{'has old object'}
			old_object = (<player_info>.object)
		endif
		if cas_queue_is_busy
			if (($cas_queue_current_job.current_player_index) = <index>)
				if (($cas_queue_current_job.appearance_checksum) = <new_appearance_checksum>)
					printf \{'cas_queue_add_request - Already have this appearance'}
					return \{FALSE}
				endif
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
					if NOT <old_object> :GetSingleTag appearance_checksum
						ScriptAssert \{'appearance_checksum missing from object'}
					endif
					if NOT <old_object> :GetSingleTag body_checksum
						ScriptAssert \{'body_checksum missing from object'}
					endif
					if (<appearance_checksum> = <new_appearance_checksum>)
						printf \{'cas_queue_add_request - Already have this appearance in old cancelled object'}
						if NOT GotParam \{Force}
							return \{FALSE
								character_is_finished = 1}
						endif
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
	if NOT GotParam \{no_fast_update}
		if GotParam \{in_cas}
			get_body_checksum_from_appearance appearance = <appearance>
			if GotParam \{current_body_checksum}
				if (<current_body_checksum> = <body_checksum>)
					fast_cas_update = 1
				endif
			endif
			if GotParam \{instrument}
				cas_object = (<player_info>.object)
				<cas_object> :GetSingleTag current_instrument
				if NOT (<current_instrument> = <instrument>)
					if (<instrument> = drum || <current_instrument> = drum)
						fast_cas_update = 0
					endif
				endif
			endif
		endif
	endif
	stars
	printf qs(0x1c87054b) d = <fast_cas_update>
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
		appearance_checksum = <new_appearance_checksum>
		character_id = <character_id>
		savegame = <savegame>
		Player = <Player>
		has_mic = <has_mic>
		stored_character_index = <stored_character_index>
	}
	SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = <player_info>
	SpawnScriptNow cas_queue_update params = {new_request_index = <index>}
	return \{true}
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

script cancel_all_cas_loads 
	if cas_queue_is_busy
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

script cas_queue_cancel_load 
	RequireParams \{[
			Player
		]
		all}
	if cas_queue_is_busy
		active_player = ($cas_queue_current_job.current_player_index)
	else
		active_player = -1
	endif
	i = 0
	begin
	player_info = ($cas_queue_player_info [<i>])
	if StructureContains structure = <player_info> Player
		if ((<player_info>.Player) = <Player>)
			break
		endif
	endif
	if (<i> = 3)
		printf \{qs(0x5a1dc8c1)
			channel = persistent_band}
		return
	endif
	i = (<i> + 1)
	repeat 4
	printf qs(0x1a2ee505) i = <i> p = <Player> channel = persistent_band
	printscriptinfo \{'cas_queue_cancel_load'
		channel = persistent_band}
	if (<i> = <active_player>)
		cascancelloading
	else
		cas_queue_remove_job_details {
			player_info = ($cas_queue_player_info [<i>])
			index = <i>
		}
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
		Change \{cas_queue_current_job = {
			}}
		Change \{cas_queue_lock = 0}
		SpawnScriptNow \{cas_queue_update}
	endif
	Change \{cas_queue_lock = 0}
	Change \{disable_cas_back = 0}
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
	return \{FALSE}
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
			Player = (<player_info>.Player)
			getplayerinfo <Player> band_member out = new_object
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
	if GotParam \{old_object}
		printf \{qs(0x88b262ee)}
		if CompositeObjectExists Name = <old_object>
			printf \{qs(0x63866abd)}
			cas_queue_internal_destroy_object object = <old_object>
		endif
	endif
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
		formatText checksumName = aliasname 'cas_player%d' d = (<index> + 1)
		AssignAlias id = <new_object> alias = <aliasname>
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
	if ($cas_queue_lock = 1)
		return \{true}
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
	ps2_load_car_part_script
	printscriptinfo \{'cas_destroy_all_characters'}
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

script cas_player_has_pending_request 
	if ((<Player> < 1) || (<Player> > 4))
		return \{FALSE}
	endif
	index = (<Player> - 1)
	player_info = ($cas_queue_player_info [<index>])
	if StructureContains structure = <player_info> requested_frame
		return \{true}
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
	ps2_get_musician_context_data Name = <cas_object>
	gethathairchoice appearance = <appearance>
	getaccchoice appearance = <appearance>
	getshoeschoice appearance = <appearance>
	buildscriptparams = {
		<buildscriptparams>
		instrument = <instrument>
		temporary_heap = quota_cas
		LightGroup = <LightGroup>
		hat_hair_choice = <hat_hair_choice>
		acc_left_choice = <acc_left_choice>
		acc_right_choice = <acc_right_choice>
		shoes_choice = <shoes_choice>
		appearance_checksum = <appearance_checksum>
	}
	<cas_object> :GetSingleTag current_instrument
	<cas_object> :obj_cleargeoms
	changeappearancepaks {
		current_appearance = ($<bandmember_appearance>) current_instrument = <current_instrument>
		new_appearance = <appearance> new_instrument = <instrument>
		Heap = <asset_heap> asset_context = <asset_heap>
	}
	Change GlobalName = <bandmember_appearance> NewValue = (<appearance>)
	<cas_object> :SetTags current_instrument = <instrument>
	if NOT GotParam \{buildscript}
		buildscript = create_model_from_appearance
	endif
	if GotParam \{cancelled}
		return \{FALSE}
	endif
	params = {
		appearance = <appearance>
		buildscript = <buildscript>
		buildscriptparams = <buildscriptparams>
	}
	<cas_object> :modelbuilder_preload <params>
	<cas_object> :modelbuilder_build <params>
	<cas_object> :obj_setbloom enable = true
	generatechecksumfromstruct struct = <appearance>
	<cas_object> :SetTags appearance_checksum = <structure_checksum>
	<cas_object> :unhide
	return \{true}
endscript

script cas_set_object_node_pos \{instrument = None}
	printf \{qs(0x63bb5215)}
	printstruct <...>
	RequireParams \{[
			Player
		]
		all}
	index = (<Player> - 1)
	if GotParam \{node}
		GetWaypointPos Name = <node>
		GetWaypointDir Name = <node>
		printf \{qs(0x3033f675)}
		printstruct <...>
	else
		if getinstrumentnodename instrument = <instrument>
			GetWaypointPos Name = <instrument_node_name>
			GetWaypointDir Name = <instrument_node_name>
			printf \{qs(0x82a4e285)}
			printstruct <...>
		else
			GetWaypointPos \{Name = $cas_node_name}
			GetWaypointDir \{Name = $cas_node_name}
			printf \{qs(0xef6747e4)}
			printstruct <...>
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

script cas_set_lobby_pos 
	RequireParams \{[
			Player
			Pos
		]
		all}
	index = (<Player> - 1)
	printf qs(0x403b60e4) p = <Pos> i = <Player>
	player_info = ($cas_queue_player_info [<index>])
	player_info = {
		<player_info>
		Pos = <Pos>
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
	printscriptinfo \{'cas_start_loading_anim'}
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

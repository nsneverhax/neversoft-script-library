
script band_lobby_focus_rocker 
	RequireParams \{[
			Player
			submenu_index
			savegame
		]
		all}
	printf channel = band_lobby qs(0x5b5b48b9) p = <Player> v = <submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if ((GotParam is_new_rocker) || (GotParam is_random_rocker))
		formatText checksumName = character_id 'temporary_car_%d' d = <submenu_index> AddToStringLookup = true
	endif
	if NOT GotParam \{character_id}
		ScriptAssert \{'missing character_id'}
		character_id = ($failsafe_car_profile)
	endif
	if NOT characterprofileexists savegame = <savegame> Name = <character_id>
		printf channel = band_lobby_rocker qs(0xcc8a7845) s = <savegame> c = <character_id>
		return
	endif
	set_chosen_character_id Player = ($<submenu_data>.Player) id = <character_id> savegame = <savegame>
	persistent_band_refresh_changed_characters
	update_camera_for_viewport Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
endscript

script band_lobby_unfocus_rocker 
	printf \{qs(0x82019063)}
	RequireParams \{[
			Player
			submenu_index
		]
		all}
endscript

script band_lobby_confirm_rocker 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	get_savegame_from_player Player = <Player>
	if GotParam \{random_rocker}
		if band_lobby_has_max_cars savegame = <savegame>
			SoundEvent \{event = audio_ui_generic_warning}
			band_lobby_update_ticker \{msg_checksum = car_full}
			return
		endif
	endif
	if NOT band_lobby_is_edit_rocker_allowed
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if ($<submenu_data>.is_managed = 0)
		menu = main
	else
		menu = manage_member
	endif
	getplayerinfo ($<submenu_data>.Player) chosen_character_id
	character_id = <chosen_character_id>
	if NOT characterprofileexists savegame = <savegame> Name = <character_id>
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	if GotParam \{random_rocker}
		band_lobby_commit_random_rocker <...>
	endif
	set_chosen_character_id Player = ($<submenu_data>.Player) id = None
	array = ($<submenu_data>.menu_indices)
	SetArrayElement \{ArrayName = array
		index = 0
		NewValue = 0}
	SetArrayElement \{ArrayName = array
		index = 1
		NewValue = 0}
	SetArrayElement \{ArrayName = array
		index = 2
		NewValue = 0}
	band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = <array>
	band_lobby_change_playerinfo {
		action = back
		character_id = <character_id>
		character_savegame = <savegame>
		menu = <menu>
		Player = <Player>
		submenu_index = <submenu_index>
	}
endscript

script band_lobby_cancel_select_rocker 
	RequireParams \{[
			menu
			Player
			submenu_index
		]
		all}
	printf qs(0x23bb4baa) d = <Player> v = <submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	set_chosen_character_id Player = ($<submenu_data>.Player) id = None
	persistent_band_refresh_changed_characters
	update_camera_for_viewport Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
	if (<menu> = rocker)
		if NOT ($g_lobby_net_state = local)
			menu = main
		endif
	endif
	band_lobby_change_menu action = back menu = <menu> Player = <Player> submenu_index = <submenu_index> no_forced
endscript

script band_lobby_has_max_cars 
	RequireParams \{[
			savegame
		]
		all}
	characterprofilegetlist savegame = <savegame> categories = [cars]
	GetArraySize <profile_list>
	if (<array_Size> >= $max_num_create_a_rockers)
		return \{true}
	endif
	return \{FALSE}
endscript

script band_lobby_build_select_rocker_submenu 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	printf channel = band_lobby qs(0x3f03caf0) d = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	get_savegame_from_player Player = <Player>
	getplayerinfo <Player> controller
	check_car_unlocks controller = <controller>
	getplayerinfo ($<submenu_data>.Player) character_id out = current_character_id
	getplayerinfo ($<submenu_data>.Player) character_savegame out = current_character_savegame
	submenu_states = ($band_lobby_submenu_states)
	focus_index = 0
	menu_index = 0
	array = []
	menu_index = 0
	if band_lobby_is_edit_rocker_allowed
		characterprofilegetlist savegame = <savegame> categories = [cars]
		GetArraySize <profile_list>
		if (<array_Size> < $max_num_create_a_rockers)
			AddArrayElement {
				array = <array>
				element = {
					text = qs(0xaba58505)
					checksum = random_rocker
					choose_script = band_lobby_random_rocker_advance_to_menu
					select_params = {
						menu = accept_create_random_rocker
						Player = <Player>
						submenu_index = <submenu_index>
					}
					additional_focus_script = band_lobby_focus_rocker
					additional_focus_params = {
						Player = <Player>
						submenu_index = <submenu_index>
						savegame = <savegame>
						is_random_rocker
					}
					additional_unfocus_script = band_lobby_unfocus_rocker
					additional_unfocus_params = {
						Player = <Player>
						submenu_index = <submenu_index>
						savegame = <savegame>
						is_random_rocker
					}
				}
			}
			menu_index = (<menu_index> + 1)
			if isxenonorwindx
				AddArrayElement {
					array = <array>
					element = {
						text = qs(0x345f304f)
						checksum = random_rocker
						choose_script = band_lobby_random_rocker_advance_to_menu
						select_params = {
							menu = accept_create_random_avatar
							Player = <Player>
							submenu_index = <submenu_index>
						}
						additional_focus_script = band_lobby_focus_rocker
						additional_focus_params = {
							Player = <Player>
							submenu_index = <submenu_index>
							savegame = <savegame>
							is_random_avatar
						}
						additional_unfocus_script = band_lobby_unfocus_rocker
						additional_unfocus_params = {
							Player = <Player>
							submenu_index = <submenu_index>
							savegame = <savegame>
							is_random_avatar
						}
					}
				}
				menu_index = (<menu_index> + 1)
			endif
			if ($<submenu_data>.is_managed = 0)
				AddArrayElement {
					array = <array>
					element = {
						text = qs(0x610b4705)
						checksum = edit_rockers
						choose_script = band_lobby_create_new_rocker
						select_params = {
							Player = <Player>
							submenu_index = <submenu_index>
						}
						additional_focus_script = band_lobby_focus_rocker
						additional_focus_params = {
							Player = <Player>
							submenu_index = <submenu_index>
							savegame = <savegame>
							is_new_rocker
						}
						additional_unfocus_script = band_lobby_unfocus_rocker
						additional_unfocus_params = {
							Player = <Player>
							submenu_index = <submenu_index>
							savegame = <savegame>
							is_new_rocker
						}
					}
				}
				menu_index = (<menu_index> + 1)
			endif
		else
			AddArrayElement {
				array = <array>
				element = {
					text = qs(0xaba58505)
					checksum = edit_rockers
					choose_script = band_lobby_update_ticker
					select_params = {msg_checksum = car_full}
				}
			}
			AddArrayElement {
				array = <array>
				element = {
					text = qs(0x610b4705)
					checksum = edit_rockers
					choose_script = band_lobby_update_ticker
					select_params = {msg_checksum = car_full}
				}
			}
			menu_index = (<menu_index> + 1)
		endif
	endif
	getplayerinfo <Player> part
	characterprofilegetlist savegame = <savegame>
	band_lobby_add_characters_to_menu {
		focus_index = <focus_index>
		menu_index = <menu_index>
		savegame = <savegame>
		profile_list = <profile_list>
		current_character_id = <current_character_id>
		current_character_savegame = <current_character_savegame>
		part = <part>
		submenu_data = <submenu_data>
		array = <array>
		Player = <Player>
		submenu_index = <submenu_index>
	}
	if isXenon
		if NOT band_lobby_controller_can_save controller = <savegame>
			old_savegame = <savegame>
			if ($g_leader_player_num >= 0)
				get_savegame_from_player Player = ($g_leader_player_num)
			else
				get_savegame_from_controller controller = ($primary_controller)
			endif
			if (<old_savegame> != <savegame>)
				characterprofilegetlist savegame = <savegame> categories = [cars]
				band_lobby_add_characters_to_menu {
					band_leader_character_grab = 1
					focus_index = <focus_index>
					menu_index = <menu_index>
					savegame = <savegame>
					profile_list = <profile_list>
					current_character_id = <current_character_id>
					current_character_savegame = <current_character_savegame>
					part = <part>
					submenu_data = <submenu_data>
					array = <array>
					Player = <Player>
					submenu_index = <submenu_index>
				}
			endif
		endif
	endif
	if ($<submenu_data>.is_managed = 0)
		back_menu = main
		add_shortcuts = 1
	else
		back_menu = manage_member
		add_shortcuts = 0
	endif
	formatText checksumName = select_rocker 'select_rocker%i' i = <submenu_index>
	select_rocker_options = {(
			(<submenu_states>.<select_rocker>) +
			{options = <array>} +
			{focus_param = character_id} +
			{add_shortcuts = <add_shortcuts>} +
			{back_script = band_lobby_cancel_select_rocker} +
			{back_params = {
					menu = <back_menu>
					Player = <Player>
					submenu_index = <submenu_index>
				}}
		)}
	AddParam structure_name = submenu_states Name = <select_rocker> value = <select_rocker_options>
	Change band_lobby_submenu_states = <submenu_states>
	band_lobby_change_menu action = forward menu = select_rocker Player = <Player> submenu_index = <submenu_index> no_forced
endscript

script band_lobby_random_rocker_advance_to_menu 
	RequireParams \{[
			menu
			Player
			submenu_index
		]
		all}
	if band_lobby_is_edit_rocker_allowed
		band_lobby_change_menu {
			action = forward
			menu = <menu>
			Player = <Player>
			submenu_index = <submenu_index>
		}
	else
		SoundEvent \{event = audio_ui_generic_warning}
	endif
endscript

script band_lobby_borrow_band_leader_car 
	RequireParams \{[
			Player
			submenu_index
			character_id
			character_savegame
			action
			menu
		]
		all}
	printf \{'band_lobby_borrow_band_leader_car'}
	printstruct <...>
	band_lobby_change_playerinfo {
		action = <action>
		character_id = <character_id>
		character_savegame = <character_savegame>
		menu = <menu>
		Player = <Player>
		submenu_index = <submenu_index>
	}
	set_chosen_character_id Player = <Player> id = None
endscript

script band_lobby_add_characters_to_menu 
	RequireParams \{[
			focus_index
			menu_index
			savegame
			profile_list
			current_character_id
			current_character_savegame
			part
			submenu_data
			array
			Player
			submenu_index
		]
		all}
	GetArraySize <profile_list>
	if (<array_Size> > 0)
		i = 0
		begin
		this_ID = (<profile_list> [<i>])
		characterprofilegetstruct savegame = <savegame> Name = <this_ID>
		if display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = <part>
			show_character = 1
			if (<show_character> = 1)
				if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
					get_fullname_of_character savegame = <savegame> id = <this_ID> profanity_allowed
				else
					get_fullname_of_character savegame = <savegame> id = <this_ID>
				endif
				AddArrayElement {
					array = <array>
					element = {
						text = <fullname>
						checksum = <this_ID>
						choose_script = band_lobby_select_rocker
						select_params = {
							band_leader_character_grab = <band_leader_character_grab>
							savegame = <savegame>
							character_id = <this_ID>
							character_savegame = <savegame>
							Player = <Player>
							submenu_index = <submenu_index>
						}
						additional_focus_script = band_lobby_focus_rocker
						additional_focus_params = {
							Player = <Player>
							submenu_index = <submenu_index>
							character_id = <this_ID>
							savegame = <savegame>
						}
						additional_unfocus_script = band_lobby_unfocus_rocker
						additional_unfocus_params = {
							Player = <Player>
							submenu_index = <submenu_index>
							character_id = <this_ID>
							savegame = <savegame>
						}
					}
				}
				if ((<this_ID> = <current_character_id>) && (<savegame> = <current_character_savegame>))
					focus_index = <menu_index>
				endif
				menu_index = (<menu_index> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return focus_index = <focus_index> menu_index = <menu_index> array = <array>
endscript

script band_lobby_select_rocker 
	RequireParams \{[
			savegame
			character_id
			character_savegame
			Player
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if ($<submenu_data>.is_managed = 0)
		menu = main
		choose_action = back
		choose_script = band_lobby_change_playerinfo
	else
		menu = manage_member
		choose_action = back
		choose_script = band_lobby_change_playerinfo
	endif
	if GotParam \{band_leader_character_grab}
		choose_script = band_lobby_borrow_band_leader_car
	else
		if band_lobby_is_edit_rocker_allowed
			if is_completely_custom_musician id = <character_id>
				<menu> = accept_saved_rocker
				<choose_action> = forward
				<choose_script> = band_lobby_change_menu
			else
			endif
			if is_ghrocker id = <character_id>
				<menu> = accept_gh_rocker
				<choose_action> = forward
				<choose_script> = band_lobby_change_menu
			endif
		endif
	endif
	<choose_script> {
		action = <choose_action>
		menu = <menu>
		character_id = <character_id>
		character_savegame = <character_savegame>
		Player = <Player>
		submenu_index = <submenu_index>
	}
endscript

script band_lobby_commit_random_rocker 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	get_savegame_from_player Player = <Player>
	getplayerinfo ($<submenu_data>.Player) chosen_character_id
	character_id = <chosen_character_id>
	if GotParam \{random_rocker}
		create_new_car_from_character_id character_id = <character_id> savegame = <savegame>
		if GotParam \{random_avatar}
			update_temporary_random_avatar slot = <submenu_index> savegame = <savegame>
		else
			update_temporary_random_car slot = <submenu_index> savegame = <savegame>
		endif
		character_id = <new_character_id>
	endif
	return character_id = <character_id>
endscript

script band_lobby_choose_edit_rocker 
	printf \{qs(0xa4a8c912)}
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	get_savegame_from_player Player = <Player>
	if GotParam \{random_rocker}
		if band_lobby_has_max_cars savegame = <savegame>
			SoundEvent \{event = audio_ui_generic_warning}
			band_lobby_update_ticker \{msg_checksum = car_full}
			return
		endif
	endif
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.Player) chosen_character_id
	character_id = <chosen_character_id>
	if NOT characterprofileexists savegame = <savegame> Name = <character_id>
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	if band_lobby_is_edit_rocker_allowed
		band_lobby_change_network Player = <Player> network = local focus = 0
	else
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	create_loading_screen
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_force_submenu_change_all \{menu = main
		submenu_data_match = occupied
		match_value = 1}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	Change cas_current_player = <Player>
	formatText checksumName = player_name 'cas_player%i' i = <Player>
	Change cas_current_player_name = <player_name>
	if GotParam \{random_rocker}
		band_lobby_commit_random_rocker <...>
		getplayerinfo (<submenu_index> + 1) character_id out = old_character_id
		Change g_charselect_previous_character_id = <old_character_id>
		Change \{cas_editing_new_character = true}
	else
		Change \{cas_editing_new_character = FALSE}
	endif
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	set_chosen_character_id Player = ($<submenu_data>.Player) id = None
	if ($<submenu_data>.is_managed = 0)
		menu = main
	else
		menu = manage_member
	endif
	band_lobby_change_playerinfo {
		action = back
		character_id = <character_id>
		character_savegame = <savegame>
		menu = <menu>
		Player = <Player>
		submenu_index = <submenu_index>
	}
	Change \{cas_started_from = lobby}
	cascancelloading
	cas_destroy_all_characters
	hide_glitch \{num_frames = 8}
	getplayerinfo <Player> controller
	Change primary_controller = <controller>
	ui_event_wait event = menu_change data = {state = uistate_customize_character_enter from_lobby = 1 new_data = {state_device = <controller>}}
endscript

script band_lobby_create_new_rocker 
	printf \{qs(0x74d673e0)}
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	get_savegame_from_player Player = <Player>
	if band_lobby_has_max_cars savegame = <savegame>
		SoundEvent \{event = audio_ui_generic_warning}
		band_lobby_update_ticker \{msg_checksum = car_full}
		return
	endif
	if band_lobby_is_edit_rocker_allowed
		band_lobby_change_network Player = <Player> network = local focus = 0
	else
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.Player) chosen_character_id
	if (<chosen_character_id> = None)
		return
	endif
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_force_submenu_change_all \{menu = main
		submenu_data_match = occupied
		match_value = 1}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	Change cas_current_player = ($<submenu_data>.Player)
	formatText checksumName = player_name 'cas_player%i' i = ($<submenu_data>.Player)
	Change cas_current_player_name = <player_name>
	character_id = <chosen_character_id>
	band_lobby_commit_random_rocker random_rocker <...>
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	Change \{cas_editing_new_character = true}
	Change \{cas_started_from = lobby}
	set_chosen_character_id Player = ($<submenu_data>.Player) id = None
	getplayerinfo (<submenu_index> + 1) character_id out = old_character_id
	Change g_charselect_previous_character_id = <old_character_id>
	if ($<submenu_data>.is_managed = 0)
		menu = main
	else
		menu = manage_member
	endif
	band_lobby_change_playerinfo {
		action = back
		character_id = <character_id>
		character_savegame = <savegame>
		menu = <menu>
		Player = <Player>
		submenu_index = <submenu_index>
	}
	cascancelloading
	cas_destroy_all_characters
	hide_glitch \{num_frames = 8}
	getplayerinfo <Player> controller
	Change primary_controller = <controller>
	ui_event_wait event = menu_change data = {
		state = uistate_customize_character_enter
		from_lobby = 1
		new_state = uistate_customize_character
		new_data = {
			state_device = <controller>
			from_lobby = 1
		}
	}
endscript

script band_lobby_find_missing_part 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	GetArraySize ($part_priority)
	i = 0
	begin
	if (<part> != $part_priority [<i>])
		found_part = None
		j = 0
		begin
		formatText checksumName = submenu 'band_lobby_submenu_data_%i' i = <j>
		getplayerinfo ($<submenu>.Player) part out = this_part
		if (($part_priority [<i>]) = <this_part>)
			<found_part> = <this_part>
			break
		endif
		<j> = (<j> + 1)
		repeat ($g_num_lobby_local_submenus)
		if (<found_part> = None)
			return true missing_part = ($part_priority [<i>])
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script band_lobby_get_used_band_member_parts 
	used_parts = []
	used_indices = []
	GetArraySize ($part_priority)
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if playerinfoequals ($<submenu_data>.Player) in_game = 1
		getplayerinfo ($<submenu_data>.Player) part
		getplayerinfo ($<submenu_data>.Player) stored_character_index
		getplayerinfo ($<submenu_data>.Player) character_id
		AddArrayElement array = <used_parts> element = <part>
		used_parts = <array>
		if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
			AddArrayElement array = <used_indices> element = <stored_character_index>
			used_indices = <array>
			if isXenon
				if (<stored_character_index> = 0)
					if ((($<submenu_data>.Player) != $g_leader_player_num) && ($g_leader_player_num != -1))
						get_saved_band_member savegame = <i> index = 0
						if (<user_changed> = 0)
							if ((<band_leader_member_id> > 0) && (<band_leader_member_id> < 4))
								printf 'Controller %c is using buddy character index %i' c = <i> i = <band_leader_member_id>
								AddArrayElement array = <used_indices> element = <band_leader_member_id>
								used_indices = <array>
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return used_parts = <used_parts> used_indices = <used_indices>
endscript

script band_lobby_load_band_leader_character 
	RequireParams \{[
			submenu_index
			part
			character_index
		]
		all}
	get_part_text_nl part = <part>
	printf channel = band_lobby qs(0xa66f064f) s = <submenu_index> p = <part_text>
	if ($g_leader_player_num >= 0)
		get_savegame_from_player Player = ($g_leader_player_num)
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	printf channel = band_lobby qs(0x4844fa55) s = <savegame>
	printf channel = band_lobby qs(0xa857703d) s = <character_index>
	if NOT get_saved_band_member index = <character_index> savegame = <savegame>
		ScriptAssert qs(0xc56971ee) p = <index> i = ($g_leader_player_num)
	endif
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	printf channel = band_lobby qs(0xeb6d8e8a) a = ($<submenu_data>.Player) b = <part> c = <character_id>
	setplayerinfo ($<submenu_data>.Player) part = <part> store
	setplayerinfo ($<submenu_data>.Player) character_id = <character_id> store
	setplayerinfo ($<submenu_data>.Player) character_savegame = <character_savegame> store
	setplayerinfo ($<submenu_data>.Player) stored_character_index = <character_index> store
	if NOT GotParam \{no_refresh}
		persistent_band_refresh_changed_characters
	endif
	update_camera_for_viewport Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
endscript

script band_lobby_fix_cpu_parts 
	printf \{channel = band_lobby
		qs(0x784863bb)}
	RequireParams \{[
			used_parts
			buddy_parts
		]
		all}
	bad_cpu_players = []
	required_buddy_parts = <buddy_parts>
	GetArraySize <used_parts>
	if (<array_Size> > 0)
		i = 0
		begin
		used_part = (<used_parts> [<i>])
		if ArrayContains array = <required_buddy_parts> contains = <used_part>
			RemoveArrayElement array = <required_buddy_parts> element = <used_part>
			required_buddy_parts = <array>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if (($<submenu_data>.occupied) = 0)
		if NOT band_lobby_player_in_use Player = ($<submenu_data>.Player)
			getplayerinfo ($<submenu_data>.Player) part out = cpu_part
			if ArrayContains array = <used_parts> contains = <cpu_part>
				AddArrayElement array = <bad_cpu_players> element = ($<submenu_data>.Player)
				bad_cpu_players = <array>
			else
				if ArrayContains array = <required_buddy_parts> contains = <cpu_part>
					RemoveArrayElement array = <required_buddy_parts> element = <cpu_part>
					required_buddy_parts = <array>
				endif
				AddArrayElement array = <used_parts> element = <cpu_part>
				<used_parts> = <array>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	GetArraySize <bad_cpu_players>
	num_bad_players = <array_Size>
	if (<num_bad_players> > 0)
		i = 0
		begin
		bad_player = (<bad_cpu_players> [<i>])
		GetArraySize <required_buddy_parts>
		if (<array_Size> = 0)
			printstruct <...>
			ScriptAssert 'required_buddy_parts is empty, trying to set player %a' a = <bad_player>
			break
		endif
		new_part = (<required_buddy_parts> [0])
		RemoveArrayElement array = <required_buddy_parts> index = 0
		required_buddy_parts = <array>
		setplayerinfo <bad_player> part = <new_part> store
		printf 'Changed player %a part to %b' a = <bad_player> b = <new_part>
		i = (<i> + 1)
		repeat <num_bad_players>
	endif
endscript

script band_lobby_refresh_band_leader_characters 
	printf \{channel = band_lobby
		qs(0x67d3c9d8)}
	if ($g_leader_player_num = -1)
		return
	endif
	band_lobby_get_used_band_member_parts
	getplayerinfo ($g_leader_player_num) part out = leader_part
	RemoveArrayElement array = ($part_priority) element = <leader_part>
	buddy_parts = <array>
	band_lobby_fix_cpu_parts used_parts = <used_parts> buddy_parts = <buddy_parts>
	GetArraySize <buddy_parts>
	i = 0
	begin
	part = (<buddy_parts> [<i>])
	member_index = (<i> + 1)
	if NOT ArrayContains array = <used_indices> contains = <member_index>
		if NOT ArrayContains array = <used_parts> contains = <part>
			if band_lobby_find_buddy_submenu part = <part>
				band_lobby_load_band_leader_character {
					submenu_index = <submenu_index>
					character_index = <member_index>
					part = <part>
					no_refresh
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if NOT GotParam \{no_refresh}
		persistent_band_refresh_changed_characters
	endif
endscript

script band_lobby_player_in_use 
	RequireParams \{[
			Player
		]
		all}
	check_player = <Player>
	getnumplayersingame local = <local>
	if (<num_players> > 0)
		getfirstplayer local = <local>
		begin
		if (<Player> = <check_player>)
			return \{true}
		endif
		getnextplayer local = <local> Player = <Player>
		repeat <num_players>
	endif
	return \{FALSE}
endscript

script band_lobby_find_buddy_submenu 
	RequireParams \{[
			part
		]
		all}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if NOT band_lobby_player_in_use Player = ($<submenu_data>.Player)
		getplayerinfo ($<submenu_data>.Player) part out = other_part
		printf 'band_lobby_find_buddy_submenu - viewport=%v player=%p part=%a not in use' v = <i> p = ($<submenu_data>.Player) a = <other_part>
		if (<other_part> = <part>)
			return true submenu_index = <i>
			break
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{FALSE}
endscript

script band_lobby_find_lower_part_priority_buddy_submenu 
	RequireParams \{[
			part
		]
		all}
	GetArraySize ($part_priority)
	i = (<array_Size> - 1)
	begin
	if (<part> = $part_priority [<i>])
		break
	endif
	j = 0
	begin
	formatText checksumName = submenu 'band_lobby_submenu_data_%i' i = <j>
	if NOT band_lobby_player_in_use Player = ($<submenu>.Player)
		getplayerinfo ($<submenu>.Player) part out = this_part
		if (($part_priority [<i>]) = <this_part>)
			return true submenu_index = <j>
		endif
	endif
	<j> = (<j> + 1)
	repeat ($g_num_lobby_local_submenus)
	<i> = (<i> - 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script band_lobby_handle_character_swap 
	RequireParams \{[
			Player
			old_part
			new_part
		]
		all}
	printf \{channel = band_lobby
		qs(0x85af9b5d)}
	if band_lobby_find_buddy_submenu part = <new_part>
		part = <old_part>
	else
		setplayerinfo <Player> part = <new_part>
		if band_lobby_find_missing_part Player = <Player>
			if band_lobby_find_lower_part_priority_buddy_submenu part = <missing_part>
				part = <missing_part>
			endif
		endif
	endif
	if GotParam \{submenu_index}
		swap_submenu_index = <submenu_index>
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <swap_submenu_index>
		getplayerinfo <Player> in_game
		if (<in_game> = 1)
			getplayerinfo ($<submenu_data>.Player) stored_character_index out = swap_character_index
			getplayerinfo ($<submenu_data>.Player) character_id out = swap_character_id
			getplayerinfo ($<submenu_data>.Player) character_savegame out = swap_character_savegame
			setplayerinfo ($<submenu_data>.Player) part = <old_part>
			setplayerinfo <Player> part = <new_part>
			setplayerinfo <Player> stored_character_index = <swap_character_index>
			if GotParam \{no_refresh}
				band_lobby_refresh_band_leader_characters \{no_refresh}
			else
				band_lobby_refresh_band_leader_characters
			endif
			setplayerinfo <Player> character_id = <swap_character_id>
			setplayerinfo <Player> character_savegame = <swap_character_savegame>
		else
			setplayerinfo ($<submenu_data>.Player) part = <old_part>
			setplayerinfo <Player> part = <new_part>
			if GotParam \{no_refresh}
				band_lobby_refresh_band_leader_characters \{no_refresh}
			else
				band_lobby_refresh_band_leader_characters
			endif
		endif
	endif
	if ScreenElementExists \{id = hud_mic_binding}
		mic_binding_end
	endif
endscript

script band_lobby_switch_characters_for_ps3_at_join 
	RequireParams \{[
			Player
			controller
		]
		all}
	printf 'band_lobby_switch_characters_for_ps3_at_join %a %b' a = <Player> b = <controller>
	if IsGuitarController controller = <controller>
		part = guitar
		get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
		guitar_bass_flip = <user_option>
		if (<guitar_bass_flip> = bass)
			part = bass
		endif
	elseif isdrumcontroller controller = <controller>
		part = drum
	else
		if ($allow_controller_for_all_instruments = 1)
			part = guitar
		else
			part = vocals
		endif
	endif
	getplayerinfo <Player> part out = old_part
	setplayerinfo <Player> is_local_client = 1
	setplayerinfo <Player> in_game = 1
	if (<old_part> != <part>)
		band_lobby_handle_character_swap {
			Player = <Player>
			old_part = <old_part>
			new_part = <part>
			no_refresh
		}
	endif
	setplayerinfo <Player> stored_character_index = 0
	band_lobby_refresh_band_leader_characters \{no_refresh}
endscript

script band_lobby_rerandomize_rocker 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	if NOT band_lobby_is_edit_rocker_allowed
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	get_savegame_from_player Player = <Player>
	if GotParam \{random_avatar}
		update_temporary_random_avatar slot = <submenu_index> savegame = <savegame>
	else
		update_temporary_random_car slot = <submenu_index> savegame = <savegame>
	endif
	persistent_band_refresh_changed_characters
endscript

script band_lobby_delete_saved_rocker 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	get_savegame_from_player Player = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.Player) chosen_character_id
	character_id = <chosen_character_id>
	if NOT characterprofileexists savegame = <savegame> Name = <character_id>
		SoundEvent \{event = audio_ui_generic_warning}
		return
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		band_lobby_create_popup_menu {
			menu = delete_rocker
			Player = <Player>
			container = <resolved_id>
			submenu_index = <submenu_index>
		}
	endif
endscript

script band_lobby_delete_saved_rocker_confirm 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	get_savegame_from_player Player = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.Player) chosen_character_id
	character_id = <chosen_character_id>
	set_chosen_character_id Player = ($<submenu_data>.Player) id = None
	delete_custom_profile id = <character_id> savegame = <savegame>
	band_lobby_set_dirty_save_flag Player = <Player> flag = 1
	array = ($<submenu_data>.menu_indices)
	SetArrayElement \{ArrayName = array
		index = 0
		NewValue = 0}
	SetArrayElement \{ArrayName = array
		index = 1
		NewValue = 0}
	SetArrayElement \{ArrayName = array
		index = 2
		NewValue = 0}
	band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = <array>
	if ($<submenu_data>.is_managed = 0)
		band_lobby_change_menu {action = back menu = main submenu_index = <submenu_index> Player = <Player> reset_characters}
	endif
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	switch (<menu>)
		case select_rocker0
		case select_rocker1
		case select_rocker2
		case select_rocker3
		case accept_saved_rocker
		case accept_gh_rocker
		case accept_create_random_rocker
		case accept_create_random_avatar
		case accept_avatar
		band_lobby_get_submenu_data submenu_index = <i> param = Player
		if playerinfoequals <Player> is_local_client = 1
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
			if ($<submenu_data>.is_managed = 0)
				band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
				band_lobby_change_menu action = back menu = main Player = <Player> submenu_index = <i> focus = 0 no_forced
				set_chosen_character_id Player = <Player> id = None
			endif
		endif
		default
		printf \{'all good'}
	endswitch
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	persistent_band_refresh_changed_characters
	band_lobby_update_ticker \{msg_checksum = current_state}
	band_lobby_destroy_popup_menu
endscript

script band_lobby_is_edit_rocker_allowed 
	if savegame_async_is_busy
		return \{FALSE}
	endif
	if ($is_in_cas = 1)
		return \{FALSE}
	endif
	if band_lobby_are_remote_players_in_game
		return \{FALSE}
	endif
	if ($cas_current_savegame != -1)
		return \{FALSE}
	endif
	if ($g_career_search != NULL)
		return \{FALSE}
	endif
	if inroadiebattlemode
		return \{FALSE}
	endif
	return \{true}
endscript

script band_lobby_is_select_rocker_menu \{menu = !q1768515945}
	switch (<menu>)
		case select_rocker0
		case select_rocker1
		case select_rocker2
		case select_rocker3
		case accept_saved_rocker
		case accept_gh_rocker
		case accept_create_random_rocker
		case accept_create_random_avatar
		case accept_avatar
		return \{true}
		default
		return \{FALSE}
	endswitch
endscript

script band_lobby_is_not_managed_player 
	RequireParams \{[
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if ($<submenu_data>.is_managed = 1 && $<submenu_data>.occupied = 1)
		return \{FALSE}
	endif
	return \{true}
endscript

script band_lobby_get_character_id 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> chosen_character_id
	if (<chosen_character_id> = None)
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
	else
		getplayerinfo <Player> chosen_character_savegame
		character_id = <chosen_character_id>
		character_savegame = <chosen_character_savegame>
	endif
	return character_id = <character_id> character_savegame = <character_savegame>
endscript

script band_lobby_reset_all_chosen_characters 
	getmaxplayers
	<i> = 1
	begin
	if GotParam \{not_silhouettes}
		getplayerinfo <i> chosen_character_id
		if (<chosen_character_id> != silhouette)
			set_chosen_character_id Player = <i> id = None
		endif
	else
		set_chosen_character_id Player = <i> id = None
	endif
	i = (<i> + 1)
	repeat <max_players>
endscript

script band_lobby_rocker_changed_player_part 
	RequireParams \{[
			part
			Player
		]
		all}
	if ((<part> = guitar) || (<part> = bass))
		getplayerinfo <Player> controller
		get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
		guitar_bass_flip = <user_option>
		if (<guitar_bass_flip> != <part>)
			band_lobby_set_dirty_save_flag Player = <Player> flag = 1
			save_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip' new_value = <part>
		endif
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty'
		if (<user_option> = None)
			if (<part> = guitar)
				get_progression_instrument_user_option part = bass controller = <controller> option = 'difficulty'
			else
				get_progression_instrument_user_option part = guitar controller = <controller> option = 'difficulty'
			endif
			if (<user_option> != None)
				setplayerinfo <Player> difficulty = <user_option> store
				save_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty' new_value = <user_option>
				band_lobby_set_dirty_save_flag Player = <Player> flag = 1
			endif
		else
			setplayerinfo <Player> difficulty = <user_option> store
		endif
	endif
	getplayerinfo <Player> part out = old_part
	if (<Player> <= 4)
		if (<old_part> != <part>)
			getplayerinfo <Player> stored_character_index
			get_savegame_from_player Player = <Player>
			get_saved_band_member index = <stored_character_index> savegame = <savegame>
			if isps3
				user_changed = 0
			endif
			if ((<user_changed> = 0) && ($g_leader_player_num != <Player>))
				band_lobby_handle_character_swap {
					Player = <Player>
					old_part = <old_part>
					new_part = <part>
					no_refresh
				}
				if isXenon
					getplayerinfo <Player> stored_character_index
					getplayerinfo <Player> character_id
					getplayerinfo <Player> character_savegame
					globaltag_fix_band_member0_at_join {
						savegame = <savegame>
						existing_character_id = <character_id>
						existing_character_savegame = <character_savegame>
						existing_stored_character_index = <stored_character_index>
					}
					setplayerinfo <Player> stored_character_index = 0 store
				endif
			endif
			setplayerinfo <Player> part = <part> store
			if band_lobby_find_buddy_submenu part = <part>
				formatText checksumName = buddy_submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
				setplayerinfo ($<buddy_submenu_data>.Player) part = <old_part> store
			endif
			band_lobby_refresh_band_leader_characters \{no_refresh}
		endif
	endif
	setplayerinfo <Player> part = <part> store
	if inroadiebattlemode
		roadie_battle_change_difficulty_if_not_allowed Player = <Player>
	endif
	if (<Player> <= 4)
		band_lobby_get_player_submenu_index player_num = <Player>
		if (<submenu_index> >= 0)
			update_camera_for_viewport Player = <Player> submenu_index = <submenu_index>
		endif
	endif
endscript

script use_alternate_if_from_lobby 
	if ui_event_exists_in_stack \{Name = 'band_lobby'}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

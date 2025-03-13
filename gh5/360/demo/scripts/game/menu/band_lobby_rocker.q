
script band_lobby_focus_outfit 
	requireparams \{[
			player
			viewport_index
			outfit_id
			outfit_character_id
		]
		all}
	printf channel = band_lobby qs(0x4c3d1b05) p = <player> v = <viewport_index>
	get_savegame_from_player player = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	update_temporary_ghrocker slot = <viewport_index> savegame = <savegame> character_id = <outfit_character_id> outfit = <outfit_id>
	formattext checksumname = id_checksum 'temporary_ghrocker_%d' d = <viewport_index> addtostringlookup = true
	setplayerinfo ($<submenu_data>.player) chosen_character_id = <id_checksum>
	setplayerinfo ($<submenu_data>.player) chosen_character_savegame = <savegame>
	persistent_band_refresh_changed_characters
endscript

script band_lobby_unfocus_outfit 
	requireparams \{[
			player
			viewport_index
		]
		all}
	printf channel = band_lobby qs(0x4a66da59) p = <player> v = <viewport_index>
endscript

script band_lobby_focus_rocker 
	requireparams \{[
			player
			viewport_index
			savegame
		]
		all}
	printf channel = band_lobby qs(0x824ac887) p = <player> v = <viewport_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if ((gotparam is_new_rocker) || (gotparam is_random_rocker))
		formattext checksumname = character_id 'temporary_car_%d' d = <viewport_index> addtostringlookup = true
	elseif gotparam \{is_random_avatar}
		formattext checksumname = character_id 'temporary_avatar_%d' d = <viewport_index> addtostringlookup = true
	endif
	if NOT gotparam \{character_id}
		scriptassert \{'missing character_id'}
		character_id = ($failsafe_car_profile)
	endif
	if NOT characterprofileexists savegame = <savegame> name = <character_id>
		printf channel = band_lobby_rocker qs(0xcc8a7845) s = <savegame> c = <character_id>
		return
	endif
	setplayerinfo ($<submenu_data>.player) chosen_character_id = <character_id>
	setplayerinfo ($<submenu_data>.player) chosen_character_savegame = <savegame>
	persistent_band_refresh_changed_characters
	update_camera_for_viewport player = ($<submenu_data>.player) viewport_index = <viewport_index>
endscript

script band_lobby_unfocus_rocker 
	printf \{qs(0x82019063)}
	requireparams \{[
			player
			viewport_index
		]
		all}
endscript

script band_lobby_confirm_rocker 
	requireparams \{[
			player
			viewport_index
		]
		all}
	get_savegame_from_player player = <player>
	if gotparam \{random_rocker}
		if band_lobby_has_max_cars savegame = <savegame>
			soundevent \{event = menu_warning_sfx}
			band_lobby_update_ticker \{msg_checksum = car_full}
			return
		endif
	endif
	if NOT band_lobby_is_edit_rocker_allowed
		soundevent \{event = menu_warning_sfx}
		return
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if ($<submenu_data>.is_managed = 0)
		menu = main
	else
		menu = manage_member
	endif
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	character_id = <chosen_character_id>
	if NOT characterprofileexists savegame = <savegame> name = <character_id>
		soundevent \{event = menu_warning_sfx}
		return
	endif
	if gotparam \{random_rocker}
		band_lobby_commit_random_rocker <...>
	endif
	setplayerinfo ($<submenu_data>.player) chosen_character_id = none
	setplayerinfo ($<submenu_data>.player) chosen_character_savegame = -1
	array = ($<submenu_data>.menu_indices)
	setarrayelement \{arrayname = array
		index = 0
		newvalue = 0}
	setarrayelement \{arrayname = array
		index = 1
		newvalue = 0}
	setarrayelement \{arrayname = array
		index = 2
		newvalue = 0}
	band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = <array>
	band_lobby_change_playerinfo {
		action = back
		character_id = <character_id>
		character_savegame = <savegame>
		menu = <menu>
		player = <player>
		viewport_index = <viewport_index>
	}
endscript

script band_lobby_choose_outfit 
	requireparams \{[
			player
			viewport_index
			outfit
			outfit_character_id
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if ($<submenu_data>.is_managed = 0)
		menu = main
	else
		menu = manage_member
	endif
	formattext checksumname = id_checksum 'temporary_ghrocker_%d' d = <viewport_index> addtostringlookup = true
	get_savegame_from_player player = <player>
	characterprofilegetstruct savegame = <savegame> name = <id_checksum>
	profile_struct = {
		<profile_struct>
		name = <outfit_character_id>
	}
	characterprofilesetstruct savegame = <savegame> name = <outfit_character_id> profile_struct = <profile_struct>
	setplayerinfo ($<submenu_data>.player) chosen_character_id = none
	setplayerinfo ($<submenu_data>.player) chosen_character_savegame = -1
	array = ($<submenu_data>.menu_indices)
	setarrayelement \{arrayname = array
		index = 0
		newvalue = 0}
	setarrayelement \{arrayname = array
		index = 1
		newvalue = 0}
	setarrayelement \{arrayname = array
		index = 2
		newvalue = 0}
	band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = <array>
	band_lobby_change_playerinfo {
		action = back
		character_id = <outfit_character_id>
		character_savegame = <savegame>
		menu = <menu>
		player = <player>
		viewport_index = <viewport_index>
	}
endscript

script band_lobby_cancel_select_outfit 
	requireparams \{[
			menu
			player
			viewport_index
		]
		all}
	printf qs(0x9233e203) d = <player> v = <viewport_index>
	get_savegame_from_player player = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	setplayerinfo ($<submenu_data>.player) chosen_character_id = <outfit_character_id>
	setplayerinfo ($<submenu_data>.player) chosen_character_savegame = <savegame>
	persistent_band_refresh_changed_characters
	band_lobby_change_menu action = back menu = <menu> player = <player> viewport_index = <viewport_index> no_forced
endscript

script band_lobby_cancel_select_rocker 
	requireparams \{[
			menu
			player
			viewport_index
		]
		all}
	printf qs(0x5841243c) d = <player> v = <viewport_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	setplayerinfo ($<submenu_data>.player) chosen_character_id = none
	setplayerinfo ($<submenu_data>.player) chosen_character_savegame = -1
	persistent_band_refresh_changed_characters
	update_camera_for_viewport player = ($<submenu_data>.player) viewport_index = <viewport_index>
	if (<menu> = rocker)
		if NOT ($g_lobby_net_state = local)
			menu = main
		endif
	endif
	band_lobby_change_menu action = back menu = <menu> player = <player> viewport_index = <viewport_index> no_forced
endscript

script band_lobby_build_select_outfit_submenu 
	requireparams \{[
			player
			viewport_index
		]
		all}
	printf qs(0x9c4850c0) d = <player> v = <viewport_index>
	get_savegame_from_player player = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	character_id = <chosen_character_id>
	characterprofilegetstruct savegame = <savegame> name = <character_id>
	submenu_states = ($band_lobby_submenu_states)
	outfit_array = cas_full_body
	outfit_list = ($<outfit_array>)
	array = []
	getarraysize <outfit_list>
	if (<array_size> > 0)
		i = 0
		begin
		this_id = ((<outfit_list> [<i>]).desc_id)
		if cas_item_is_visible part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id)
			if ghrocker_body_matches matcheswith = <character_id> part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id)
				if is_part_unlocked part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id) savegame = <savegame>
					addarrayelement {
						array = <array>
						element = {
							text = ((<outfit_list> [<i>]).frontend_desc)
							checksum = <this_id>
							choose_script = band_lobby_choose_outfit
							select_params = {
								outfit = <this_id>
								outfit_character_id = <character_id>
								player = <player>
								viewport_index = <viewport_index>
							}
							additional_focus_script = band_lobby_focus_outfit
							additional_focus_params = {
								player = <player>
								outfit_character_id = <character_id>
								viewport_index = <viewport_index>
								outfit_id = <this_id>
							}
							additional_unfocus_script = band_lobby_unfocus_outfit
							additional_unfocus_params = {
								player = <player>
								viewport_index = <viewport_index>
								outfit_id = <this_id>
							}
						}
					}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if ($<submenu_data>.is_managed = 0)
		add_shortcuts = 1
	else
		add_shortcuts = 0
	endif
	formattext checksumname = select_outfit 'select_outfit%i' i = <viewport_index>
	select_outfit_options = {
		(<submenu_states>.<select_outfit>)
		options = <array>
		focus_param = outfit
		add_shortcuts = <add_shortcuts>
		back_script = band_lobby_cancel_select_outfit
		back_params = {
			menu = accept_gh_rocker
			player = <player>
			viewport_index = <viewport_index>
			outfit_character_id = <character_id>
		}
	}
	addparam structure_name = submenu_states name = <select_outfit> value = <select_outfit_options>
	change band_lobby_submenu_states = <submenu_states>
	band_lobby_change_menu action = forward menu = select_outfit player = <player> viewport_index = <viewport_index> no_forced
endscript

script band_lobby_has_max_cars 
	requireparams \{[
			savegame
		]
		all}
	characterprofilegetlist savegame = <savegame> categories = [cars]
	getarraysize <profile_list>
	if (<array_size> >= $max_num_create_a_rockers)
		return \{true}
	endif
	return \{false}
endscript

script band_lobby_build_select_rocker_submenu 
	requireparams \{[
			player
			viewport_index
		]
		all}
	printf channel = band_lobby qs(0x3f03caf0) d = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	get_savegame_from_player player = <player>
	getplayerinfo <player> controller
	check_car_unlocks controller = <controller>
	getplayerinfo ($<submenu_data>.player) character_id out = current_character_id
	getplayerinfo ($<submenu_data>.player) character_savegame out = current_character_savegame
	submenu_states = ($band_lobby_submenu_states)
	focus_index = 0
	menu_index = 0
	array = []
	menu_index = 0
	if band_lobby_is_edit_rocker_allowed
		characterprofilegetlist savegame = <savegame> categories = [cars]
		getarraysize <profile_list>
		if (<array_size> < $max_num_create_a_rockers)
			if ($<submenu_data>.is_managed = 0)
				addarrayelement {
					array = <array>
					element = {
						text = qs(0x21790444)
						checksum = edit_rockers
						choose_script = band_lobby_create_new_rocker
						select_params = {
							player = <player>
							viewport_index = <viewport_index>
						}
						additional_focus_script = band_lobby_focus_rocker
						additional_focus_params = {
							player = <player>
							viewport_index = <viewport_index>
							savegame = <savegame>
							is_new_rocker
						}
						additional_unfocus_script = band_lobby_unfocus_rocker
						additional_unfocus_params = {
							player = <player>
							viewport_index = <viewport_index>
							savegame = <savegame>
							is_new_rocker
						}
					}
				}
				menu_index = (<menu_index> + 1)
			endif
			addarrayelement {
				array = <array>
				element = {
					text = qs(0xaba58505)
					checksum = random_rocker
					choose_script = band_lobby_change_menu
					select_params = {
						action = forward
						menu = accept_create_random_rocker
						player = <player>
						viewport_index = <viewport_index>
					}
					additional_focus_script = band_lobby_focus_rocker
					additional_focus_params = {
						player = <player>
						viewport_index = <viewport_index>
						savegame = <savegame>
						is_random_rocker
					}
					additional_unfocus_script = band_lobby_unfocus_rocker
					additional_unfocus_params = {
						player = <player>
						viewport_index = <viewport_index>
						savegame = <savegame>
						is_random_rocker
					}
				}
			}
			menu_index = (<menu_index> + 1)
			if isavatarsysteminitialized
				addarrayelement {
					array = <array>
					element = {
						text = qs(0x345f304f)
						checksum = random_rocker
						choose_script = band_lobby_change_menu
						select_params = {
							action = forward
							menu = accept_create_random_avatar
							player = <player>
							viewport_index = <viewport_index>
						}
						additional_focus_script = band_lobby_focus_rocker
						additional_focus_params = {
							player = <player>
							viewport_index = <viewport_index>
							savegame = <savegame>
							is_random_avatar
						}
						additional_unfocus_script = band_lobby_unfocus_rocker
						additional_unfocus_params = {
							player = <player>
							viewport_index = <viewport_index>
							savegame = <savegame>
							is_random_avatar
						}
					}
				}
				menu_index = (<menu_index> + 1)
			endif
		else
			addarrayelement {
				array = <array>
				element = {
					text = qs(0x21790444)
					checksum = edit_rockers
					choose_script = band_lobby_update_ticker
					select_params = {msg_checksum = car_full}
				}
			}
			addarrayelement {
				array = <array>
				element = {
					text = qs(0xaba58505)
					checksum = edit_rockers
					choose_script = band_lobby_update_ticker
					select_params = {msg_checksum = car_full}
				}
			}
			if isavatarsysteminitialized
				addarrayelement {
					array = <array>
					element = {
						text = qs(0x345f304f)
						checksum = edit_rockers
						choose_script = band_lobby_update_ticker
						select_params = {msg_checksum = car_full}
					}
				}
			endif
			menu_index = (<menu_index> + 1)
		endif
	endif
	getplayerinfo <player> part
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
		player = <player>
		viewport_index = <viewport_index>
	}
	if isxenon
		if NOT band_lobby_controller_can_save controller = <savegame>
			old_savegame = <savegame>
			if ($g_leader_player_num >= 0)
				get_savegame_from_player player = ($g_leader_player_num)
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
					player = <player>
					viewport_index = <viewport_index>
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
	formattext checksumname = select_rocker 'select_rocker%i' i = <viewport_index>
	select_rocker_options = {
		(<submenu_states>.<select_rocker>)
		options = <array>
		focus_param = character_id
		add_shortcuts = <add_shortcuts>
		back_script = band_lobby_cancel_select_rocker
		back_params = {
			menu = <back_menu>
			player = <player>
			viewport_index = <viewport_index>
		}
	}
	addparam structure_name = submenu_states name = <select_rocker> value = <select_rocker_options>
	change band_lobby_submenu_states = <submenu_states>
	band_lobby_change_menu action = forward menu = select_rocker player = <player> viewport_index = <viewport_index> no_forced
endscript

script band_lobby_borrow_band_leader_car 
	requireparams \{[
			player
			viewport_index
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
		player = <player>
		viewport_index = <viewport_index>
	}
	setplayerinfo <player> chosen_character_id = none
	setplayerinfo <player> chosen_character_savegame = -1
endscript

script band_lobby_add_characters_to_menu 
	requireparams \{[
			focus_index
			menu_index
			savegame
			profile_list
			current_character_id
			current_character_savegame
			part
			submenu_data
			array
			player
			viewport_index
		]
		all}
	getarraysize <profile_list>
	if (<array_size> > 0)
		i = 0
		begin
		this_id = (<profile_list> [<i>])
		characterprofilegetstruct savegame = <savegame> name = <this_id>
		if display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = <part>
			show_character = 1
			if NOT is_completely_custom_musician id = <this_id>
				if is_avatar_character savegame = <savegame> id = <this_id>
					if (($<submenu_data>.occupied) = 0)
						<show_character> = 0
					else
						getplayerinfo ($<submenu_data>.player) controller
						if NOT checkforsignin local controller_index = <controller>
							<show_character> = 0
						elseif netsessionfunc func = xenonisguest params = {controller_index = <controller>}
							<show_character> = 0
						endif
					endif
				endif
			endif
			if (<show_character> = 1)
				if playerinfoequals ($<submenu_data>.player) is_local_client = 1
					get_fullname_of_character savegame = <savegame> id = <this_id> profanity_allowed
				else
					get_fullname_of_character savegame = <savegame> id = <this_id>
				endif
				addarrayelement {
					array = <array>
					element = {
						text = <fullname>
						checksum = <this_id>
						choose_script = band_lobby_select_rocker
						select_params = {
							band_leader_character_grab = <band_leader_character_grab>
							savegame = <savegame>
							character_id = <this_id>
							character_savegame = <savegame>
							player = <player>
							viewport_index = <viewport_index>
						}
						additional_focus_script = band_lobby_focus_rocker
						additional_focus_params = {
							player = <player>
							viewport_index = <viewport_index>
							character_id = <this_id>
							savegame = <savegame>
						}
						additional_unfocus_script = band_lobby_unfocus_rocker
						additional_unfocus_params = {
							player = <player>
							viewport_index = <viewport_index>
							character_id = <this_id>
							savegame = <savegame>
						}
					}
				}
				if ((<this_id> = <current_character_id>) && (<savegame> = <current_character_savegame>))
					focus_index = <menu_index>
				endif
				menu_index = (<menu_index> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return focus_index = <focus_index> menu_index = <menu_index> array = <array>
endscript

script band_lobby_select_rocker 
	requireparams \{[
			savegame
			character_id
			character_savegame
			player
			viewport_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if ($<submenu_data>.is_managed = 0)
		menu = main
		choose_action = back
		choose_script = band_lobby_change_playerinfo
	else
		menu = manage_member
		choose_action = back
		choose_script = band_lobby_change_playerinfo
	endif
	if gotparam \{band_leader_character_grab}
		choose_script = band_lobby_borrow_band_leader_car
	else
		if band_lobby_is_edit_rocker_allowed
			if is_completely_custom_musician id = <character_id>
				<menu> = accept_saved_rocker
				<choose_action> = forward
				<choose_script> = band_lobby_change_menu
			else
				if is_avatar_character savegame = <savegame> id = <character_id>
					if band_lobby_is_not_managed_player viewport_index = <viewport_index>
						<menu> = accept_avatar
						<choose_action> = forward
						<choose_script> = band_lobby_change_menu
					endif
				endif
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
		player = <player>
		viewport_index = <viewport_index>
	}
endscript

script band_lobby_commit_random_rocker 
	requireparams \{[
			player
			viewport_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	get_savegame_from_player player = <player>
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	character_id = <chosen_character_id>
	if gotparam \{random_rocker}
		create_new_car_from_character_id character_id = <character_id> savegame = <savegame>
		if gotparam \{random_avatar}
			update_temporary_random_avatar slot = <viewport_index> savegame = <savegame>
		else
			update_temporary_random_car slot = <viewport_index> savegame = <savegame>
		endif
		character_id = <new_character_id>
	endif
	return character_id = <character_id>
endscript

script band_lobby_choose_edit_rocker 
	printf \{qs(0xa4a8c912)}
	requireparams \{[
			player
			viewport_index
		]
		all}
	get_savegame_from_player player = <player>
	if gotparam \{random_rocker}
		if band_lobby_has_max_cars savegame = <savegame>
			soundevent \{event = menu_warning_sfx}
			band_lobby_update_ticker \{msg_checksum = car_full}
			return
		endif
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	character_id = <chosen_character_id>
	if NOT characterprofileexists savegame = <savegame> name = <character_id>
		soundevent \{event = menu_warning_sfx}
		return
	endif
	if band_lobby_is_edit_rocker_allowed
		band_lobby_change_network player = <player> network = local focus = 0
	else
		soundevent \{event = menu_warning_sfx}
		return
	endif
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_force_all_ready_players_to_main_menu
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	change cas_current_player = <player>
	formattext checksumname = player_name 'cas_player%i' i = <player>
	change cas_current_player_name = <player_name>
	if gotparam \{random_rocker}
		band_lobby_commit_random_rocker <...>
		getplayerinfo (<viewport_index> + 1) character_id out = old_character_id
		change charselect_previous_character_id = <old_character_id>
		change \{cas_editing_new_character = true}
	else
		change \{cas_editing_new_character = false}
	endif
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	setplayerinfo ($<submenu_data>.player) chosen_character_id = none
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
		player = <player>
		viewport_index = <viewport_index>
	}
	change \{cas_started_from = lobby}
	cascancelloading
	cas_destroy_all_characters
	getplayerinfo <player> controller
	ui_event_wait event = menu_change data = {state = uistate_customize_character_enter new_data = {state_device = <controller>}}
endscript

script band_lobby_create_new_rocker 
	printf \{qs(0x74d673e0)}
	requireparams \{[
			player
			viewport_index
		]
		all}
	get_savegame_from_player player = <player>
	if band_lobby_has_max_cars savegame = <savegame>
		soundevent \{event = menu_warning_sfx}
		band_lobby_update_ticker \{msg_checksum = car_full}
		return
	endif
	if band_lobby_is_edit_rocker_allowed
		band_lobby_change_network player = <player> network = local focus = 0
	else
		soundevent \{event = menu_warning_sfx}
		return
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	if (<chosen_character_id> = none)
		return
	endif
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_force_all_ready_players_to_main_menu
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	change cas_current_player = ($<submenu_data>.player)
	formattext checksumname = player_name 'cas_player%i' i = ($<submenu_data>.player)
	change cas_current_player_name = <player_name>
	character_id = <chosen_character_id>
	band_lobby_commit_random_rocker random_rocker <...>
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	change \{cas_editing_new_character = true}
	change \{cas_started_from = lobby}
	setplayerinfo ($<submenu_data>.player) chosen_character_id = none
	getplayerinfo (<viewport_index> + 1) character_id out = old_character_id
	change charselect_previous_character_id = <old_character_id>
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
		player = <player>
		viewport_index = <viewport_index>
	}
	cascancelloading
	cas_destroy_all_characters
	getplayerinfo <player> controller
	ui_event_wait event = menu_change data = {
		state = uistate_customize_character_enter
		new_state = uistate_create_character_gender
		new_data = {
			state_device = <controller>
			from_lobby = 1
		}
		instrument = none
	}
endscript

script band_lobby_find_missing_part 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	getarraysize ($part_priority)
	i = 0
	begin
	if (<part> != $part_priority [<i>])
		found_part = none
		j = 0
		begin
		formattext checksumname = submenu 'band_lobby_submenu_data_%i' i = <j>
		getplayerinfo ($<submenu>.player) part out = this_part
		if (($part_priority [<i>]) = <this_part>)
			<found_part> = <this_part>
			break
		endif
		<j> = (<j> + 1)
		repeat ($g_num_lobby_local_submenus)
		if (<found_part> = none)
			return true missing_part = ($part_priority [<i>])
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script band_lobby_get_used_band_member_parts 
	used_parts = []
	used_indices = []
	getarraysize ($part_priority)
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if playerinfoequals ($<submenu_data>.player) in_game = 1
		getplayerinfo ($<submenu_data>.player) part
		getplayerinfo ($<submenu_data>.player) stored_character_index
		getplayerinfo ($<submenu_data>.player) character_id
		addarrayelement array = <used_parts> element = <part>
		used_parts = <array>
		if playerinfoequals ($<submenu_data>.player) is_local_client = 1
			addarrayelement array = <used_indices> element = <stored_character_index>
			used_indices = <array>
			if isxenon
				if (<stored_character_index> = 0)
					if ((($<submenu_data>.player) != $g_leader_player_num) && ($g_leader_player_num != -1))
						get_saved_band_member savegame = <i> index = 0
						if (<user_changed> = 0)
							if ((<band_leader_member_id> > 0) && (<band_leader_member_id> < 4))
								printf 'Controller %c is using buddy character index %i' c = <i> i = <band_leader_member_id>
								addarrayelement array = <used_indices> element = <band_leader_member_id>
								used_indices = <array>
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return used_parts = <used_parts> used_indices = <used_indices>
endscript

script band_lobby_load_band_leader_character 
	requireparams \{[
			submenu_index
			part
			character_index
		]
		all}
	get_part_text_nl part = <part>
	printf channel = band_lobby qs(0xa66f064f) s = <submenu_index> p = <part_text>
	if ($g_leader_player_num >= 0)
		get_savegame_from_player player = ($g_leader_player_num)
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	printf channel = band_lobby qs(0x4844fa55) s = <savegame>
	printf channel = band_lobby qs(0xa857703d) s = <character_index>
	if NOT get_saved_band_member index = <character_index> savegame = <savegame>
		scriptassert qs(0xc56971ee) p = <index> i = ($g_leader_player_num)
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	printf channel = band_lobby qs(0xeb6d8e8a) a = ($<submenu_data>.player) b = <part> c = <character_id>
	setplayerinfo ($<submenu_data>.player) part = <part> store
	setplayerinfo ($<submenu_data>.player) character_id = <character_id> store
	setplayerinfo ($<submenu_data>.player) character_savegame = <character_savegame> store
	setplayerinfo ($<submenu_data>.player) stored_character_index = <character_index> store
	if NOT gotparam \{no_refresh}
		persistent_band_refresh_changed_characters
	endif
	update_camera_for_viewport player = ($<submenu_data>.player) viewport_index = <submenu_index>
endscript

script band_lobby_fix_cpu_parts 
	printf \{channel = band_lobby
		qs(0x784863bb)}
	requireparams \{[
			used_parts
			buddy_parts
		]
		all}
	bad_cpu_players = []
	required_buddy_parts = <buddy_parts>
	getarraysize <used_parts>
	if (<array_size> > 0)
		i = 0
		begin
		used_part = (<used_parts> [<i>])
		if arraycontains array = <required_buddy_parts> contains = <used_part>
			removearrayelement array = <required_buddy_parts> element = <used_part>
			required_buddy_parts = <array>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if (($<submenu_data>.occupied) = 0)
		if NOT band_lobby_player_in_use player = ($<submenu_data>.player)
			getplayerinfo ($<submenu_data>.player) part out = cpu_part
			if arraycontains array = <used_parts> contains = <cpu_part>
				addarrayelement array = <bad_cpu_players> element = ($<submenu_data>.player)
				bad_cpu_players = <array>
			else
				if arraycontains array = <required_buddy_parts> contains = <cpu_part>
					removearrayelement array = <required_buddy_parts> element = <cpu_part>
					required_buddy_parts = <array>
				endif
				addarrayelement array = <used_parts> element = <cpu_part>
				<used_parts> = <array>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	getarraysize <bad_cpu_players>
	num_bad_players = <array_size>
	if (<num_bad_players> > 0)
		i = 0
		begin
		bad_player = (<bad_cpu_players> [<i>])
		getarraysize <required_buddy_parts>
		if (<array_size> = 0)
			printstruct <...>
			scriptassert 'required_buddy_parts is empty, trying to set player %a' a = <bad_player>
			break
		endif
		new_part = (<required_buddy_parts> [0])
		removearrayelement array = <required_buddy_parts> index = 0
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
	removearrayelement array = ($part_priority) element = <leader_part>
	buddy_parts = <array>
	band_lobby_fix_cpu_parts used_parts = <used_parts> buddy_parts = <buddy_parts>
	getarraysize <buddy_parts>
	i = 0
	begin
	part = (<buddy_parts> [<i>])
	member_index = (<i> + 1)
	if NOT arraycontains array = <used_indices> contains = <member_index>
		if NOT arraycontains array = <used_parts> contains = <part>
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
	repeat <array_size>
	if NOT gotparam \{no_refresh}
		persistent_band_refresh_changed_characters
	endif
endscript

script band_lobby_player_in_use 
	requireparams \{[
			player
		]
		all}
	check_player = <player>
	getnumplayersingame local = <local>
	if (<num_players> > 0)
		getfirstplayer local = <local>
		begin
		if (<player> = <check_player>)
			return \{true}
		endif
		getnextplayer local = <local> player = <player>
		repeat <num_players>
	endif
	return \{false}
endscript

script band_lobby_find_buddy_submenu 
	requireparams \{[
			part
		]
		all}
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if NOT band_lobby_player_in_use player = ($<submenu_data>.player)
		getplayerinfo ($<submenu_data>.player) part out = other_part
		printf 'band_lobby_find_buddy_submenu - viewport=%v player=%p part=%a not in use' v = <i> p = ($<submenu_data>.player) a = <other_part>
		if (<other_part> = <part>)
			return true submenu_index = <i>
			break
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{false}
endscript

script band_lobby_find_lower_part_priority_buddy_submenu 
	requireparams \{[
			part
		]
		all}
	getarraysize ($part_priority)
	i = (<array_size> - 1)
	begin
	if (<part> = $part_priority [<i>])
		break
	endif
	j = 0
	begin
	formattext checksumname = submenu 'band_lobby_submenu_data_%i' i = <j>
	if NOT band_lobby_player_in_use player = ($<submenu>.player)
		getplayerinfo ($<submenu>.player) part out = this_part
		if (($part_priority [<i>]) = <this_part>)
			return true submenu_index = <j>
		endif
	endif
	<j> = (<j> + 1)
	repeat ($g_num_lobby_local_submenus)
	<i> = (<i> - 1)
	repeat <array_size>
	return \{false}
endscript

script band_lobby_handle_character_swap 
	requireparams \{[
			player
			old_part
			new_part
		]
		all}
	printf \{channel = band_lobby
		qs(0x85af9b5d)}
	if band_lobby_find_buddy_submenu part = <new_part>
		part = <old_part>
	else
		setplayerinfo <player> part = <new_part>
		if band_lobby_find_missing_part player = <player>
			if band_lobby_find_lower_part_priority_buddy_submenu part = <missing_part>
				part = <missing_part>
			endif
		endif
	endif
	printstruct <...>
	if gotparam \{submenu_index}
		swap_submenu_index = <submenu_index>
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <swap_submenu_index>
		getplayerinfo <player> in_game
		if (<in_game> = 1)
			getplayerinfo ($<submenu_data>.player) stored_character_index out = swap_character_index
			getplayerinfo ($<submenu_data>.player) character_id out = swap_character_id
			getplayerinfo ($<submenu_data>.player) character_savegame out = swap_character_savegame
			setplayerinfo ($<submenu_data>.player) part = <old_part>
			setplayerinfo <player> part = <new_part>
			setplayerinfo <player> stored_character_index = <swap_character_index>
			if gotparam \{no_refresh}
				band_lobby_refresh_band_leader_characters \{no_refresh}
			else
				band_lobby_refresh_band_leader_characters
			endif
			setplayerinfo <player> character_id = <swap_character_id>
			setplayerinfo <player> character_savegame = <swap_character_savegame>
		else
			setplayerinfo ($<submenu_data>.player) part = <old_part>
			setplayerinfo <player> part = <new_part>
			if gotparam \{no_refresh}
				band_lobby_refresh_band_leader_characters \{no_refresh}
			else
				band_lobby_refresh_band_leader_characters
			endif
		endif
	endif
endscript

script band_lobby_switch_characters_for_ps3_at_join 
	requireparams \{[
			player
			controller
		]
		all}
	printf 'band_lobby_switch_characters_for_ps3_at_join %a %b' a = <player> b = <controller>
	if isguitarcontroller controller = <controller>
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
	getplayerinfo <player> part out = old_part
	setplayerinfo <player> is_local_client = 1
	setplayerinfo <player> in_game = 1
	if (<old_part> != <part>)
		band_lobby_handle_character_swap {
			player = <player>
			old_part = <old_part>
			new_part = <part>
			no_refresh
		}
	endif
	setplayerinfo <player> stored_character_index = 0
	band_lobby_refresh_band_leader_characters \{no_refresh}
endscript

script band_lobby_rerandomize_rocker 
	requireparams \{[
			player
			viewport_index
		]
		all}
	if NOT band_lobby_is_edit_rocker_allowed
		soundevent \{event = menu_warning_sfx}
		return
	endif
	get_savegame_from_player player = <player>
	if gotparam \{random_avatar}
		update_temporary_random_avatar slot = <viewport_index> savegame = <savegame>
	else
		update_temporary_random_car slot = <viewport_index> savegame = <savegame>
	endif
	persistent_band_refresh_changed_characters
endscript

script band_lobby_delete_saved_rocker 
	requireparams \{[
			player
			viewport_index
		]
		all}
	get_savegame_from_player player = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	character_id = <chosen_character_id>
	if NOT characterprofileexists savegame = <savegame> name = <character_id>
		soundevent \{event = menu_warning_sfx}
		return
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
		band_lobby_create_popup_menu {
			menu = delete_rocker
			player = <player>
			container = <resolved_id>
			viewport_index = <viewport_index>
		}
	endif
endscript

script band_lobby_delete_saved_rocker_confirm 
	requireparams \{[
			player
			viewport_index
		]
		all}
	get_savegame_from_player player = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.player) chosen_character_id
	character_id = <chosen_character_id>
	setplayerinfo ($<submenu_data>.player) chosen_character_id = none
	delete_custom_profile id = <character_id> savegame = <savegame>
	band_lobby_set_dirty_save_flag player = <player> flag = 1
	array = ($<submenu_data>.menu_indices)
	setarrayelement \{arrayname = array
		index = 0
		newvalue = 0}
	setarrayelement \{arrayname = array
		index = 1
		newvalue = 0}
	setarrayelement \{arrayname = array
		index = 2
		newvalue = 0}
	band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = <array>
	if ($<submenu_data>.is_managed = 0)
		band_lobby_change_menu {action = back menu = main viewport_index = <viewport_index> player = <player> reset_characters}
	endif
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = menu
	switch (<menu>)
		case select_rocker0
		case select_rocker1
		case select_rocker2
		case select_rocker3
		case select_outfit0
		case select_outfit1
		case select_outfit2
		case select_outfit3
		case accept_saved_rocker
		case accept_gh_rocker
		case accept_create_random_rocker
		case accept_create_random_avatar
		case accept_avatar
		band_lobby_get_submenu_data_new submenu_index = <i> param = player
		if playerinfoequals <player> is_local_client = 1
			formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
			if ($<submenu_data>.is_managed = 0)
				band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
				band_lobby_change_menu action = back menu = main player = <player> viewport_index = <i> focus = 0 no_forced
				setplayerinfo <player> chosen_character_id = none
				setplayerinfo <player> chosen_character_savegame = -1
			endif
		endif
		default
		printf \{'all good'}
	endswitch
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	persistent_band_refresh_changed_characters
	band_lobby_destroy_popup_menu
endscript

script band_lobby_is_edit_rocker_allowed 
	if savegame_async_is_busy
		return \{false}
	endif
	if ($is_in_cas = 1)
		return \{false}
	endif
	if band_lobby_are_remote_players_in_game
		return \{false}
	endif
	if ($cas_current_savegame != -1)
		return \{false}
	endif
	if ($g_career_search != null)
		return \{false}
	endif
	return \{true}
endscript

script band_lobby_is_not_managed_player 
	requireparams \{[
			viewport_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if ($<submenu_data>.is_managed = 1 && $<submenu_data>.occupied = 1)
		return \{false}
	endif
	return \{true}
endscript

script band_lobby_get_character_id 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> chosen_character_id
	if (<chosen_character_id> = none)
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
	else
		getplayerinfo <player> chosen_character_savegame
		character_id = <chosen_character_id>
		character_savegame = <chosen_character_savegame>
	endif
	return character_id = <character_id> character_savegame = <character_savegame>
endscript

script band_lobby_reset_all_chosen_characters 
	getmaxplayers
	<i> = 1
	begin
	if gotparam \{not_silhouettes}
		getplayerinfo <i> chosen_character_id
		if (<chosen_character_id> != silhouette)
			setplayerinfo <i> chosen_character_id = none
			setplayerinfo <i> chosen_character_savegame = -1
		endif
	else
		setplayerinfo <i> chosen_character_id = none
		setplayerinfo <i> chosen_character_savegame = -1
	endif
	i = (<i> + 1)
	repeat <max_players>
endscript

script band_lobby_rocker_changed_player_part 
	requireparams \{[
			part
			player
		]
		all}
	if ((<part> = guitar) || (<part> = bass))
		getplayerinfo <player> controller
		get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
		guitar_bass_flip = <user_option>
		if (<guitar_bass_flip> != <part>)
			band_lobby_set_dirty_save_flag player = <player> flag = 1
			save_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip' new_value = <part>
		endif
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty'
		if (<user_option> = none)
			if (<part> = guitar)
				get_progression_instrument_user_option part = bass controller = <controller> option = 'difficulty'
			else
				get_progression_instrument_user_option part = guitar controller = <controller> option = 'difficulty'
			endif
			if (<user_option> != none)
				setplayerinfo <player> difficulty = <user_option>
				save_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty' new_value = <user_option>
				band_lobby_set_dirty_save_flag player = <player> flag = 1
			endif
		else
			setplayerinfo <player> difficulty = <user_option>
		endif
	endif
	getplayerinfo <player> part out = old_part
	if (<player> <= 4)
		if (<old_part> != <part>)
			getplayerinfo <player> stored_character_index
			get_savegame_from_player player = <player>
			get_saved_band_member index = <stored_character_index> savegame = <savegame>
			if isps3
				user_changed = 0
			endif
			if ((<user_changed> = 0) && ($g_leader_player_num != <player>))
				band_lobby_handle_character_swap {
					player = <player>
					old_part = <old_part>
					new_part = <part>
					no_refresh
				}
				if isxenon
					getplayerinfo <player> stored_character_index
					getplayerinfo <player> character_id
					getplayerinfo <player> character_savegame
					globaltag_fix_band_member0_at_join {
						savegame = <savegame>
						existing_character_id = <character_id>
						existing_character_savegame = <character_savegame>
						existing_stored_character_index = <stored_character_index>
					}
					setplayerinfo <player> stored_character_index = 0
				endif
			endif
			setplayerinfo <player> part = <part> store
			if band_lobby_find_buddy_submenu part = <part>
				formattext checksumname = buddy_submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
				setplayerinfo ($<buddy_submenu_data>.player) part = <old_part> store
			endif
			band_lobby_refresh_band_leader_characters \{no_refresh}
		endif
	endif
	setplayerinfo <player> part = <part> store
	if (<player> <= 4)
		if gotparam \{viewport_index}
			update_camera_for_viewport player = <player> viewport_index = <viewport_index>
		endif
	endif
endscript

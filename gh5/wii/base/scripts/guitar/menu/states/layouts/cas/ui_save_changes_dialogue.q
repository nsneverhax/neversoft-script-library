
script ui_create_save_changes_dialogue 
	prompt_for_save_or_confirm = save
	cas_get_player
	if isXenon
		if NOT CheckForSignIn local controller_index = <controller>
			prompt_for_save_or_confirm = confirm
		endif
	endif
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		prompt_for_save_or_confirm = confirm
	endif
	switch <prompt_for_save_or_confirm>
		case save
		confirm_title_text = qs(0x32541dc7)
		confirm_option_text = qs(0xe618e644)
		confirm_func = exit_save_changes
		confirm_dialog_text = qs(0xee9a8f50)
		case confirm
		confirm_title_text = qs(0xc1fb7e7c)
		confirm_option_text = qs(0xb177602e)
		confirm_func = exit_skip_save
		confirm_dialog_text = qs(0x70d0fab3)
	endswitch
	create_dialog_box {
		heading_text = <confirm_title_text>
		body_text = <confirm_dialog_text>
		no_background
		options = [
			{
				func = <confirm_func>
				text = <confirm_option_text>
			}
			{
				func = exit_discard_changes
				text = qs(0x1fbf1f17)
			}
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
		]
		back_button_script = generic_event_back
		player_device = <state_device>
	}
	clean_up_user_control_helpers
	add_user_control_helper controller = <state_device> text = qs(0x326e2d2f) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xf7723015) button = red z = 100000
endscript

script ui_destroy_save_changes_dialogue 
	destroy_dialog_box
endscript

script exit_save_changes 
	if is_completely_custom_musician id = ($cas_current_profile)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
	endif
	destroy_dialog_box
	clean_up_menu_history_screen_elements
	getcasappearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = ($cas_current_fullname) savegame = ($cas_current_savegame)
	cas_get_player
	if ($cas_started_from != lobby)
		setplayerinfo <Player> character_id = ($cas_current_profile)
		setplayerinfo <Player> character_savegame = ($cas_current_savegame)
	endif
	Change charselect_previous_character_id = ($cas_current_profile)
	if ($achievements_creating_character = 1)
		if ((<appearance>.cas_physique.desc_id) = femalephysique)
			achievements_rock_maiden controller = ($primary_controller)
		elseif ((<appearance>.cas_physique.desc_id) = malephysique)
			achievements_warrior_of_rock controller = ($primary_controller)
		endif
	endif
	if ($cas_started_from != career_select)
		cas_destroy_all_characters
	endif
	data = {savegame = ($cas_current_savegame) requested_autosave = 1}
	cas_back_out_to_correct_state
	ui_memcard_autosave_replace event = menu_back state = <state> data = {<data>}
endscript

script exit_discard_changes 
	destroy_dialog_box
	clean_up_menu_history_screen_elements
	cas_get_player
	if (($cas_editing_new_character) = true)
		cas_destroy_all_characters
		delete_custom_profile id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_get_player
		if characterprofileexists Name = ($charselect_previous_character_id) savegame = ($cas_current_savegame)
			character_id = ($charselect_previous_character_id)
		else
			character_id = ($failsafe_car_profile)
		endif
		setplayerinfo <Player> character_id = <character_id>
		setplayerinfo <Player> character_savegame = ($cas_current_savegame)
		if ($cas_started_from = lobby)
			getplayerinfo <Player> stored_character_index
			globaltag_save_band_member_choice index = <stored_character_index> character_id = <character_id> savegame = ($cas_current_savegame) character_savegame = ($cas_current_savegame)
		endif
	elseif ($cas_started_from = lobby)
		cas_destroy_all_characters
	else
		if GotParam \{no_changes}
			if ($cas_started_from = main_menu)
				cas_destroy_all_characters
			endif
		else
			cas_destroy_all_characters
		endif
	endif
	cas_back_out_to_correct_state
	generic_event_back state = <state> data = {}
endscript

script exit_skip_save 
	if is_completely_custom_musician id = ($cas_current_profile)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
	endif
	destroy_dialog_box
	clean_up_menu_history_screen_elements
	getcasappearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = ($cas_current_fullname) savegame = ($cas_current_savegame)
	cas_get_player
	if ($cas_started_from != lobby)
		setplayerinfo <Player> character_id = ($cas_current_profile)
		setplayerinfo <Player> character_savegame = ($cas_current_savegame)
	endif
	Change charselect_previous_character_id = ($cas_current_profile)
	if ($cas_started_from != career_select)
		cas_destroy_all_characters
	endif
	cas_back_out_to_correct_state
	generic_event_back state = <state> data = {}
endscript

script cas_back_out_to_correct_state 
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		return \{state = uistate_character_hub}
	elseif ((<stack> [<i>].base_name) = 'character_selection')
		return \{state = uistate_character_selection}
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		return \{state = uistate_singleplayer_character_hub}
	elseif ((<stack> [<i>].base_name) = 'band_lobby')
		return \{state = uistate_band_lobby_setup}
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		return \{state = uistate_band_mode}
	endif
	i = (<i> + 1)
	repeat <stack_size>
	ScriptAssert \{'No suitable state found to back out to'}
endscript

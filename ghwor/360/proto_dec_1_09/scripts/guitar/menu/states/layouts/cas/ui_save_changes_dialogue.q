
script ui_create_save_changes_dialogue 
	prompt_for_save_or_confirm = save
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = <state_device>}
			prompt_for_save_or_confirm = confirm
		endif
		if NOT CheckForSignIn local controller_index = <state_device>
			prompt_for_save_or_confirm = confirm
		endif
	endif
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		prompt_for_save_or_confirm = confirm
	endif
	switch <prompt_for_save_or_confirm>
		case save
		confirm_title_text = qs(0x9a0149db)
		confirm_option_text = qs(0xe618e644)
		confirm_func = exit_save_changes
		confirm_dialog_text = qs(0xee9a8f50)
		case confirm
		confirm_title_text = qs(0xd0c43971)
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
	hide_glitch \{num_frames = 12}
	DestroyScreenElement \{id = dialog_box_vmenu
		preserve_parent}
	if is_completely_custom_musician id = ($cas_current_profile)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame) readytorock = <readytorock>
	endif
	destroy_dialog_box
	getcasappearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = ($cas_current_fullname) savegame = ($cas_current_savegame)
	cas_get_player
	if ($cas_started_from != lobby)
	endif
	Change charselect_previous_character_id = ($cas_current_profile)
	get_is_female_from_appearance appearance = <appearance>
	if ($cas_started_from != career_select)
		cas_destroy_all_characters
	endif
	data = {savegame = ($cas_current_savegame) requested_autosave = 1}
	autosave_type = ui_memcard_autosave_replace
	if GotParam \{not_replace}
		autosave_type = ui_memcard_autosave
	endif
	if (true = $cas_editing_new_character)
		broadcastevent Type = created_rocker data = {Player = <Player> controller_index = <device_num>}
	endif
	cas_back_out_to_correct_state
	<autosave_type> event = menu_back state = <state> data = {<data>}
endscript

script exit_discard_changes 
	hide_glitch \{num_frames = 12}
	destroy_dialog_box
	cas_get_player
	if (($cas_editing_new_character) = true)
		cas_destroy_all_characters
		if (($cas_current_savegame) != -1)
			delete_custom_profile id = ($cas_current_profile) savegame = ($cas_current_savegame)
			cas_get_player
			if characterprofileexists Name = ($charselect_previous_character_id) savegame = ($cas_current_savegame)
				character_id = ($charselect_previous_character_id)
			else
				cas_get_random_ghrocker savegame = ($cas_current_savegame)
			endif
			if ($cas_started_from = lobby)
				getplayerinfo <Player> stored_character_index
				globaltag_save_band_member_choice index = <stored_character_index> character_id = <character_id> savegame = ($cas_current_savegame) character_savegame = ($cas_current_savegame)
				setplayerinfo <Player> character_id = <character_id>
				setplayerinfo <Player> character_savegame = ($cas_current_savegame)
			endif
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
	generic_event_back nosound state = <state> data = {}
endscript

script exit_skip_save 
	hide_glitch \{num_frames = 12}
	DestroyScreenElement \{id = dialog_box_vmenu
		preserve_parent}
	if is_completely_custom_musician id = ($cas_current_profile)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame) readytorock = <readytorock>
	endif
	destroy_dialog_box
	getcasappearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = ($cas_current_fullname) savegame = ($cas_current_savegame)
	cas_get_player
	if ($cas_started_from != lobby)
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
	if ((<stack> [<i>].base_name) = 'character_selection')
		return \{state = uistate_character_selection}
	elseif ((<stack> [<i>].base_name) = 'band_lobby')
		return \{state = uistate_band_lobby}
	endif
	i = (<i> + 1)
	repeat <stack_size>
	ScriptAssert \{'No suitable state found to back out to'}
endscript

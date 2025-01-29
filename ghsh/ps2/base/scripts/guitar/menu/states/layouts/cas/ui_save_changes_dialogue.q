
script ui_create_save_changes_dialogue 
	prompt_for_save_or_confirm = save
	cas_get_player_status
	if isXenon
		if NetSessionFunc func = xenonisguest params = {controller_index = ($<player_status>.controller)}
			prompt_for_save_or_confirm = confirm
		endif
		if NOT CheckForSignIn local controller_index = ($<player_status>.controller)
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
		confirm_dialog_text = qs(0x18ab2f3d)
		case confirm
		confirm_title_text = qs(0xc1fb7e7c)
		confirm_option_text = qs(0xb177602e)
		confirm_func = exit_skip_save
		confirm_dialog_text = qs(0x70d0fab3)
	endswitch
	header_dims = (330.0, 120.0)
	if Spanish
		<header_dims> = (450.0, 120.0)
	endif
	create_popup_warning_menu {
		title = <confirm_title_text>
		textblock = {
			text = <confirm_dialog_text>
		}
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
				text = qs(0xf7723015)
			}
		]
		header_dims = <header_dims>
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}]
	}
	if NOT (($menu_over_ride_exclusive_device) = -1)
		controller = ($menu_over_ride_exclusive_device)
	endif
	add_user_control_helper text = qs(0xf7723015) button = red z = 100000 controller = <controller>
endscript

script ui_destroy_save_changes_dialogue 
	destroy_popup_warning_menu
endscript

script exit_save_changes 
	destroy_band_money_display
	DestroyScreenElement \{id = pu_warning_vmenu
		preserve_parent}
	if ScreenElementExists \{id = popup_stars}
		popup_stars :se_setprops \{alpha = 0.0}
	endif
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame) readytorock = <readytorock>
	endif
	destroy_popup_warning_menu
	clean_up_menu_history_screen_elements
	getcasappearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	cas_get_player_status
	Change structurename = <player_status> character_id = ($cas_current_profile)
	if is_from_singleplayer_hub
		SetGlobalTags savegame = ($cas_current_savegame) last_singleplayer_character params = {last_singleplayer_character = ($cas_current_profile)}
	endif
	if ($achievements_creating_character = 1)
		achievements_masterpiece controller = ($primary_controller)
	endif
	if ($cas_from_main_menu = 1)
		cas_destroy_all_characters
	endif
	ui_event_get_stack
	data = {savegame = ($cas_current_savegame) requested_autosave = 1}
	autosave_type = ui_memcard_autosave_replace
	if GotParam \{not_replace}
		autosave_type = ui_memcard_autosave
	endif
	data = {<data> 0x6d221ff1}
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		if NOT current_band_has_band_name
			<autosave_type> event = menu_replace data = {state = uistate_band_name_logo event_params = {event = menu_back data = {state = uistate_character_hub <data>}} from_save = 1 controller = $primary_controller}
			return
		endif
		<autosave_type> event = menu_back state = uistate_character_hub data = <data>
		return
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		if NOT current_band_has_band_name
			<autosave_type> event = menu_replace data = {state = uistate_band_name_logo event_params = {event = menu_back data = {state = uistate_singleplayer_character_hub <data>}} from_save = 1 controller = $primary_controller}
			return
		endif
		<autosave_type> event = menu_back state = uistate_singleplayer_character_hub data = <data>
		return
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		<autosave_type> event = menu_back state = uistate_band_mode data = <data>
		return
	endif
	i = (<i> + 1)
	repeat <stack_size>

	<autosave_type> event = menu_back state = uistate_character_selection data = <data>
endscript

script exit_discard_changes 
	destroy_popup_warning_menu
	clean_up_menu_history_screen_elements
	cas_get_player_status
	if (($cas_editing_new_character) = true)
		cas_destroy_all_characters
		delete_custom_profile id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_get_player_status
		if NOT get_musician_profile_struct_by_id dont_assert id = ($charselect_previous_character_id) savegame = ($cas_current_savegame)
			Change structurename = <player_status> character_id = Axel
		else
			Change structurename = <player_status> character_id = ($charselect_previous_character_id)
		endif
	else
		if GotParam \{no_changes}
			if ($cas_from_main_menu = 1)
				cas_destroy_all_characters
			endif
		else
			cas_destroy_all_characters
			cas_queue_new_character_profile id = ($charselect_previous_character_id) Player = ($cas_current_player) savegame = ($cas_current_savegame) force_update = 1 hide_old_character = 1
		endif
		Change structurename = <player_status> character_id = ($charselect_previous_character_id)
	endif
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		generic_event_back \{state = uistate_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		generic_event_back \{state = uistate_singleplayer_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		generic_event_back \{state = uistate_band_mode}
		return
	endif
	i = (<i> + 1)
	repeat <stack_size>

	generic_event_back \{state = uistate_character_selection}
endscript

script exit_skip_save 
	DestroyScreenElement \{id = pu_warning_vmenu
		preserve_parent}
	if ScreenElementExists \{id = popup_stars}
		popup_stars :se_setprops \{alpha = 0.0}
	endif
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame) readytorock = <readytorock>
	endif
	destroy_popup_warning_menu
	clean_up_menu_history_screen_elements
	getcasappearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	cas_get_player_status
	Change structurename = <player_status> character_id = ($cas_current_profile)
	if is_from_singleplayer_hub
		SetGlobalTags savegame = ($cas_current_savegame) last_singleplayer_character params = {last_singleplayer_character = ($cas_current_profile)}
	endif
	if ($cas_from_main_menu = 1)
		cas_destroy_all_characters
	endif
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		generic_event_back \{state = uistate_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_player1_start
		generic_event_back \{state = uistate_singleplayer_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		generic_event_back \{state = uistate_band_mode}
		return
	endif
	i = (<i> + 1)
	repeat <stack_size>
	generic_event_back \{state = uistate_character_selection}
endscript

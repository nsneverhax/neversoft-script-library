ui_options_from_submenu = 0

script ui_create_options 
	StartRendering
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	update_ingame_controllers controller = ($primary_controller)
	create_frontend_bg
	make_menu_frontend {
		pad_back_script = generic_event_back
		title = qs(0x2c98ca28)
		exclusive_device = ($primary_controller)
	}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	add_menu_frontend_item \{text = qs(0x3e3a98e6)
		desc = 'menu_tape_01'
		choose_state = uistate_options_cheats}
	add_menu_frontend_item {
		text = qs(0x9baf87e5)
		desc = 'menu_tape_02'
		pad_choose_script = menu_choose_band_make_selection
		pad_choose_params = {from_options = 1 device_num = ($primary_controller) event_params = {event = menu_back}}
	}
	if NOT current_band_has_band_name
		<item_id> :se_setprops not_focusable item_color = [110 100 90 175]
	endif
	add_menu_frontend_item \{text = qs(0x98846417)
		desc = 'menu_tape_03'
		pad_choose_script = ui_options_continue_to_data_submenu
		pad_choose_params = {
			is_popup
		}}
	if isXenon
		if NOT CheckForSignIn local controller_index = ($primary_controller)
			<item_id> :se_setprops not_focusable item_color = [110 100 90 175]
		elseif NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			<item_id> :se_setprops not_focusable item_color = [110 100 90 175]
		endif
	endif
	add_menu_frontend_item \{text = qs(0x550b8c8e)
		desc = 'menu_tape_04'
		choose_state = uistate_options_calibrate_lag}
	add_menu_frontend_item \{text = qs(0xb0462d31)
		desc = 'menu_tape_05'
		choose_state = uistate_options_audio}
	add_menu_frontend_item \{text = qs(0x7305a834)
		desc = 'menu_tape_01'
		pad_choose_script = ui_options_continue_to_settings_submenu
		pad_choose_params = {
			is_popup
		}}
	menu_finish
	unblock_invites
endscript

script ui_return_options 
	clean_up_user_control_helpers
	menu_finish
endscript

script ui_options_anim_in 
	if NOT ($ui_options_from_submenu)
		menu_transition_in \{menu = current_menu_anchor}
	else
		Change \{ui_options_from_submenu = 0}
	endif
	current_menu_anchor :se_setprops \{highlight_alpha = 1}
	current_menu :obj_spawnscript \{highlight_motion}
endscript

script ui_options_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_destroy_options 
	cleanup_frontend_bg
	generic_ui_destroy
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	Type = guitar
	text = qs(0x9504b94a)
	if NOT IsGuitarController controller = <controller>
		Type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			Type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {Type = <Type> text = <text>}
endscript

script ui_options_set_settings 
	if ScreenElementExists \{id = current_menu}
		GetGlobalTags \{user_options}
		current_menu :SetTags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	RemoveParameter \{event}
	RemoveParameter \{controller}
	if NOT ($playing_song)
		if CheckForSignIn local controller_index = <device_num>
			RemoveParameter \{device_num}
			if ScreenElementExists \{id = current_menu}
				GetGlobalTags \{user_options}
				new_user_options = <...>
				current_menu :GetSingleTag \{user_options}
				if GotParam \{user_options}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						generic_menu_pad_back_sound
						SpawnScriptNow \{ui_memcard_autosave_replace}
						return
					endif
				endif
			endif
		endif
	endif
	generic_event_back
endscript

script ui_options_continue_to_settings_submenu 
	if is_ui_event_running
		return \{FALSE}
	endif
	current_menu :Obj_KillSpawnedScript \{Name = highlight_motion}
	current_menu_anchor :se_setprops \{highlight_alpha = 0}
	ui_event_block event = menu_change data = {state = uistate_options_settings <...>}
endscript

script ui_options_continue_to_data_submenu 
	if is_ui_event_running
		return \{FALSE}
	endif
	current_menu :Obj_KillSpawnedScript \{Name = highlight_motion}
	current_menu_anchor :se_setprops \{highlight_alpha = 0}
	ui_event_block event = menu_change data = {state = uistate_options_data <...>}
endscript

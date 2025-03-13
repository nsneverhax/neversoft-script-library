ui_options_from_submenu = 0

script ui_create_options 
	startrendering
	change \{rich_presence_context = presence_menus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
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
		not_focusable
		rgba = [
			110
			100
			90
			175
		]
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
		}
		not_focusable
		rgba = [
			110
			100
			90
			175
		]}
	if isxenon
		if NOT checkforsignin local controller_index = ($primary_controller)
			<item_id> :se_setprops not_focusable item_color = [110 100 90 175]
		elseif netsessionfunc func = xenonisguest params = {controller_index = ($primary_controller)}
			<item_id> :se_setprops not_focusable item_color = [110 100 90 175]
		endif
	endif
	add_menu_frontend_item \{text = qs(0x550b8c8e)
		desc = 'menu_tape_04'
		choose_state = uistate_options_calibrate_lag}
	add_menu_frontend_item \{text = qs(0xb0462d31)
		desc = 'menu_tape_05'
		choose_state = uistate_options_audio
		not_focusable
		rgba = [
			110
			100
			90
			175
		]}
	add_menu_frontend_item \{text = qs(0x7305a834)
		desc = 'menu_tape_01'
		pad_choose_script = ui_options_continue_to_settings_submenu
		pad_choose_params = {
			is_popup
		}
		not_focusable
		rgba = [
			110
			100
			90
			175
		]}
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
		change \{ui_options_from_submenu = 0}
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
	type = guitar
	text = qs(0x9504b94a)
	if NOT isguitarcontroller controller = <controller>
		type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {type = <type> text = <text>}
endscript

script ui_options_set_settings 
	if screenelementexists \{id = current_menu}
		getglobaltags \{user_options}
		current_menu :settags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	removeparameter \{event}
	removeparameter \{controller}
	if NOT ($playing_song)
		if checkforsignin local controller_index = <device_num>
			removeparameter \{device_num}
			if screenelementexists \{id = current_menu}
				getglobaltags \{user_options}
				new_user_options = <...>
				current_menu :getsingletag \{user_options}
				if gotparam \{user_options}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						generic_menu_pad_back_sound
						spawnscriptnow \{ui_memcard_autosave_replace}
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
		return \{false}
	endif
	current_menu :obj_killspawnedscript \{name = highlight_motion}
	current_menu_anchor :se_setprops \{highlight_alpha = 0}
	ui_event_block event = menu_change data = {state = uistate_options_settings <...>}
endscript

script ui_options_continue_to_data_submenu 
	if is_ui_event_running
		return \{false}
	endif
	current_menu :obj_killspawnedscript \{name = highlight_motion}
	current_menu_anchor :se_setprops \{highlight_alpha = 0}
	ui_event_block event = menu_change data = {state = uistate_options_data <...>}
endscript

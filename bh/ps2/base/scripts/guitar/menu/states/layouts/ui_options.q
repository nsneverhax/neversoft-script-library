ui_options_from_submenu = 0

script ui_create_options 
	StartRendering
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	Change \{top_rockers_enabled = 0}
	Change \{memcard_after_func = None}
	update_ingame_controllers controller = ($primary_controller)
	0x5e1a3a04 \{title = qs(0x976cf9e7)
		option_arrows}
	0x9d0992fe \{text = qs(0x3e3a98e6)
		choose_state = uistate_options_cheats}
	if NOT current_band_has_band_name
		0x9d0992fe \{text = qs(0x9baf87e5)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			focus_rgba = [
				160
				150
				140
				175
			]
			unfocus_rgba = [
				160
				150
				140
				175
			]}
	else
		0x9d0992fe {
			text = qs(0x9baf87e5)
			pad_choose_script = menu_choose_band_make_selection
			pad_choose_params = {from_options = 1 device_num = ($primary_controller) event_params = {event = menu_back}}
		}
	endif
	0x9d0992fe \{text = qs(0x98846417)
		pad_choose_script = ui_options_continue_to_data_submenu
		pad_choose_params = {
			is_popup
		}}
	0x9d0992fe \{text = qs(0x550b8c8e)
		choose_state = uistate_options_calibrate_lag}
	0x9d0992fe \{text = qs(0xa0345d1c)
		choose_state = uistate_options_audio}
	0x9d0992fe \{text = qs(0x7305a834)
		pad_choose_script = ui_options_continue_to_settings_submenu
		pad_choose_params = {
			is_popup
		}}
	0x9d0992fe \{text = qs(0x9560fb22)
		choose_state = uistate_bonus_videos}
	if GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		i = 0
		begin
		curr_id = (<children> [<i>])
		<curr_id> :se_setprops {
			tags = {index = <i>}
		}
		i = (<i> + 1)
		repeat <array_Size>
	endif
	clean_up_user_control_helpers
	menu_finish
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
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
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
		RemoveParameter \{device_num}
		if ScreenElementExists \{id = current_menu}
			GetGlobalTags \{user_options}
			new_user_options = <...>
			current_menu :GetSingleTag \{user_options}
			if GotParam \{user_options}
				if GotParam \{no_loading_screen}
					RemoveParameter \{no_loading_screen
						struct_name = new_user_options}
				endif
				if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
					generic_menu_pad_back_sound
					SpawnScriptNow \{ui_memcard_autosave_replace}
					return
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
	ui_event_block event = menu_change data = {state = uistate_options_settings <...>}
endscript

script ui_options_continue_to_data_submenu 
	if is_ui_event_running
		return \{FALSE}
	endif
	ui_event_block event = menu_change data = {state = uistate_options_data <...>}
endscript

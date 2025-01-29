practice_speed_factors = {
	full = 1.0
	slow = 0.8
	slower = 0.66666675
	slowest = 0.5
}

script ui_init_practice_select_speed 
	if ScreenElementExists \{id = practice_sectiontext}
		practice_sectiontext :SE_SetProps \{alpha = 0}
	endif
endscript

script ui_deinit_practice_select_speed 
	if ScreenElementExists \{id = practice_sectiontext}
		practice_sectiontext :SE_SetProps \{alpha = 1}
	endif
endscript

script ui_create_practice_select_speed device_num = ($primary_controller)
	CreateScreenElement \{type = DescInterface
		parent = root_window
		id = PracticeSelectSpeedInterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0x2586eb28)}
	if PracticeSelectSpeedInterface :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if PracticeSelectSpeedInterface :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	particle_id = <id>
	PracticeSelectSpeedInterface :Desc_ResolveAlias \{name = alias_Menu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :SE_SetProps {
		event_handlers = [
			{pad_back practice_select_speed_back}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0xab4bfb64)
		autoSizeDims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = full}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x0f639d5c)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slow}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x8e382995)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slower}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x28ef973e)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slowest}}
		]
		exclusive_device = <device_num>
	}
	if <particle_id> :Desc_ResolveAlias name = alias_particles param = light_bar_id
		<light_bar_id> :Obj_SpawnScript create_ui_highlight_particles params = {Pos = (420.0, -90.0) z = 1011 parent = <light_bar_id>}
	else
		ScriptAssert \{'UI_art'}
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1011}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 1011}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script ui_destroy_practice_select_speed 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = PracticeSelectSpeedInterface}
		DestroyScreenElement \{id = PracticeSelectSpeedInterface}
	endif
endscript

script practice_select_speed_back 
	Menu_Music_Off
	generic_event_back
endscript

script menu_choose_practice_speed_set_speed \{speed = full}
	Change current_speedfactor = ($practice_speed_factors.<speed>)
	generic_event_choose \{state = UIstate_practice_select_looping}
endscript

script menu_choose_practice_speed_auto_go_to_gameplay_for_vocals 
	ui_event_wait_for_safe
	if ui_event_exists_in_stack \{name = 'gameplay'}
		create_loading_screen
		practice_restart_song
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

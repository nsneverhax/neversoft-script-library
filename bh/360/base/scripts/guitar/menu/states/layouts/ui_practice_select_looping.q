
script ui_create_practice_select_looping device_num = ($primary_controller)
	CreateScreenElement \{type = DescInterface
		parent = root_window
		id = PracticeSelectLoopingInterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0xf352e399)}
	if PracticeSelectLoopingInterface :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if PracticeSelectLoopingInterface :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	particle_id = <id>
	PracticeSelectLoopingInterface :Desc_ResolveAlias \{name = alias_Menu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :SE_SetProps {
		event_handlers = [
			{pad_back generic_event_back}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x5b9dd758)
		autoSizeDims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_looping params = {<...> choice = once}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0xd1cccae6)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_looping params = {<...> choice = looping}}
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

script ui_destroy_practice_select_looping 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = PracticeSelectLoopingInterface}
		DestroyScreenElement \{id = PracticeSelectLoopingInterface}
	endif
endscript

script menu_choose_practice_looping 
	if (<choice> = looping)
		Change \{practice_loop_section = 1}
	else
		Change \{practice_loop_section = 0}
	endif
	GetFirstPlayer
	SetPlayerInfo <player> in_game = 1
	SetPlayerInfo <player> controller = <device_num>
	Change \{game_mode = practice}
	Change \{practice_enabled = 1}
	GetPlayerInfo <player> part
	if (<part> = vocals)
		spawnscriptlater \{menu_choose_practice_speed_auto_go_to_gameplay_for_vocals}
		return
	endif
	if ui_event_exists_in_stack \{name = 'gameplay'}
		create_loading_screen
		practice_restart_song
	elseif NOT GotParam \{from_pause}
		generic_event_choose \{state = uistate_play_song}
	else
		restart_warning_select_restart \{dont_save_song_data}
	endif
endscript

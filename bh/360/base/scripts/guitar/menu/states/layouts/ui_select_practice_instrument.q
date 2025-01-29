
script ui_create_select_practice_instrument 
	CreateScreenElement \{type = DescInterface
		parent = root_window
		id = PracticeSelectInstrumentInterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0x003c5382)}
	if PracticeSelectInstrumentInterface :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if PracticeSelectInstrumentInterface :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	particle_id = <id>
	PracticeSelectInstrumentInterface :Desc_ResolveAlias \{name = alias_Menu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :SE_SetProps \{event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
	CreateScreenElement \{type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x9504b94a)
		autoSizeDims = true
		event_handlers = [
			{
				focus
				practice_difficulty_focus
			}
			{
				unfocus
				practice_difficulty_unfocus
			}
			{
				pad_choose
				practice_choose_instrument
				params = {
					instrument = guitar
				}
			}
		]}
	CreateScreenElement \{type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x7d4f9214)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{
				focus
				practice_difficulty_focus
			}
			{
				unfocus
				practice_difficulty_unfocus
			}
			{
				pad_choose
				practice_choose_instrument
				params = {
					instrument = bass
				}
			}
		]}
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

script ui_destroy_select_practice_instrument 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = PracticeSelectInstrumentInterface}
		DestroyScreenElement \{id = PracticeSelectInstrumentInterface}
	endif
endscript

script practice_choose_instrument 
	GetFirstPlayer
	SetPlayerInfo <player> part = <instrument>
	get_progression_instrument_user_option part = <instrument> controller = <device_num> option = 'hyperspeed'
	if (<user_option> != -1)
		SetPlayerInfo <player> Cheat_HyperSpeed_Value = <user_option>
	endif
	generic_event_choose \{state = UIstate_select_practice_difficulty}
endscript

script practice_setup_part_and_continue 
	GetControllerType controller = <device_num>
	GetFirstPlayer
	if (<controller_type> = guitar)
		state = UIstate_select_practice_instrument
	elseif (<controller_type> = Drum)
		SetPlayerInfo <player> part = Drum
		state = UIstate_select_practice_difficulty
	else
		SetPlayerInfo <player> part = vocals
		state = UIstate_select_practice_difficulty
	endif
	vocals_distribute_mics
	ui_event event = menu_change state = <state>
endscript

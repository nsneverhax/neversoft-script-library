
script ui_create_select_practice_difficulty device_num = ($primary_controller)
	CreateScreenElement \{type = DescInterface
		parent = root_window
		id = PracticeSelectDifficultyInterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0x19804ebf)}
	if PracticeSelectDifficultyInterface :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if PracticeSelectDifficultyInterface :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	particle_id = <id>
	PracticeSelectDifficultyInterface :Desc_ResolveAlias \{name = alias_Menu}
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
		item_text = qs(0x8d657387)
		autoSizeDims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = easy}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x6ef11a01)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = medium}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x51b06d2f)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = hard}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x334908ac)
		autoSizeDims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = expert}}
		]
		exclusive_device = <device_num>
	}
	if <particle_id> :Desc_ResolveAlias name = alias_particles param = light_bar_id
		<light_bar_id> :Obj_SpawnScript create_ui_highlight_particles params = {Pos = (420.0, -90.0) z = 1011 parent = <light_bar_id>}
	else
		ScriptAssert \{'UI_art'}
	endif
	get_controller_type controller_index = <device_num>
	if (<controller_type> = Drum)
		if any_song_has_double_kick
			CreateScreenElement {
				type = DescInterface
				parent = current_menu
				desc = 'practice_menu_popup_item'
				item_text = qs(0x7a19b5f7)
				autoSizeDims = true
				highlight_btn_alpha = 0
				event_handlers = [
					{focus practice_difficulty_focus}
					{unfocus practice_difficulty_unfocus}
					{pad_choose practice_choose_difficulty params = {difficulty = expert_plus}}
				]
				exclusive_device = <device_num>
			}
		endif
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1011}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 1011}
	LaunchEvent \{type = focus
		target = current_menu}
	spawnscriptnow \{reset_mainmenu_camera}
endscript

script ui_destroy_select_practice_difficulty 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = PracticeSelectDifficultyInterface}
		DestroyScreenElement \{id = PracticeSelectDifficultyInterface}
	endif
endscript

script practice_difficulty_focus 
	generic_menu_up_or_down_sound
	SE_SetProps \{highlight_btn_alpha = 1
		item_rgba = [
			21
			41
			78
			255
		]}
	SE_GetProps
	if ScreenElementExists \{id = PracticeSelectInstrumentInterface}
		if PracticeSelectInstrumentInterface :Desc_ResolveAlias \{name = alias_particles}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = daveschorn}
		else
			printf \{qs(0x4458ef03)
				channel = daveschorn}
		endif
	endif
	if ScreenElementExists \{id = PracticeSelectDifficultyInterface}
		if PracticeSelectDifficultyInterface :Desc_ResolveAlias \{name = alias_particles}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = daveschorn}
		else
			printf \{qs(0x4458ef03)
				channel = daveschorn}
		endif
	endif
	if ScreenElementExists \{id = PracticeSelectSpeedInterface}
		if PracticeSelectSpeedInterface :Desc_ResolveAlias \{name = alias_particles}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = daveschorn}
		else
			printf \{qs(0x4458ef03)
				channel = daveschorn}
		endif
	endif
	if ScreenElementExists \{id = PracticeSelectLoopingInterface}
		if PracticeSelectLoopingInterface :Desc_ResolveAlias \{name = alias_particles}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = daveschorn}
		else
			printf \{qs(0x4458ef03)
				channel = daveschorn}
		endif
	endif
endscript

script practice_difficulty_unfocus 
	SE_SetProps \{highlight_btn_alpha = 0
		item_rgba = [
			183
			186
			255
			255
		]}
endscript

script practice_choose_difficulty 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetFirstPlayer
	if (<difficulty> = expert_plus)
		SetPlayerInfo <player> double_kick_drum = 1
		difficulty = expert
	else
		SetPlayerInfo <player> double_kick_drum = 0
	endif
	SetPlayerInfo <player> difficulty = <difficulty>
	GMan_SongTool_GetCurrentSong
	if ($current_song_qpak != <current_song>)
		unload_songqpak
		load_songqpak song_name = <current_song>
		begin
		if ($loadpak_lock = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	generic_event_choose \{state = UIstate_select_song_section}
endscript


script ui_create_select_practice_difficulty device_num = ($primary_controller)
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = practiceselectdifficultyinterface
		desc = 'practice_menu_popup'
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		practice_head_text = qs(0x19804ebf)}
	if practiceselectdifficultyinterface :desc_resolvealias \{Name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if practiceselectdifficultyinterface :desc_resolvealias \{Name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	particle_id = <id>
	practiceselectdifficultyinterface :desc_resolvealias \{Name = alias_menu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :se_setprops {
		event_handlers = [
			{pad_back generic_event_back}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x8d657387)
		autosizedims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = easy}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x6ef11a01)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = medium}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x51b06d2f)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = hard}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x334908ac)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = expert}}
		]
		exclusive_device = <device_num>
	}
	if <particle_id> :desc_resolvealias Name = 0x4ad34825 param = 0x12b40ebc
		<0x12b40ebc> :obj_spawnscript 0x0542334f params = {Pos = (420.0, -90.0) z = 1011 parent = <0x12b40ebc>}
	else
		ScriptAssert \{'UI_art'}
	endif
	get_controller_type controller_index = <device_num>
	if (<controller_type> = drum)
		if any_song_has_double_kick
			CreateScreenElement {
				Type = descinterface
				parent = current_menu
				desc = 'practice_menu_popup_item'
				item_text = qs(0x7a19b5f7)
				autosizedims = true
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
	LaunchEvent \{Type = focus
		target = current_menu}
	SpawnScriptNow \{reset_mainmenu_camera}
endscript

script ui_destroy_select_practice_difficulty 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = practiceselectdifficultyinterface}
		DestroyScreenElement \{id = practiceselectdifficultyinterface}
	endif
endscript

script practice_difficulty_focus 
	generic_menu_up_or_down_sound
	se_setprops \{highlight_btn_alpha = 1
		item_rgba = [
			21
			41
			78
			255
		]}
	se_getprops
	if ScreenElementExists \{id = practiceselectinstrumentinterface}
		if practiceselectinstrumentinterface :desc_resolvealias \{Name = 0x4ad34825}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = 0x65ee2b19}
		else
			printf \{qs(0x4458ef03)
				channel = 0x65ee2b19}
		endif
	endif
	if ScreenElementExists \{id = practiceselectdifficultyinterface}
		if practiceselectdifficultyinterface :desc_resolvealias \{Name = 0x4ad34825}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = 0x65ee2b19}
		else
			printf \{qs(0x4458ef03)
				channel = 0x65ee2b19}
		endif
	endif
	if ScreenElementExists \{id = practiceselectspeedinterface}
		if practiceselectspeedinterface :desc_resolvealias \{Name = 0x4ad34825}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = 0x65ee2b19}
		else
			printf \{qs(0x4458ef03)
				channel = 0x65ee2b19}
		endif
	endif
	if ScreenElementExists \{id = practiceselectloopinginterface}
		if practiceselectloopinginterface :desc_resolvealias \{Name = 0x4ad34825}
			<resolved_id> :SetProps Pos = <Pos>
			printf \{qs(0x8dd4e426)
				channel = 0x65ee2b19}
		else
			printf \{qs(0x4458ef03)
				channel = 0x65ee2b19}
		endif
	endif
endscript

script practice_difficulty_unfocus 
	se_setprops \{highlight_btn_alpha = 0
		item_rgba = [
			183
			186
			255
			255
		]}
endscript

script practice_choose_difficulty 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	getfirstplayer
	if (<difficulty> = expert_plus)
		setplayerinfo <Player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <Player> double_kick_drum = 0
	endif
	setplayerinfo <Player> difficulty = <difficulty>
	gman_songtool_getcurrentsong
	if load_song_from_sd_needed song_name = <current_song>
		create_loading_screen
	endif
	if ScreenElementExists \{id = practice_sd_eject_listener}
		DestroyScreenElement \{id = practice_sd_eject_listener}
	endif
	if NOT load_songqpak song_name = <current_song>
		destroy_loading_screen
		create_dialog_box {
			no_background
			heading_text = qs(0x79597197)
			dlg_z_priority = 1500
			body_text = <error_text>
			options = [
				{
					func = practice_error_loading_destroy_dialog
					text = qs(0x9bc5dae4)
				}
			]
		}
		return
	endif
	destroy_loading_screen
	generic_event_choose \{state = uistate_select_song_section}
endscript

script practice_error_loading_destroy_dialog 
	destroy_dialog_box
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'songlist'}
		generic_event_back \{state = uistate_songlist}
	else
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

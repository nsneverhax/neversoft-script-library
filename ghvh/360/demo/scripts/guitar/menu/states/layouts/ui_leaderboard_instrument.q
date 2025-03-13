
script ui_create_leaderboard_instrument 
	make_generic_menu {
		screen = guitarist
		title = qs(0x8694014b)
		exclusive_device = ($primary_controller)
	}
	add_generic_menu_text_item \{text = qs(0x9504b94a)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'guitar'
		}}
	add_generic_menu_text_item \{text = qs(0x7d4f9214)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'backup'
		}}
	add_generic_menu_text_item \{text = qs(0x388cd3db)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'drums'
		}}
	add_generic_menu_text_item \{text = qs(0x1b9f6f84)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'mic'
		}}
	add_generic_menu_text_item \{text = qs(0xdabf99c0)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'band'
		}}
	menu_finish
	change \{band_mode_mode = none}
endscript

script ui_destroy_leaderboard_instrument 
	generic_ui_destroy
endscript

script ui_leaderboard_instrument_select 
	if (<instrument> = 'band')
		change \{game_mode = p4_quickplay}
		change \{band_mode_mode = quickplay}
	else
		change \{game_mode = p1_quickplay}
		switch (<instrument>)
			case 'guitar'
			setplayerinfo \{1
				part = guitar}
			case 'backup'
			setplayerinfo \{1
				part = bass}
			case 'drums'
			setplayerinfo \{1
				part = drum}
			case 'mic'
			setplayerinfo \{1
				part = vocals}
		endswitch
		change \{band_mode_mode = none}
	endif
	formattext checksumname = instrument_checksum '%i' i = <instrument>
	change current_leaderboard_instrument = <instrument_checksum>
	generic_event_choose \{state = uistate_setlist
		data = {
			from_leaderboard = 1
		}}
endscript

script ui_leaderboard_instrument_anim_in 
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'backstage'
		}}
	menu_transition_in \{menu = generic_menu
		anim_type = zoom_blur}
endscript

script ui_leaderboard_instrument_anim_out 
	menu_transition_out \{menu = generic_menu
		anim_type = zoom_blur}
endscript

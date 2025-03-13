
script ui_create_options_progression 
	spawnscriptnow \{play_cameracut
		params = {
			prefix = 'cameras_no_band'
		}}
	createscreenelement \{parent = root_window
		id = 0x8f9a261d
		type = descinterface
		desc = 'options_menu'
		title_text = qs(0xeb003ba8)
		0xf75cb82a = false
		arrows_alpha = 0}
	if NOT 0x8f9a261d :desc_resolvealias \{name = 0xa39f6109
			param = 0xd27b45a1}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	assignalias id = <0xd27b45a1> alias = current_menu
	current_menu :settags \{smooth_morph_time = 0.1}
	current_menu :se_setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	get_savegame_from_controller controller = ($primary_controller)
	if NOT savegamegetprogression savegame = <savegame>
		<progression> = 0
	endif
	<slot> = 0
	begin
	formattext checksumname = field 'progression_header%d' d = <slot> addtostringlookup = true
	getglobaltags savegame = <savegame> <field>
	printstruct <...>
	if (<slot> = <progression>)
		formattext textname = helper_text qs(0xad8bd77c) a = <stars>
		add_generic_barrel_menu_icon_item {
			icon = data_settings_checkmark
			text = <progression_name>
			additional_focus_script = options_progression_setup_helpers
			additional_focus_params = {savegame = <savegame> slot = <slot>}
			helper_text = <helper_text>
			parent = current_menu
		}
	else
		if (<progression_in_use> = 0)
			add_generic_barrel_menu_text_item {
				pad_choose_script = options_progression_show_new_progression_warning
				pad_choose_params = {savegame = <savegame> slot = <slot>}
				text = <progression_name>
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> slot = <slot>}
				helper_text = qs(0x77e921f9)
				parent = current_menu
			}
		else
			formattext textname = helper_text qs(0xad8bd77c) a = <stars>
			add_generic_barrel_menu_text_item {
				pad_choose_script = options_progression_show_change_progression_warning
				pad_choose_params = {savegame = <savegame> slot = <slot>}
				pad_square_script = options_progression_show_delete_progression_warning
				pad_square_params = {savegame = <savegame> slot = <slot>}
				text = <progression_name>
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> slot = <slot>}
				helper_text = <helper_text>
				parent = current_menu
			}
		endif
	endif
	<slot> = (<slot> + 1)
	repeat $num_savegame_progressions
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_progression 
	clean_up_user_control_helpers
	if screenelementexists \{id = 0x8f9a261d}
		destroyscreenelement \{id = 0x8f9a261d}
	endif
endscript

script options_progression_setup_helpers 
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	if NOT savegamegetprogression savegame = <savegame>
		<progression> = 0
	endif
	formattext checksumname = field 'progression_header%d' d = <slot> addtostringlookup = true
	getglobaltags savegame = <savegame> <field>
	if (<slot> != <progression>)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<slot> != <progression>)
		if (<progression_in_use> = 1)
			add_user_control_helper \{text = qs(0x271a1633)
				button = blue
				z = 100000}
		endif
	endif
	getsingletag \{helper_text}
	if gotparam \{helper_text}
		0x8f9a261d :se_setprops helper_text_text = <helper_text>
	endif
endscript

script options_progression_create_new_progression \{default_name = qs(0x00000000)
		event = menu_change}
	removeparameter \{text}
	ui_event event = <event> data = {state = uistate_edit_name char_limit = 18 default_name = <default_name> title = qs(0x17f49e18) device_num = ($primary_controller) accept_script = options_progression_save_new_progression accept_params = {<...>} no_show_history = <no_show_history>}
endscript

script options_progression_is_name_unique 
	requireparams \{[
			name
			savegame
		]
		all}
	i = 0
	begin
	if (<i> != <slot>)
		formattext checksumname = field 'progression_header%d' d = <i> addtostringlookup = true
		getglobaltags savegame = <savegame> <field>
		if (<progression_in_use> = 1)
			if (<progression_name> = <name>)
				return \{false}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($num_savegame_progressions)
	return \{true}
endscript

script options_progression_save_new_progression 
	if (<text> = qs(0x00000000))
		soundevent \{event = ui_sfx_negative_select}
		options_progression_show_blank_progression_warning <...>
		return
	endif
	if NOT options_progression_is_name_unique name = <text> savegame = <savegame> slot = <slot>
		soundevent \{event = ui_sfx_negative_select}
		options_progression_show_nonunique_progression_warning <...>
		return
	endif
	soundevent \{event = enter_band_name_finish}
	options_progression_set_savegame_progression <...>
endscript

script options_progression_return_from_save_instrument_warning 
	options_progression_create_new_progression <...> default_name = <text> event = menu_replace
endscript

script options_progression_set_savegame_progression 
	savegamesetprogression savegame = <savegame> progression = <slot>
	formattext checksumname = field 'progression_header%d' d = <slot> addtostringlookup = true
	getglobaltags <field> savegame = <savegame>
	if (<progression_in_use> = 0)
		setglobaltags savegame = <savegame> <field> params = {progression_name = <text> progression_in_use = 1}
		options_progression_update_venue
		ui_memcard_autosave_replace event = menu_back state = uistate_options_progression data = {savegame = <savegame>}
	else
		options_progression_update_venue
		generic_event_back
	endif
endscript

script options_progression_reset_savegame_progression 
	if savegamegetprogression savegame = <savegame>
		lockglobaltags \{off}
		lockglobaltags \{freeplay_check_off}
		reset_progression_slot savegame = <savegame> slot = <slot> globaltag_checksum = dummy
		lockglobaltags \{freeplay_check_on}
		lockglobaltags
		savegamesetprogression savegame = <savegame> progression = <progression>
		options_progression_update_venue
		ui_memcard_autosave_replace event = menu_back state = uistate_options_progression data = {savegame = <savegame>}
	else
		options_progression_update_venue
		generic_event_back
	endif
endscript

script options_progression_update_venue 
	quickplay_choose_random_venue
	getpakmancurrent \{map = zones}
	if gotparam \{pak}
		if NOT structurecontains \{structure = $levelzones
				$current_level}
			scriptassert \{'No level named %s, check LevelZones in venuelist.q for available levels'
				s = $current_level}
		endif
		if NOT (<pak> = (($levelzones.$current_level).zone))
			stoprendering
			create_loading_screen
			crowd_system_deinit
			wait \{4
				gameframes}
			venue_system_init
			wait \{4
				gameframes}
			crowd_system_init
			wait \{4
				gameframes}
			destroy_loading_screen
			startrendering
		endif
		play_cameracut \{prefix = 'cameras_no_band'}
	endif
endscript

script options_progression_show_change_progression_warning 
	formattext checksumname = field 'progression_header%d' d = <slot> addtostringlookup = true
	getglobaltags savegame = <savegame> <field>
	formattext {
		textname = message
		qs(0xdd77a11c)
		s = <progression_name>
	}
	ui_event event = menu_change data = {state = uistate_options_change_progression_warning savegame = <savegame> slot = <slot> message = <message>}
endscript

script options_progression_show_delete_progression_warning 
	formattext checksumname = field 'progression_header%d' d = <slot> addtostringlookup = true
	getglobaltags savegame = <savegame> <field>
	formattext {
		textname = message
		qs(0xcc25acf4)
		s = <progression_name>
	}
	ui_event event = menu_change data = {state = uistate_options_change_progression_warning savegame = <savegame> slot = <slot> is_reset = 1 message = <message> progression_name = <progression_name>}
endscript

script options_progression_show_new_progression_warning 
	formattext \{textname = message
		qs(0x1b188377)}
	ui_event event = menu_change data = {state = uistate_options_change_progression_warning savegame = <savegame> slot = <slot> create_new = 1 message = <message>}
endscript

script options_progression_show_nonunique_progression_warning 
	ui_event_wait event = menu_replace data = {
		state = uistate_generic_dialog_box
		template = continue
		heading_text = qs(0xb278de63)
		body_text = qs(0xe029feb1)
		confirm_func = options_progression_return_from_save_instrument_warning
		confirm_func_params = {<...>}
	}
endscript

script options_progression_show_blank_progression_warning 
	ui_event_wait event = menu_replace data = {
		state = uistate_generic_dialog_box
		template = continue
		heading_text = qs(0xda16dee3)
		body_text = qs(0xbaee1d38)
		confirm_func = options_progression_return_from_save_instrument_warning
		confirm_func_params = {<...>}
	}
endscript


script ui_create_options_progression 
	make_generic_barrel_menu {
		texture = tv_clouds
		max_expansions = ($num_savegame_progressions)
	}
	get_savegame_from_controller controller = ($primary_controller)
	if NOT savegamegetprogression savegame = <savegame>
		<Progression> = 0
	endif
	<slot> = 0
	begin
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	printstruct <...>
	if (<slot> = <Progression>)
		formatText TextName = helper_text qs(0xad8bd77c) a = <stars>
		add_generic_barrel_menu_icon_item {
			icon = data_settings_checkmark
			text = <progression_name>
			additional_focus_script = options_progression_setup_helpers
			additional_focus_params = {savegame = <savegame> slot = <slot>}
			helper_text = <helper_text>
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
			}
		else
			formatText TextName = helper_text qs(0xad8bd77c) a = <stars>
			add_generic_barrel_menu_text_item {
				pad_choose_script = options_progression_show_change_progression_warning
				pad_choose_params = {savegame = <savegame> slot = <slot>}
				pad_square_script = options_progression_show_delete_progression_warning
				pad_square_params = {savegame = <savegame> slot = <slot>}
				text = <progression_name>
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> slot = <slot>}
				helper_text = <helper_text>
			}
		endif
	endif
	<slot> = (<slot> + 1)
	repeat $num_savegame_progressions
	if GotParam \{vmenu_id}
		AssignAlias id = <vmenu_id> alias = current_menu
	endif
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_progression 
	clean_up_user_control_helpers
	destroy_generic_barrel_menu
endscript

script options_progression_setup_helpers 
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	if NOT savegamegetprogression savegame = <savegame>
		<Progression> = 0
	endif
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	if (<slot> != <Progression>)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<slot> != <Progression>)
		if (<progression_in_use> = 1)
			add_user_control_helper \{text = qs(0x271a1633)
				button = blue
				z = 100000}
		endif
	endif
endscript

script options_progression_create_new_progression \{default_name = qs(0x00000000)
		event = menu_change}
	RemoveParameter \{text}
	ui_event event = <event> data = {state = uistate_edit_name char_limit = 18 default_name = <default_name> title = qs(0x17f49e18) device_num = ($primary_controller) accept_script = options_progression_save_new_progression accept_params = {<...>} no_show_history = <no_show_history>}
endscript

script options_progression_is_name_unique 
	RequireParams \{[
			Name
			savegame
		]
		all}
	i = 0
	begin
	if (<i> != <slot>)
		formatText checksumName = Field 'progression_header%d' d = <i> AddToStringLookup = true
		GetGlobalTags savegame = <savegame> <Field>
		if (<progression_in_use> = 1)
			if (<progression_name> = <Name>)
				return \{FALSE}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($num_savegame_progressions)
	return \{true}
endscript

script options_progression_save_new_progression 
	if (<text> = qs(0x00000000))
		SoundEvent \{event = ui_sfx_negative_select}
		options_progression_show_blank_progression_warning <...>
		return
	endif
	if NOT options_progression_is_name_unique Name = <text> savegame = <savegame> slot = <slot>
		SoundEvent \{event = ui_sfx_negative_select}
		options_progression_show_nonunique_progression_warning <...>
		return
	endif
	SoundEvent \{event = enter_band_name_finish}
	options_progression_set_savegame_progression <...>
endscript

script options_progression_return_from_save_instrument_warning 
	options_progression_create_new_progression <...> default_name = <text> event = menu_replace
endscript

script options_progression_set_savegame_progression 
	savegamesetprogression savegame = <savegame> Progression = <slot>
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	GetGlobalTags <Field> savegame = <savegame>
	if (<progression_in_use> = 0)
		SetGlobalTags savegame = <savegame> <Field> params = {progression_name = <text> progression_in_use = 1}
		options_progression_update_venue
		ui_memcard_autosave_replace event = menu_back state = uistate_options_progression data = {savegame = <savegame>}
	else
		options_progression_update_venue
		generic_event_back
	endif
endscript

script options_progression_reset_savegame_progression 
	if savegamegetprogression savegame = <savegame>
		lockglobaltags \{OFF}
		lockglobaltags \{freeplay_check_off}
		reset_progression_slot savegame = <savegame> slot = <slot> globaltag_checksum = dummy
		lockglobaltags \{freeplay_check_on}
		lockglobaltags
		savegamesetprogression savegame = <savegame> Progression = <Progression>
		options_progression_update_venue
		ui_memcard_autosave_replace event = menu_back state = uistate_options_progression data = {savegame = <savegame>}
	else
		options_progression_update_venue
		generic_event_back
	endif
endscript

script options_progression_update_venue 
	quickplay_choose_random_venue
	GetPakManCurrent \{map = zones}
	if GotParam \{pak}
		if NOT StructureContains \{structure = $LevelZones
				$current_level}
			ScriptAssert \{'No level named %s, check LevelZones in venuelist.q for available levels'
				s = $current_level}
		endif
		if NOT (<pak> = (($LevelZones.$current_level).zone))
			StopRendering
			create_loading_screen
			crowd_system_deinit
			Wait \{4
				gameframes}
			venue_system_init
			Wait \{4
				gameframes}
			crowd_system_init
			Wait \{4
				gameframes}
			destroy_loading_screen
			StartRendering
		endif
	endif
endscript

script options_progression_show_change_progression_warning 
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	formatText {
		TextName = message
		qs(0xdd77a11c)
		s = <progression_name>
	}
	ui_event event = menu_change data = {state = uistate_options_change_progression_warning savegame = <savegame> slot = <slot> message = <message>}
endscript

script options_progression_show_delete_progression_warning 
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	formatText {
		TextName = message
		qs(0xcc25acf4)
		s = <progression_name>
	}
	ui_event event = menu_change data = {state = uistate_options_change_progression_warning savegame = <savegame> slot = <slot> is_reset = 1 message = <message> progression_name = <progression_name>}
endscript

script options_progression_show_new_progression_warning 
	formatText \{TextName = message
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

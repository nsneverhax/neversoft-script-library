
script ui_create_options_progression 
	spawnscriptnow \{play_cameracut
		params = {
			prefix = 'cameras_no_band'
		}}
	CreateScreenElement \{parent = root_window
		id = options_progression_menu
		type = DescInterface
		desc = 'options_menu'
		title_text = qs(0xeb003ba8)
		options_vmenu_loop_view = false
		arrows_alpha = 0}
	if NOT options_progression_menu :Desc_ResolveAlias \{name = alias_options_vmenu
			param = options_vmenu}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <options_vmenu> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :SE_SetProps {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	get_savegame_from_controller controller = ($primary_controller)
	if NOT SaveGameGetProgression savegame = <savegame>
		<Progression> = 0
	endif
	<Slot> = 0
	begin
	FormatText checksumname = Field 'progression_header%d' d = <Slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	printstruct <...>
	if (<Slot> = <Progression>)
		FormatText TextName = helper_text qs(0xad8bd77c) a = <STARS>
		add_generic_barrel_menu_icon_item {
			icon = data_settings_checkmark
			text = <progression_name>
			additional_focus_script = options_progression_setup_helpers
			additional_focus_params = {savegame = <savegame> Slot = <Slot>}
			helper_text = <helper_text>
			parent = current_menu
		}
	else
		if (<progression_in_use> = 0)
			add_generic_barrel_menu_text_item {
				pad_choose_script = options_progression_show_new_progression_warning
				pad_choose_params = {savegame = <savegame> Slot = <Slot>}
				text = <progression_name>
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> Slot = <Slot>}
				helper_text = qs(0x77e921f9)
				parent = current_menu
			}
		else
			FormatText TextName = helper_text qs(0xad8bd77c) a = <STARS>
			add_generic_barrel_menu_text_item {
				pad_choose_script = options_progression_show_change_progression_warning
				pad_choose_params = {savegame = <savegame> Slot = <Slot>}
				pad_square_script = options_progression_show_delete_progression_warning
				pad_square_params = {savegame = <savegame> Slot = <Slot>}
				text = <progression_name>
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> Slot = <Slot>}
				helper_text = <helper_text>
				parent = current_menu
			}
		endif
	endif
	<Slot> = (<Slot> + 1)
	repeat $num_savegame_progressions
	LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_progression 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_progression_menu}
		DestroyScreenElement \{id = options_progression_menu}
	endif
endscript

script options_progression_setup_helpers 
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	if NOT SaveGameGetProgression savegame = <savegame>
		<Progression> = 0
	endif
	FormatText checksumname = Field 'progression_header%d' d = <Slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	if (<Slot> != <Progression>)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<Slot> != <Progression>)
		if (<progression_in_use> = 1)
			add_user_control_helper \{text = qs(0x271a1633)
				button = blue
				z = 100000}
		endif
	endif
	GetSingleTag \{helper_text}
	if GotParam \{helper_text}
		options_progression_menu :SE_SetProps helper_text_text = <helper_text>
	endif
endscript

script options_progression_create_new_progression \{default_name = qs(0x00000000)
		event = menu_change}
	RemoveParameter \{text}
	ui_event event = <event> data = {state = UIstate_edit_name char_limit = 18 default_name = <default_name> Title = qs(0x17f49e18) device_num = ($primary_controller) accept_script = options_progression_save_new_progression accept_params = {<...>} no_show_history = <no_show_history>}
endscript

script options_progression_is_name_unique 
	RequireParams \{[
			name
			savegame
		]
		all}
	i = 0
	begin
	if (<i> != <Slot>)
		FormatText checksumname = Field 'progression_header%d' d = <i> AddToStringLookup = true
		GetGlobalTags savegame = <savegame> <Field>
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
		SoundEvent \{event = UI_SFX_Negative_Select}
		options_progression_show_blank_progression_warning <...>
		return
	endif
	if NOT options_progression_is_name_unique name = <text> savegame = <savegame> Slot = <Slot>
		SoundEvent \{event = UI_SFX_Negative_Select}
		options_progression_show_nonunique_progression_warning <...>
		return
	endif
	SoundEvent \{event = Enter_Band_Name_Finish}
	options_progression_set_savegame_progression <...>
endscript

script options_progression_return_from_save_instrument_warning 
	options_progression_create_new_progression <...> default_name = <text> event = menu_replace
endscript

script options_progression_set_savegame_progression 
	SaveGameSetProgression savegame = <savegame> Progression = <Slot>
	FormatText checksumname = Field 'progression_header%d' d = <Slot> AddToStringLookup = true
	GetGlobalTags <Field> savegame = <savegame>
	if (<progression_in_use> = 0)
		SetGlobalTags savegame = <savegame> <Field> params = {progression_name = <text> progression_in_use = 1}
		options_progression_update_venue
		ui_memcard_autosave_replace event = menu_back state = UIstate_options_progression data = {savegame = <savegame>}
	else
		options_progression_update_venue
		generic_event_back
	endif
endscript

script options_progression_reset_savegame_progression 
	if SaveGameGetProgression savegame = <savegame>
		LockGlobalTags \{off}
		LockGlobalTags \{freeplay_check_off}
		reset_progression_slot savegame = <savegame> Slot = <Slot> globaltag_checksum = dummy
		LockGlobalTags \{freeplay_check_on}
		LockGlobalTags
		SaveGameSetProgression savegame = <savegame> Progression = <Progression>
		options_progression_update_venue
		ui_memcard_autosave_replace event = menu_back state = UIstate_options_progression data = {savegame = <savegame>}
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
			wait \{4
				gameframes}
			venue_system_init
			wait \{4
				gameframes}
			crowd_system_init
			wait \{4
				gameframes}
			destroy_loading_screen
			StartRendering
		endif
		play_cameracut \{prefix = 'cameras_no_band'}
	endif
endscript

script options_progression_show_change_progression_warning 
	FormatText checksumname = Field 'progression_header%d' d = <Slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	FormatText {
		TextName = message
		qs(0xdd77a11c)
		s = <progression_name>
	}
	ui_event event = menu_change data = {state = UIstate_options_change_progression_warning savegame = <savegame> Slot = <Slot> message = <message>}
endscript

script options_progression_show_delete_progression_warning 
	FormatText checksumname = Field 'progression_header%d' d = <Slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	FormatText {
		TextName = message
		qs(0xcc25acf4)
		s = <progression_name>
	}
	ui_event event = menu_change data = {state = UIstate_options_change_progression_warning savegame = <savegame> Slot = <Slot> is_reset = 1 message = <message> progression_name = <progression_name>}
endscript

script options_progression_show_new_progression_warning 
	FormatText \{TextName = message
		qs(0x1b188377)}
	ui_event event = menu_change data = {state = UIstate_options_change_progression_warning savegame = <savegame> Slot = <Slot> create_new = 1 message = <message>}
endscript

script options_progression_show_nonunique_progression_warning 
	ui_event_wait event = menu_replace data = {
		state = UIstate_generic_dialog_box
		template = continue
		heading_text = qs(0xb278de63)
		body_text = qs(0xe029feb1)
		confirm_func = options_progression_return_from_save_instrument_warning
		confirm_func_params = {<...>}
	}
endscript

script options_progression_show_blank_progression_warning 
	ui_event_wait event = menu_replace data = {
		state = UIstate_generic_dialog_box
		template = continue
		heading_text = qs(0xda16dee3)
		body_text = qs(0xbaee1d38)
		confirm_func = options_progression_return_from_save_instrument_warning
		confirm_func_params = {<...>}
	}
endscript

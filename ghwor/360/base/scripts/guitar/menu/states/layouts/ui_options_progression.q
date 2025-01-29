
script ui_create_options_progression 
	SpawnScriptNow \{play_cameracut
		params = {
			prefix = 'cameras_no_band'
		}}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_progression_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back options_progression_back}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x46df8385)
	}
	attempt_to_add_friend_feed \{parent_id = options_progression_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_progression_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_progression_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_progression_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_progression_menu_id
		}}
	if options_progression_menu_id :desc_resolvealias \{Name = alias_mainmenu_up_arrow}
		<resolved_id> :se_setprops {
			Hide
		}
	endif
	if options_progression_menu_id :desc_resolvealias \{Name = alias_mainmenu_down_arrow}
		<resolved_id> :se_setprops {
			Hide
		}
	endif
	get_savegame_from_controller controller = ($primary_controller)
	if NOT savegamegetprogression savegame = <savegame>
		<Progression> = 0
	endif
	<slot> = 0
	begin
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <Field>
	if (<slot> = <Progression>)
		formatText TextName = helper_text qs(0xad8bd77c) a = <stars>
		mainmenu_setup_option {
			back_script = options_progression_back
			additional_focus_script = options_progression_setup_helpers
			additional_focus_params = {savegame = <savegame> slot = <slot>}
			menu_item_text = <progression_name>
			screen_id = options_progression_menu_id
			helper_text = <helper_text>
			icon = Options_Controller_Check
		}
	else
		if (<progression_in_use> = 0)
			mainmenu_setup_option {
				choose_script = options_progression_show_new_progression_warning
				choose_params = {savegame = <savegame> slot = <slot>}
				back_script = options_progression_back
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> slot = <slot>}
				menu_item_text = <progression_name>
				screen_id = options_progression_menu_id
				helper_text = qs(0x77e921f9)
			}
		else
			formatText TextName = helper_text qs(0xad8bd77c) a = <stars>
			mainmenu_setup_option {
				choose_script = options_progression_show_change_progression_warning
				choose_params = {savegame = <savegame> slot = <slot>}
				back_script = options_progression_back
				additional_focus_script = options_progression_setup_helpers
				additional_focus_params = {savegame = <savegame> slot = <slot>}
				menu_item_text = <progression_name>
				screen_id = options_progression_menu_id
				helper_text = <helper_text>
				icon = Options_Controller_X
			}
			if GotParam \{mainmenu_item_id}
				<event_handlers> = [
					{
						pad_square
						generic_blocking_execute_script
						params = {
							pad_script = options_progression_show_delete_progression_warning
							pad_params = {
								savegame = <savegame>
								slot = <slot>
							}
						}
					}
				]
				<mainmenu_item_id> :se_setprops event_handlers = <event_handlers>
			endif
		endif
	endif
	<slot> = (<slot> + 1)
	repeat $num_savegame_progressions
	main_menu_finalize
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_progression 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_progression_menu_id}
		DestroyScreenElement \{id = options_progression_menu_id}
	endif
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
			z = 100000
			all_buttons}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	if (<slot> != <Progression>)
		if (<progression_in_use> = 1)
			add_user_control_helper \{text = qs(0x271a1633)
				button = blue
				z = 100000
				all_buttons}
		endif
	endif
endscript

script options_progression_create_new_progression \{default_name = qs(0x00000000)
		event = menu_change
		savegame = !i1768515945
		slot = !i1768515945}
	RemoveParameter \{text}
	formatText TextName = text qs(0x431687d5) s = (<slot> + 1)
	options_progression_save_new_progression savegame = <savegame> slot = <slot> text = <text>
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
		ui_sfx \{menustate = Generic
			uitype = negativeselect}
		options_progression_show_blank_progression_warning <...>
		return
	endif
	if NOT options_progression_is_name_unique Name = <text> savegame = <savegame> slot = <slot>
		ui_sfx \{menustate = Generic
			uitype = negativeselect}
		options_progression_show_nonunique_progression_warning <...>
		return
	endif
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
		ui_memcard_autosave_replace event = menu_back state = uistate_options_progression data = {savegame = <savegame>} show_mainmenu_bg = 1
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
		ui_memcard_autosave_replace event = menu_back state = uistate_options_progression data = {savegame = <savegame>} show_mainmenu_bg = 1
	else
		options_progression_update_venue
		generic_event_back
	endif
endscript

script options_progression_update_venue 
	quickplay_choose_random_venue
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
	ui_sfx \{menustate = Generic
		uitype = select}
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

script options_progression_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script ui_options_progression_anim_in 
	mainmenu_animate \{id = options_progression_menu_id}
endscript

script ui_options_progression_anim_out 
	mainmenu_animate \{id = options_progression_menu_id}
endscript

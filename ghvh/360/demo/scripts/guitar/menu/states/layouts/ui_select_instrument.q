
script ui_create_select_instrument 
	ui_select_instrument_continue <...>
endscript

script ui_destroy_select_instrument 
	generic_ui_destroy
	cleanup_frontend_bg
endscript
instrument_list = {
	guitar = {
		text = qs(0x9504b94a)
		text_nl = 'guitar'
	}
	bass = {
		text = qs(0x7d4f9214)
		text_nl = 'bass'
	}
	drum = {
		text = qs(0xcf488ba5)
		text_nl = 'drum'
	}
	vocals = {
		text = qs(0x1b9f6f84)
		text_nl = 'vocals'
	}
	band = {
		text = qs(0xdabf99c0)
		text_nl = 'band'
	}
}

script ui_select_instrument_continue 
	if gotparam \{from_hub}
		title = qs(0x3960109a)
	else
		title = qs(0x8694014b)
	endif
	if gotparam \{from_top_rocker}
		screen = guitarist
	else
		screen = drummer
	endif
	gamemode_getnumplayers
	if (<num_players> = 1)
		clear_exclusive_devices
		add_exclusive_device device = ($primary_controller)
	endif
	if (showbackstage_halfscreen)
		make_generic_menu title = <title>
		add_menu_script = add_generic_menu_text_item
	elseif (gotparam from_top_rocker)
		make_generic_menu title = <title>
		add_menu_script = add_generic_menu_text_item
	else
		create_frontend_bg
		make_menu_frontend screen = <screen> title = <title> spacing_between = -15
		add_menu_script = add_menu_frontend_item
	endif
	allow_guitar = 0
	allow_drum = 0
	allow_vocal = 0
	if gotparam \{from_top_rocker}
		allow_guitar = 1
		allow_drum = 1
		allow_vocal = 1
	endif
	ui_get_controller_parts_allowed controller = ($primary_controller)
	if structurecontains structure = <allowed> guitar
		allow_guitar = 1
	endif
	if structurecontains structure = <allowed> drum
		allow_drum = 1
	endif
	if structurecontains structure = <allowed> vocals
		allow_vocal = 1
	endif
	if (<allow_guitar> = 1)
		<add_menu_script> {
			desc = 'menu_tape_01'
			text = ($band_mode_available_text.instruments [0])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = guitar from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
		<add_menu_script> {
			desc = 'menu_tape_02'
			text = ($band_mode_available_text.instruments [1])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = bass from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		<add_menu_script> {
			desc = 'menu_tape_01'
			text = ($band_mode_available_text.instruments [0])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = guitar controller = ($primary_controller)}
			rgba = (($g_menu_colors).menu_disabled)
		}
		<add_menu_script> {
			desc = 'menu_tape_02'
			text = ($band_mode_available_text.instruments [1])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = bass controller = ($primary_controller)}
			rgba = (($g_menu_colors).menu_disabled)
		}
	endif
	if ((($allow_controller_for_all_instruments) = 1) || (gotparam from_top_rocker))
		if (<allow_drum> = 1)
			<add_menu_script> {
				desc = 'menu_tape_03'
				text = ($band_mode_available_text.instruments [2])
				pad_choose_script = ui_select_instrument_done
				pad_choose_params = {instrument = drum from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
			}
		else
			<add_menu_script> {
				desc = 'menu_tape_03'
				text = ($band_mode_available_text.instruments [2])
				choose_state = uistate_select_instrument_warning
				choose_state_data = {instrument = drum controller = ($primary_controller)}
				rgba = (($g_menu_colors).menu_disabled)
			}
		endif
		if (<allow_vocal> = 1)
			<add_menu_script> {
				desc = 'menu_tape_04'
				text = ($band_mode_available_text.instruments [3])
				pad_choose_script = ui_select_instrument_done
				pad_choose_params = {instrument = vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
			}
		else
			<add_menu_script> {
				desc = 'menu_tape_04'
				text = ($band_mode_available_text.instruments [3])
				pad_choose_script = ui_select_instrument_done
				pad_choose_params = {instrument = vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
				rgba = (($g_menu_colors).menu_disabled)
			}
		endif
	endif
	if gotparam \{from_top_rocker}
		<add_menu_script> {
			desc = 'menu_tape_05'
			text = qs(0xdabf99c0)
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = band from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
	endif
	if (($practice_enabled) = 1)
		launchevent \{type = focus
			target = current_menu}
	elseif NOT gotparam \{old_base_name}
		if NOT (gotparam from_top_rocker)
			initial_focus = 0
			if isguitarcontroller controller = ($primary_controler)
				<initial_focus> = 0
			elseif isdrumcontroller controller = ($primary_controller)
				<initial_focus> = 2
			else
				if (<allow_guitar> = 0)
					if (<allow_drum> = 0)
						<initial_focus> = 3
					else
						<initial_focus> = 2
					endif
				endif
			endif
			launchevent type = focus target = current_menu data = {child_index = (<initial_focus> + 1)}
		endif
	endif
	menu_finish
	unblock_invites
endscript

script select_instrument_anim_in 
	if (showbackstage_halfscreen)
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'backstage'
			}}
		menu_transition_in \{menu = generic_menu
			anim_type = zoom_blur}
	elseif (gotparam from_top_rocker)
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'backstage'
			}}
		menu_transition_in \{menu = generic_menu
			anim_type = zoom_blur}
	else
		menu_transition_in \{menu = current_menu_anchor}
	endif
endscript

script select_instrument_anim_out 
	if (showbackstage_halfscreen)
		menu_transition_out \{menu = generic_menu
			anim_type = zoom_blur}
	elseif ((gotparam from_top_rocker))
		menu_transition_out \{menu = generic_menu
			anim_type = zoom_blur}
	else
		menu_transition_out \{menu = current_menu_anchor}
	endif
endscript
career_last_chosen_part = guitar

script ui_select_instrument_done \{player = 1
		event = menu_change}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
	if gotparam \{from_top_rocker}
		if (<instrument> = band)
			change \{game_mode = p4_quickplay}
		else
			change \{game_mode = p1_quickplay}
		endif
	endif
	if gotparam \{skip}
		clear_exclusive_devices
		add_exclusive_device device = ($primary_controller)
	endif
	if (<instrument> = vocals)
		allow_vocal = 0
		if gotparam \{from_top_rocker}
			allow_vocal = 1
		else
		endif
		ui_get_controller_parts_allowed controller = ($primary_controller)
		if structurecontains structure = <allowed> vocals
			allow_vocal = 1
		endif
		if (<allow_vocal> = 0)
			generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = ($primary_controller)}
			return
		endif
	else
		ui_get_controller_parts_allowed controller = ($primary_controller)
		if NOT gotparam \{from_top_rocker}
			if NOT structurecontains structure = <allowed> <instrument>
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = ($primary_controller)}
			endif
		endif
	endif
	change player1_device = ($primary_controller)
	setplayerinfo <player> part = <instrument>
	change career_last_chosen_part = <instrument>
	setplayerinfo <player> controller = ($primary_controller)
	vocals_distribute_mics
	if ($game_mode = p1_career)
		player_status = player1_status
		get_current_band_info
		getglobaltags <band_info>
		switch <instrument>
			case guitar
			change \{current_progression_flag = career_guitar}
			change structurename = <player_status> part = guitar
			case bass
			change \{current_progression_flag = career_bass}
			change structurename = <player_status> part = bass
			case drum
			change \{current_progression_flag = career_drum}
			change structurename = <player_status> part = drum
			case vocals
			change \{current_progression_flag = career_vocals}
			change structurename = <player_status> part = vocals
		endswitch
		register_new_progression_atoms ($current_progression_flag)
	endif
	if ($practice_enabled)
		vocals_distribute_mics
		generic_event_choose state = uistate_setlist data = {from_top_rocker = <from_top_rocker> no_jamsession}
		return
	endif
	switch ($game_mode)
		case p1_quickplay
		check_for_first_play = 1
		if gotparam \{from_top_rocker}
			if (<from_top_rocker> = 1)
				check_for_first_play = 0
			endif
		endif
		if NOT gotparam \{skip}
			generic_event_choose event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		else
			set_primary_controller device_num = <device_num> event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		endif
		case p2_pro_faceoff
		case p2_battle
		setplayerinfo 1 part = <instrument>
		setplayerinfo 2 part = <instrument>
		generic_event_choose event = <event> state = uistate_select_difficulty
		default
		if gotparam \{from_top_rocker}
			generic_event_choose event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		endif
		if gotparam \{from_hub}
			generic_event_back \{state = uistate_singleplayer_character_hub}
		else
			if NOT gotparam \{skip}
				generic_event_choose event = <event> state = uistate_select_difficulty
			else
				set_primary_controller device_num = <device_num> event = <event> event = <event> state = uistate_select_difficulty
			endif
		endif
	endswitch
endscript

script ui_select_instrument_check_controllers 
	obj_getid
	begin
	ui_get_controller_parts_allowed controller = ($primary_controller)
	<objid> :menu_getselectedindex
	if gotparam \{allowed}
		if structurecontains structure = <allowed> guitar
			if (<selected_index> = 1)
				rgba = (($g_menu_colors).menu_main_focus)
			else
				rgba = (($g_menu_colors).menu_main_unfocus)
			endif
			setscreenelementprops {
				id = {<objid> child = 1}
				rgba = <rgba>
				event_handlers = [
					{pad_choose ui_select_instrument_done params = {instrument = guitar from_hub = <from_hub> from_top_rocker = <from_top_rocker>}}
				]
				replace_handlers
			}
			if (<selected_index> = 2)
				rgba = (($g_menu_colors).menu_main_focus)
			else
				rgba = (($g_menu_colors).menu_main_unfocus)
			endif
			setscreenelementprops {
				id = {<objid> child = 2}
				rgba = <rgba>
				event_handlers = [
					{pad_choose ui_select_instrument_done params = {instrument = bass from_hub = <from_hub> from_top_rocker = <from_top_rocker>}}
				]
				replace_handlers
			}
		else
			setscreenelementprops {
				id = {<objid> child = 1}
				rgba = (($g_menu_colors).menu_disabled)
				event_handlers = [
					{pad_choose generic_event_choose params = {state = uistate_select_instrument_warning data = {instrument = guitar controller = ($primary_controller)}}}
				]
				replace_handlers
			}
			setscreenelementprops {
				id = {<objid> child = 2}
				rgba = (($g_menu_colors).menu_disabled)
				event_handlers = [
					{pad_choose generic_event_choose params = {state = uistate_select_instrument_warning data = {instrument = guitar controller = ($primary_controller)}}}
				]
				replace_handlers
			}
		endif
		if (($allow_controller_for_all_instruments) = 1)
			if structurecontains structure = <allowed> drum
				if (<selected_index> = 3)
					rgba = (($g_menu_colors).menu_main_focus)
				else
					rgba = (($g_menu_colors).menu_main_unfocus)
				endif
				setscreenelementprops {
					id = {<objid> child = 3}
					rgba = <rgba>
					event_handlers = [
						{pad_choose ui_select_instrument_done params = {instrument = drum from_hub = <from_hub> from_top_rocker = <from_top_rocker>}}
					]
					replace_handlers
				}
			else
				setscreenelementprops {
					id = {<objid> child = 3}
					rgba = (($g_menu_colors).menu_disabled)
					event_handlers = [
						{pad_choose generic_event_choose params = {state = uistate_select_instrument_warning data = {instrument = drum controller = ($primary_controller)}}}
					]
					replace_handlers
				}
			endif
			if structurecontains structure = <allowed> vocals
				if (<selected_index> = 4)
					rgba = (($g_menu_colors).menu_main_focus)
				else
					rgba = (($g_menu_colors).menu_main_unfocus)
				endif
				setscreenelementprops {
					id = {<objid> child = 4}
					rgba = <rgba>
				}
			else
				setscreenelementprops {
					id = {<objid> child = 4}
					rgba = (($g_menu_colors).menu_disabled)
				}
			endif
		endif
	endif
	removeparameter \{allowed}
	wait \{1
		gameframe}
	repeat
endscript

script select_instrument_update_menu_entry 
	requiredparams \{[
			instrument
			allowed
			menu_id
		]
		all}
	<menu_id> :menu_getselectedindex
	if structurecontains structure = <allowed> <instrument>
	else
	endif
endscript

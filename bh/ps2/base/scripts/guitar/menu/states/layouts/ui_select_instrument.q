
script ui_create_select_instrument 
	ui_select_instrument_continue <...>
endscript

script ui_destroy_select_instrument 
	KillSpawnedScript \{Name = career_menu_jaw_anim}
	0xafd96096
	generic_ui_destroy
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
	Band = {
		text = qs(0xdabf99c0)
		text_nl = 'band'
	}
}

script ui_select_instrument_continue 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if GotParam \{from_hub}
		title = qs(0xbeabd766)
	else
		title = qs(0x8694014b)
	endif
	gamemode_getnumplayers
	if (<num_players> = 1)
		clear_exclusive_devices
		add_exclusive_device device = ($primary_controller)
	endif
	0x5e1a3a04 title = <title> pad_back_script = 0x462881bd
	allow_guitar = 0
	allow_drum = 0
	allow_vocal = 0
	if GotParam \{from_top_rocker}
		allow_guitar = 1
		allow_drum = 1
		allow_vocal = 1
	endif
	ui_get_controller_parts_allowed controller = ($primary_controller)
	if StructureContains structure = <allowed> guitar
		allow_guitar = 1
	endif
	if StructureContains structure = <allowed> drum
		allow_drum = 1
	endif
	if StructureContains structure = <allowed> vocals
		allow_vocal = 1
	endif
	if (<allow_guitar> = 1)
		0x9d0992fe {
			text = ($band_mode_available_text.instruments [0])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = guitar from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
		0x9d0992fe {
			text = ($band_mode_available_text.instruments [1])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = bass from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		0x9d0992fe {
			text = ($band_mode_available_text.instruments [0])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = guitar controller = ($primary_controller)}
			rgba = [140 140 140 255]
		}
		0x9d0992fe {
			text = ($band_mode_available_text.instruments [1])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = bass controller = ($primary_controller)}
			rgba = [140 140 140 255]
		}
	endif
	if ((($allow_controller_for_all_instruments) = 1) || (GotParam from_top_rocker))
		if (<allow_drum> = 1)
			0x9d0992fe {
				text = ($band_mode_available_text.instruments [2])
				pad_choose_script = ui_select_instrument_done
				pad_choose_params = {instrument = drum from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
			}
		else
			0x9d0992fe {
				text = ($band_mode_available_text.instruments [2])
				choose_state = uistate_select_instrument_warning
				choose_state_data = {instrument = drum controller = ($primary_controller)}
				rgba = [140 140 140 255]
			}
		endif
		if (<allow_vocal> = 1)
			0x9d0992fe {
				text = ($band_mode_available_text.instruments [3])
				pad_choose_script = ui_select_instrument_done
				pad_choose_params = {instrument = vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
			}
		else
			0x9d0992fe {
				text = ($band_mode_available_text.instruments [3])
				pad_choose_script = ui_select_instrument_done
				pad_choose_params = {instrument = vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
				rgba = [140 140 140 255]
			}
		endif
	endif
	if GotParam \{from_top_rocker}
		0x9d0992fe {
			text = qs(0xdabf99c0)
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = Band from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	endif
	if NOT GotParam \{old_base_name}
		if NOT GotParam \{from_top_rocker}
			initial_focus = 0
			if IsGuitarController controller = ($primary_controler)
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
			LaunchEvent Type = focus target = current_menu data = {child_index = (<initial_focus>)}
		endif
	endif
	menu_finish
	0x87679bf6 \{z_offset = 18.0}
	destroy_loading_screen
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script select_instrument_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script select_instrument_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript
career_last_chosen_part = guitar

script ui_select_instrument_done \{Player = 1
		event = menu_change}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if GotParam \{from_top_rocker}
		if (<instrument> = Band)
			Change \{game_mode = p1_quickplay}
		else
			Change \{game_mode = p1_quickplay}
		endif
	endif
	if (<instrument> = vocals)
		allow_vocal = 0
		if GotParam \{from_top_rocker}
			allow_vocal = 1
		else
		endif
		ui_get_controller_parts_allowed controller = ($primary_controller)
		if StructureContains structure = <allowed> vocals
			allow_vocal = 1
		endif
		if (<allow_vocal> = 0)
			generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = ($primary_controller)}
			return
		endif
	else
		ui_get_controller_parts_allowed controller = ($primary_controller)
		if NOT GotParam \{from_top_rocker}
			if NOT StructureContains structure = <allowed> <instrument>
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = ($primary_controller)}
			endif
		endif
	endif
	Change player1_device = ($primary_controller)
	setplayerinfo <Player> part = <instrument>
	Change career_last_chosen_part = <instrument>
	setplayerinfo <Player> controller = ($primary_controller)
	if GotParam \{from_top_rocker}
		get_controller_part controller = ($primary_controller)
		Change 0x50e507a2 = <controller_part>
	else
		Change \{0x50e507a2 = None}
	endif
	vocals_distribute_mics
	if ($0xc7e670d7 = 1)
		generic_event_choose \{state = uistate_select_difficulty}
	endif
	if ($game_mode = gh4_p1_career)
		player_status = player1_status
		get_current_band_info
		GetGlobalTags <band_info>
		switch <instrument>
			case guitar
			Change \{current_progression_flag = career_guitar}
			Change structurename = <player_status> part = guitar
			case bass
			Change \{current_progression_flag = career_bass}
			Change structurename = <player_status> part = bass
			case drum
			Change \{current_progression_flag = career_drum}
			Change structurename = <player_status> part = drum
			case vocals
			Change \{current_progression_flag = career_vocals}
			Change structurename = <player_status> part = vocals
		endswitch
		register_new_progression_atoms ($current_progression_flag)
	endif
	if ($practice_enabled)
		vocals_distribute_mics
		generic_event_choose \{state = uistate_setlist
			data = {
				no_jamsession
			}}
		return
	endif
	switch ($game_mode)
		case p1_quickplay
		if NOT GotParam \{skip}
			generic_event_choose event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		else
			set_primary_controller device_num = <device_num> event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		endif
		case p2_pro_faceoff
		setplayerinfo 1 part = <instrument>
		setplayerinfo 2 part = <instrument>
		generic_event_choose event = <event> state = uistate_select_difficulty
		default
		if GotParam \{from_top_rocker}
			generic_event_choose event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		endif
		if GotParam \{from_hub}
			generic_event_back \{state = uistate_singleplayer_character_hub}
		else
			if NOT GotParam \{skip}
				generic_event_choose event = <event> state = uistate_select_difficulty
			else
				set_primary_controller device_num = <device_num> event = <event> event = <event> state = uistate_select_difficulty
			endif
		endif
	endswitch
endscript

script 0x462881bd 
	Change \{top_rockers_enabled = 0}
	generic_event_back
endscript


script ui_create_select_instrument 
	ui_select_instrument_continue <...>
endscript

script ui_destroy_select_instrument 
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

script pollformic 
	ui_get_controller_parts_allowed controller = ($primary_controller)
	old_allowed = <allowed>
	begin
	ui_get_controller_parts_allowed controller = ($primary_controller)
	if NOT comparestructs struct1 = <allowed> struct2 = <old_allowed>
		ui_event \{event = menu_refresh}
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script ui_select_instrument_continue 
	make_generic_menu {
		title = <title>
	}
	if GotParam \{from_hub}
		title = qs(0xbeabd766)
		make_generic_menu {
			title = <title>
		}
	else
		title = qs(0x8694014b)
		make_generic_menu {
			title = <title>
			pad_back_script = go_back_to_main_menu
		}
	endif
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
	printstruct <allowed>
	if (<allow_guitar> = 1)
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [0])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = guitar from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [1])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = bass from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [0])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = guitar}
			rgba = [50 44 35 255]
		}
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [1])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = bass}
			rgba = [50 44 35 255]
		}
	endif
	if (<allow_drum> = 1)
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [2])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = drum from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [2])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = drum}
			rgba = [50 44 35 255]
		}
	endif
	if (<allow_vocal> = 1)
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [3])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		add_generic_menu_text_item {
			text = ($band_mode_available_text.instruments [3])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
			rgba = [50 44 35 255]
		}
	endif
	if GotParam \{from_top_rocker}
		add_generic_menu_text_item {
			text = qs(0xdabf99c0)
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = Band from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		current_menu :obj_spawnscript ui_select_instrument_check_controllers params = {from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
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
			LaunchEvent Type = focus target = current_menu data = {child_index = <initial_focus>}
		endif
	endif
	menu_finish
	current_menu :obj_spawnscript \{pollformic}
endscript
career_last_chosen_part = guitar

script ui_select_instrument_done \{Player = 1
		event = menu_change}
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
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
			printf \{qs(0x6f0cd253)}
			generic_event_choose \{state = uistate_select_instrument_warning
				data = {
					instrument = vocals
				}}
			return
		endif
	endif
	setplayerinfo 1 device = ($primary_controller)
	setplayerinfo <Player> part = <instrument>
	Change career_last_chosen_part = <instrument>
	setplayerinfo <Player> controller = ($primary_controller)
	vocals_distribute_mics
	if ($game_mode = gh4_p1_career)
		switch <instrument>
			case guitar
			Change \{current_progression_flag = career_guitar}
			setplayerinfo \{1
				part = guitar}
			case bass
			Change \{current_progression_flag = career_bass}
			setplayerinfo \{1
				part = bass}
			case drum
			Change \{current_progression_flag = career_drum}
			setplayerinfo \{1
				part = drum}
			case vocals
			Change \{current_progression_flag = career_vocals}
			setplayerinfo \{1
				part = vocals}
		endswitch
	endif
	switch ($game_mode)
		case p1_quickplay
		generic_event_choose event = <event> state = uistate_songlist data = {from_top_rocker = <from_top_rocker>}
		case p2_pro_faceoff
		case p2_roadie_battle
		setplayerinfo 1 part = <instrument>
		setplayerinfo 2 part = <instrument>
		generic_event_choose event = <event> state = uistate_select_difficulty
		default
		if GotParam \{from_hub}
			generic_event_back \{state = uistate_singleplayer_character_hub}
		else
			generic_event_choose event = <event> state = uistate_select_difficulty
		endif
	endswitch
endscript

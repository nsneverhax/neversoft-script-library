jam_highway_recording_mode = 0
jam_highway_song_length = 600000
jam_control_bar_offset = (25.0, 98.0)
jam_control_selected = 0
jam_highway_playing = 0
jam_highway_recording = 0
jam_highway_step_recording = 0
jam_current_recording_player = 1
jam_advanced_record = 0

script jam_recording_check_disconnect 
	<practice> = 0
	if ($game_mode = practice)
		<practice> = 1
	endif
	if NOT CD
		if ($allow_controller_for_all_instruments = 1)
			return
		endif
	endif
	GetControllerType controller = ($primary_controller)
	begin
	prev_controller_type = <controller_type>
	GetControllerType controller = ($primary_controller)
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	data = {practice = <practice>}
	if GotParam \{recording_studio}
		data = {jamroom_new_functionallity practice = <practice>}
	endif
	if NOT (<is_active_controller> = 1)
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	if NOT ((<controller_type> = guitar) || (<controller_type> = Drum))
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	if NOT (<controller_type> = <prev_controller_type>)
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	wait \{5
		gameframes}
	repeat
endscript

script create_jam_recording_menu \{song = dangerzone
		editing = 0
		back_to_jam_band = 1}
	printf channel = jam_mode qs(0xc812d4f6) s = <editing>
	Change \{select_shift = 0}
	Change \{debug_show_analog_options = 0}
	Change \{target_jam_camera_prop = jam_advanced_recording}
	jam_camera_wait
	Change \{jam_advanced_record = 1}
	destroy_bg_viewport
	setup_bg_viewport
	if GotParam \{current_instrument}
		Change jam_current_track = <current_instrument>
		SetPlayerInfo <player> jam_instrument = <current_instrument>
	endif
	GetPlayerInfo <player> controller
	if isdrumcontroller controller = <controller>
		Change \{jam_current_track = 3}
		SetPlayerInfo <player> part = Drum
		SetPlayerInfo <player> jam_instrument = ($jam_current_track)
	else
		SetPlayerInfo <player> part = guitar
	endif
	Menu_Music_Off
	Change \{jam_control_selected = 0}
	Change \{jam_copy_bound_low = 0}
	Change \{jam_copy_bound_high = 0}
	Change \{jam_loop_bound_low = -1}
	Change \{jam_loop_bound_high = -1}
	musicstudio_reinit_menu_sounds
	CreateScreenElement \{parent = root_window
		id = jam_studio_element
		type = DescInterface
		desc = 'adv_record'}
	killspawnedscript \{name = menu_jam_screensaver_loading}
	jam_studio_element :Obj_SpawnScript \{jam_recording_check_disconnect}
	<song> = jamsession
	Change \{jam_highway_recording_mode = 1}
	jam_setup_song editing = <editing> advanced_record = 1
	Change \{jam_current_quantize = 4}
	Change \{no_marker_snap = 0}
	Change \{no_precise_snap = 0}
	jam_studio_element :SetProps snap_text = ($jam_quantize [($jam_current_quantize)].name_text)
	if IsPS3
		if jam_studio_element :Desc_ResolveAlias \{name = alias_d_pad}
			<resolved_id> :SetProps texture = d_pad_ps3
		endif
	endif
	jam_studio_hide_tilt_meter
	if NOT (<editing> = 1)
		Change \{jam_selected_song = qs(0xd9070aee)}
		Change \{jam_current_bpm = 120}
		song_prefix = 'editable'
		FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
		suffix = '_size'
		AppendSuffixToChecksum base = <fretbar_array> SuffixString = <suffix>
		<fretbar_size> = <appended_id>
		Change globalname = <fretbar_size> newValue = 0
		musicstudio_create_fretbars
	endif
	FormatText \{TextName = title_text
		qs(0x90f34c93)
		s = $jam_selected_song
		b = $jam_current_bpm}
	jam_studio_element :SetProps SongTitleInfo_text = <title_text>
	create_jam_control_bar back_to_jam_band = <back_to_jam_band>
	AssignAlias \{id = jam_control_container
		alias = current_menu}
	LaunchEvent \{type = focus
		target = current_menu}
	create_studio_now_bar
	spawnscriptnow \{create_jam_multiple_highways
		id = jam_recording_spawns
		params = {
			song = editable
		}}
	spawnscriptnow \{jam_update_count
		id = jam_recording_spawns}
	reset_song_time \{starttime = 0}
	Change \{jam_highway_play_time = 0}
	Change \{jam_highway_playing = 0}
	CreateScreenElement \{type = ContainerElement
		id = jam_pause_container
		parent = jam_studio_element
		Pos = (329.0, 90.0)}
	jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	jam_recording_add_user_control_helpers
	if (<editing> = 1)
		FormatText \{TextName = title_text
			qs(0x90f34c93)
			s = $jam_selected_song
			b = $jam_current_bpm}
		killspawnedscript \{name = jam_highway_select_quantize}
		spawnscriptnow \{jam_highway_select_quantize
			id = jam_recording_spawns}
		spawnscriptnow \{id = jam_recording_spawns
			jam_ghmix_show_scale_reference}
	else
		FormatText TextName = title_text qs(0xc64bb950) b = $jam_current_bpm c = ($jam_tracks [$jam_current_track].name_text)
		spawnscriptnow \{id = jam_recording_spawns
			show_change_bpm}
	endif
	if GotParam \{ghmix_persistant_settings}
		Change jam_highway_play_time = (<ghmix_persistant_settings>.cur_playtime)
		Change jam_highway_play_line_pos = (<ghmix_persistant_settings>.cur_playline_pos)
		new_pos = ($jam_highway_play_line_pos - (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second))
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_play_time + $jam_highway_start_low_bound)
		<new_high_bound> = ($jam_highway_play_time + $jam_highway_start_high_bound)
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		Change jam_highway_low_bound = <new_low_bound>
		Change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		Change jam_lead_octave_range = (<ghmix_persistant_settings>.cur_lead_octave)
		Change jam_melody_octave_range = (<ghmix_persistant_settings>.cur_melody_octave)
		Change jam_rhythm_chord_type = (<ghmix_persistant_settings>.cur_rhythm_chords)
		Change jam_control_selected = (<ghmix_persistant_settings>.cur_control)
		Change jam_current_quantize = (<ghmix_persistant_settings>.cur_quantize)
		jam_studio_element :SetProps snap_text = ($jam_quantize [($jam_current_quantize)].name_text)
		Change jam_loop_bound_low = (<ghmix_persistant_settings>.cur_loop_low)
		Change jam_loop_bound_high = (<ghmix_persistant_settings>.cur_loop_high)
	endif
	spawnscriptnow \{jam_recording_create_metaview
		id = jam_recording_spawns}
	broadcastevent \{type = ghmix_load_complete}
endscript

script jam_recording_update_note 
	<player> = ($jam_current_recording_player)
	GetPlayerInfo <player> controller
	<last_instrument> = -1
	begin
	GetPlayerInfo <player> jam_instrument
	if NOT (<last_instrument> = <jam_instrument>)
		GetPlayerInfo <player> jam_instrument
		switch (<jam_instrument>)
			case 0
			<note_func> = jam_input_rhythm_get_current_note
			case 1
			<note_func> = jam_input_lead_get_current_note
			case 2
			<note_func> = jam_input_bass_get_current_note
			case 3
			return
			case 4
			<note_func> = jam_input_melody_get_current_note
		endswitch
		<jam_instrument> = <last_instrument>
	endif
	GetHeldPattern controller = <controller> player = <player>
	<note_func> player = <player> hold_pattern = <hold_pattern>
	if ScreenElementExists \{id = studio_pick_text}
		if NOT (<jam_instrument> = 3)
			studio_pick_text :SE_SetProps text = <single_note_text>
		else
			studio_pick_text :SE_SetProps \{text = qs(0x00000000)}
		endif
	else
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script show_change_bpm 
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	killspawnedscript \{name = jam_highway_select_quantize}
	GetEnterButtonAssignment
	choose_button = <assignment>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x582d7977)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xc4c7f798)
		button = strumbar
		z = 100}
	if ScreenElementExists \{id = jam_studio_element}
		FormatText \{TextName = curr_bpm_text
			qs(0x4d4555da)
			s = $jam_current_bpm}
		jam_studio_element :SetProps bpm_number_text = <curr_bpm_text>
	endif
	if IsPS3
		if jam_studio_element :Desc_ResolveAlias \{name = alias_bpm_d_pad}
			<resolved_id> :SetProps texture = d_pad_ps3 Pos = (67.0, -49.0)
		endif
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = bpm_box}
		<resolved_id> :SetProps Pos = (472.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = bpm_box}
		<resolved_id> :SetProps Pos = (472.0, 47.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	GetPlayerInfo ($jam_current_recording_player) controller
	curr_bpm = $jam_current_bpm
	mid_up_strum = 0
	mid_down_strum = 0
	begin
	if has_lefty_adj_control_press Dir = up controller = <controller> player = $jam_current_recording_player
		if (<mid_up_strum> = 0)
			<curr_bpm> = (<curr_bpm> + 1)
			if (<curr_bpm> > $jam_max_bpm)
				<curr_bpm> = $jam_max_bpm
			endif
			GHMix_scroll \{adv_record}
			killspawnedscript \{name = scale_bpm_arrows}
			spawnscriptnow \{scale_bpm_arrows
				id = jam_recording_spawns
				params = {
					up
				}}
			killspawnedscript \{name = jam_recording_metronome}
			reset_song_time \{starttime = 0}
			spawnscriptnow jam_recording_metronome id = jam_recording_spawns params = {bpm = <curr_bpm> time = 0 sound_only}
		endif
		<mid_up_strum> = (<mid_up_strum> + 1)
		if (<mid_up_strum> > 10)
			<mid_up_strum> = 0
		endif
	else
		<mid_up_strum> = 0
	endif
	if has_lefty_adj_control_press Dir = down controller = <controller> player = $jam_current_recording_player
		if (<mid_down_strum> = 0)
			<curr_bpm> = (<curr_bpm> - 1)
			if (<curr_bpm> < $jam_min_bpm)
				<curr_bpm> = $jam_min_bpm
			endif
			GHMix_scroll \{adv_record}
			killspawnedscript \{name = scale_bpm_arrows}
			spawnscriptnow \{scale_bpm_arrows
				id = jam_recording_spawns
				params = {
					down
				}}
			killspawnedscript \{name = jam_recording_metronome}
			reset_song_time \{starttime = 0}
			spawnscriptnow jam_recording_metronome id = jam_recording_spawns params = {bpm = <curr_bpm> time = 0 sound_only}
		endif
		<mid_down_strum> = (<mid_down_strum> + 1)
		if (<mid_down_strum> > 10)
			<mid_down_strum> = 0
		endif
	else
		<mid_down_strum> = 0
	endif
	FormatText TextName = curr_bpm_text qs(0x4d4555da) s = <curr_bpm>
	jam_studio_element :SetProps bpm_number_text = <curr_bpm_text>
	if ControllerMake <choose_button> <controller>
		break
	endif
	if ControllerMake start <controller>
		break
	endif
	wait \{1
		gameframe}
	repeat
	killspawnedscript \{name = jam_recording_metronome}
	SoundEvent \{event = GHMix_Select}
	Change jam_current_bpm = <curr_bpm>
	guitar_jam_settings_bpm_back \{no_sound
		player = $jam_current_recording_player}
	broadcastevent \{type = ghmix_bpm_selected}
	SetSongInfo bpm = ($jam_current_bpm)
	if jam_studio_element :Desc_ResolveAlias \{name = bpm_box}
		<resolved_id> :SetProps Pos = (472.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	FormatText \{TextName = title_text
		qs(0x90f34c93)
		s = $jam_selected_song
		b = $jam_current_bpm}
	jam_studio_element :SetProps SongTitleInfo_text = <title_text>
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	killspawnedscript \{name = jam_highway_select_quantize}
	spawnscriptnow \{jam_highway_select_quantize
		id = jam_recording_spawns}
	spawnscriptnow \{id = jam_recording_spawns
		jam_ghmix_show_scale_reference}
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script scale_bpm_arrows 
	if GotParam \{up}
		jam_studio_element :SetProps \{bpm_arrow_up_scale = 2.0}
		jam_studio_element :SetProps \{bpm_arrow_up_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
	if GotParam \{down}
		jam_studio_element :SetProps \{bpm_arrow_down_scale = 2.0}
		jam_studio_element :SetProps \{bpm_arrow_down_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
endscript

script jam_recording_create_editable_arrays 
	song_prefix = 'editable'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	drumnotessize = ($drumnotessize)
	arraylistsize = ($arraylistsize)
	jamsession_array_action <...> func = CreateScriptArray
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	musicstudio_mainobj :MusicStudio_GetCurrentHeap
	CreateScriptArray name = <arraylist> size = <arraylistsize> heap = <heap> type = checksum
	jamsession_array_action <...> func = jamsession_AddScriptArrayItem
endscript

script jam_recording_create_jamsession_arrays 
	song_prefix = 'jamsession'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	drumnotessize = ($drumnotessize)
	arraylistsize = ($arraylistsize)
	FormatText checksumname = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	musicstudio_mainobj :MusicStudio_GetCurrentHeap
	CreateScriptArray name = <arraylist2> size = <arraylistsize> heap = <heap> type = checksum
	jamsession_array_action <...> func = jamsession_AddScriptArrayItem arraylist = <arraylist2>
endscript

script jam_recording_setup_timesig 
	song_prefix = 'editable'
	FormatText checksumname = timesig_array '%s_timesig' s = <song_prefix> AddToStringLookup = true
	timesig_to_add = [0 , 4 , 4]
	AddScriptArrayItem name = <timesig_array> array = <timesig_to_add>
endscript

script jam_control_bar_down 
	jam_studio_element :GetTags
	if GotParam \{block_updown}
		if (<block_updown> = 1)
			printf \{'blocking a bar down'
				channel = ghmix_tut}
			return
		endif
	endif
	GHMix_scroll \{adv_record}
	GetArraySize \{$jam_controls}
	num_controls = (<array_size> - 1)
	Change jam_control_selected = ($jam_control_selected + 1)
	if ($jam_control_selected > <num_controls>)
		Change \{jam_control_selected = 0}
	endif
	if ($jam_control_selected = 10)
		jam_show_paste_highlight
	else
		if ScreenElementExists \{id = jam_paste_highlight}
			DestroyScreenElement \{id = jam_paste_highlight}
		endif
	endif
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		spawnscriptnow \{jam_studio_animate_mouse}
		LegacyDoScreenElementMorph id = control_bg time = 0 Pos = ($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) rot_angle = <rotation>
	endif
endscript

script jam_control_bar_up 
	jam_studio_element :GetTags
	if GotParam \{block_updown}
		if (<block_updown> = 1)
			printf \{'blocking a bar up'
				channel = ghmix_tut}
			return
		endif
	endif
	GHMix_scroll \{adv_record}
	GetArraySize \{$jam_controls}
	num_controls = (<array_size> - 1)
	Change jam_control_selected = ($jam_control_selected - 1)
	if ($jam_control_selected < 0)
		Change jam_control_selected = <num_controls>
	endif
	if ($jam_control_selected = 10)
		jam_show_paste_highlight
	else
		if ScreenElementExists \{id = jam_paste_highlight}
			DestroyScreenElement \{id = jam_paste_highlight}
		endif
	endif
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		spawnscriptnow \{jam_studio_animate_mouse}
		LegacyDoScreenElementMorph id = control_bg time = 0 Pos = ($jam_control_bar_offset + $jam_control_selected * $jam_control_offset) rot_angle = <rotation>
	endif
endscript

script jam_control_goto 
	GetArraySize \{$jam_controls}
	Change jam_control_selected = <option_index>
	if ($jam_control_selected = 10)
		jam_show_paste_highlight
	else
		if ScreenElementExists \{id = jam_paste_highlight}
			DestroyScreenElement \{id = jam_paste_highlight}
		endif
	endif
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		spawnscriptnow \{jam_studio_animate_mouse}
		LegacyDoScreenElementMorph id = control_bg time = 0 Pos = ($jam_control_bar_offset + $jam_control_selected * $jam_control_offset) rot_angle = <rotation>
	endif
endscript

script jam_control_bar_choose 
	killspawnedscript \{name = jam_highway_play}
	stop_custom_song
	SetScreenElementProps \{id = control_playstop
		texture = icon_play}
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = ($jam_current_recording_player)
	spawnscriptnow \{jam_studio_animate_mouse}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :GetTags
		if GotParam \{controls_enabled}
			if ((<controls_enabled> [$jam_control_selected]) = 0)
				printf 'control denied %a' a = ($jam_control_selected) channel = ghmix_tut
				return
			endif
		endif
	endif
	Change \{no_precise_snap = 0}
	Change \{no_marker_snap = 0}
	switch $jam_control_selected
		case 0
		printf \{channel = jam_mode
			qs(0x0cc737d4)}
		SoundEvent \{event = GhMix_Scroll_Up_Down}
		if ($jam_highway_recording_mode = 1)
			jam_highway_move_last_note
		else
			jam_highway_move_end
		endif
		Change \{jam_highway_playing = 0}
		case 1
		printf \{channel = jam_mode
			qs(0xba402bc0)}
		SoundEvent \{event = GhMix_Scroll_Up_Down}
		spawnscriptnow jam_highway_user_skip id = <jam_player_spawns> params = {forwards = 1}
		Change \{jam_highway_playing = 0}
		case 2
		printf \{channel = jam_mode
			qs(0xed59051a)}
		SoundEvent \{event = GHMix_Select}
		Change \{jam_highway_playing = 1}
		if ($jam_highway_recording_mode = 0)
			begin_jam_song
		endif
		if ($jam_current_track = 4)
			Change \{jam_melody_last_pattern = 65536}
			Change \{jam_melody_current_pattern = 65536}
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> player = ($jam_current_recording_player)}
		spawnscriptnow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = control_name
				}
			}}
		SetScreenElementProps id = <resolved_id> text = ($jam_controls [$jam_control_selected].alt_name_text)
		spawnscriptnow \{jam_highway_play
			id = jam_recording_spawns}
		case 3
		printf \{channel = jam_mode
			qs(0xcb8e98d2)}
		SoundEvent \{event = GHMix_Select}
		Change \{no_marker_snap = 1}
		GetPlayerInfo ($jam_current_recording_player) jam_instrument
		if (<jam_instrument> = 4)
			Change \{jam_melody_last_pattern = 1}
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> player = ($jam_current_recording_player)}
		spawnscriptnow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		spawnscriptnow \{jam_highway_record
			id = jam_recording_spawns}
		Change \{jam_highway_playing = 0}
		broadcastevent \{type = ghmix_start_rec}
		case 4
		printf \{channel = jam_mode
			qs(0x3be47dca)}
		SoundEvent \{event = GHMix_Select}
		Change \{no_precise_snap = 1}
		Change \{no_marker_snap = 1}
		GetPlayerInfo ($jam_current_recording_player) jam_instrument
		if (<jam_instrument> = 4)
			Change \{jam_melody_last_pattern = 1}
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> player = ($jam_current_recording_player)}
		spawnscriptnow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		spawnscriptnow \{jam_highway_step_record
			id = jam_recording_spawns}
		Change \{jam_highway_playing = 0}
		broadcastevent \{type = ghmix_start_step}
		case 5
		printf \{channel = jam_mode
			qs(0xfd4062da)}
		SoundEvent \{event = GhMix_Scroll_Up_Down}
		spawnscriptnow jam_highway_user_skip id = <jam_player_spawns> params = {forwards = 0}
		Change \{jam_highway_playing = 0}
		case 6
		printf \{channel = jam_mode
			qs(0x842241d3)}
		SoundEvent \{event = GhMix_Scroll_Up_Down}
		jam_highway_move_beginning
		Change \{jam_highway_playing = 0}
		case 7
		broadcastevent \{type = ghmix_start_loop}
		printf \{channel = jam_mode
			qs(0x71c49faa)}
		SoundEvent \{event = GHMix_Select}
		jam_highway_loop
		Change \{jam_highway_playing = 0}
		case 8
		broadcastevent \{type = ghmix_delete_start}
		printf \{channel = jam_mode
			qs(0x4bcb1cce)}
		SoundEvent \{event = GHMix_Select}
		jam_highway_delete_section
		Change \{jam_highway_playing = 0}
		case 9
		broadcastevent \{type = ghmix_start_copy}
		printf \{channel = jam_mode
			qs(0x715c7186)}
		SoundEvent \{event = GHMix_Select}
		jam_highway_copy
		Change \{jam_highway_playing = 0}
		case 10
		broadcastevent \{type = ghmix_paste_start}
		printf \{channel = jam_mode
			qs(0xffbc1273)}
		SoundEvent \{event = GHMix_Select}
		jam_highway_paste_control
		Change \{jam_highway_playing = 0}
		case 11
		Change \{no_marker_snap = 1}
		broadcastevent \{type = ghmix_start_nudge}
		printf \{channel = jam_mode
			qs(0x8b6d7f03)}
		SoundEvent \{event = GHMix_Select}
		spawnscriptnow jam_highway_note_nudge id = <jam_player_spawns>
		Change \{jam_highway_playing = 0}
		case 12
		printf \{channel = jam_mode
			qs(0x75aa1924)}
		SoundEvent \{event = GHMix_Select}
		LaunchEvent \{type = unfocus
			target = jam_control_container}
		GetPlayerInfo ($jam_current_recording_player) controller
		create_menu_jam_marker controller = <controller>
		Change \{jam_highway_playing = 0}
		case 13
		printf \{channel = jam_mode
			qs(0x17b9309e)}
		SoundEvent \{event = GHTunes_UI_Select}
		jam_recording_switch_instrument
		jam_ghmix_note_quick_update player = ($jam_current_recording_player)
		Change \{jam_highway_playing = 0}
	endswitch
endscript
jam_loop_bound_low = -1
jam_loop_bound_high = -1

script jam_highway_loop 
	printf \{channel = jam_mode
		qs(0xead72b33)}
	if ($jam_highway_recording_mode = 0)
		return
	endif
	tool_controls = []
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = loop}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	loop_bound_low = 0
	loop_bound_high = 0
	mid_up_strum = 0
	mid_down_strum = 0
	if IsPS3
		<clear_button> = square
	elseif IsXenonOrWinDX
		<clear_button> = triangle
	endif
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	count = 0
	GetPlayerInfo ($jam_current_recording_player) controller
	loop_controls = [set_loop clear_loop select_area cancel]
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	if ArrayContains array = <loop_controls> contains = select_area
		if has_lefty_adj_control_press Dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				GHMix_scroll \{adv_record}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				GHMix_scroll \{adv_record}
				jam_highway_skip_backwards
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > $jam_select_area_wait)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if ArrayContains array = <loop_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			GhMix_Pad_Back_Sound
			<broke> = 1
			break
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = jam_loop_highlight}
		DestroyScreenElement \{id = jam_loop_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = jam_loop_highlight
		texture = white
		just = [left top]
		rgba = [255 0 0 50]
		Pos = (<highlight_pos> + (0.0, 55.0))
		dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		z_priority = 10
	}
	if ArrayContains array = <loop_controls> contains = set_loop
		if ControllerMake start <controller>
			SoundEvent \{event = GHMix_Select}
			if ($jam_highway_play_time < <orig_start_time>)
				<loop_bound_low> = $jam_highway_play_time
				<loop_bound_high> = <orig_start_time>
			elseif ($jam_highway_play_time > <orig_start_time>)
				<loop_bound_low> = <orig_start_time>
				<loop_bound_high> = $jam_highway_play_time
			elseif ($jam_highway_play_time = <orig_start_time>)
				<loop_bound_low> = (<orig_start_time>)
				<loop_bound_high> = (($jam_highway_play_time))
			endif
			broadcastevent \{type = ghmix_loop_set}
			break
		endif
	endif
	if ArrayContains array = <loop_controls> contains = clear_loop
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			if ControllerMake <clear_button> <controller>
				<loop_bound_low> = -1
				<loop_bound_high> = -1
				break
			endif
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	wait \{1
		gameframe}
	repeat
	broadcastevent \{type = ghmix_stop_loop}
	if ((<loop_bound_low> != <loop_bound_high>) || (<loop_bound_low> = -1 && <loop_bound_high> = -1))
		quantize_to = 1
		ms_per_beat = (60000.0 / $jam_current_bpm)
		ms_per_quarter = (<ms_per_beat> / <quantize_to>)
		if NOT (<loop_bound_low> = -1 && <loop_bound_high> = -1)
			if ((<loop_bound_high> - <loop_bound_low>) >= <ms_per_quarter>)
				Change jam_loop_bound_low = <loop_bound_low>
				Change jam_loop_bound_high = <loop_bound_high>
			else
				spawnscriptnow \{show_warning_message
					id = jam_recording_spawns
					params = {
						warning_text = qs(0xe19408b8)
					}}
			endif
		else
			Change jam_loop_bound_low = <loop_bound_low>
			Change jam_loop_bound_high = <loop_bound_high>
		endif
	else
		if NOT GotParam \{broke}
			spawnscriptnow \{show_warning_message
				id = jam_recording_spawns
				params = {
					warning_text = qs(0xc7806153)
				}}
		endif
	endif
	printf channel = jam_mode qs(0x40240d02) a = <loop_bound_low> b = <loop_bound_high>
	if ScreenElementExists \{id = jam_loop_highlight}
		DestroyScreenElement \{id = jam_loop_highlight}
	endif
	LaunchEvent \{type = focus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
endscript

script jam_highway_add_marker 
	GhMix_Pad_Choose_Sound
	destroy_menu_jam_marker
	LaunchEvent \{type = focus
		target = jam_control_container}
	quantize_to = 1
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = ($jam_highway_play_time / <quantize>)
	CastToInteger \{intervals}
	new_time = (<intervals> * <quantize>)
	time_before = ($jam_highway_play_time - <new_time>)
	time_after = ((<new_time> + <quantize>) - $jam_highway_play_time)
	if (<time_after> <= <time_before>)
		<new_time> = (<new_time> + <quantize>)
	endif
	CastToInteger \{new_time}
	new_pos = ($jam_highway_play_line_pos - ((<new_time> / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
	if (<new_time> < $jam_highway_play_time)
		<new_low_bound> = ($jam_highway_low_bound - ($jam_highway_play_time - <new_time>))
		<new_high_bound> = ($jam_highway_high_bound - ($jam_highway_play_time - <new_time>))
	else
		<new_low_bound> = ($jam_highway_low_bound + (<new_time> - $jam_highway_play_time))
		<new_high_bound> = ($jam_highway_high_bound + (<new_time> - $jam_highway_play_time))
	endif
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	Change jam_highway_low_bound = <new_low_bound>
	Change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
	Change jam_highway_play_time = <new_time>
	markers_array = editable_jam_markers
	suffix = '_size'
	AppendSuffixToChecksum base = <markers_array> SuffixString = <suffix>
	<markers_size> = <appended_id>
	get_marker_count markers_array = <markers_array> markers_size = <markers_size> new_marker_time = ($jam_highway_play_time) new_marker_name = ($jam_markers [$jam_current_marker].name_text)
	AddMarkerItem name = <markers_array> time = ($jam_highway_play_time) marker_name = ($jam_markers [$jam_current_marker].name_text) marker_count = <marker_count> bpm = ($jam_current_marker_bpm) LightShow = ($jam_current_lightshow)
	Change \{no_marker_snap = 0}
endscript

script get_marker_count 
	GetArraySize ($<markers_array>)
	printf channel = jam_mode qs(0x601c28e9) s = <array_size>
	count = 0
	marker_count = 0
	begin
	if (($<markers_size>) <= 0)
		break
	endif
	curr_marker_name = ($<markers_array> [<count>].marker_name)
	curr_marker_time = ($<markers_array> [<count>].time)
	curr_marker_count = ($<markers_array> [<count>].marker_count)
	if (<curr_marker_name> = <new_marker_name>)
		if (<curr_marker_time> = <new_marker_time>)
			<marker_count> = <curr_marker_count>
			break
		else
			<marker_count> = (<marker_count> + 1)
		endif
	endif
	<count> = (<count> + 1)
	if (<count> >= ($<markers_size>))
		break
	endif
	repeat
	return marker_count = <marker_count>
endscript

script debug_print_markers 
	markers_array = editable_jam_markers
	suffix = '_size'
	AppendSuffixToChecksum base = <markers_array> SuffixString = <suffix>
	<markers_size> = <appended_id>
	GetArraySize ($<markers_array>)
	printf channel = jam_mode qs(0x601c28e9) s = <array_size>
	count = 0
	begin
	printf qs(0xf6643ac1) s = <count>
	printstruct ($<markers_array> [<count>])
	<count> = (<count> + 1)
	repeat <array_size>
endscript

script jam_highway_move_beginning 
	SetScreenElementProps \{id = jam_highway_container
		Pos = $jam_highway_play_line_pos}
	initialize_jam_highway
	SetSeekPosition_Song \{position = 0}
	Change \{jam_highway_play_time = 0}
	if ($jam_highway_recording_mode = 0)
		begin_song \{Pause = 1}
	endif
endscript

script jam_highway_move_end 
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container Pos = <end_pos>
	SetSeekPosition_Song position = ($jam_highway_end_time)
	Change jam_highway_play_time = ($jam_highway_end_time)
	<new_low_bound> = ($jam_highway_start_low_bound + $jam_highway_end_time)
	<new_high_bound> = ($jam_highway_start_high_bound + $jam_highway_end_time)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	Change jam_highway_low_bound = <new_low_bound>
	Change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
endscript

script jam_highway_move_last_note 
	GetTrackSize track = ($jam_tracks [$jam_current_track].id)
	if (<track_size> > 0)
		if GetCustomNote track = ($jam_tracks [$jam_current_track].id) index = (<track_size> - 1)
			musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 8.0)
			if (<note_length> >= <note_quantize_ms>)
				musicstudio_mainobj :MusicStudioGhmix_GetSnapTime time = (<note_time> + <note_length>) snap = (1.0 / 8.0) direction = 1
				end_time = <snap_time>
			else
				end_time = <note_time>
			endif
		else
			return
		endif
	else
		return
	endif
	end_pos = ($jam_highway_play_line_pos - ((<end_time> / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container Pos = <end_pos>
	Change jam_highway_play_time = <end_time>
	<new_low_bound> = (<end_time> + $jam_highway_start_low_bound)
	<new_high_bound> = (<end_time> + $jam_highway_start_high_bound)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	Change jam_highway_low_bound = <new_low_bound>
	Change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
endscript

script jam_highway_play 
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	tool_controls = []
	if ScreenElementExists \{id = jam_control_container}
		LaunchEvent \{type = unfocus
			target = jam_control_container}
	endif
	if (<jam_instrument> = 3)
		wait \{20
			gameframes}
	endif
	if ($jam_highway_recording_mode = 1)
		playback_custom_song \{start_time = $jam_highway_play_time}
	endif
	if GotParam \{jam_mode}
		begin_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
		SetScreenElementProps id = jam_band_highway_playline Pos = <begin_pos>
		pixels_per_frame = ($jam_band_pixels_per_second / 60)
		GetScreenElementPosition \{id = jam_band_highway_playline}
		end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
		begin
		new_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
		if NOT (<new_pos> [0] > <end_pos> [0])
			SetScreenElementProps id = jam_band_highway_playline Pos = <new_pos>
			Change jam_highway_play_time = ($jam_highway_play_time + ((1.0 / 60.0) * 1000.0))
		else
			break
		endif
		wait \{1
			gameframe}
		repeat
		Change \{jam_highway_playing = 0}
	else
		LaunchEvent \{type = unfocus
			target = jam_control_container}
		if StructureContains structure = ($jam_tracks [$jam_current_track]) input_func
			GetPlayerInfo ($jam_current_recording_player) controller
			FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
			spawnscriptnow ($jam_tracks [$jam_current_track].input_func) id = <input_spawn> params = {show_hud = 0 controller = <controller> select_player = ($jam_current_recording_player) hammer_on = <hammer_on>}
			if (($jam_current_track) = 3)
				spawnscriptnow \{id = jam_recording_spawns
					jam_advanced_show_percussion_box}
			else
				if NOT (($jam_current_track) = 0)
					spawnscriptnow \{id = jam_recording_spawns
						jam_advanced_show_arpeggiator_box}
				endif
			endif
		endif
		clean_up_user_control_helpers
		jam_recording_add_user_control_helpers \{state = playing}
		can_loop = 0
		if ($jam_highway_play_time <= ($jam_loop_bound_high + 2))
			<can_loop> = 1
		endif
		pixels_per_frame = ($jam_highway_pixels_per_second / 60)
		GetScreenElementPosition \{id = jam_highway_container}
		playback_custom_song \{start_time = $jam_highway_play_time}
		count = 0
		begin
		if ($game_mode = practice)
			jam_studio_element :GetTags
		endif
		GetSongTimeMs
		Change jam_highway_play_time = <time>
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			if (<can_loop> = 1)
				if ($jam_highway_play_time > ($jam_loop_bound_high - ((1000.0 / 60.0) * 2)))
					Change \{jam_highway_play_time = $jam_loop_bound_low}
					jam_highway_reinit
				endif
			endif
		endif
		end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
		new_pos = ($jam_highway_play_line_pos - ((($jam_highway_play_time) / 1000.0) * $jam_highway_pixels_per_second))
		if NOT (<new_pos> [0] < <end_pos> [0])
			if NOT (<count> = 0)
				SetScreenElementProps id = jam_highway_container Pos = <new_pos>
				<new_low_bound> = (($jam_highway_play_time) + ($jam_highway_start_low_bound))
				<new_high_bound> = (($jam_highway_play_time) + ($jam_highway_start_high_bound))
				CastToInteger \{new_low_bound}
				CastToInteger \{new_high_bound}
				Change jam_highway_low_bound = <new_low_bound>
				Change jam_highway_high_bound = <new_high_bound>
			endif
			<count> = (<count> + 1)
		else
			jam_highway_move_end
			break
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		if ControllerMake start <controller>
			SoundEvent \{event = GHMix_Select}
			break
		endif
		if ArrayContains array = <tool_controls> contains = force_exit
			break
		endif
		wait \{1
			gameframe}
		repeat
		jam_ghmix_note_quick_update player = ($jam_current_recording_player)
		spawnscriptnow \{id = jam_recording_spawns
			jam_advanced_hide_percussion_box}
		spawnscriptnow \{id = jam_recording_spawns
			jam_advanced_hide_arpeggiator_box}
		killspawnedscript \{name = jam_play_arpeggiator_loop}
		killspawnedscript \{name = jam_play_drum_loop}
		jam_stop_all_sound
		killspawnedscript \{name = jam_lightup_held_note_sprites}
		killspawnedscript \{name = jam_studio_tilt_meter}
		jam_studio_hide_tilt_meter
		jam_hide_all_held_note_sprites player = ($jam_current_recording_player)
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = {
						pitch_indicator
						child = pitch_dial
					}
				}
			}}
		LegacyDoScreenElementMorph id = <resolved_id> time = 0.2 rot_angle = 0
		jam_input_destroy_player_server player = ($jam_current_recording_player)
		FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
		killspawnedscript id = <input_spawn>
		killspawnedscript \{id = jam_input_spawns}
		jam_kill_update_note_length player = ($jam_current_recording_player)
		LaunchEvent \{type = focus
			target = jam_control_container}
		SetScreenElementProps \{id = control_playstop
			texture = icon_play}
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = control_name
				}
			}}
		SetScreenElementProps id = <resolved_id> text = ($jam_controls [$jam_control_selected].name_text)
		clean_up_user_control_helpers
		jam_recording_add_user_control_helpers
	endif
	printf \{channel = jam_mode
		qs(0xbd4e4e75)}
	Change \{jam_highway_playing = 0}
	if ($jam_highway_recording_mode = 0)
		begin_jam_song \{Pause = 1}
	endif
	if ($jam_highway_recording_mode = 1)
		stop_custom_song
	endif
	jam_stop_all_sound
endscript

script jam_highway_record 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	tool_controls = []
	Change \{jam_highway_recording = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	GetPlayerInfo ($jam_current_recording_player) controller
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 3)
		wait \{20
			gameframes}
	endif
	show_countin_message
	jam_record_input
	playback_custom_song \{start_time = $jam_highway_play_time}
	spawnscriptnow \{jam_recording_metronome
		id = jam_input_spawns
		params = {
			sound_only
		}}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = recording}
	can_loop = 0
	if ($jam_highway_play_time <= ($jam_loop_bound_high + 2))
		<can_loop> = 1
	endif
	pixels_per_frame = ($jam_highway_pixels_per_second / 60)
	GetScreenElementPosition \{id = jam_highway_container}
	playback_custom_song \{start_time = $jam_highway_play_time}
	count = 0
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	GetSongTimeMs
	Change jam_highway_play_time = <time>
	if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
		if (<can_loop> = 1)
			if ($jam_highway_play_time > ($jam_loop_bound_high - ((1000.0 / 60.0) * 2)))
				Change \{jam_highway_play_time = $jam_loop_bound_low}
				killspawnedscript \{name = jam_recording_metronome}
				spawnscriptnow \{jam_recording_metronome
					id = jam_input_spawns
					params = {
						sound_only
					}}
				jam_highway_reinit
			endif
		endif
	endif
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	new_pos = ($jam_highway_play_line_pos - ((($jam_highway_play_time) / 1000.0) * $jam_highway_pixels_per_second))
	if NOT (<new_pos> [0] < <end_pos> [0])
		if NOT (<count> = 0)
			SetScreenElementProps id = jam_highway_container Pos = <new_pos>
			<new_low_bound> = (($jam_highway_play_time) + ($jam_highway_start_low_bound))
			<new_high_bound> = (($jam_highway_play_time) + ($jam_highway_start_high_bound))
			CastToInteger \{new_low_bound}
			CastToInteger \{new_high_bound}
			Change jam_highway_low_bound = <new_low_bound>
			Change jam_highway_high_bound = <new_high_bound>
		endif
		<count> = (<count> + 1)
	else
		jam_highway_move_end
		break
	endif
	GetPlayerInfo ($jam_current_recording_player) controller
	<done> = 0
	if ControllerMake start <controller>
		<done> = 1
	elseif ArrayContains array = <tool_controls> contains = force_exit
		<done> = 1
	endif
	if (<done> = 1)
		SoundEvent \{event = GHMix_Select}
		if (<jam_instrument> = 4)
			jam_input_melody_stop_sound
		endif
		FormatText checksumname = msg_box 'jam_limit_msg_box_%a' a = ($jam_current_recording_player)
		if ScreenElementExists id = <msg_box>
			DestroyScreenElement id = <msg_box>
		endif
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	stop_custom_song
	printf \{channel = jam_mode
		qs(0xee7339d4)}
	broadcastevent \{type = ghmix_stop_rec}
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_percussion_box}
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_arpeggiator_box}
	killspawnedscript \{name = jam_play_arpeggiator_loop}
	killspawnedscript \{name = jam_play_drum_loop}
	jam_stop_all_sound
	killspawnedscript \{name = jam_lightup_held_note_sprites}
	killspawnedscript \{name = jam_studio_tilt_meter}
	jam_studio_hide_tilt_meter
	jam_hide_all_held_note_sprites player = ($jam_current_recording_player)
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	LegacyDoScreenElementMorph id = <resolved_id> time = 0.2 rot_angle = 0
	jam_input_destroy_player_server player = ($jam_current_recording_player)
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	killspawnedscript id = <input_spawn>
	jam_recording_metronome_stop
	killspawnedscript \{id = jam_input_spawns}
	jam_kill_update_note_length player = ($jam_current_recording_player)
	LaunchEvent \{type = focus
		target = jam_control_container}
	if ScreenElementExists \{id = control_record}
		SetScreenElementProps \{id = control_record
			alpha = 1}
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	Change \{jam_highway_recording = 0}
	Change \{no_precise_snap = 0}
	Change \{no_marker_snap = 0}
endscript

script show_countin_message 
	count_wait = (60.0 / $jam_current_bpm)
	curr_time = $jam_highway_play_time
	CastToInteger \{curr_time}
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = metronome_box}
			<resolved_id> :SetProps Pos = (54.0, 800.0) time = 0.0
		endif
	endif
	quantize_to = 1
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize_fretbar = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_fretbar>)
	CastToInteger \{intervals}
	new_time_fretbar = (<intervals> * <quantize_fretbar>)
	wait_for_next_fretbar = (<curr_time> - <new_time_fretbar>)
	<wait_for_next_fretbar> = (<wait_for_next_fretbar> / 1000.0)
	toggle_advanced_record_metronome \{left}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x787beab2)}
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = countin_box}
		<resolved_id> :SetProps Pos = (357.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = countin_box}
		<resolved_id> :SetProps Pos = (357.0, 178.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = Jam_Mode_Metronome}
	wait <count_wait> seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x5356b971)}
	endif
	toggle_advanced_record_metronome \{left}
	SoundEvent \{event = Jam_Mode_Metronome}
	wait <count_wait> seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x4a4d8830)}
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = Jam_Mode_Metronome}
	wait <count_wait> seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x050c1ef7)}
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = Jam_Mode_Metronome}
	if (<wait_for_next_fretbar> = 0)
		wait <count_wait> seconds
		SoundEvent \{event = Jam_Mode_Metronome}
	else
		wait <wait_for_next_fretbar> seconds
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = countin_box}
		<resolved_id> :SetProps Pos = (357.0, 800.0) time = 0.2
	endif
endscript

script jam_update_count 
	begin
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS \{note = 1.0}
	intervals = ($jam_highway_play_time / <note_quantize_ms>)
	CastToInteger \{intervals}
	FormatText TextName = measure_text qs(0x73307931) s = (<intervals> + 1)
	jam_studio_element :SetProps measure_count_text = <measure_text>
	if NOT ($jam_current_quantize < 2)
		musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = ($jam_quantize [$jam_current_quantize].value)
		intervals = ($jam_highway_play_time / <note_quantize_ms>)
		<intervals_rounding_check> = (<intervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		begin
		if (<intervals> > (1 / ($jam_quantize [$jam_current_quantize].value)))
			<intervals> = (<intervals> - (1 / ($jam_quantize [$jam_current_quantize].value)))
		else
			if (<intervals> = (1 / ($jam_quantize [$jam_current_quantize].value)))
				<intervals> = 0
			endif
			break
		endif
		repeat
		CastToInteger \{intervals}
		FormatText TextName = snap_text qs(0x73307931) s = (<intervals> + 1)
		jam_studio_element :SetProps note_count_text = <snap_text>
	else
		jam_studio_element :SetProps \{note_count_text = qs(0x00000000)}
	endif
	wait \{5
		gameframes}
	repeat
endscript

script jam_advanced_show_percussion_box 
	if ($is_drum_machine = 1)
		jam_studio_element :SE_SetProps \{drum_machine_glow_alpha = 0.65000004}
	else
		jam_studio_element :SE_SetProps \{drum_machine_glow_alpha = 0}
	endif
	box = percussion_box
	end_pos = (188.0, 447.0)
	if isdrumcontroller controller = <controller>
		box = percussion_box_small
		end_pos = (188.0, 462.0)
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias name = <box>
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.0
		endif
		if jam_studio_element :Desc_ResolveAlias name = <box>
			<resolved_id> :SetProps Pos = <end_pos> time = 0.2
		endif
	endif
endscript

script jam_advanced_hide_percussion_box 
	box = percussion_box
	if isdrumcontroller controller = <controller>
		box = percussion_box_small
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias name = <box>
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.2
		endif
	endif
endscript

script jam_advanced_show_arpeggiator_box 
	if (($is_arpeggiator [$jam_current_track]) = 1)
		jam_studio_element :SE_SetProps \{arpeggiator_glow_alpha = 0.65000004}
	else
		jam_studio_element :SE_SetProps \{arpeggiator_glow_alpha = 0}
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = arpeggiator_box}
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.0
		endif
		if jam_studio_element :Desc_ResolveAlias \{name = arpeggiator_box}
			<resolved_id> :SetProps Pos = (188.0, 498.0) time = 0.2
		endif
	endif
endscript

script jam_advanced_hide_arpeggiator_box 
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = arpeggiator_box}
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.2
		endif
	endif
endscript

script jam_record_input \{step_record = 0
		show_box = 1}
	hammer_on = 1
	if (<step_record> = 1)
		<hammer_on> = 0
	endif
	if StructureContains structure = ($jam_tracks [$jam_current_track]) input_func
		GetPlayerInfo ($jam_current_recording_player) controller
		FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
		spawnscriptnow ($jam_tracks [$jam_current_track].input_func) id = <input_spawn> params = {show_hud = 0 controller = <controller> select_player = ($jam_current_recording_player) hammer_on = <hammer_on>}
	endif
	if (<show_box> = 1)
		if (($jam_current_track) = 3)
			spawnscriptnow \{id = jam_recording_spawns
				jam_advanced_show_percussion_box}
		else
			if NOT (($jam_current_track) = 0)
				spawnscriptnow \{id = jam_recording_spawns
					jam_advanced_show_arpeggiator_box}
			endif
		endif
	endif
endscript

script jam_highway_step_record 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	tool_controls = []
	Change \{jam_highway_recording = 1}
	Change \{jam_highway_step_recording = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	GetPlayerInfo ($jam_current_recording_player) controller
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 3 || <jam_instrument> = 4)
		wait \{30
			gameframes}
	endif
	jam_record_input \{step_record = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = step_recording}
	mid_up_strum = 0
	mid_down_strum = 0
	wait_before_sustain = 15
	hold_frames = 0
	old_quantize = ($jam_current_quantize)
	input_spawned = 1
	whammy_hold_count = 0
	if isguitarcontroller controller = <controller>
		killspawnedscript \{name = show_warning_message}
		spawnscriptnow \{show_jam_helper_box
			id = jam_input_spawns
			params = {
				text = qs(0x88acb88a)
			}}
	endif
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	spawnscriptnow id = <input_spawn> jam_step_wait
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	count = 0
	curr_playing_id = null
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	step_strum = 0
	if isguitarcontroller controller = <controller>
		if ($blade_active = 0)
			if GuitarGetAnalogueInfo controller = <controller>
				if (<rightx> > 0.3)
					if (<whammy_hold_count> > 3)
						if (<input_spawned> = 1)
							jam_input_destroy_player_server player = ($jam_current_recording_player)
							FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
							killspawnedscript id = <input_spawn>
							killspawnedscript \{id = jam_input_spawns}
							jam_kill_update_note_length player = ($jam_current_recording_player)
							killspawnedscript \{name = jam_step_wait}
							<input_spawned> = 0
							clean_up_user_control_helpers
							jam_recording_add_user_control_helpers \{state = step_rec_skip}
						endif
						if ControllerMake <break_button> <controller>
							SoundEvent \{event = Enter_Band_Name_Back}
							DeleteCustomNoteRange track = ($jam_tracks [<track>].id) low_bound = (($jam_highway_play_time) -5) high_bound = (($jam_highway_play_time) + 5)
						endif
						if ScreenElementExists \{id = jam_studio_element}
							if NOT ScriptIsRunning \{show_warning_message}
								jam_studio_element :SetProps \{dialog_text = qs(0x18c05386)}
							endif
						endif
					endif
					<whammy_hold_count> = (<whammy_hold_count> + 1)
				else
					<whammy_hold_count> = 0
					if (<input_spawned> = 0)
						jam_record_input \{step_record = 1
							show_box = 0}
						spawnscriptnow id = <input_spawn> jam_step_wait
						<input_spawned> = 1
						clean_up_user_control_helpers
						jam_recording_add_user_control_helpers \{state = step_recording}
					endif
					if ScreenElementExists \{id = jam_studio_element}
						if NOT ScriptIsRunning \{show_warning_message}
							jam_studio_element :SetProps \{dialog_text = qs(0x95b3eb24)}
						endif
					endif
				endif
			endif
		endif
	endif
	if has_lefty_adj_control_press Dir = up controller = <controller> player = $jam_current_recording_player
		if (<mid_up_strum> = 0)
			if (<input_spawned> = 0)
				GhMix_Pad_Up_Down
				jam_highway_skip_forwards
			endif
		endif
		<mid_up_strum> = (<mid_up_strum> + 1)
		if (<input_spawned> = 0)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		endif
	else
		if (<jam_instrument> = 2 && <mid_up_strum> > 0 && ($bass_kit_mode) > 0)
			StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		endif
		<mid_up_strum> = 0
	endif
	if (<jam_instrument> != 4 || <input_spawned> = 0)
		if has_lefty_adj_control_press Dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				if (<input_spawned> = 0)
					GhMix_Pad_Up_Down
					jam_highway_skip_backwards
				endif
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<input_spawned> = 0)
				if (<mid_down_strum> > $jam_select_area_wait)
					<mid_down_strum> = 0
				endif
			endif
		else
			if (<jam_instrument> = 2 && <mid_down_strum> > 0 && ($bass_kit_mode) > 0)
				StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
			endif
			<mid_down_strum> = 0
		endif
	else
		if IsSoundPlayingByID ($jam_input_current_melody)
			if (<curr_playing_id> = ($jam_input_current_melody))
				<mid_down_strum> = (<mid_down_strum> + 1)
			else
				<curr_playing_id> = ($jam_input_current_melody)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if (<mid_up_strum> = 0 && <mid_down_strum> = 0)
		killspawnedscript \{name = jam_sustain_step}
	endif
	if (<mid_up_strum> > <wait_before_sustain>)
		if NOT ScriptIsRunning \{jam_sustain_step}
			<old_quantize> = $jam_current_quantize
			spawnscriptnow jam_sustain_step params = {old_quantize = <old_quantize>}
		endif
	elseif (<mid_down_strum> > <wait_before_sustain>)
		if NOT ScriptIsRunning \{jam_sustain_step}
			<old_quantize> = $jam_current_quantize
			if (<whammy_hold_count> > 3)
				spawnscriptnow jam_sustain_step params = {old_quantize = <old_quantize> Dir = backwards}
			else
				spawnscriptnow jam_sustain_step params = {old_quantize = <old_quantize>}
			endif
		endif
	endif
	<done> = 0
	if ControllerMake start <controller>
		<done> = 1
	elseif ($jam_tutorial_status = section_done)
		<done> = 1
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		<done> = 1
	endif
	if (<done> = 1)
		FormatText checksumname = msg_box 'jam_limit_msg_box_%a' a = ($jam_current_recording_player)
		if ScreenElementExists id = <msg_box>
			DestroyScreenElement id = <msg_box>
		endif
		if (<jam_instrument> = 4)
			jam_input_melody_stop_sound
		endif
		SoundEvent \{event = GHMix_Select}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	spawnscriptnow \{id = jam_recording_spawns
		remove_jam_helper_box}
	printf \{channel = jam_mode
		qs(0x2063829b)}
	broadcastevent \{type = ghmix_stop_step}
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_percussion_box}
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_arpeggiator_box}
	killspawnedscript \{name = jam_play_arpeggiator_loop}
	killspawnedscript \{name = jam_play_drum_loop}
	jam_stop_all_sound
	killspawnedscript \{name = jam_lightup_held_note_sprites}
	killspawnedscript \{name = jam_studio_tilt_meter}
	jam_studio_hide_tilt_meter
	jam_hide_all_held_note_sprites player = ($jam_current_recording_player)
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	LegacyDoScreenElementMorph id = <resolved_id> time = 0.2 rot_angle = 0
	jam_input_destroy_player_server player = ($jam_current_recording_player)
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	killspawnedscript id = <input_spawn>
	killspawnedscript \{name = jam_step_wait}
	killspawnedscript \{id = jam_input_spawns}
	jam_kill_update_note_length player = ($jam_current_recording_player)
	LaunchEvent \{type = focus
		target = jam_control_container}
	if ScreenElementExists \{id = control_record}
		SetScreenElementProps \{id = control_record
			alpha = 1}
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	Change \{jam_highway_recording = 0}
	Change \{jam_highway_step_recording = 0}
	Change \{no_precise_snap = 0}
	Change \{no_marker_snap = 0}
endscript

script show_jam_helper_box \{Title = qs(0x62c3095f)
		text = qs(0x5449d8c0)}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_title_text = <Title>
	endif
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_text = <text>
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps Pos = (195.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps Pos = (195.0, -13.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
endscript

script jam_step_wait 
	begin
	Block \{type = jam_note_hit}
	wait \{4
		gameframes}
	jam_highway_skip_forwards
	repeat
endscript

script remove_jam_helper_box 
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps Pos = (5.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
endscript

script jam_sustain_step \{Dir = forwards}
	quantize_to = ($jam_quantize [6].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	wait ((<quantize> / ((1.0 / 60.0) * 1000)) * 2) gameframes
	Change \{jam_current_quantize = 6}
	if (<Dir> = forwards)
		jam_highway_skip_forwards
	else
		jam_highway_skip_backwards
	endif
	Change jam_current_quantize = <old_quantize>
endscript

script jam_highway_user_skip \{forwards = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	GetPlayerInfo ($jam_current_recording_player) controller
	GetEnterButtonAssignment
	choose_button = <assignment>
	mid_button_press = 0
	begin
	if ControllerPressed <choose_button> <controller>
		if (<mid_button_press> = 0)
			if (<forwards> = 1)
				jam_highway_skip_forwards
			else
				jam_highway_skip_backwards
			endif
		endif
		<mid_button_press> = (<mid_button_press> + 1)
		if (<mid_button_press> > $jam_skip_wait)
			<mid_button_press> = 0
		endif
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script jam_highway_skip_forwards 
	GetScreenElementPosition \{id = jam_highway_container}
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	if NOT StructureContains structure = ($jam_quantize [$jam_current_quantize]) marker
		get_next_snap_time time = ($jam_highway_play_time) snap = ($jam_quantize [$jam_current_quantize].value)
		new_time = <snap_time>
		if GotParam \{amount}
			<new_time> = ($jam_highway_play_time + <amount>)
			CastToInteger \{new_time}
		endif
	else
		song = editable
		suffix = '_jam_markers'
		AppendSuffixToChecksum base = <song> SuffixString = <suffix>
		song_jam_markers = <appended_id>
		suffix = '_size'
		AppendSuffixToChecksum base = <song_jam_markers> SuffixString = <suffix>
		<jam_markers_size> = <appended_id>
		new_time = $jam_highway_play_time
		count = 0
		begin
		if (($<jam_markers_size>) = 0)
			break
		endif
		curr_time = ($<song_jam_markers> [<count>].time)
		if (<curr_time> > $jam_highway_play_time)
			<new_time> = <curr_time>
			break
		endif
		<count> = (<count> + 1)
		if (<count> > (($<jam_markers_size>) - 1))
			break
		endif
		repeat
	endif
	new_pos = ($jam_highway_play_line_pos - ((<new_time> / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] < <end_pos> [0])
		jam_highway_move_end
	else
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_low_bound + (<new_time> - $jam_highway_play_time))
		<new_high_bound> = ($jam_highway_high_bound + (<new_time> - $jam_highway_play_time))
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		Change jam_highway_low_bound = <new_low_bound>
		Change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		if ($jam_highway_recording_mode = 0)
			begin_jam_song \{Pause = 1}
		endif
		Change jam_highway_play_time = <new_time>
		play_time = $jam_highway_play_time
		CastToInteger \{play_time}
		SetSeekPosition_Song position = <play_time>
	endif
endscript

script jam_highway_skip_backwards 
	GetScreenElementPosition \{id = jam_highway_container}
	if NOT StructureContains structure = ($jam_quantize [$jam_current_quantize]) marker
		get_prev_snap_time time = ($jam_highway_play_time) snap = ($jam_quantize [$jam_current_quantize].value)
		new_time = <snap_time>
		if GotParam \{amount}
			<new_time> = ($jam_highway_play_time + <amount>)
			CastToInteger \{new_time}
		endif
	else
		song = editable
		suffix = '_jam_markers'
		AppendSuffixToChecksum base = <song> SuffixString = <suffix>
		song_jam_markers = <appended_id>
		suffix = '_size'
		AppendSuffixToChecksum base = <song_jam_markers> SuffixString = <suffix>
		<jam_markers_size> = <appended_id>
		new_time = $jam_highway_play_time
		count = (($<jam_markers_size>) - 1)
		begin
		if (($<jam_markers_size>) = 0)
			break
		endif
		curr_time = ($<song_jam_markers> [<count>].time)
		if (<curr_time> < $jam_highway_play_time)
			<new_time> = <curr_time>
			break
		endif
		<count> = (<count> - 1)
		if (<count> < 0)
			break
		endif
		repeat
	endif
	new_pos = ($jam_highway_play_line_pos - ((<new_time> / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] > $jam_highway_play_line_pos [0])
		jam_highway_move_beginning
	else
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<low_bound> = ($jam_highway_low_bound - ($jam_highway_play_time - <new_time>))
		<high_bound> = ($jam_highway_high_bound - ($jam_highway_play_time - <new_time>))
		CastToInteger \{low_bound}
		CastToInteger \{high_bound}
		Change jam_highway_low_bound = <low_bound>
		Change jam_highway_high_bound = <high_bound>
		jam_highway_reinit
		if ($jam_highway_recording_mode = 0)
			begin_jam_song \{Pause = 1}
		endif
		Change jam_highway_play_time = <new_time>
		play_time = $jam_highway_play_time
		CastToInteger \{play_time}
		SetSeekPosition_Song position = <play_time>
	endif
endscript

script jam_highway_delete_section 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	delete_controls = [delete delete_toggle select cancel]
	tool_controls = []
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = delete}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	delete_bound_low = 0
	delete_bound_high = 0
	mid_up_strum = 0
	mid_down_strum = 0
	delete_all = 0
	count = 0
	done = 0
	cancel = 0
	GetPlayerInfo ($jam_current_recording_player) controller
	if IsPS3
		<delete_button> = square
	elseif IsXenonOrWinDX
		<delete_button> = triangle
	endif
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	if ControllerMake <break_button> <controller>
		if ArrayContains array = <delete_controls> contains = cancel
			<cancel> = 1
			break
		endif
	elseif ControllerMake start <controller>
		if ArrayContains array = <delete_controls> contains = delete
			<done> = 1
		endif
	endif
	if (<done> = 1)
		SoundEvent \{event = Enter_Band_Name_Back}
		if ($jam_highway_play_time < <orig_start_time>)
			<delete_bound_low> = $jam_highway_play_time
			<delete_bound_high> = <orig_start_time>
		elseif ($jam_highway_play_time > <orig_start_time>)
			<delete_bound_low> = <orig_start_time>
			<delete_bound_high> = $jam_highway_play_time
		elseif ($jam_highway_play_time = <orig_start_time>)
			<delete_bound_low> = (<orig_start_time> -50)
			<delete_bound_high> = (($jam_highway_play_time) + 50)
		endif
		break
	endif
	if ArrayContains array = <delete_controls> contains = select
		if has_lefty_adj_control_press Dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				GHMix_scroll \{adv_record}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				GHMix_scroll \{adv_record}
				jam_highway_skip_backwards
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > $jam_select_area_wait)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if ArrayContains array = <delete_controls> contains = delete_toggle
		if ControllerMake <delete_button> <controller>
			SoundEvent \{event = GHMix_Select}
			clean_up_user_control_helpers
			if (<delete_all> = 1)
				<delete_all> = 0
				jam_recording_add_user_control_helpers \{state = delete}
			else
				<delete_all> = 1
				jam_recording_add_user_control_helpers \{state = delete
					delete_one}
			endif
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	if (<delete_all> = 1)
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_delete_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 650.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_delete_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	wait \{1
		gameframe}
	repeat
	CastToInteger \{delete_bound_high}
	CastToInteger \{delete_bound_low}
	if NOT (<cancel> = 1)
		if NOT (<delete_bound_low> = <delete_bound_high>)
			if (<delete_all> = 1)
				GetArraySize \{$jam_tracks}
				track_count = 0
				begin
				DeleteCustomNoteRange track = ($jam_tracks [<track_count>].id) low_bound = <delete_bound_low> high_bound = <delete_bound_high>
				<track_count> = (<track_count> + 1)
				repeat <array_size>
			else
				DeleteCustomNoteRange track = ($jam_tracks [($jam_current_track)].id) low_bound = <delete_bound_low> high_bound = <delete_bound_high>
			endif
		endif
	else
		GhMix_Pad_Back_Sound
	endif
	jam_highway_reinit
	broadcastevent \{type = ghmix_delete_done}
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	LaunchEvent \{type = focus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
endscript
jam_copy_bound_low = 0
jam_copy_bound_high = 0

script jam_highway_copy 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = copy}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	GetPlayerInfo ($jam_current_recording_player) controller
	if IsPS3
		<copy_button> = square
		<loop_copy_button> = triangle
	elseif IsXenonOrWinDX
		<copy_button> = triangle
		<loop_copy_button> = square
	endif
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	mid_up_strum = 0
	mid_down_strum = 0
	copy_all = 0
	count = 0
	done = 0
	copy_controls = [copy copy_toggle cancel Strum]
	tool_controls = []
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	if ControllerMake <break_button> <controller>
		if ArrayContains array = <copy_controls> contains = cancel
			GhMix_Pad_Back_Sound
			break
		endif
	endif
	if ControllerMake start <controller>
		if ArrayContains array = <copy_controls> contains = copy
			<done> = 1
		endif
	endif
	if (<done> = 1)
		SoundEvent \{event = GHMix_Select}
		if NOT ($jam_highway_play_time = <orig_start_time>)
			if ($jam_highway_play_time < <orig_start_time>)
				Change jam_copy_bound_low = ($jam_highway_play_time)
				Change jam_copy_bound_high = (<orig_start_time>)
			else
				Change jam_copy_bound_low = (<orig_start_time>)
				Change jam_copy_bound_high = ($jam_highway_play_time)
			endif
			SetScreenElementProps \{id = control_paste
				rgba = [
					255
					255
					255
					255
				]}
		endif
		break
	endif
	if ArrayContains array = <copy_controls> contains = Strum
		step_strum = 0
		if has_lefty_adj_control_press Dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				GHMix_scroll \{adv_record}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				GHMix_scroll \{adv_record}
				jam_highway_skip_backwards
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > $jam_select_area_wait)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if ArrayContains array = <copy_controls> contains = copy_toggle
		if ControllerMake <copy_button> <controller>
			SoundEvent \{event = GHMix_Select}
			clean_up_user_control_helpers
			if (<copy_all> = 1)
				<copy_all> = 0
				jam_recording_add_user_control_helpers \{state = copy}
			else
				<copy_all> = 1
				jam_recording_add_user_control_helpers \{state = copy
					copy_one}
			endif
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = jam_copy_highlight}
		DestroyScreenElement \{id = jam_copy_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	if (<copy_all> = 1)
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_copy_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 650.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_copy_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	endif
	if ControllerMake <loop_copy_button> <controller>
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			Change jam_copy_bound_low = ($jam_loop_bound_low)
			Change jam_copy_bound_high = ($jam_loop_bound_high)
			SetScreenElementProps \{id = control_paste
				rgba = [
					255
					255
					255
					255
				]}
			break
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_clear_clipboards
	broadcastevent \{type = ghmix_stop_copy}
	if (<copy_all> = 1)
		GetArraySize \{$jam_tracks}
		track_count = 0
		begin
		CopyCustomNoteRange track = ($jam_tracks [<track_count>].id) low_bound = ($jam_copy_bound_low) high_bound = ($jam_copy_bound_high) debug
		<track_count> = (<track_count> + 1)
		repeat <array_size>
	else
		CopyCustomNoteRange track = ($jam_tracks [($jam_current_track)].id) low_bound = ($jam_copy_bound_low) high_bound = ($jam_copy_bound_high) debug
	endif
	if ScreenElementExists \{id = jam_copy_highlight}
		DestroyScreenElement \{id = jam_copy_highlight}
	endif
	LaunchEvent \{type = focus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
endscript

script jam_clear_clipboards 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	ClearTrackClipboard track = ($jam_tracks [<track_count>].id)
	<track_count> = (<track_count> + 1)
	repeat <array_size>
endscript

script jam_highway_paste_control 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	if ($jam_copy_bound_low = $jam_copy_bound_high)
		return
	endif
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = paste}
	wait \{5
		gameframes}
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	if IsXenonOrWinDX
		paste_multiple_button = triangle
	elseif IsPS3
		paste_multiple_button = square
	endif
	paste_controls = [paste_one paste_multi cancel]
	tool_controls = []
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	if ArrayContains array = <paste_controls> contains = paste_one
		if ControllerMake <choose_button> <controller>
			GHMix_scroll \{adv_record}
			jam_highway_paste
			printf \{channel = jam_mode
				qs(0x76c31916)}
			broadcastevent \{type = ghmix_paste_pasted}
		endif
	endif
	if ArrayContains array = <paste_controls> contains = paste_multi
		if ControllerMake <paste_multiple_button> <controller>
			SoundEvent \{event = GHMix_Select}
			show_paste_multiple
			return
		endif
	endif
	if ArrayContains array = <paste_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			GhMix_Pad_Back_Sound
			break
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	wait \{1
		gameframe}
	repeat
	broadcastevent \{type = ghmix_paste_done}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script show_paste_multiple 
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = paste_multiple}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{paste_number_text = qs(0x787beab2)}
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
		<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
		<resolved_id> :SetProps Pos = (468.0, 18.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	paste_count = 1
	delay = 8
	max_num_pastes = 20
	begin
	if ControllerMake <break_button>
		if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
			GhMix_Pad_Back_Sound
			<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.2
			<resolved_id> :SE_WaitProps
		endif
		clean_up_user_control_helpers
		jam_recording_add_user_control_helpers
		LaunchEvent \{type = focus
			target = jam_control_container}
		return
	endif
	if ControllerPressed up <controller>
		GHMix_scroll \{adv_record}
		<paste_count> = (<paste_count> + 1)
		if (<paste_count> > <max_num_pastes>)
			<paste_count> = <max_num_pastes>
		endif
		killspawnedscript \{name = scale_paste_arrows}
		spawnscriptnow \{scale_paste_arrows
			id = jam_recording_spawns
			params = {
				up
			}}
		wait <delay> frames
	endif
	if ControllerPressed down <controller>
		GHMix_scroll \{adv_record}
		<paste_count> = (<paste_count> - 1)
		if (<paste_count> < 1)
			<paste_count> = 1
		endif
		killspawnedscript \{name = scale_paste_arrows}
		spawnscriptnow \{scale_paste_arrows
			id = jam_recording_spawns
			params = {
				down
			}}
		wait <delay> frames
	endif
	FormatText TextName = loop_count_text qs(0x73307931) s = <paste_count>
	jam_studio_element :SetProps paste_number_text = <loop_count_text>
	if ControllerMake start <controller>
		SoundEvent \{event = GHMix_Select}
		break
	endif
	wait \{1
		gameframe}
	repeat
	FormatText TextName = paste_text qs(0x32176178) s = <paste_count>
	create_dialog_box {
		player_device = ($MemcardController)
		heading_text = qs(0xd7505531)
		body_text = <paste_text>
	}
	CreateScreenElement \{type = SpriteElement
		parent = dialog_box_container
		id = loading_record
		texture = load_record
		Pos = (640.0, 512.0)
		z_priority = 10000
		rot_angle = 0}
	dialog_box_container :Obj_SpawnScript \{jam_recording_animate_spinning_record}
	wait \{1
		second}
	count = 0
	begin
	if (<count> = (<paste_count> - 1))
		jam_highway_paste \{last_paste = 0}
	else
		jam_highway_paste \{last_paste = 1}
	endif
	wait \{1
		gameframe}
	<count> = (<count> + 1)
	repeat <paste_count>
	destroy_dialog_box
	if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
		<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script jam_recording_animate_spinning_record 
	if NOT ScreenElementExists \{id = loading_record}
		if ScreenElementExists \{id = dialog_box_container}
			CreateScreenElement \{type = SpriteElement
				parent = dialog_box_container
				id = loading_record
				texture = load_record
				Pos = (640.0, 585.0)
				z_priority = 10000
				rot_angle = 0}
		endif
	endif
	begin
	loading_record :SE_GetProps
	loading_record :SE_SetProps rot_angle = (<rot_angle> + 360) time = 1
	loading_record :SE_WaitProps
	repeat
endscript

script scale_paste_arrows 
	if GotParam \{up}
		jam_studio_element :SetProps \{paste_arrow_up_scale = 2.0}
		jam_studio_element :SetProps \{paste_arrow_up_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
	if GotParam \{down}
		jam_studio_element :SetProps \{paste_arrow_down_scale = 2.0}
		jam_studio_element :SetProps \{paste_arrow_down_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
endscript

script jam_highway_paste \{last_paste = 1}
	GetArraySize \{$jam_tracks}
	copy_count = 0
	track_count = 0
	begin
	AppendSuffixToChecksum base = ($jam_tracks [<track_count>].id) SuffixString = '_clipboard'
	GetTrackSize track = <appended_id>
	if (<track_size> > 0)
		<copy_count> = (<copy_count> + 1)
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
	if (<copy_count> > 1)
		track_count = 0
		begin
		jam_paste_track track = <track_count>
		<track_count> = (<track_count> + 1)
		repeat <array_size>
	else
		jam_paste_track \{track = $jam_current_track}
	endif
	jam_highway_skip_forwards amount = ($jam_copy_bound_high - $jam_copy_bound_low)
	if (<last_paste> = 1)
		jam_show_paste_highlight
	endif
endscript

script jam_paste_track 
	PasteTrackClipboard {
		track = ($jam_tracks [<track>].id)
		low_bound = ($jam_copy_bound_low)
		high_bound = ($jam_copy_bound_high)
		time = ($jam_highway_play_time)
		debug
	}
	if (<paste_index> > 0)
		if GetCustomNote track = ($jam_tracks [($jam_current_track)].id) index = (<paste_index> - 1)
			musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 32.0)
			if ((<note_time> + <note_length>) > (<paste_time> - <note_quantize_ms>))
				new_note_length = ((<paste_time> - <note_quantize_ms>) - <note_time>)
				CastToInteger \{new_note_length}
				UpdateCustomNote track = ($jam_tracks [($jam_current_track)].id) index = (<paste_index> - 1) length = <new_note_length>
			endif
		endif
	endif
endscript

script jam_show_paste_highlight 
	if ($jam_copy_bound_low = $jam_copy_bound_high)
		return
	endif
	GetArraySize \{$jam_tracks}
	copy_count = 0
	track_count = 0
	begin
	AppendSuffixToChecksum base = ($jam_tracks [<track_count>].id) SuffixString = '_clipboard'
	GetTrackSize track = <appended_id>
	if (<track_size> > 0)
		<copy_count> = (<copy_count> + 1)
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	highlight_low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	highlight_high_pos = ((($jam_highway_play_time + <copy_size>) / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = jam_paste_highlight}
		DestroyScreenElement \{id = jam_paste_highlight}
	endif
	if (<copy_count> > 1)
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_paste_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_low_pos> + (0.0, 55.0))
			dims = ((0.0, 650.0) + ((1.0, 0.0) * (<highlight_high_pos> [0] - <highlight_low_pos> [0])))
			z_priority = 10
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_paste_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_low_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<highlight_high_pos> [0] - <highlight_low_pos> [0])))
			z_priority = 10
		}
	endif
endscript

script jam_highway_note_nudge 
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	nudge_controls = [nudge nudge_all cancel direction_swap]
	tool_controls = []
	nudge_direction = 1
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	track = ($jam_tracks [$jam_current_track].id)
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = nudge_forward}
	wait \{5
		gameframes}
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	if IsXenonOrWinDX
		nudge_all_button = triangle
		swap_dir_button = square
	elseif IsPS3
		nudge_all_button = square
		swap_dir_button = triangle
	endif
	begin
	if ($game_mode = practice)
		jam_studio_element :GetTags
	endif
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = ($jam_quantize [$jam_current_quantize].value)
	if NOT ($jam_current_quantize = 0)
		if ArrayContains array = <nudge_controls> contains = nudge
			if ControllerMake <choose_button> <controller>
				SoundEvent \{event = GhMix_Scroll_Up_Down}
				if CustomNoteNudge time = ($jam_highway_play_time) nudge = <note_quantize_ms> song_length = ($jam_highway_song_length) track = <track> direction = <nudge_direction>
					if (<nudge_direction> > 0)
						jam_highway_skip_forwards amount = <note_quantize_ms>
					else
						jam_highway_skip_backwards amount = <note_quantize_ms>
					endif
					wait \{1
						gameframe}
				else
					killspawnedscript \{name = show_warning_message}
					spawnscriptnow \{show_warning_message
						id = jam_recording_spawns
						params = {
							warning_text = qs(0xf4ef3a8c)
						}}
				endif
			endif
		endif
		if ArrayContains array = <nudge_controls> contains = nudge_all
			if ControllerMake <nudge_all_button> <controller>
				SoundEvent \{event = GhMix_Scroll_Up_Down}
				if CustomNoteNudge time = ($jam_highway_play_time) nudge = <note_quantize_ms> song_length = ($jam_highway_song_length) track = <track> direction = <nudge_direction> all
					if (<nudge_direction> > 0)
						jam_highway_skip_forwards amount = <note_quantize_ms>
					else
						jam_highway_skip_backwards amount = <note_quantize_ms>
					endif
					wait \{1
						gameframe}
				endif
			endif
		endif
	endif
	if ArrayContains array = <nudge_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			GhMix_Pad_Back_Sound
			break
		endif
	endif
	if ArrayContains array = <nudge_controls> contains = direction_swap
		if ControllerMake <swap_dir_button> <controller>
			nudge_direction = (<nudge_direction> * -1)
			clean_up_user_control_helpers
			if (<nudge_direction> > 0)
				jam_recording_add_user_control_helpers \{state = nudge_forward}
			else
				jam_recording_add_user_control_helpers \{state = nudge_backward}
			endif
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	wait \{1
		gameframe}
	repeat
	broadcastevent \{type = ghmix_stop_nudge}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = focus
		target = jam_control_container}
	Change \{no_precise_snap = 0}
	Change \{no_marker_snap = 0}
endscript

script show_warning_message \{warning_text = qs(0x361603ec)
		start_pos = (21.0, 800.0)
		end_pos = (21.0, -94.0)}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{dialog_title_text = qs(0xaa163738)}
	endif
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_text = <warning_text>
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps Pos = <start_pos> time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps Pos = <end_pos> time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	wait \{3
		seconds}
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps Pos = <start_pos> time = 0.2
		<resolved_id> :SE_WaitProps
	endif
endscript

script initialize_jam_highway 
	seconds_per_screen = ((720.0 / $jam_highway_pixels_per_second [1]) * 1000)
	Change \{jam_highway_start_low_bound = -1250}
	Change \{jam_highway_start_high_bound = 1250}
	<new_low_bound> = ($jam_highway_start_low_bound)
	<new_high_bound> = ($jam_highway_start_high_bound)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	Change jam_highway_low_bound = <new_low_bound>
	Change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
endscript
jam_highway_low_bound = 0.0
jam_highway_high_bound = 0.0
jam_highway_start_low_bound = -800.0
jam_highway_start_high_bound = 1250.0
jam_highway_end_time = 0.0
jam_highway_pixels_per_second = (0.0, 250.0)
start_at_index_bars = 0
start_at_index_markers = 0
jam_highway_hammer_on_tolerance = 0
jam_highway_play_time = 0
jam_highway_rotation = -90
jam_highway_play_line_pos_master = (450.0, 389.0)
jam_highway_play_line_pos = (0.0, 0.0)

script jam_recording_switch_instrument 
	spawnscriptnow \{fade_out_note_text}
	player = ($jam_current_recording_player)
	GetPlayerInfo <player> controller
	if isdrumcontroller controller = <controller>
		spawnscriptnow \{show_warning_message
			id = jam_recording_spawns
			params = {
				warning_text = qs(0x955f2115)
			}}
		return
	endif
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	StopRendering
	Change \{jam_copy_bound_low = 0}
	Change \{jam_copy_bound_high = 0}
	jam_input_melody_stop_sound
	jam_clear_clipboards
	if ScreenElementExists \{id = jam_highway_container_master}
		DestroyScreenElement \{id = jam_highway_container_master}
	endif
	killspawnedscript \{name = create_jam_highway_notetrack}
	killspawnedscript \{name = create_jam_highway_fretbars}
	GetArraySize \{$jam_tracks}
	if ($jam_current_track = (<array_size> - 1))
		Change \{jam_current_track = 0}
	else
		Change jam_current_track = ($jam_current_track + 1)
	endif
	SetPlayerInfo <player> jam_instrument = ($jam_current_track)
	create_studio_now_bar
	jam_highway_reinit
	spawnscriptnow \{create_jam_multiple_highways
		id = jam_recording_spawns
		params = {
			song = editable
		}}
	new_pos = ($jam_highway_play_line_pos - (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
	<new_low_bound> = ($jam_highway_play_time + $jam_highway_start_low_bound)
	<new_high_bound> = ($jam_highway_play_time + $jam_highway_start_high_bound)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	Change jam_highway_low_bound = <new_low_bound>
	Change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
	wait \{10
		gameframes}
	StartRendering
	spawnscriptnow \{id = jam_recording_spawns
		jam_ghmix_show_scale_reference}
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script jam_highway_reinit 
	Change \{start_at_index_bars = 0}
	Change \{start_at_index_markers = 0}
	musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
	<main_player> :MusicStudioPlayer_GetInstrument
	<main_player> :MusicStudioPlayer_GetPlayerIndex
	GetPlayerInfo <player> lefty_flip
	GetArraySize ($jam_tracks)
	index = 0
	begin
	musicstudio_mainobj :MusicStudioHighway_Reinit lefty = <lefty_flip> jam_instrument = <index>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script create_jam_multiple_highways 
	z_priority = 5
	ResolveScreenElementID \{id = jam_studio_element}
	if ScreenElementExists \{id = highway_window_element}
		DestroyScreenElement \{id = highway_window_element}
	endif
	CreateScreenElement \{type = WindowElement
		parent = jam_studio_element
		id = highway_window_element
		Pos = (394.0, 115.0)
		dims = (717.0, 482.0)}
	CreateScreenElement {
		type = ContainerElement
		parent = highway_window_element
		id = jam_highway_container_master
		just = [center center]
		Pos = ($jam_highway_play_line_pos_master - (437.0, 96.0))
		scale = 1
		rot_angle = $jam_highway_rotation
	}
	CreateScreenElement \{type = ContainerElement
		parent = jam_highway_container_master
		id = jam_highway_container
		Pos = $jam_highway_play_line_pos
		scale = 1}
	initialize_jam_highway
	suffix = '_fretbars'
	AppendSuffixToChecksum base = <song> SuffixString = <suffix>
	song_fretbars = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum base = <song_fretbars> SuffixString = <suffix>
	fretbar_size = <appended_id>
	suffix = '_timesig'
	AppendSuffixToChecksum base = <song> SuffixString = <suffix>
	song_timesig = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum base = <song_timesig> SuffixString = <suffix>
	timesig_size = <appended_id>
	suffix = '_jam_markers'
	AppendSuffixToChecksum base = <song> SuffixString = <suffix>
	song_jam_markers = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum base = <song_jam_markers> SuffixString = <suffix>
	<jam_markers_size> = <appended_id>
	bar_size = ((($<song_fretbars> [(($<fretbar_size>) - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		texture = white
		just = [left top]
		rgba = [80 80 80 255]
		Pos = (0.0, 56.0)
		dims = ((0.0, 680.0) + <bar_size>)
		z_priority = <z_priority>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		texture = white
		just = [left top]
		rgba = [60 60 60 255]
		Pos = (0.0, 240.0)
		dims = ((0.0, 680.0) + <bar_size>)
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement \{parent = jam_highway_container
		id = loop_start_marker
		type = DescInterface
		Pos = (0.0, -1000.0)
		rot_angle = 90
		desc = 'jam_loop_marker'}
	loop_start_marker :SetProps \{loop_text = qs(0x3d20eae5)}
	CreateScreenElement \{parent = jam_highway_container
		id = loop_end_marker
		type = DescInterface
		Pos = (0.0, -1000.0)
		rot_angle = 90
		desc = 'jam_loop_marker'}
	loop_end_marker :SetProps \{loop_text = qs(0x3feb20d0)}
	Change jam_highway_end_time = ($<song_fretbars> [($<fretbar_size> - 1)])
	spawnscriptnow create_jam_highway_fretbars id = jam_recording_spawns params = {<...>}
	if jam_studio_element :Desc_ResolveAlias \{name = alias_main_inst_text}
		<resolved_id> :SE_SetProps text = ($jam_tracks [$jam_current_track].name_text)
	endif
	spawnscriptnow \{create_jam_highway_notetrack
		id = jam_recording_spawns
		params = {
			jam_instrument = $jam_current_track
			Pos = (0.0, 0.0)
			gem_offset = (0.0, 32.0)
			gem_scale = 0.8
		}}
	GetArraySize \{$jam_tracks}
	<small_gems_begin_pos> = (0.0, 192.0)
	track = ($jam_current_track + 1)
	<count> = 1
	begin
	if (<track> > (<array_size> - 1))
		<track> = 0
	endif
	spawnscriptnow create_jam_highway_notetrack id = jam_recording_spawns params = {jam_instrument = <track> Pos = <small_gems_begin_pos> gem_offset = (0.0, 20.0) gem_scale = 0.55 small_view = 1}
	FormatText checksumname = alias_id 'alias_inst_text%s' s = <count>
	if jam_studio_element :Desc_ResolveAlias name = <alias_id>
		<resolved_id> :SE_SetProps text = ($jam_tracks [<track>].name_text)
	endif
	<small_gems_begin_pos> = (<small_gems_begin_pos> + (0.0, 115.5))
	<track> = (<track> + 1)
	<count> = (<count> + 1)
	repeat (<array_size> - 1)
endscript

script create_jam_highway_fretbars 
	<whole_measure_dims> = (7.0, 680.0)
	<quarter_measure_dims> = (4.0, 680.0)
	<bar_offset> = (0.0, 58.0)
	begin
	if ScreenElementExists \{id = jam_highway_bars_container}
		DestroyScreenElement \{id = jam_highway_bars_container}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = jam_highway_container
		id = jam_highway_bars_container
		Pos = (0.0, 0.0)}
	loop_offset = (22.0, 268.0)
	if ($jam_loop_bound_low < 0)
		loop_marker_pos = (0.0, -1000.0)
	else
		loop_marker_pos = (((($jam_loop_bound_low) / 1000.0) * $jam_highway_pixels_per_second) + <loop_offset>)
	endif
	if ScreenElementExists \{id = loop_start_marker}
		loop_start_marker :SetProps Pos = <loop_marker_pos>
	endif
	if ($jam_loop_bound_high < 0)
		loop_marker_pos = (0.0, -1000.0)
	else
		loop_marker_pos = (((($jam_loop_bound_high) / 1000.0) * $jam_highway_pixels_per_second) + <loop_offset>)
	endif
	if ScreenElementExists \{id = loop_start_marker}
		loop_end_marker :SetProps Pos = <loop_marker_pos>
	endif
	count = $start_at_index_markers
	begin
	if (($<jam_markers_size>) = 0)
		break
	endif
	curr_time = ($<song_jam_markers> [<count>].time)
	if (<curr_time> > $jam_highway_high_bound)
		break
	endif
	curr_marker_name = ($<song_jam_markers> [<count>].marker_name)
	curr_marker_count = ($<song_jam_markers> [<count>].marker_count)
	curr_bpm = ($<song_jam_markers> [<count>].bpm)
	curr_marker_lightshow = ($<song_jam_markers> [<count>].LightShow)
	if (<curr_time> < $jam_highway_low_bound)
		Change start_at_index_markers = <count>
	else
		<marker_offset> = (28.0, 395.0)
		<marker_pos> = (((<curr_time> / 1000.0) * $jam_highway_pixels_per_second) + <marker_offset>)
		if (<curr_marker_count> > 0)
			FormatText TextName = marker qs(0x40e7ccd5) s = <curr_marker_name> c = <curr_marker_count> b = ($jam_lightshow [<curr_marker_lightshow>].name_text)
		else
			FormatText TextName = marker qs(0x54c9fe18) s = <curr_marker_name> b = ($jam_lightshow [<curr_marker_lightshow>].name_text)
		endif
		CreateScreenElement {
			parent = jam_highway_bars_container
			type = DescInterface
			Pos = <marker_pos>
			rot_angle = 90
			desc = 'jam_marker'
		}
		<id> :SetProps marker_text = <marker>
	endif
	<count> = (<count> + 1)
	if (<count> > (($<jam_markers_size>) - 1))
		break
	endif
	repeat
	count = $start_at_index_bars
	begin
	curr_time = ($<song_fretbars> [<count>])
	if (<curr_time> > $jam_highway_high_bound)
		break
	endif
	song_beat_time = 0
	note_len = 0
	if ((<count> + 1) <= ($<fretbar_size> - 1))
		song_beat_time = ($<song_fretbars> [(<count> + 1)] - $<song_fretbars> [<count>])
		note_len = (4 / 4)
		Change jam_highway_hammer_on_tolerance = ((<song_beat_time> / $default_hammer_on_measure_scale) * <note_len>)
	endif
	if (<curr_time> >= $jam_highway_low_bound)
		bar_pos = ((($<song_fretbars> [<count>]) / 1000.0) * $jam_highway_pixels_per_second)
		Mod a = <count> b = 4
		if (<Mod> = 0)
			CreateScreenElement {
				type = SpriteElement
				parent = jam_highway_bars_container
				texture = white
				just = [center top]
				rgba = ($jam_highway_measurebar_color)
				Pos = (<bar_pos> + <bar_offset>)
				dims = <whole_measure_dims>
				z_priority = 7
			}
		else
			CreateScreenElement {
				type = SpriteElement
				parent = jam_highway_bars_container
				texture = white
				just = [center top]
				rgba = ($jam_highway_fretbar_color)
				Pos = (<bar_pos> + <bar_offset>)
				dims = <quarter_measure_dims>
				z_priority = 7
			}
		endif
		if (<Mod> = 0)
			if (<count> = ($<fretbar_size> - 1))
				FormatText \{TextName = marker
					qs(0xfe76608c)}
			else
				FormatText TextName = marker qs(0x73307931) s = ((<count> / 4) + 1)
			endif
			CreateScreenElement {
				type = TextElement
				parent = jam_highway_bars_container
				font = fontgrid_text_A1
				just = [center center]
				scale = 0.6
				rgba = [220 220 220 255]
				Pos = ((<bar_pos>) + (1.0, 14.0))
				text = <marker>
				rot_angle = (($jam_highway_rotation) * -1)
				z_priority = 14
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		endif
	else
		Change start_at_index_bars = <count>
	endif
	<count> = (<count> + 1)
	if (<count> > ($<fretbar_size> - 1))
		break
	endif
	repeat
	if ($jam_highway_playing = 1)
		wait \{5
			gameframes}
	else
		wait \{5
			gameframes}
	endif
	repeat
endscript

script cleanup_jam_highway_notetrack 
	musicstudio_mainobj :MusicStudioHighway_Cleanup jam_instrument = <jam_instrument>
endscript

script create_jam_highway_notetrack \{small_view = 0}
	OnExitRun cleanup_jam_highway_notetrack params = {jam_instrument = <jam_instrument>}
	FormatText checksumname = notetrack_cont 'jam_highway_notetrack_containter_%s' s = <jam_instrument>
	<Drum> = 0
	GetPlayerInfo \{$jam_current_recording_player
		controller}
	if isdrumcontroller controller = <controller>
		<Drum> = 1
	endif
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	if (<Drum> = 1)
		<lefty> = 0
		<gem_textures> = [
			{
				texture = red_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = yellow_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = blue_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = orange_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = green_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = kick_bar_purple
				dims = (256.0, 32.0)
			}
		]
	else
		<gem_textures> = [
			{
				texture = green_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = red_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = yellow_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = blue_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = orange_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = kick_bar_purple
				dims = (256.0, 32.0)
			}
		]
	endif
	if ScreenElementExists id = <notetrack_cont>
		DestroyScreenElement id = <notetrack_cont>
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = jam_highway_container
		id = <notetrack_cont>
		Pos = <Pos>
	}
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 8.0)
	sustain_min = <note_quantize_ms>
	CastToInteger \{sustain_min}
	musicstudio_mainobj :MusicStudioHighway_Init {
		jam_instrument = <jam_instrument>
		track = ($jam_tracks [<jam_instrument>].id)
		container = <notetrack_cont>
		gem_textures = <gem_textures>
		lefty = <lefty>
		small_view = <small_view>
		controller = <controller>
		gem_offset = <gem_offset>
		gem_scale = <gem_scale>
		sustain_min = <sustain_min>
	}
	begin
	musicstudio_mainobj :MusicStudioHighway_Update jam_instrument = <jam_instrument>
	wait \{1
		gameframes}
	repeat
endscript

script jam_create_song_info_boxes 
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = studio_highway_infobox
		texture = white
		just = [right top]
		rgba = [50 50 50 255]
		dims = (510.0, 120.0)
		Pos = (0.0, 510.0)
		scale = 1
		rot_angle = 90
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_name
		font = fontgrid_text_A1
		just = [left center]
		scale = 0.8
		rgba = [210 130 0 250]
		Pos = (35.0, 35.0)
		text = ($jam_selected_song)
		z_priority = (<z_priority> + 1)
	}
	<count> = 0
	<last_end_time> = 0
	<total_notes> = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	if (<notetrack_size> > 0)
		end_time = ($<gem_array> [(<notetrack_size> - 2)])
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
		<total_notes> = (<total_notes> + <notetrack_size>)
	endif
	<count> = (<count> + 1)
	repeat 4
	<total_notes> = (<total_notes> / 2)
	Mod a = <last_end_time> b = 60000
	<seconds> = (<Mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		FormatText TextName = song_len qs(0xb76f0df8) a = <minutes> b = <seconds>
	else
		FormatText TextName = song_len qs(0x84b9fd2b) a = <minutes> b = <seconds>
	endif
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_length
		font = fontgrid_text_A1
		just = [left center]
		scale = 0.6
		rgba = [210 130 0 250]
		Pos = (35.0, 85.0)
		text = <song_len>
		z_priority = (<z_priority> + 1)
	}
	FormatText TextName = song_bpm qs(0x3dbb8347) a = ($jam_current_bpm)
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_bpm
		font = fontgrid_text_A1
		just = [left center]
		scale = 0.6
		rgba = [210 130 0 250]
		Pos = (185.0, 85.0)
		text = <song_bpm>
		z_priority = (<z_priority> + 1)
	}
	FormatText TextName = num_notes qs(0xf939f6cb) a = <total_notes>
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_notes
		font = fontgrid_text_A1
		just = [left center]
		scale = 0.6
		rgba = [210 130 0 250]
		Pos = (300.0, 85.0)
		text = <num_notes>
		z_priority = (<z_priority> + 1)
	}
	bar_size = ((($<song_fretbars> [(<fretbar_size> - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = studio_highway_endbox
		texture = white
		just = [right top]
		rgba = [50 50 50 255]
		dims = (510.0, 370.0)
		Pos = ((370.0, 500.0) + <bar_size>)
		scale = 1
		rot_angle = 90
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_endbox
		font = fontgrid_text_A1
		just = [left center]
		scale = 2.2
		rgba = [210 130 0 250]
		Pos = (63.0, 270.0)
		text = qs(0x3a7145e5)
		z_priority = (<z_priority> + 1)
	}
endscript
jam_controls = [
	{
		id = control_end
		texture = icon_jump_end
		name_text = qs(0x2f3f8abc)
		help_text = qs(0x84422181)
	}
	{
		id = control_skip_forwards
		texture = icon_forward
		name_text = qs(0xef6d3166)
		help_text = qs(0x53b2408e)
	}
	{
		id = control_playstop
		texture = icon_play
		name_text = qs(0xcdaa4ea8)
		alt_name_text = qs(0x9dbd05c7)
		help_text = qs(0x28e3b51a)
	}
	{
		id = control_record
		texture = icon_record
		name_text = qs(0x66451271)
		help_text = qs(0x5a4c37a7)
	}
	{
		id = control_step_record
		texture = icon_step_record
		name_text = qs(0x1de48f0a)
		help_text = qs(0x4bb54cde)
	}
	{
		id = control_skip_backwards
		texture = icon_back
		name_text = qs(0x9c8914fd)
		help_text = qs(0x0692ba97)
	}
	{
		id = control_beginning
		texture = icon_jump_begin
		name_text = qs(0x54328aa0)
		help_text = qs(0x12fc9bf2)
	}
	{
		id = control_loop
		texture = icon_loop
		name_text = qs(0x5137d418)
		help_text = qs(0x77bc10b8)
	}
	{
		id = control_delete
		texture = icon_delete
		name_text = qs(0xa32bf91f)
		help_text = qs(0x1c37005c)
	}
	{
		id = control_copy
		texture = icon_copy
		name_text = qs(0x51af3a34)
		help_text = qs(0x3f4d7838)
	}
	{
		id = control_paste
		texture = icon_paste
		name_text = qs(0xc84166a2)
		help_text = qs(0x76509fc3)
	}
	{
		id = control_note_nudge
		texture = icon_nudge
		name_text = qs(0x9f5b93ea)
		help_text = qs(0xbcfb291f)
	}
	{
		id = control_marker
		texture = icon_add_marker
		name_text = qs(0x619cf5cd)
		alt_name_text = qs(0xbc4e8553)
		help_text = qs(0x8fe1dcc5)
	}
	{
		id = control_switch_instrument
		texture = icon_swap_instrument
		name_text = qs(0x6759cd0a)
		help_text = qs(0x8646efef)
	}
]
jam_control_offset = (0.0, 33.0)

script create_jam_control_bar 
	z_priority = 31
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = toolbar
			}
		}}
	CreateScreenElement {
		type = SpriteElement
		id = control_bg
		parent = <resolved_id>
		texture = highlighted_button
		just = [left top]
		rgba = [255 255 255 255]
		dims = (39.0, 39.0)
		rot_angle = -90
		Pos = ($jam_control_bar_offset)
		z_priority = (<z_priority> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		id = selection_arrow
		parent = <resolved_id>
		texture = selection_arrow
		just = [left top]
		rgba = [255 255 255 255]
		scale = 1
		Pos = (($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) + (25.0, -28.0))
		z_priority = (<z_priority> + 5)
	}
	GetPlayerInfo ($jam_current_recording_player) controller
	CreateScreenElement {
		type = ContainerElement
		parent = <resolved_id>
		id = jam_control_container
		exclusive_device = <controller>
		scale = 1
		just = [center center]
		Pos = (0.0, 0.0)
		event_handlers = [
			{pad_up jam_control_bar_up}
			{pad_down jam_control_bar_down}
			{pad_option jam_control_bar_skip_forwards}
			{pad_option2 jam_control_bar_skip_backwards}
			{pad_choose jam_control_bar_choose}
			{pad_start jam_recording_pause params = {back_to_jam_band = <back_to_jam_band>}}
		]
	}
	GetArraySize \{$jam_controls}
	count = 0
	<button_pos> = (25.0, 98.0)
	<y_off> = ($jam_control_offset)
	begin
	CreateScreenElement {
		type = SpriteElement
		parent = jam_control_container
		texture = toolbar_button
		just = [left top]
		rgba = [255 255 255 255]
		dims = (39.0, 39.0)
		rot_angle = -90
		Pos = (<button_pos> + <count> * <y_off>)
		z_priority = (<z_priority> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		id = ($jam_controls [<count>].id)
		texture = ($jam_controls [<count>].texture)
		just = [left top]
		scale = 1.2750001
		Pos = (42.5, -2.0)
		rot_angle = 90
		z_priority = (<z_priority> + 3)
	}
	<count> = (<count> + 1)
	repeat <array_size>
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [0].name_text)
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [0].help_text)
endscript

script create_studio_now_bar 
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = nowbar_bg
			}
		}}
	if ScreenElementExists \{id = studio_nowbar_container}
		DestroyScreenElement \{id = studio_nowbar_container}
	endif
	CreateScreenElement {
		type = ContainerElement
		id = studio_nowbar_container
		parent = <resolved_id>
		Pos = (-4.0, 12.5)
		scale = (0.78, 0.78)
		z_priority = 100
	}
	<gem_params> = {type = SpriteElement parent = studio_nowbar_container just = [center center] scale = 1 z_priority = 13}
	<Drum> = 0
	<rb_drum> = 0
	GetPlayerInfo \{$jam_current_recording_player
		controller}
	if isdrumcontroller controller = <controller>
		if IsRBDrum controller = <controller>
			<rb_drum> = 1
		endif
		<Drum> = 1
	endif
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	if (<Drum> = 1)
		<lefty> = 0
		<gem_positions> = [
			(184.0, 24.0) ,
			(20.0, 24.0) ,
			(61.0, 24.0) ,
			(102.0, 24.0) ,
			(143.0, 24.0) ,
		]
	elseif (<lefty> = 1)
		<gem_positions> = [
			(184.0, 24.0)
			(143.0, 24.0) ,
			(102.0, 24.0) ,
			(61.0, 24.0) ,
			(20.0, 24.0) ,
		]
	else
		<gem_positions> = [
			(20.0, 24.0) ,
			(61.0, 24.0) ,
			(102.0, 24.0) ,
			(143.0, 24.0) ,
			(184.0, 24.0)
		]
	endif
	CreateScreenElement {
		<gem_params>
		texture = green_now_off
		Pos = (<gem_positions> [0])
	}
	CreateScreenElement {
		<gem_params>
		texture = red_now_off
		Pos = (<gem_positions> [1])
	}
	CreateScreenElement {
		<gem_params>
		texture = yellow_now_off
		Pos = (<gem_positions> [2])
	}
	CreateScreenElement {
		<gem_params>
		texture = blue_now_off
		Pos = (<gem_positions> [3])
	}
	if NOT (<rb_drum> = 1)
		CreateScreenElement {
			<gem_params>
			texture = orange_now_off
			Pos = (<gem_positions> [4])
		}
	else
		CreateScreenElement {
			<gem_params>
			texture = orange_now_off
			Pos = (<gem_positions> [4])
			rgba = [80 80 80 255]
		}
	endif
	<player> = ($jam_current_recording_player)
	<gem_on_params> = {type = SpriteElement parent = studio_nowbar_container just = [center center] scale = 1 z_priority = 14}
	FormatText checksumname = gem_id 'jam_now_on_gr_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = green_now_on
		Pos = (<gem_positions> [0])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_re_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = red_now_on
		Pos = (<gem_positions> [1])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_ye_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = yellow_now_on
		Pos = (<gem_positions> [2])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_bl_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = blue_now_on
		Pos = (<gem_positions> [3])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_or_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = orange_now_on
		Pos = (<gem_positions> [4])
	}
	safe_hide id = <gem_id>
endscript

script jam_highway_select_quantize 
	z_priority = 30
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	GetPlayerInfo ($jam_current_recording_player) controller
	<last_note_count> = 0
	<no_snap> = 0
	begin
	<disallow_snap> = 0
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :GetTags
		if GotParam \{block_snap}
			<disallow_snap> = <block_snap>
		endif
	endif
	if NOT (($is_arpeggiator [$jam_current_track] = 1 || $is_drum_machine = 1) && ($jam_highway_recording = 1 && $jam_highway_step_recording != 1))
		if (<disallow_snap> = 0)
			if GuitarControllerMake left <controller>
				if (<lefty> = 1)
					change_quantize_right
				else
					change_quantize_left
				endif
			endif
			if GuitarControllerMake right <controller>
				if (<lefty> = 1)
					change_quantize_left
				else
					change_quantize_right
				endif
			endif
			markers_size = ($editable_jam_markers_size)
			if (<markers_size> <= 0)
				Change \{no_marker_snap = 1}
			endif
			if (($no_marker_snap = 1) && ($jam_current_quantize = 0))
				Change \{jam_current_quantize = 1}
				jam_studio_element :SetProps snap_text = ($jam_quantize [0].name_text)
			endif
			if (($no_precise_snap = 1) && ($jam_current_quantize = 9))
				Change \{jam_current_quantize = 8}
				jam_studio_element :SetProps snap_text = ($jam_quantize [5].name_text)
			endif
		endif
	else
		Change \{jam_current_quantize = 6}
		<no_snap> = 1
		jam_studio_element :SetProps \{snap_text = qs(0xf40fa77f)}
	endif
	if (<no_snap> = 1)
		if ($jam_highway_recording = 0)
			jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript
no_marker_snap = 0
no_precise_snap = 0

script change_quantize_left 
	next_quantize = ($jam_current_quantize - 1)
	GetArraySize ($jam_quantize)
	GhMix_Pad_Back_Sound
	min_quantize = 0
	if ($no_marker_snap = 1)
		<min_quantize> = 1
	endif
	max_quantize = 9
	if ($no_precise_snap = 1)
		<max_quantize> = 8
	endif
	if (<next_quantize> < <min_quantize>)
		<next_quantize> = <max_quantize>
	endif
	Change jam_current_quantize = <next_quantize>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_studio_element :SE_SetProps \{snap_arrow_left_scale = 2.0}
	jam_studio_element :SE_SetProps \{snap_arrow_left_scale = 1.3
		time = 0.15}
	jam_studio_element :SE_WaitProps
	broadcastevent \{type = ghmix_snap_changed}
endscript

script change_quantize_right 
	next_quantize = ($jam_current_quantize + 1)
	GetArraySize ($jam_quantize)
	GhMix_Pad_Back_Sound
	min_quantize = 0
	if ($no_marker_snap = 1)
		<min_quantize> = 1
	endif
	max_quantize = 9
	if ($no_precise_snap = 1)
		<max_quantize> = 8
	endif
	if (<next_quantize> > <max_quantize>)
		<next_quantize> = <min_quantize>
	endif
	Change jam_current_quantize = <next_quantize>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_studio_element :SE_SetProps \{snap_arrow_right_scale = 2.0}
	jam_studio_element :SE_SetProps \{snap_arrow_right_scale = 1.3
		time = 0.15}
	jam_studio_element :SE_WaitProps
	broadcastevent \{type = ghmix_snap_changed}
endscript

script jam_clear_track_check 
	GetPlayerInfo <select_player> jam_instrument
	if ($jam_advanced_record = 1)
		LaunchEvent \{type = unfocus
			target = jam_pause_container}
		FormatText TextName = dialog qs(0x0fc7f97d) s = ($jam_tracks [$jam_current_track].alt_text)
		controller = ($primary_controller)
	else
		LaunchEvent type = unfocus target = <vmenu_id>
		destroy_jam_band_menu
		FormatText TextName = dialog qs(0x0fc7f97d) s = ($jam_tracks [<jam_instrument>].alt_text)
		GetPlayerInfo <select_player> controller
	endif
	clean_up_user_control_helpers
	create_dialog_box {
		heading_text = qs(0xbbcf951c)
		body_text = <dialog>
		player_device = <controller>
		options = [
			{
				func = jam_clear_track_go_back
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
			{
				func = jam_clear_track
				func_params = {<...>}
				text = qs(0xbbcf951c)
			}
		]
	}
endscript

script jam_clear_track_go_back 
	if ($jam_advanced_record = 1)
		destroy_dialog_box
		set_focus_color \{Color = pure_white}
		set_unfocus_color \{Color = gh4_jam_orangeish}
		jam_recording_add_user_control_helpers
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
	else
		destroy_dialog_box
		ui_event \{event = menu_refresh}
	endif
endscript

script jam_clear_track 
	GetPlayerInfo <select_player> jam_instrument
	if ($jam_advanced_record = 1)
		DeleteCustomNoteRange track = ($jam_tracks [($jam_current_track)].id) low_bound = 0 high_bound = ($jam_highway_song_length)
		jam_highway_reinit
		jam_highway_move_beginning
	else
		DeleteCustomNoteRange track = ($jam_tracks [<jam_instrument>].id) low_bound = 0 high_bound = ($jam_highway_song_length)
	endif
	jam_clear_track_go_back <...>
endscript

script destroy_jam_recording_menu 
	jam_stop_all_sound
	Change \{jam_advanced_record = 0}
	musicstudio_reinit_menu_sounds
	destroy_dialog_box
	killspawnedscript \{id = jam_recording_spawns}
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = ($jam_current_recording_player)
	killspawnedscript id = <jam_player_spawns>
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	killspawnedscript id = <input_spawn>
	killspawnedscript \{name = jam_step_wait}
	jam_input_destroy_player_server player = ($jam_current_recording_player)
	killspawnedscript \{name = fade_out_note_text}
	killspawnedscript \{name = line6_pod_remove}
	killspawnedscript \{id = jam_input_spawns}
	stop_custom_song
	killspawnedscript \{name = jam_play_arpeggiator_loop}
	killspawnedscript \{name = jam_play_drum_loop}
	jam_kill_update_note_length player = ($jam_current_recording_player)
	if ScreenElementExists \{id = jam_studio_element}
		DestroyScreenElement \{id = jam_studio_element}
	endif
	jam_clear_clipboards
	FormatText \{checksumname = clipboard_array
		'clipboard'}
	if GlobalExists name = <clipboard_array> type = array
		DestroyScriptArray name = <clipboard_array>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ($jam_highway_recording_mode = 1)
	else
		end_song
	endif
	Change \{jam_highway_recording_mode = 0}
	Change \{jam_highway_recording = 0}
	Change \{jam_highway_step_recording = 0}
endscript

script jam_recording_add_user_control_helpers \{state = null}
	clean_up_user_control_helpers
	if ($game_mode = practice)
		if ScreenElementExists \{id = jam_band_container}
			<skip_button> = start
		elseif ScreenElementExists \{id = jam_studio_element}
			<skip_button> = back
		endif
		add_user_control_helper text = qs(0x784c64ff) button = <skip_button> z = 100
	endif
	switch <state>
		case loop
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			add_user_control_helper \{text = qs(0x227300c8)
				button = yellow
				z = 100}
		endif
		add_user_control_helper \{text = qs(0xbe1f4927)
			button = start
			z = 100}
		add_user_control_helper \{text = qs(0x4d17d51b)
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
		case playing
		add_user_control_helper \{text = qs(0xafa78b6d)
			button = start
			z = 100}
		case recording
		add_user_control_helper \{text = qs(0xb581da63)
			button = start
			z = 100}
		case step_recording
		add_user_control_helper \{text = qs(0x37b6bf56)
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs(0xb581da63)
			button = start
			z = 100}
		case step_rec_skip
		add_user_control_helper \{text = qs(0x784c64ff)
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs(0xff5a6032)
			button = red
			z = 100}
		add_user_control_helper \{text = qs(0xb581da63)
			button = start
			z = 100}
		case delete
		add_user_control_helper \{text = qs(0x271a1633)
			button = start
			z = 100}
		add_user_control_helper \{text = qs(0x4d17d51b)
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
		if GotParam \{delete_one}
			add_user_control_helper \{text = qs(0x2f5d6122)
				button = yellow
				z = 100}
		else
			add_user_control_helper \{text = qs(0x6e9c7390)
				button = yellow
				z = 100}
		endif
		case copy
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			add_user_control_helper \{text = qs(0x580fde84)
				button = blue
				z = 100}
		endif
		add_user_control_helper \{text = qs(0x63b5b49e)
			button = start
			z = 100}
		add_user_control_helper \{text = qs(0x4d17d51b)
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
		if GotParam \{copy_one}
			add_user_control_helper \{text = qs(0x8b180c8a)
				button = yellow
				z = 100}
		else
			add_user_control_helper \{text = qs(0xaafdafa5)
				button = yellow
				z = 100}
		endif
		case paste
		add_user_control_helper \{text = qs(0x61e576d1)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x3fc1c076)
			button = red
			z = 100}
		add_user_control_helper \{text = qs(0x307781c9)
			button = yellow
			z = 100}
		case paste_multiple
		add_user_control_helper \{text = qs(0x307781c9)
			button = start
			z = 100}
		add_user_control_helper \{text = qs(0x735df1b3)
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
		case nudge_forward
		add_user_control_helper text = ($jam_ghmix_text_nudge_forward) button = green z = 100
		add_user_control_helper \{text = qs(0x3fc1c076)
			button = red
			z = 100}
		add_user_control_helper text = ($jam_ghmix_text_nudgeall_forward) button = yellow z = 100
		add_user_control_helper text = ($jam_ghmix_text_nudge_dir) button = blue z = 100
		case nudge_backward
		add_user_control_helper text = ($jam_ghmix_text_nudge_backwards) button = green z = 100
		add_user_control_helper \{text = qs(0x3fc1c076)
			button = red
			z = 100}
		add_user_control_helper text = ($jam_ghmix_text_nudgeall_backwards) button = yellow z = 100
		add_user_control_helper text = ($jam_ghmix_text_nudge_dir) button = blue z = 100
		default
		if ScreenElementExists \{id = jam_studio_element}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100}
			if NOT ($game_mode = practice)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
			endif
			add_user_control_helper text = ($jam_ghmix_text_skip_backwards) button = yellow z = 100
			add_user_control_helper text = ($jam_ghmix_text_skip_forwards) button = blue z = 100
		elseif ScreenElementExists \{id = jam_band_container}
			if NOT ($game_mode = practice)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
				add_user_control_helper \{text = qs(0xbdcf8d77)
					button = back
					z = 100}
			endif
		endif
	endswitch
endscript

script jam_recording_cleanup 
	song_prefix = 'editable'
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	FormatText checksumname = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	ClearCustomSong
	jamsession_unload \{song_prefix = 'editable'}
endscript

script jam_recording_pause 
	if ($game_mode = practice)
		return
	endif
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	jam_band_pause select_player = ($jam_current_recording_player) player_cont = jam_pause_container event_cont = jam_control_container adv_record back_to_jam_band = <back_to_jam_band> shake = 0
endscript

script jam_advanced_recording_quit 
	generic_event_back \{data = {
			editing = 1
		}}
endscript

script jam_recording_create_metaview 
	begin
	if NOT ScreenElementExists \{id = jam_studio_element}
		return
	endif
	<metaview_pixels_per_second> = (($jam_recording_metaview_length) / (($jam_highway_end_time) / 1000))
	<new_pos> = (<metaview_pixels_per_second> * (($jam_highway_play_time) / 1000))
	<new_pos> = (($jam_recording_metaview_length) - <new_pos>)
	<new_pos> = ((0.0, 1.0) * <new_pos>)
	<new_pos> = (<new_pos> + (376.0, 35.0))
	jam_studio_element :SE_SetProps time_marker_pos = <new_pos>
	wait \{10
		gameframes}
	repeat
endscript

script jam_recording_destroy_metaview 
	if ScreenElementExists \{id = jam_metaview_cont}
		DestroyScreenElement \{id = jam_metaview_cont}
	endif
endscript

script jam_studio_hide_tilt_meter 
	return
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	pitch_indicator = <resolved_id>
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_meter
				}
			}
		}}
	pitch_meter = <resolved_id>
	if ScreenElementExists id = <pitch_indicator>
		<pitch_indicator> :SE_SetProps alpha = 0
	endif
	if ScreenElementExists id = <pitch_meter>
		<pitch_meter> :SE_SetProps alpha = 0
	endif
endscript

script jam_studio_tilt_meter 
	return
	<player> = ($jam_current_recording_player)
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	pitch_indicator = <resolved_id>
	ResolveScreenElementID \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_meter
				}
			}
		}}
	pitch_meter = <resolved_id>
	GetPlayerInfo <player> jam_instrument
	if (<jam_instrument> = 3 || <jam_instrument> = 5)
		<pitch_indicator> :SE_SetProps alpha = 1
		<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter_whole
		return
	endif
	switch (<jam_instrument>)
		case 0
		<tilt_var> = jam_tilt_rhythm
		case 1
		<tilt_var> = jam_tilt_lead
		case 2
		<tilt_var> = jam_tilt_bass
		case 4
		<tilt_var> = jam_tilt_melody
	endswitch
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	if (<chromatic> = 1)
		if (<jam_instrument> = 0)
			<pitch_indicator> :SE_SetProps alpha = 1
			<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter
		else
			<pitch_indicator> :SE_SetProps alpha = 1
			<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter_quarter
		endif
	else
		if (<jam_instrument> = 0)
			<pitch_indicator> :SE_SetProps alpha = 0
			<pitch_meter> :SE_SetProps alpha = 0
		else
			<pitch_indicator> :SE_SetProps alpha = 1
			<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter
		endif
	endif
	<last_tilt> = -1
	begin
	if NOT (<last_tilt> = ($<tilt_var>))
		<last_tilt> = ($<tilt_var>)
		if ((<chromatic> = 0) || <jam_instrument> = 0)
			switch (<last_tilt>)
				case 0
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = -20
				case 1
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = 20
			endswitch
		else
			switch (<last_tilt>)
				case 0
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = -45
				case 1
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = -15
				case 2
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = 15
				case 3
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = 45
			endswitch
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_studio_animate_mouse time = 0.1 Pos = (($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) + (25.0, -28.0)) rotation = 0.0
	LegacyDoScreenElementMorph id = selection_arrow time = <time> Pos = <Pos> rot_angle = <rotation>
endscript

script jam_control_bar_skip_forwards 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> * 2)
	jam_highway_skip_forwards quantize = <quantize>
	GhMix_Pad_Up_Down
endscript

script jam_control_bar_skip_backwards 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> * 2)
	jam_highway_skip_backwards quantize = <quantize>
	GhMix_Pad_Up_Down
endscript

script jam_ghmix_show_scale_reference 
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	font_color = [180 180 180 255]
	button_text_params = {type = TextElement font = fontgrid_text_A1 just = [center center] scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {type = TextBlockElement font = fontgrid_text_A3 just = [left center] rgba = <font_color>}
	if (<jam_instrument> = 3)
		jam_ghmix_remove_scale_reference
		return
	endif
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> chromatic
		chromatic = 1
		cont_pos = (1020.0, 68.0)
		background_dim = (195.0, 250.0)
		background_pos = (5.0, 50.0)
	else
		chromatic = 0
		cont_pos = (1044.0, 68.0)
		background_dim = (168.0, 250.0)
		background_pos = (-10.0, 50.0)
	endif
	num_notes = 7
	if (<jam_instrument> = 0)
		<x_buttons> = -95
		<x_notes> = 39
		<x_notes_off> = 24
		<y_buttons> = 117
		<y_notes> = 95
		<y_inc> = 30
		<buttons> = [
			[1 2 0 0 0]
			[1 0 3 0 0]
			[0 2 3 0 0]
			[0 2 0 4 0]
			[0 0 3 4 0]
			[0 0 3 0 5]
			[0 0 0 4 5]
		]
	else
		<x_buttons> = -95
		<x_notes> = 39
		<x_notes_off> = 24
		<y_buttons> = 117
		<y_notes> = 95
		<y_inc> = 30
		<buttons> = [
			[0 0 0 0 0]
			[1 0 0 0 0]
			[0 2 0 0 0]
			[0 0 3 0 0]
			[0 0 0 4 0]
			[0 0 0 0 5]
			[0 0 0 4 5]
		]
		guitar_jam_scales_get_diatonic instrument = <jam_instrument>
		if NOT (<diatonic> = 1)
			<num_notes> = 6
			<background_dim> = (<background_dim> - (0.0, 30.0))
		endif
	endif
	if ScreenElementExists \{id = jam_ghmix_scale_reference}
		DestroyScreenElement \{id = jam_ghmix_scale_reference}
	endif
	CreateScreenElement {
		type = ContainerElement
		id = jam_ghmix_scale_reference
		parent = jam_studio_element
		Pos = <cont_pos>
		z_priority = 1000
		alpha = 0
		scale = 0.9
	}
	CreateScreenElement {
		type = SpriteElement
		parent = jam_ghmix_scale_reference
		texture = white
		just = [center top]
		rgba = [20 20 20 200]
		Pos = <background_pos>
		dims = <background_dim>
		z_priority = 25
	}
	current_root = ($jam_track_rootnotes [<jam_instrument>])
	FormatText TextName = scale_header qs(0x646d1d57) a = ($jam_roots [<current_root>].name_text) b = (<chosen_scale>.name)
	CreateScreenElement {
		<note_text_params>
		parent = jam_ghmix_scale_reference
		Pos = (-83.0, 50.0)
		text = <scale_header>
		just = [left , top]
		internal_just = [left , bottom]
		z_priority = 26
		dims = (140.0, 30.0)
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	<cur_active_scale_name> = ($jam_track_scales_new [<jam_instrument>])
	<cur_scale> = ($<cur_active_scale_name>)
	<loop_count> = 0
	begin
	<cur_buttons> = (<buttons> [<loop_count>])
	<inner_loop_count> = 0
	begin
	<cur_button> = (<cur_buttons> [<inner_loop_count>])
	switch (<cur_button>)
		case 0
		<sprite> = gray_button
		case 1
		<sprite> = green_button
		case 2
		<sprite> = red_button
		case 3
		<sprite> = yellow_button
		case 4
		<sprite> = blue_button
		case 5
		<sprite> = orange_button
	endswitch
	CreateScreenElement {
		type = SpriteElement
		parent = jam_ghmix_scale_reference
		texture = <sprite>
		just = [left bottom]
		Pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		scale = 0.68
		z_priority = 26
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	<note_struct> = (<cur_scale> [<loop_count>])
	jam_get_sample_checksum string = (<note_struct> [0]) Fret = (<note_struct> [1]) type = 0 jam_instrument = <jam_instrument>
	if (<chromatic> = 1)
		main_text = <note_text>
		if (<jam_instrument> = 0)
			<note_struct> = (<cur_scale> [<loop_count> + 7])
		else
			<note_struct> = (<cur_scale> [<loop_count> + 6])
		endif
		jam_get_sample_checksum string = (<note_struct> [0]) Fret = (<note_struct> [1]) type = 0 jam_instrument = <jam_instrument>
		FormatText TextName = final_text qs(0xc0962e7a) a = <main_text> b = <note_text>
	else
		final_text = <note_text>
	endif
	CreateScreenElement {
		<note_text_params>
		parent = jam_ghmix_scale_reference
		Pos = ((<x_notes> * (1.0, 0.0)) + ((<y_notes> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		text = <final_text>
		internal_just = [left , center]
		z_priority = 26
		dims = (55.0, 33.0)
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	<loop_count> = (<loop_count> + 1)
	repeat <num_notes>
	jam_ghmix_scale_reference :SE_SetProps \{alpha = 1
		time = 0}
endscript

script jam_ghmix_remove_scale_reference 
	if ScreenElementExists \{id = jam_ghmix_scale_reference}
		jam_ghmix_scale_reference :SE_SetProps \{alpha = 0
			time = 0}
		jam_ghmix_scale_reference :SE_WaitProps
		DestroyScreenElement \{id = jam_ghmix_scale_reference}
	endif
endscript

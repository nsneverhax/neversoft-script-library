jam_highway_recording_mode = 0
jam_highway_song_length = 180000
jam_control_bar_offset = (25.0, 98.0)
jam_control_selected = 0
jam_highway_playing = 0
jam_highway_recording = 0
jam_highway_step_recording = 0
jam_current_recording_player = 1
jam_advanced_record = 0
0xbcacb187 = 0

script jam_recording_check_disconnect 
	<training> = 0
	if ($game_mode = training)
		<training> = 1
	endif
	if NOT CD
		if ($allow_controller_for_all_instruments = 1)
			return
		endif
	endif
	getcontrollertype controller = ($primary_controller)
	begin
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if ($0xbcacb187 = 0)
		if NOT GotParam \{recording_studio}
			prev_controller_type = <controller_type>
			getcontrollertype controller = ($primary_controller)
			if NOT (<is_active_controller> = 1)
				if NOT (<is_active_controller> = 1)
					if NOT ScriptIsRunning \{ui_recording_studio_disconnect_update}
						if NOT ScriptIsRunning \{ui_recording_disconnect_update}
							if NOT 0xc377c1ac
								if GotParam \{0x8d07739d}
									if ($is_shutdown_safe = 1)
										0xa238e6a3
										ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup 0x8d07739d}
									endif
								else
									0xa238e6a3
									if GotParam \{0x9b5d183a}
										ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup 0x9b5d183a}
									else
										ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup}
									endif
								endif
							endif
						endif
					endif
				endif
			endif
			if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
				if NOT ScriptIsRunning \{ui_recording_studio_disconnect_update}
					if NOT ScriptIsRunning \{ui_recording_disconnect_update}
						if NOT 0xc377c1ac
							if GotParam \{0x8d07739d}
								if ($is_shutdown_safe = 1)
									0xa238e6a3
									ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup 0x8d07739d}
								endif
							else
								0xa238e6a3
								if GotParam \{0x9b5d183a}
									ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup 0x9b5d183a}
								else
									ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup}
								endif
							endif
						endif
					endif
				endif
			endif
			if NOT (<controller_type> = <prev_controller_type>)
				if NOT ScriptIsRunning \{ui_recording_studio_disconnect_update}
					if NOT ScriptIsRunning \{ui_recording_disconnect_update}
						if NOT 0xc377c1ac
							if GotParam \{0x8d07739d}
								if ($is_shutdown_safe = 1)
									0xa238e6a3
									ui_event_wait state = uistate_recording_disconnect data = {training = <training> is_popup 0x8d07739d}
								endif
							else
								0xa238e6a3
								if GotParam \{0x9b5d183a}
									ui_event_wait state = uistate_recording_disconnect data = {training = <training> 0x9b5d183a}
								else
									ui_event_wait state = uistate_recording_disconnect data = {training = <training>}
								endif
							endif
						endif
					endif
				endif
			endif
			if ((<controller_type> != <prev_controller_type>) && <controller_type> != controller)
				controller = ($primary_controller)
				Player = ($jam_current_recording_player)
				if isdrumcontroller controller = <controller>
					Change \{jam_current_track = 2}
					setplayerinfo <Player> part = drum
					setplayerinfo <Player> jam_instrument = ($jam_current_track)
					jam_recording_switch_instrument \{0x777de791}
					LaunchEvent \{Type = unfocus
						target = jam_control_container}
				elseif (<controller_type> = guitar)
					Change jam_current_track = (($jam_current_track) - 1)
					if (($jam_current_track) < 0)
						Change \{jam_current_track = 4}
					endif
					setplayerinfo <Player> part = guitar
					jam_recording_switch_instrument
					if ScreenElementExists \{id = jam_control_container}
						LaunchEvent \{Type = unfocus
							target = jam_control_container}
					endif
				endif
				Wait \{1
					gameframe}
			endif
		else
			if (<is_active_controller> = 1)
				if (<training> = 1)
					controller = ($primary_controller)
					if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
						0xa238e6a3
						ui_event_wait state = uistate_recording_disconnect data = {recording_studio training = <training>}
					endif
				endif
			else
				if (<training> = 1)
					if NOT ScriptIsRunning \{ui_recording_studio_disconnect_update}
						if NOT ScriptIsRunning \{ui_recording_disconnect_update}
							if NOT 0xc377c1ac
								0xa238e6a3
								ui_event_wait state = uistate_recording_disconnect data = {recording_studio training = <training>}
							endif
						endif
					endif
				else
					0x03f6ef66 = ($jam_current_recording_player)
					Change \{jam_current_recording_player = 0}
					<num_active_controllers> = 0
					<count> = 0
					0x7de704b3 = 0
					begin
					if (<active_controllers> [(<count>)])
						<num_active_controllers> = (<num_active_controllers> + 1)
						if isdrumcontroller controller = <count>
							0x7de704b3 = 1
							Change primary_controller = <count>
						elseif IsGuitarController controller = <count>
							0x7de704b3 = 1
							Change primary_controller = <count>
						endif
					endif
					<count> = (<count> + 1)
					destroy_jam_recording_menu \{0xd4617269}
					Change jam_current_recording_player = (($jam_current_recording_player) + 1)
					repeat 4
					Change jam_current_recording_player = <0x03f6ef66>
					if ((<num_active_controllers> = 0) || (<0x7de704b3> = 0))
						if NOT ScriptIsRunning \{ui_recording_studio_disconnect_update}
							if NOT ScriptIsRunning \{ui_recording_disconnect_update}
								if NOT 0xc377c1ac
									0xa238e6a3
									ui_event_wait state = uistate_recording_disconnect data = {recording_studio training = <training>}
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script create_jam_recording_menu \{song = dangerzone
		editing = 0
		back_to_jam_band = 1}
	unload_gempaks
	0xf7e0f992 \{Wait}
	printf \{qs(0x3a6084c0)
		a = $memcard_jamsession_actual_file_name}
	if (<editing> = 0)
		Change \{memcard_jamsession_actual_file_name = ''}
		printf \{qs(0x70c93713)}
	endif
	printf channel = jam_mode qs(0xc812d4f6) s = <editing>
	Change \{select_shift = 0}
	Change \{debug_show_analog_options = 0}
	create_viewport_ui \{texture = `tex\zones\z_studio\rm_studio_monitor_gh_mix.dds`
		texdict = `zones/z_studio/z_studio.tex`
		keep_current_level}
	SpawnScriptNow id = jam_band_spawns menu_jam_screensaver_loading params = {window_id = <window_id>}
	Change \{target_jam_camera_prop = jam_advanced_recording}
	jam_camera_wait
	Change \{jam_advanced_record = 1}
	destroy_bg_viewport
	setup_bg_viewport
	if GotParam \{current_instrument}
		Change jam_current_track = <current_instrument>
		setplayerinfo <Player> jam_instrument = <current_instrument>
	endif
	getplayerinfo <Player> controller
	if isdrumcontroller controller = <controller>
		Change \{jam_current_track = 3}
		setplayerinfo <Player> part = drum
		setplayerinfo <Player> jam_instrument = ($jam_current_track)
	else
		setplayerinfo <Player> part = guitar
	endif
	menu_music_off
	Change \{jam_control_selected = 0}
	Change \{jam_undo_track = -1}
	Change \{jam_copy_bound_low = 0}
	Change \{jam_copy_bound_high = 0}
	Change \{jam_loop_bound_low = -1}
	Change \{jam_loop_bound_high = -1}
	CreateScreenElement \{parent = root_window
		id = jam_studio_element
		Type = descinterface
		desc = 'adv_record'}
	KillSpawnedScript \{Name = menu_jam_screensaver_loading}
	destroy_viewport_ui
	SpawnScriptNow \{jam_recording_check_disconnect}
	<song> = jamsession
	Change \{jam_highway_recording_mode = 1}
	jam_setup_song editing = <editing> advanced_record = 1
	Change \{jam_current_quantize = 4}
	Change \{no_marker_snap = 0}
	Change \{no_precise_snap = 0}
	jam_studio_element :SetProps snap_text = ($jam_quantize [($jam_current_quantize)].name_text)
	jam_studio_hide_tilt_meter
	<0xec156766> = <song>
	if NOT (<editing> = 1)
		jam_recording_get_unique_name
		Change jam_selected_song = <song>
		Change \{jam_current_bpm = 120}
		song_prefix = 'editable'
		formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
		suffix = '_size'
		AppendSuffixToChecksum Base = <fretbar_array> SuffixString = <suffix>
		<fretbar_size> = <appended_id>
		Change GlobalName = <fretbar_size> NewValue = 0
		jam_highway_create_fretbars
	endif
	<song> = <0xec156766>
	formatText \{TextName = title_text
		qs(0x90f34c93)
		s = $jam_selected_song
		b = $jam_current_bpm}
	jam_studio_element :SetProps songtitleinfo_text = <title_text>
	create_jam_control_bar back_to_jam_band = <back_to_jam_band>
	AssignAlias \{id = jam_control_container
		alias = current_menu}
	LaunchEvent \{Type = focus
		target = current_menu}
	create_studio_now_bar
	SpawnScriptNow \{create_jam_multiple_highways
		id = jam_recording_spawns
		params = {
			song = editable
		}}
	SpawnScriptNow \{jam_update_count
		id = jam_recording_spawns}
	reset_song_time \{starttime = 0}
	Change \{jam_highway_play_time = 0}
	Change \{jam_highway_playing = 0}
	CreateScreenElement \{Type = ContainerElement
		id = jam_pause_container
		parent = jam_studio_element
		Pos = (329.0, 90.0)}
	jam_ghmix_note_quick_update Player = ($jam_current_recording_player)
	jam_recording_add_user_control_helpers
	if (<editing> = 1)
		formatText \{TextName = title_text
			qs(0x90f34c93)
			s = $jam_selected_song
			b = $jam_current_bpm}
		KillSpawnedScript \{Name = jam_highway_select_quantize}
		SpawnScriptNow \{jam_highway_select_quantize
			id = jam_recording_spawns}
		SpawnScriptNow \{id = jam_recording_spawns
			jam_ghmix_show_scale_reference}
	else
		formatText TextName = title_text qs(0xc64bb950) b = $jam_current_bpm c = ($jam_tracks [$jam_current_track].name_text)
		SpawnScriptNow \{id = jam_recording_spawns
			show_change_bpm}
		KillSpawnedScript \{Name = jam_recording_metronome}
		SpawnScriptNow \{jam_recording_metronome
			id = jam_recording_spawns
			params = {
				bpm = $jam_current_bpm
				time = 0
				sound_only
			}}
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
	0xc1c4e84c \{mode = jammode}
	SpawnScriptNow \{jam_recording_create_metaview
		id = jam_recording_spawns}
	destroy_loading_screen \{Force = 1}
	broadcastevent \{Type = ghmix_load_complete}
endscript

script jam_recording_update_note 
	<Player> = ($jam_current_recording_player)
	getplayerinfo <Player> controller
	<last_instrument> = -1
	begin
	getplayerinfo <Player> jam_instrument
	if NOT (<last_instrument> = <jam_instrument>)
		getplayerinfo <Player> jam_instrument
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
	GetHeldPattern controller = <controller> Player = <Player> nobrokenstring
	<note_func> Player = <Player> hold_pattern = <hold_pattern>
	if ScreenElementExists \{id = studio_pick_text}
		if NOT (<jam_instrument> = 3)
			studio_pick_text :se_setprops text = <single_note_text>
		else
			studio_pick_text :se_setprops \{text = qs(0x00000000)}
		endif
	else
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script show_change_bpm 
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	KillSpawnedScript \{Name = jam_highway_select_quantize}
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
		formatText \{TextName = curr_bpm_text
			qs(0x73307931)
			s = $jam_current_bpm}
		jam_studio_element :SetProps bpm_number_text = <curr_bpm_text>
	endif
	if jam_studio_element :desc_resolvealias \{Name = bpm_box}
		<resolved_id> :SetProps Pos = (472.0, 800.0) time = 0.0
		<resolved_id> :se_waitprops
	endif
	if jam_studio_element :desc_resolvealias \{Name = bpm_box}
		<resolved_id> :SetProps Pos = (472.0, 47.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	getplayerinfo ($jam_current_recording_player) controller
	curr_bpm = $jam_current_bpm
	mid_up_strum = 0
	mid_down_strum = 0
	begin
	if NOT ui_event_exists_in_stack \{Name = 'recording_disconnect'}
		if has_lefty_adj_control_press Dir = up controller = <controller> Player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				<curr_bpm> = (<curr_bpm> + 1)
				if (<curr_bpm> > $jam_max_bpm)
					<curr_bpm> = $jam_max_bpm
				endif
				ghmix_scroll \{adv_record}
				generic_menu_up_or_down_sound \{up}
				KillSpawnedScript \{Name = scale_bpm_arrows}
				SpawnScriptNow \{scale_bpm_arrows
					id = jam_recording_spawns
					params = {
						up
					}}
				KillSpawnedScript \{Name = jam_recording_metronome}
				reset_song_time \{starttime = 0}
				SpawnScriptNow jam_recording_metronome id = jam_recording_spawns params = {bpm = <curr_bpm> time = 0 sound_only}
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > 10)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> Player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				<curr_bpm> = (<curr_bpm> - 1)
				if (<curr_bpm> < $jam_min_bpm)
					<curr_bpm> = $jam_min_bpm
				endif
				ghmix_scroll \{adv_record}
				generic_menu_up_or_down_sound \{down}
				KillSpawnedScript \{Name = scale_bpm_arrows}
				SpawnScriptNow \{scale_bpm_arrows
					id = jam_recording_spawns
					params = {
						down
					}}
				KillSpawnedScript \{Name = jam_recording_metronome}
				reset_song_time \{starttime = 0}
				SpawnScriptNow jam_recording_metronome id = jam_recording_spawns params = {bpm = <curr_bpm> time = 0 sound_only}
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > 10)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
		formatText TextName = curr_bpm_text qs(0x73307931) s = <curr_bpm>
		jam_studio_element :SetProps bpm_number_text = <curr_bpm_text>
		if ControllerMake <choose_button> <controller>
			break
		endif
		if ControllerMake start <controller>
			break
		endif
	else
		Wait \{3
			gameframes}
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{Name = jam_recording_metronome}
	ui_menu_select_sfx
	Change jam_current_bpm = <curr_bpm>
	guitar_jam_settings_bpm_back \{no_sound
		Player = $jam_current_recording_player}
	broadcastevent \{Type = ghmix_bpm_selected}
	settrackinfo track = rhythm bpm = ($jam_current_bpm)
	settrackinfo track = lead bpm = ($jam_current_bpm)
	settrackinfo track = bass bpm = ($jam_current_bpm)
	settrackinfo track = drum bpm = ($jam_current_bpm)
	if jam_studio_element :desc_resolvealias \{Name = bpm_box}
		<resolved_id> :SetProps Pos = (472.0, 800.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	formatText \{TextName = title_text
		qs(0x90f34c93)
		s = $jam_selected_song
		b = $jam_current_bpm}
	jam_studio_element :SetProps songtitleinfo_text = <title_text>
	jam_recording_add_user_control_helpers
	KillSpawnedScript \{Name = jam_highway_select_quantize}
	SpawnScriptNow \{jam_highway_select_quantize
		id = jam_recording_spawns}
	SpawnScriptNow \{id = jam_recording_spawns
		jam_ghmix_show_scale_reference}
	LaunchEvent \{Type = focus
		target = jam_control_container}
endscript

script scale_bpm_arrows 
	if GotParam \{up}
		jam_studio_element :SetProps \{bpm_arrow_up_scale = 2.0}
		jam_studio_element :SetProps \{bpm_arrow_up_scale = 1.5
			time = 0.15}
		jam_studio_element :se_waitprops
	endif
	if GotParam \{down}
		jam_studio_element :SetProps \{bpm_arrow_down_scale = 2.0}
		jam_studio_element :SetProps \{bpm_arrow_down_scale = 1.5
			time = 0.15}
		jam_studio_element :se_waitprops
	endif
endscript

script jam_recording_create_editable_arrays 
	song_prefix = 'editable'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	arraylistsize = ($arraylistsize)
	jamsession_array_action <...> func = createscriptarray
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	createscriptarray Name = <arraylist> size = <arraylistsize> Heap = heap_song Type = checksum
	jamsession_array_action <...> func = jamsession_addscriptarrayitem
endscript

script jam_recording_create_jamsession_arrays 
	song_prefix = 'jamsession'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	arraylistsize = ($arraylistsize)
	formatText checksumName = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	createscriptarray Name = <arraylist2> size = <arraylistsize> Heap = heap_song Type = checksum
	jamsession_array_action <...> func = jamsession_addscriptarrayitem arraylist = <arraylist2>
endscript

script jam_highway_create_fretbars 
	song_prefix = 'editable'
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
	song_length = $jam_highway_song_length
	time_interval = (60000.0 / $jam_current_bpm)
	song_time = 0.0
	song_time_int = 0
	begin
	addscriptarrayitem Name = <fretbar_array> integer = <song_time_int>
	<song_time> = (<song_time> + <time_interval>)
	<new_time_rounding_check> = (<song_time> + 0.5)
	CastToInteger \{new_time_rounding_check}
	<song_time_int> = <song_time>
	CastToInteger \{song_time_int}
	if NOT (<new_time_rounding_check> = <song_time_int>)
		<song_time_int> = (<song_time_int> + 1)
	endif
	if (<song_time> > <song_length>)
		break
	endif
	repeat
endscript

script jam_recording_setup_timesig 
	song_prefix = 'editable'
	formatText checksumName = timesig_array '%s_timesig' s = <song_prefix> AddToStringLookup = true
	timesig_to_add = [0 , 4 , 4]
	addscriptarrayitem Name = <timesig_array> array = <timesig_to_add>
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
	generic_menu_up_or_down_sound \{down}
	GetArraySize \{$jam_controls}
	num_controls = (<array_Size> - 1)
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
	jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :se_setprops control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		SpawnScriptNow \{jam_studio_animate_mouse}
		legacydoscreenelementmorph id = control_bg time = 0 Pos = ($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) rot_angle = <rotation>
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
	generic_menu_up_or_down_sound \{up}
	GetArraySize \{$jam_controls}
	num_controls = (<array_Size> - 1)
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
	jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :se_setprops control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		SpawnScriptNow \{jam_studio_animate_mouse}
		legacydoscreenelementmorph id = control_bg time = 0 Pos = ($jam_control_bar_offset + $jam_control_selected * $jam_control_offset) rot_angle = <rotation>
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
	jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :se_setprops control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :se_setprops control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		SpawnScriptNow \{jam_studio_animate_mouse}
		legacydoscreenelementmorph id = control_bg time = 0 Pos = ($jam_control_bar_offset + $jam_control_selected * $jam_control_offset) rot_angle = <rotation>
	endif
endscript

script jam_control_bar_choose 
	KillSpawnedScript \{Name = jam_highway_play}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	SetScreenElementProps \{id = control_playstop
		texture = icon_play}
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = ($jam_current_recording_player)
	SpawnScriptNow \{jam_studio_animate_mouse}
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
		generic_menu_up_or_down_sound \{up}
		if ($jam_highway_recording_mode = 1)
			jam_highway_move_last_note
		else
			jam_highway_move_end
		endif
		Change \{jam_highway_playing = 0}
		case 1
		printf \{channel = jam_mode
			qs(0xba402bc0)}
		generic_menu_up_or_down_sound \{up}
		SpawnScriptNow jam_highway_user_skip id = <jam_player_spawns> params = {forwards = 1}
		Change \{jam_highway_playing = 0}
		case 2
		printf \{channel = jam_mode
			qs(0xed59051a)}
		ui_menu_select_sfx
		Change \{jam_highway_playing = 1}
		if ($jam_highway_recording_mode = 0)
			begin_jam_song
		endif
		getplayerinfo ($jam_current_recording_player) controller
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> Player = ($jam_current_recording_player)}
		SpawnScriptNow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = control_name
				}
			}}
		SetScreenElementProps id = <resolved_id> text = ($jam_controls [$jam_control_selected].alt_name_text)
		SpawnScriptNow \{jam_highway_play
			id = jam_recording_spawns}
		case 3
		printf \{channel = jam_mode
			qs(0xcb8e98d2)}
		ui_menu_select_sfx
		Change \{no_marker_snap = 1}
		getplayerinfo ($jam_current_recording_player) jam_instrument
		if (<jam_instrument> = 4)
			Change \{jam_melody_last_pattern = 1}
		endif
		getplayerinfo ($jam_current_recording_player) controller
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> Player = ($jam_current_recording_player)}
		SpawnScriptNow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		SpawnScriptNow \{jam_highway_record
			id = jam_recording_spawns}
		Change \{jam_highway_playing = 0}
		broadcastevent \{Type = ghmix_start_rec}
		case 4
		printf \{channel = jam_mode
			qs(0x3be47dca)}
		ui_menu_select_sfx
		Change \{no_precise_snap = 1}
		Change \{no_marker_snap = 1}
		getplayerinfo ($jam_current_recording_player) jam_instrument
		if (<jam_instrument> = 4)
			Change \{jam_melody_last_pattern = 1}
		endif
		getplayerinfo ($jam_current_recording_player) controller
		ResolveScreenElementID \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> Player = ($jam_current_recording_player)}
		SpawnScriptNow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		SpawnScriptNow \{jam_highway_step_record
			id = jam_recording_spawns}
		Change \{jam_highway_playing = 0}
		broadcastevent \{Type = ghmix_start_step}
		case 5
		printf \{channel = jam_mode
			qs(0xfd4062da)}
		generic_menu_up_or_down_sound \{up}
		SpawnScriptNow jam_highway_user_skip id = <jam_player_spawns> params = {forwards = 0}
		Change \{jam_highway_playing = 0}
		case 6
		printf \{channel = jam_mode
			qs(0x842241d3)}
		generic_menu_up_or_down_sound \{up}
		jam_highway_move_beginning
		Change \{jam_highway_playing = 0}
		case 7
		broadcastevent \{Type = ghmix_start_loop}
		printf \{channel = jam_mode
			qs(0x71c49faa)}
		ui_menu_select_sfx
		jam_highway_loop
		Change \{jam_highway_playing = 0}
		case 8
		broadcastevent \{Type = ghmix_delete_start}
		printf \{channel = jam_mode
			qs(0x4bcb1cce)}
		ui_menu_select_sfx
		jam_highway_delete_section
		Change \{jam_highway_playing = 0}
		case 9
		broadcastevent \{Type = ghmix_start_copy}
		printf \{channel = jam_mode
			qs(0x715c7186)}
		ui_menu_select_sfx
		jam_highway_copy
		Change \{jam_highway_playing = 0}
		case 10
		broadcastevent \{Type = ghmix_paste_start}
		printf \{channel = jam_mode
			qs(0xffbc1273)}
		ui_menu_select_sfx
		jam_highway_paste_control
		Change \{jam_highway_playing = 0}
		case 11
		Change \{no_marker_snap = 1}
		broadcastevent \{Type = ghmix_start_nudge}
		printf \{channel = jam_mode
			qs(0x8b6d7f03)}
		ui_menu_select_sfx
		SpawnScriptNow jam_highway_note_nudge id = <jam_player_spawns>
		Change \{jam_highway_playing = 0}
		case 12
		printf \{channel = jam_mode
			qs(0x75aa1924)}
		ui_menu_select_sfx
		LaunchEvent \{Type = unfocus
			target = jam_control_container}
		getplayerinfo ($jam_current_recording_player) controller
		create_menu_jam_marker controller = <controller>
		Change \{jam_highway_playing = 0}
		case 13
		printf \{channel = jam_mode
			qs(0x17b9309e)}
		ui_menu_select_sfx
		jam_recording_switch_instrument
		jam_clear_undo_clipboard
		Change \{jam_undo_track = -1}
		jam_ghmix_note_quick_update Player = ($jam_current_recording_player)
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
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			return
		endif
	endif
	tool_controls = []
	jam_recording_add_user_control_helpers \{state = Loop}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	0xf3e484ed = <low_pos>
	loop_bound_low = 0
	loop_bound_high = 0
	mid_up_strum = 0
	mid_down_strum = 0
	<clear_button> = Triangle
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	count = 0
	getplayerinfo ($jam_current_recording_player) controller
	loop_controls = [set_loop clear_loop select_area cancel]
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ArrayContains array = <loop_controls> contains = select_area
		if has_lefty_adj_control_press Dir = up controller = <controller> Player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				generic_menu_up_or_down_sound \{up}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> Player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				generic_menu_up_or_down_sound \{down}
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
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			<broke> = 1
			break
		endif
	endif
	if ArrayContains array = <loop_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			ghmix_pad_back_sound
			<broke> = 1
			break
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ((<high_pos> [0] - <low_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> - (3000.0, 0.0))
	elseif ((<low_pos> [0] - <high_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> + (3000.0, 0.0))
	else
		<low_pos> = <0xf3e484ed>
	endif
	if ScreenElementExists \{id = jam_loop_highlight}
		DestroyScreenElement \{id = jam_loop_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	CreateScreenElement {
		Type = SpriteElement
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
			ui_menu_select_sfx
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
			broadcastevent \{Type = ghmix_loop_set}
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
	Wait \{1
		gameframe}
	repeat
	broadcastevent \{Type = ghmix_stop_loop}
	if NOT ($0x1e022966 = true)
		ui_menu_select_sfx
	endif
	if ((<loop_bound_low> != <loop_bound_high>) || (<loop_bound_low> = -1 && <loop_bound_high> = -1))
		quantize_to = 1
		ms_per_beat = (60000.0 / $jam_current_bpm)
		ms_per_quarter = (<ms_per_beat> / <quantize_to>)
		if NOT (<loop_bound_low> = -1 && <loop_bound_high> = -1)
			if ((<loop_bound_high> - <loop_bound_low>) >= <ms_per_quarter>)
				Change jam_loop_bound_low = <loop_bound_low>
				Change jam_loop_bound_high = <loop_bound_high>
			else
				SpawnScriptNow \{show_warning_message
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
			SpawnScriptNow \{show_warning_message
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
	LaunchEvent \{Type = focus
		target = jam_control_container}
	jam_recording_add_user_control_helpers
endscript

script jam_highway_add_marker 
	ghmix_pad_choose_sound
	destroy_menu_jam_marker
	LaunchEvent \{Type = focus
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
	AppendSuffixToChecksum Base = <markers_array> SuffixString = <suffix>
	<markers_size> = <appended_id>
	get_marker_count markers_array = <markers_array> markers_size = <markers_size> new_marker_time = ($jam_highway_play_time) new_marker_name = ($jam_markers [$jam_current_marker].name_text)
	addmarkeritem Name = <markers_array> time = ($jam_highway_play_time) marker_name = ($jam_markers [$jam_current_marker].name_text) marker_count = <marker_count> bpm = ($jam_current_marker_bpm) LightShow = ($jam_current_lightshow)
	jam_recording_update_metaview
	Change \{no_marker_snap = 0}
endscript

script get_marker_count 
	GetArraySize ($<markers_array>)
	printf channel = jam_mode qs(0x601c28e9) s = <array_Size>
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
	AppendSuffixToChecksum Base = <markers_array> SuffixString = <suffix>
	<markers_size> = <appended_id>
	GetArraySize ($<markers_array>)
	printf channel = jam_mode qs(0x601c28e9) s = <array_Size>
	count = 0
	begin
	printf qs(0xf6643ac1) s = <count>
	printstruct ($<markers_array> [<count>])
	<count> = (<count> + 1)
	repeat <array_Size>
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
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	if (<notetrack_size> > 0)
		end_time = ($<gem_array> [(<notetrack_size> - 2)])
		printf channel = jam_mode qs(0x76713ce2) s = <end_time>
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
	getplayerinfo ($jam_current_recording_player) jam_instrument
	tool_controls = []
	if ScreenElementExists \{id = jam_control_container}
		LaunchEvent \{Type = unfocus
			target = jam_control_container}
	endif
	if (<jam_instrument> = 3)
		Wait \{20
			gameframes}
	endif
	Change \{playing_song = 1}
	if ($jam_highway_recording_mode = 1)
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 0
				start_time = $jam_highway_play_time
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 1
				start_time = $jam_highway_play_time
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 2
				start_time = $jam_highway_play_time
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 4
				start_time = $jam_highway_play_time
			}}
		SpawnScriptNow \{guitar_jam_drum_playback
			id = jam_recording_spawns
			params = {
				start_time = $jam_highway_play_time
			}}
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
		Wait \{1
			gameframe}
		repeat
		Change \{jam_highway_playing = 0}
	else
		LaunchEvent \{Type = unfocus
			target = jam_control_container}
		if StructureContains structure = ($jam_tracks [$jam_current_track]) input_func
			getplayerinfo ($jam_current_recording_player) controller
			formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
			SpawnScriptNow ($jam_tracks [$jam_current_track].input_func) id = <input_spawn> params = {show_hud = 0 controller = <controller> select_player = ($jam_current_recording_player) hammer_on = <hammer_on>}
			if (($jam_current_track) = 3)
				SpawnScriptNow \{id = jam_recording_spawns
					jam_advanced_show_percussion_box}
			else
				if NOT (($jam_current_track) = 0)
					SpawnScriptNow \{id = jam_recording_spawns
						jam_advanced_show_arpeggiator_box}
				endif
			endif
		endif
		jam_recording_add_user_control_helpers \{state = playing}
		can_loop = 0
		if ($jam_highway_play_time <= ($jam_loop_bound_high + 2))
			<can_loop> = 1
		endif
		pixels_per_frame = ($jam_highway_pixels_per_second / 60)
		GetScreenElementPosition \{id = jam_highway_container}
		count = 0
		begin
		if ($game_mode = training)
			jam_studio_element :GetTags
		endif
		GetSongTimeMs
		Change jam_highway_play_time = <time>
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			if (<can_loop> = 1)
				if ($jam_highway_play_time > ($jam_loop_bound_high - ((1000.0 / 60.0) * 2)))
					Change \{jam_highway_play_time = $jam_loop_bound_low}
					KillSpawnedScript \{Name = guitar_jam_playback_recording}
					KillSpawnedScript \{Name = guitar_jam_drum_playback}
					SpawnScriptNow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 0
							start_time = $jam_highway_play_time
						}}
					SpawnScriptNow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 1
							start_time = $jam_highway_play_time
						}}
					SpawnScriptNow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 2
							start_time = $jam_highway_play_time
						}}
					SpawnScriptNow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 4
							start_time = $jam_highway_play_time
						}}
					SpawnScriptNow \{guitar_jam_drum_playback
						id = jam_recording_spawns
						params = {
							start_time = $jam_highway_play_time
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
		getplayerinfo ($jam_current_recording_player) controller
		if ControllerMake start <controller>
			ui_menu_select_sfx
			break
		endif
		if ($blade_active = 1)
			break
		endif
		if ($0x1e022966 = true)
			break
		endif
		if ArrayContains array = <tool_controls> contains = force_exit
			break
		endif
		Wait \{1
			gameframe}
		repeat
		jam_ghmix_note_quick_update Player = ($jam_current_recording_player)
		SpawnScriptNow \{id = jam_recording_spawns
			jam_advanced_hide_percussion_box}
		SpawnScriptNow \{id = jam_recording_spawns
			jam_advanced_hide_arpeggiator_box}
		KillSpawnedScript \{Name = jam_play_arpeggiator_loop}
		KillSpawnedScript \{Name = jam_play_drum_loop}
		jam_stop_all_sound
		KillSpawnedScript \{Name = jam_lightup_held_note_sprites}
		KillSpawnedScript \{Name = jam_studio_tilt_meter}
		jam_studio_hide_tilt_meter
		jam_hide_all_held_note_sprites Player = ($jam_current_recording_player)
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
		legacydoscreenelementmorph id = <resolved_id> time = 0.2 rot_angle = 0
		destroyplayerserverjaminput Player = ($jam_current_recording_player)
		formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
		KillSpawnedScript id = <input_spawn>
		KillSpawnedScript \{id = jam_input_spawns}
		jam_kill_update_note_length Player = ($jam_current_recording_player)
		LaunchEvent \{Type = focus
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
		jam_recording_add_user_control_helpers
	endif
	Change \{playing_song = 0}
	printf \{channel = jam_mode
		qs(0xbd4e4e75)}
	Change \{jam_highway_playing = 0}
	if ($jam_highway_recording_mode = 0)
		begin_jam_song \{Pause = 1}
	endif
	if ($jam_highway_recording_mode = 1)
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
	endif
	jam_stop_all_sound
endscript

script jam_highway_record 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			return
		endif
	endif
	tool_controls = []
	jam_update_undo_clipboard
	Change \{jam_highway_recording = 1}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	getplayerinfo ($jam_current_recording_player) controller
	getplayerinfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 3)
		Wait \{20
			gameframes}
	endif
	Change \{playing_song = 1}
	show_countin_message
	jam_record_input
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 0
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 1
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 2
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 4
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_drum_playback
		id = jam_input_spawns
		params = {
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{jam_recording_metronome
		id = jam_input_spawns
		params = {
			sound_only
		}}
	if (($0x1e022966 != true) || ($game_mode = training))
		jam_recording_add_user_control_helpers \{state = recording}
	endif
	can_loop = 0
	if ($jam_highway_play_time <= ($jam_loop_bound_high + 2))
		<can_loop> = 1
	endif
	pixels_per_frame = ($jam_highway_pixels_per_second / 60)
	GetScreenElementPosition \{id = jam_highway_container}
	count = 0
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	GetSongTimeMs
	Change jam_highway_play_time = <time>
	if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
		if (<can_loop> = 1)
			if ($jam_highway_play_time > ($jam_loop_bound_high - ((1000.0 / 60.0) * 2)))
				Change \{jam_highway_play_time = $jam_loop_bound_low}
				KillSpawnedScript \{Name = guitar_jam_playback_recording}
				KillSpawnedScript \{Name = guitar_jam_drum_playback}
				SpawnScriptNow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 0
						start_time = $jam_highway_play_time
					}}
				SpawnScriptNow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 1
						start_time = $jam_highway_play_time
					}}
				SpawnScriptNow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 2
						start_time = $jam_highway_play_time
					}}
				SpawnScriptNow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 4
						start_time = $jam_highway_play_time
					}}
				SpawnScriptNow \{guitar_jam_drum_playback
					id = jam_recording_spawns
					params = {
						start_time = $jam_highway_play_time
					}}
				KillSpawnedScript \{Name = jam_recording_metronome}
				SpawnScriptNow \{jam_recording_metronome
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
	if ($0x1e022966 = true)
		break
	endif
	getplayerinfo ($jam_current_recording_player) controller
	<done> = 0
	if ControllerMake start <controller>
		<done> = 1
	elseif ArrayContains array = <tool_controls> contains = force_exit
		<done> = 1
	endif
	if (<done> = 1)
		SoundEvent \{event = ghmix_select}
		if (<jam_instrument> = 4)
			jam_input_melody_stop_sound
		endif
		formatText checksumName = msg_box 'jam_limit_msg_box_%a' a = ($jam_current_recording_player)
		if ScreenElementExists id = <msg_box>
			DestroyScreenElement id = <msg_box>
		endif
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{playing_song = 0}
	jam_ghmix_note_quick_update Player = ($jam_current_recording_player)
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	printf \{channel = jam_mode
		qs(0xee7339d4)}
	broadcastevent \{Type = ghmix_stop_rec}
	jam_update_highway_infobox
	jam_recording_update_metaview
	SpawnScriptNow \{id = jam_recording_spawns
		jam_advanced_hide_percussion_box}
	SpawnScriptNow \{id = jam_recording_spawns
		jam_advanced_hide_arpeggiator_box}
	KillSpawnedScript \{Name = jam_play_arpeggiator_loop}
	KillSpawnedScript \{Name = jam_play_drum_loop}
	jam_stop_all_sound
	KillSpawnedScript \{Name = jam_lightup_held_note_sprites}
	KillSpawnedScript \{Name = jam_studio_tilt_meter}
	jam_studio_hide_tilt_meter
	jam_hide_all_held_note_sprites Player = ($jam_current_recording_player)
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
	legacydoscreenelementmorph id = <resolved_id> time = 0.2 rot_angle = 0
	destroyplayerserverjaminput Player = ($jam_current_recording_player)
	formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <input_spawn>
	jam_recording_metronome_stop
	KillSpawnedScript \{id = jam_input_spawns}
	jam_kill_update_note_length Player = ($jam_current_recording_player)
	LaunchEvent \{Type = focus
		target = jam_control_container}
	if ScreenElementExists \{id = control_record}
		SetScreenElementProps \{id = control_record
			alpha = 1}
	endif
	if (($0x1e022966 != true) || ($game_mode = training))
		jam_recording_add_user_control_helpers
	endif
	Change \{jam_highway_recording = 0}
	Change \{no_precise_snap = 0}
	Change \{no_marker_snap = 0}
endscript

script show_countin_message 
	count_wait = (60.0 / $jam_current_bpm)
	curr_time = $jam_highway_play_time
	CastToInteger \{curr_time}
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias \{Name = metronome_box}
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
		jam_studio_element :SetProps \{countin_number_text = qs(0x22ee76e7)}
	endif
	if jam_studio_element :desc_resolvealias \{Name = countin_box}
		<resolved_id> :SetProps Pos = (357.0, 800.0) time = 0.0
		<resolved_id> :se_waitprops
	endif
	if jam_studio_element :desc_resolvealias \{Name = countin_box}
		<resolved_id> :SetProps Pos = (357.0, 178.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = jam_mode_metronome}
	Wait <count_wait> Seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x09c32524)}
	endif
	toggle_advanced_record_metronome \{left}
	SoundEvent \{event = jam_mode_metronome}
	Wait <count_wait> Seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x10d81465)}
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = jam_mode_metronome}
	Wait <count_wait> Seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs(0x5f9982a2)}
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = jam_mode_metronome}
	if (<wait_for_next_fretbar> = 0)
		Wait <count_wait> Seconds
		SoundEvent \{event = jam_mode_metronome}
	else
		Wait <wait_for_next_fretbar> Seconds
	endif
	if jam_studio_element :desc_resolvealias \{Name = countin_box}
		<resolved_id> :SetProps Pos = (357.0, 800.0) time = 0.2
	endif
endscript

script jam_update_count 
	begin
	quantize_to = 0.25
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = ($jam_highway_play_time / <quantize>)
	CastToInteger \{intervals}
	formatText TextName = measure_text qs(0x73307931) s = (<intervals> + 1)
	jam_studio_element :SetProps measure_count_text = <measure_text>
	if NOT ($jam_current_quantize < 2)
		quantize_to = ($jam_quantize [$jam_current_quantize].value)
		ms_per_beat = (60000.0 / $jam_current_bpm)
		quantize = (<ms_per_beat> / <quantize_to>)
		fintervals = ($jam_highway_play_time / <quantize>)
		<intervals_rounding_check> = (<fintervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		<intervals> = <fintervals>
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		begin
		if (<intervals> > ((<quantize_to> * 4) - 1))
			<intervals> = (<intervals> - (<quantize_to> * 4))
		else
			break
		endif
		repeat
		CastToInteger \{intervals}
		formatText TextName = snap_text qs(0x73307931) s = (<intervals> + 1)
		jam_studio_element :SetProps note_count_text = <snap_text>
	else
		jam_studio_element :SetProps \{note_count_text = qs(0x00000000)}
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script jam_advanced_show_percussion_box 
	if ($is_drum_machine = 1)
		jam_studio_element :se_setprops \{drum_machine_glow_alpha = 0.65000004}
	else
		jam_studio_element :se_setprops \{drum_machine_glow_alpha = 0}
	endif
	box = percussion_box
	end_pos = (188.0, 447.0)
	if isdrumcontroller controller = <controller>
		box = percussion_box_small
		end_pos = (188.0, 462.0)
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias Name = <box>
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.0
		endif
		if jam_studio_element :desc_resolvealias Name = <box>
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
		if jam_studio_element :desc_resolvealias Name = <box>
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.2
		endif
	endif
endscript

script jam_advanced_show_arpeggiator_box 
	if (($is_arpeggiator [$jam_current_track]) = 1)
		jam_studio_element :se_setprops \{arpeggiator_glow_alpha = 0.65000004}
	else
		jam_studio_element :se_setprops \{arpeggiator_glow_alpha = 0}
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias \{Name = arpeggiator_box}
			<resolved_id> :SetProps Pos = (188.0, 800.0) time = 0.0
		endif
		if jam_studio_element :desc_resolvealias \{Name = arpeggiator_box}
			<resolved_id> :SetProps Pos = (188.0, 498.0) time = 0.2
		endif
	endif
endscript

script jam_advanced_hide_arpeggiator_box 
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias \{Name = arpeggiator_box}
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
		getplayerinfo ($jam_current_recording_player) controller
		formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
		SpawnScriptNow ($jam_tracks [$jam_current_track].input_func) id = <input_spawn> params = {show_hud = 0 controller = <controller> select_player = ($jam_current_recording_player) hammer_on = <hammer_on>}
	endif
	if (<show_box> = 1)
		if (($jam_current_track) = 3)
			SpawnScriptNow \{id = jam_recording_spawns
				jam_advanced_show_percussion_box}
		else
			if NOT (($jam_current_track) = 0)
				SpawnScriptNow \{id = jam_recording_spawns
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
	jam_update_undo_clipboard
	Change \{jam_highway_recording = 1}
	Change \{jam_highway_step_recording = 1}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	getplayerinfo ($jam_current_recording_player) controller
	getplayerinfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 3 || <jam_instrument> = 4)
		Wait \{30
			gameframes}
	endif
	jam_record_input \{step_record = 1}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	jam_recording_add_user_control_helpers \{state = step_recording}
	mid_up_strum = 0
	mid_down_strum = 0
	wait_before_sustain = 15
	hold_frames = 0
	old_quantize = ($jam_current_quantize)
	input_spawned = 1
	whammy_hold_count = 0
	if IsGuitarController controller = <controller>
		KillSpawnedScript \{Name = show_warning_message}
		SpawnScriptNow \{show_jam_helper_box
			id = jam_input_spawns
			params = {
				text = qs(0x88acb88a)
			}}
	endif
	formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	SpawnScriptNow id = <input_spawn> jam_step_wait
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	count = 0
	curr_playing_id = NULL
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	step_strum = 0
	if IsGuitarController controller = <controller>
		if ($blade_active = 0)
			if GuitarGetAnalogueInfo controller = <controller>
				if (<rightx> > 0.3)
					if (<whammy_hold_count> > 3)
						if (<input_spawned> = 1)
							destroyplayerserverjaminput Player = ($jam_current_recording_player)
							formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
							KillSpawnedScript id = <input_spawn>
							KillSpawnedScript \{id = jam_input_spawns}
							jam_kill_update_note_length Player = ($jam_current_recording_player)
							KillSpawnedScript \{Name = jam_step_wait}
							<input_spawned> = 0
							jam_recording_add_user_control_helpers \{state = step_rec_skip}
						endif
						if ControllerMake <break_button> <controller>
							SoundEvent \{event = enter_band_name_back}
							jam_delete_range track = <track> low_bound = (($jam_highway_play_time) -5) high_bound = (($jam_highway_play_time) + 5)
						endif
						if ScreenElementExists \{id = jam_studio_element}
							if NOT ScriptIsRunning \{show_warning_message}
								jam_studio_element :SetProps \{dialog_text = qs(0x18c05386)}
							endif
						endif
					endif
					<whammy_hold_count> = (<whammy_hold_count> + 1)
				else
					if ($0x1e022966 = FALSE)
						<whammy_hold_count> = 0
						if (<input_spawned> = 0)
							jam_record_input \{step_record = 1
								show_box = 0}
							SpawnScriptNow id = <input_spawn> jam_step_wait
							<input_spawned> = 1
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
	endif
	if has_lefty_adj_control_press Dir = up controller = <controller> Player = $jam_current_recording_player
		if (<mid_up_strum> = 0)
			if (<input_spawned> = 0)
				ghmix_pad_up_down
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
			stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		endif
		<mid_up_strum> = 0
	endif
	if (<jam_instrument> != 4 || <input_spawned> = 0)
		if has_lefty_adj_control_press Dir = down controller = <controller> Player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				if (<input_spawned> = 0)
					ghmix_pad_up_down
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
				stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
			endif
			<mid_down_strum> = 0
		endif
	else
		if issoundplaying \{$jam_input_current_melody}
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
		KillSpawnedScript \{Name = jam_sustain_step}
	endif
	if (<mid_up_strum> > <wait_before_sustain>)
		if NOT ScriptIsRunning \{jam_sustain_step}
			<old_quantize> = $jam_current_quantize
			SpawnScriptNow jam_sustain_step params = {old_quantize = <old_quantize>}
		endif
	elseif (<mid_down_strum> > <wait_before_sustain>)
		if NOT ScriptIsRunning \{jam_sustain_step}
			<old_quantize> = $jam_current_quantize
			if (<whammy_hold_count> > 3)
				SpawnScriptNow jam_sustain_step params = {old_quantize = <old_quantize> Dir = backwards}
			elseif (<jam_instrument> = 3)
				SpawnScriptNow jam_sustain_step params = {old_quantize = <old_quantize> Dir = backwards}
			else
				SpawnScriptNow jam_sustain_step params = {old_quantize = <old_quantize>}
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
	if ($0x1e022966 = true)
		<done> = 1
	endif
	if (<done> = 1)
		formatText checksumName = msg_box 'jam_limit_msg_box_%a' a = ($jam_current_recording_player)
		if ScreenElementExists id = <msg_box>
			DestroyScreenElement id = <msg_box>
		endif
		if (<jam_instrument> = 4)
			jam_input_melody_stop_sound
		endif
		ui_menu_select_sfx
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_ghmix_note_quick_update Player = ($jam_current_recording_player)
	SpawnScriptNow \{id = jam_recording_spawns
		remove_jam_helper_box}
	printf \{channel = jam_mode
		qs(0x2063829b)}
	broadcastevent \{Type = ghmix_stop_step}
	jam_update_highway_infobox
	jam_recording_update_metaview
	SpawnScriptNow \{id = jam_recording_spawns
		jam_advanced_hide_percussion_box}
	SpawnScriptNow \{id = jam_recording_spawns
		jam_advanced_hide_arpeggiator_box}
	KillSpawnedScript \{Name = jam_play_arpeggiator_loop}
	KillSpawnedScript \{Name = jam_play_drum_loop}
	jam_stop_all_sound
	KillSpawnedScript \{Name = jam_lightup_held_note_sprites}
	KillSpawnedScript \{Name = jam_studio_tilt_meter}
	jam_studio_hide_tilt_meter
	jam_hide_all_held_note_sprites Player = ($jam_current_recording_player)
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
	legacydoscreenelementmorph id = <resolved_id> time = 0.2 rot_angle = 0
	destroyplayerserverjaminput Player = ($jam_current_recording_player)
	formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <input_spawn>
	KillSpawnedScript \{Name = jam_step_wait}
	KillSpawnedScript \{id = jam_input_spawns}
	jam_kill_update_note_length Player = ($jam_current_recording_player)
	LaunchEvent \{Type = focus
		target = jam_control_container}
	if ScreenElementExists \{id = control_record}
		SetScreenElementProps \{id = control_record
			alpha = 1}
	endif
	jam_recording_add_user_control_helpers
	Change \{jam_highway_recording = 0}
	Change \{jam_highway_step_recording = 0}
	Change \{no_precise_snap = 0}
	Change \{no_marker_snap = 0}
endscript

script show_jam_helper_box \{title = qs(0x62c3095f)
		text = qs(0x5449d8c0)}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_title_text = <title>
	endif
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_text = <text>
	endif
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps Pos = (21.0, 800.0) time = 0.0
		<resolved_id> :se_waitprops
	endif
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps Pos = (21.0, -94.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
endscript

script jam_step_wait 
	begin
	Block \{Type = jam_note_hit}
	Wait \{4
		gameframes}
	jam_highway_skip_forwards
	repeat
endscript

script remove_jam_helper_box 
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps Pos = (5.0, 800.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
endscript

script jam_sustain_step \{Dir = forwards}
	quantize_to = ($jam_quantize [6].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	Wait ((<quantize> / ((1.0 / 60.0) * 1000)) * 2) gameframes
	Change \{jam_current_quantize = 6}
	if (<Dir> = forwards)
		jam_highway_skip_forwards
	else
		jam_highway_skip_backwards
	endif
	Change jam_current_quantize = <old_quantize>
endscript

script jam_highway_user_skip \{forwards = 1}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	getplayerinfo ($jam_current_recording_player) controller
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
	Wait \{1
		gameframe}
	repeat
	LaunchEvent \{Type = focus
		target = jam_control_container}
endscript

script jam_highway_skip_forwards 
	GetScreenElementPosition \{id = jam_highway_container}
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	if NOT StructureContains structure = ($jam_quantize [$jam_current_quantize]) marker
		quantize_to = ($jam_quantize [$jam_current_quantize].value)
		ms_per_beat = (60000.0 / $jam_current_bpm)
		if NOT GotParam \{quantize}
			quantize = (<ms_per_beat> / <quantize_to>)
		endif
		fintervals = ($jam_highway_play_time / <quantize>)
		<intervals_rounding_check> = (<fintervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		<intervals> = <fintervals>
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		<intervals> = (<intervals> + 1)
		new_time = (<intervals> * <quantize>)
		<new_time_rounding_check> = (<new_time> + 0.5)
		CastToInteger \{new_time_rounding_check}
		<new_time_int> = <new_time>
		CastToInteger \{new_time_int}
		if NOT (<new_time_rounding_check> = <new_time_int>)
			<new_time_int> = (<new_time_int> + 1)
		endif
		if GotParam \{amount}
			<new_time> = ($jam_highway_play_time + <amount>)
			<new_time_int> = <new_time>
			CastToInteger \{new_time_int}
		endif
	else
		song = editable
		suffix = '_jam_markers'
		AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
		song_jam_markers = <appended_id>
		suffix = '_size'
		AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
		<jam_markers_size> = <appended_id>
		<new_time_int> = $jam_highway_play_time
		count = 0
		begin
		if (($<jam_markers_size>) = 0)
			break
		endif
		curr_time = ($<song_jam_markers> [<count>].time)
		if (<curr_time> > $jam_highway_play_time)
			<new_time_int> = <curr_time>
			break
		endif
		<count> = (<count> + 1)
		if (<count> > (($<jam_markers_size>) - 1))
			break
		endif
		repeat
	endif
	new_pos = ($jam_highway_play_line_pos - ((<new_time_int> / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] < <end_pos> [0])
		jam_highway_move_end
	else
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_low_bound + (<new_time_int> - $jam_highway_play_time))
		<new_high_bound> = ($jam_highway_high_bound + (<new_time_int> - $jam_highway_play_time))
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		Change jam_highway_low_bound = <new_low_bound>
		Change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		if ($jam_highway_recording_mode = 0)
			begin_jam_song \{Pause = 1}
		endif
		Change jam_highway_play_time = <new_time_int>
		play_time = $jam_highway_play_time
		CastToInteger \{play_time}
		SetSeekPosition_Song position = <play_time>
	endif
endscript

script jam_highway_skip_backwards 
	GetScreenElementPosition \{id = jam_highway_container}
	if NOT StructureContains structure = ($jam_quantize [$jam_current_quantize]) marker
		quantize_to = ($jam_quantize [$jam_current_quantize].value)
		ms_per_beat = (60000.0 / $jam_current_bpm)
		if NOT GotParam \{quantize}
			quantize = (<ms_per_beat> / <quantize_to>)
		endif
		fintervals = ($jam_highway_play_time / <quantize>)
		<intervals_rounding_check> = (<fintervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		<intervals> = <fintervals>
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		<intervals> = (<intervals> - 1)
		new_time = (<intervals> * <quantize>)
		<new_time_rounding_check> = (<new_time> + 0.5)
		CastToInteger \{new_time_rounding_check}
		<new_time_int> = <new_time>
		CastToInteger \{new_time_int}
		if NOT (<new_time_rounding_check> = <new_time_int>)
			<new_time_int> = (<new_time_int> + 1)
		endif
		if GotParam \{amount}
			<new_time> = ($jam_highway_play_time - <amount>)
			<new_time_int> = <new_time>
			CastToInteger \{new_time_int}
		endif
	else
		song = editable
		suffix = '_jam_markers'
		AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
		song_jam_markers = <appended_id>
		suffix = '_size'
		AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
		<jam_markers_size> = <appended_id>
		<new_time_int> = $jam_highway_play_time
		count = (($<jam_markers_size>) - 1)
		begin
		if (($<jam_markers_size>) = 0)
			break
		endif
		curr_time = ($<song_jam_markers> [<count>].time)
		if (<curr_time> < $jam_highway_play_time)
			<new_time_int> = <curr_time>
			break
		endif
		<count> = (<count> - 1)
		if (<count> < 0)
			break
		endif
		repeat
	endif
	new_pos = ($jam_highway_play_line_pos - ((<new_time_int> / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] > $jam_highway_play_line_pos [0])
		jam_highway_move_beginning
	else
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<low_bound> = ($jam_highway_low_bound - ($jam_highway_play_time - <new_time_int>))
		<high_bound> = ($jam_highway_high_bound - ($jam_highway_play_time - <new_time_int>))
		CastToInteger \{low_bound}
		CastToInteger \{high_bound}
		Change jam_highway_low_bound = <low_bound>
		Change jam_highway_high_bound = <high_bound>
		jam_highway_reinit
		if ($jam_highway_recording_mode = 0)
			begin_jam_song \{Pause = 1}
		endif
		Change jam_highway_play_time = <new_time_int>
		play_time = $jam_highway_play_time
		CastToInteger \{play_time}
		SetSeekPosition_Song position = <play_time>
	endif
endscript

script jam_highway_delete_section 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			return
		endif
	endif
	delete_controls = [delete delete_toggle select cancel]
	tool_controls = []
	jam_update_undo_clipboard
	jam_recording_add_user_control_helpers \{state = delete}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	0xf3e484ed = <low_pos>
	delete_bound_low = 0
	delete_bound_high = 0
	mid_up_strum = 0
	mid_down_strum = 0
	delete_all = 0
	count = 0
	done = 0
	cancel = 0
	getplayerinfo ($jam_current_recording_player) controller
	<delete_button> = Triangle
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			<cancel> = 1
			break
		endif
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
		ui_menu_select_sfx
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
		if has_lefty_adj_control_press Dir = up controller = <controller> Player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				generic_menu_up_or_down_sound \{up}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> Player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				generic_menu_up_or_down_sound \{down}
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
			ui_menu_select_sfx
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
	if ((<high_pos> [0] - <low_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> - (3000.0, 0.0))
	elseif ((<low_pos> [0] - <high_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> + (3000.0, 0.0))
	else
		<low_pos> = <0xf3e484ed>
	endif
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
			Type = SpriteElement
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
			Type = SpriteElement
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
	Wait \{1
		gameframe}
	repeat
	if NOT (<cancel> = 1)
		if NOT (<delete_bound_low> = <delete_bound_high>)
			if (<delete_all> = 1)
				GetArraySize \{$jam_tracks}
				track_count = 0
				begin
				jam_delete_range track = <track_count> low_bound = <delete_bound_low> high_bound = <delete_bound_high>
				<track_count> = (<track_count> + 1)
				repeat <array_Size>
			else
				jam_delete_range low_bound = <delete_bound_low> high_bound = <delete_bound_high>
			endif
		endif
	else
		if NOT ($0x1e022966 = true)
			ghmix_pad_back_sound
		endif
	endif
	jam_highway_reinit
	broadcastevent \{Type = ghmix_delete_done}
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	LaunchEvent \{Type = focus
		target = jam_control_container}
	jam_update_highway_infobox
	jam_recording_update_metaview
	jam_recording_add_user_control_helpers
endscript
jam_copy_bound_low = 0
jam_copy_bound_high = 0

script jam_highway_copy 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			return
		endif
	endif
	jam_recording_add_user_control_helpers \{state = copy}
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	0xf3e484ed = <low_pos>
	getplayerinfo ($jam_current_recording_player) controller
	<copy_button> = Triangle
	<loop_copy_button> = Square
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	mid_up_strum = 0
	mid_down_strum = 0
	copy_all = 0
	count = 0
	done = 0
	copy_controls = [copy copy_toggle cancel strum]
	tool_controls = []
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			break
		endif
	endif
	if ControllerMake <break_button> <controller>
		if ArrayContains array = <copy_controls> contains = cancel
			ghmix_pad_back_sound
			break
		endif
	endif
	if ControllerMake start <controller>
		if ArrayContains array = <copy_controls> contains = copy
			<done> = 1
		endif
	endif
	if (<done> = 1)
		ui_menu_select_sfx
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
	if ArrayContains array = <copy_controls> contains = strum
		step_strum = 0
		if has_lefty_adj_control_press Dir = up controller = <controller> Player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				generic_menu_up_or_down_sound \{up}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press Dir = down controller = <controller> Player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				generic_menu_up_or_down_sound \{down}
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
			SoundEvent \{event = ghmix_select}
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
	if ((<high_pos> [0] - <low_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> - (3000.0, 0.0))
	elseif ((<low_pos> [0] - <high_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> + (3000.0, 0.0))
	else
		<low_pos> = <0xf3e484ed>
	endif
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
			Type = SpriteElement
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
			Type = SpriteElement
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
	Wait \{1
		gameframe}
	repeat
	jam_clear_clipboards
	broadcastevent \{Type = ghmix_stop_copy}
	if (<copy_all> = 1)
		GetArraySize \{$jam_tracks}
		track_count = 0
		begin
		jam_copy_track track = <track_count>
		<track_count> = (<track_count> + 1)
		repeat <array_Size>
	else
		jam_copy_track \{track = $jam_current_track}
	endif
	jam_debug_print_clipboards
	printf \{channel = jam_mode
		qs(0x8d7a590c)
		a = $jam_copy_bound_low
		b = $jam_copy_bound_high}
	if ScreenElementExists \{id = jam_copy_highlight}
		DestroyScreenElement \{id = jam_copy_highlight}
	endif
	LaunchEvent \{Type = focus
		target = jam_control_container}
	jam_recording_add_user_control_helpers
endscript

script jam_copy_track \{track = 0}
	printf channel = jam_mode qs(0xb53d417e) s = ($jam_tracks [<track>].name_text)
	gem_array = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	sixty_fourth_note = ((60000.0 / $jam_current_bpm) / 16.0)
	CastToInteger \{sixty_fourth_note}
	copy_bound_low = $jam_copy_bound_low
	copy_bound_high = ($jam_copy_bound_high - <sixty_fourth_note>)
	if (<copy_bound_high> < <copy_bound_low>)
		<copy_bound_high> = <copy_bound_low>
	endif
	gem_count = 0
	if (<notetrack_size> > 0)
		notetrack_index = 0
		begin
		time = ($<gem_array> [<notetrack_index>])
		if (<time> >= (<copy_bound_low> - 2) && <time> <= (<copy_bound_high> + 2))
			gem_count = (<gem_count> + 1)
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <notetrack_size>)
			break
		endif
		repeat
	endif
	gemarraysize = <gem_count>
	formatText checksumName = clipboard_array '%s_clipboard' s = ($jam_tracks [<track>].name_text)
	if GlobalExists Name = <clipboard_array> Type = array
		destroyscriptarray Name = <clipboard_array>
	endif
	createscriptarray Name = <clipboard_array> size = ((2 * <gem_count>) + 2) Heap = heap_song <...>
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	formatText checksumName = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track>].name_text)
	if (<gem_count> > 0)
		notetrack_index = 0
		begin
		getnotetrackitem Name = <gem_array> index = <notetrack_index>
		if (<gem_time> >= (<copy_bound_low> - 2) && <gem_time> <= (<copy_bound_high> + 2))
			addnotetrackitem Name = <clipboard_array> time = <gem_time> length = <gem_length> pattern = <gem_pattern>
			getjamsessionsound track = ($jam_tracks [<track>].id) index = (<notetrack_index> / 2)
			addjamsessionsound track = <clipboard_track> time = <gem_time> string = <note_string> fret = <note_fret> Type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <notetrack_size>)
			break
		endif
		repeat
	endif
endscript

script jam_debug_print_clipboards 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	formatText checksumName = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	clipboard_index = 0
	if GlobalExists Name = <clipboard_array> Type = array
		jamsession_debug_print_script_array gem_array = <clipboard_array>
	endif
	formatText checksumName = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track_count>].name_text)
	getjamsessionsize track = <clipboard_track>
	printf channel = jam_mode qs(0x9e0cb08c) s = <track_size> a = ($jam_tracks [<track_count>].name_text)
	track_index = 0
	if (<track_size> > 0)
		begin
		getjamsessionsound track = <clipboard_track> index = <track_index>
		<track_index> = (<track_index> + 1)
		repeat <track_size>
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_Size>
endscript

script jam_clear_clipboards 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	formatText checksumName = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track_count>].name_text)
	formatText checksumName = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	if GlobalExists Name = <clipboard_array> Type = array
		destroyscriptarray Name = <clipboard_array> Type = array
	endif
	getjamsessionsize track = <clipboard_track>
	if (<track_size> > 0)
		begin
		deletejamsessionsound track = <clipboard_track> index = 0
		getjamsessionsize track = <clipboard_track>
		if NOT (<track_size> > 0)
			break
		endif
		repeat
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_Size>
endscript

script jam_highway_paste_control 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	if ($jam_copy_bound_low = $jam_copy_bound_high)
		return
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			return
		endif
	endif
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	jam_update_undo_clipboard
	jam_recording_add_user_control_helpers \{state = paste}
	Wait \{5
		gameframes}
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	paste_multiple_button = Triangle
	paste_controls = [paste_one paste_multi cancel]
	tool_controls = []
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ArrayContains array = <paste_controls> contains = paste_one
		if ControllerMake <choose_button> <controller>
			ghmix_scroll \{adv_record}
			jam_highway_paste
			printf \{channel = jam_mode
				qs(0x76c31916)}
			broadcastevent \{Type = ghmix_paste_pasted}
		endif
	endif
	if ArrayContains array = <paste_controls> contains = paste_multi
		if ControllerMake <paste_multiple_button> <controller>
			SoundEvent \{event = ghmix_select}
			show_paste_multiple
			return
		endif
	endif
	if ArrayContains array = <paste_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			ui_menu_select_sfx
			break
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	broadcastevent \{Type = ghmix_paste_done}
	jam_recording_add_user_control_helpers
	LaunchEvent \{Type = focus
		target = jam_control_container}
endscript

script show_paste_multiple 
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			return
		endif
	endif
	jam_recording_add_user_control_helpers \{state = paste_multiple}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{paste_number_text = qs(0x22ee76e7)}
	endif
	if jam_studio_element :desc_resolvealias \{Name = paste_box}
		<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.0
		<resolved_id> :se_waitprops
	endif
	if jam_studio_element :desc_resolvealias \{Name = paste_box}
		<resolved_id> :SetProps Pos = (468.0, 18.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	paste_count = 1
	delay = 8
	max_num_pastes = 20
	begin
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			if jam_studio_element :desc_resolvealias \{Name = paste_box}
				<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.2
				<resolved_id> :se_waitprops
			endif
			return
		endif
	endif
	if ControllerMake <break_button>
		if jam_studio_element :desc_resolvealias \{Name = paste_box}
			ghmix_pad_back_sound
			<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.2
			<resolved_id> :se_waitprops
		endif
		jam_recording_add_user_control_helpers
		LaunchEvent \{Type = focus
			target = jam_control_container}
		return
	endif
	if ControllerPressed up <controller>
		ghmix_scroll \{adv_record}
		<paste_count> = (<paste_count> + 1)
		if (<paste_count> > <max_num_pastes>)
			<paste_count> = <max_num_pastes>
		endif
		KillSpawnedScript \{Name = scale_paste_arrows}
		SpawnScriptNow \{scale_paste_arrows
			id = jam_recording_spawns
			params = {
				up
			}}
		Wait <delay> frames
	endif
	if ControllerPressed down <controller>
		ghmix_scroll \{adv_record}
		<paste_count> = (<paste_count> - 1)
		if (<paste_count> < 1)
			<paste_count> = 1
		endif
		KillSpawnedScript \{Name = scale_paste_arrows}
		SpawnScriptNow \{scale_paste_arrows
			id = jam_recording_spawns
			params = {
				down
			}}
		Wait <delay> frames
	endif
	formatText TextName = loop_count_text qs(0x73307931) s = <paste_count>
	jam_studio_element :SetProps paste_number_text = <loop_count_text>
	if ControllerMake start <controller>
		SoundEvent \{event = ghmix_select}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	formatText TextName = paste_text qs(0x32176178) s = <paste_count>
	create_popup_warning_menu {
		player_device = ($memcardcontroller)
		title = qs(0xd7505531)
		textblock = {
			text = <paste_text>
		}
	}
	CreateScreenElement \{Type = SpriteElement
		parent = popup_warning_container
		id = loading_record
		texture = load_record
		Pos = (640.0, 512.0)
		z_priority = 10000
		rot_angle = 0}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	Wait \{1
		Second}
	count = 0
	begin
	if (<count> = (<paste_count> - 1))
		jam_highway_paste \{dont_skip = 0}
	else
		jam_highway_paste \{dont_skip = 1}
	endif
	Wait \{1
		gameframe}
	<count> = (<count> + 1)
	repeat <paste_count>
	destroy_popup_warning_menu
	if jam_studio_element :desc_resolvealias \{Name = paste_box}
		<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	jam_recording_add_user_control_helpers
	LaunchEvent \{Type = focus
		target = jam_control_container}
endscript

script jam_recording_animate_spinning_record 
	if NOT ScreenElementExists \{id = loading_record}
		if ScreenElementExists \{id = popup_warning_container}
			CreateScreenElement \{Type = SpriteElement
				parent = popup_warning_container
				id = loading_record
				texture = load_record
				Pos = (640.0, 485.0)
				z_priority = 10000
				rot_angle = 0}
		endif
	endif
	begin
	loading_record :se_getprops
	loading_record :se_setprops rot_angle = (<rot_angle> + 360) time = 1
	loading_record :se_waitprops
	repeat
endscript

script scale_paste_arrows 
	if GotParam \{up}
		jam_studio_element :SetProps \{paste_arrow_up_scale = 2.0}
		jam_studio_element :SetProps \{paste_arrow_up_scale = 1.5
			time = 0.15}
		jam_studio_element :se_waitprops
	endif
	if GotParam \{down}
		jam_studio_element :SetProps \{paste_arrow_down_scale = 2.0}
		jam_studio_element :SetProps \{paste_arrow_down_scale = 1.5
			time = 0.15}
		jam_studio_element :se_waitprops
	endif
endscript

script jam_highway_paste \{dont_skip = 0}
	GetArraySize \{$jam_tracks}
	track_count = 0
	copy_count = 0
	begin
	formatText checksumName = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	if GlobalExists Name = <clipboard_array> Type = array
		if (<clipboard_size> > 0)
			copy_count = (<copy_count> + 1)
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_Size>
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	copy_distance = ($jam_highway_play_time - $jam_copy_bound_low)
	end_time = ($jam_highway_play_time + <copy_size>)
	if (<copy_count> > 1)
		GetArraySize \{$jam_tracks}
		track_count = 0
		begin
		jam_paste_track track = <track_count>
		<track_count> = (<track_count> + 1)
		repeat <array_Size>
	else
		jam_paste_track \{track = $jam_current_track}
	endif
	jam_update_highway_infobox
	jam_recording_update_metaview
	quantize_to = ($jam_quantize [9].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<end_time> / <quantize>)
	CastToInteger \{intervals}
	low_end_time = (<intervals> * <quantize>)
	high_end_time = ((<intervals> + 1) * <quantize>)
	if ((<end_time> - <low_end_time>) > (<high_end_time> - <end_time>))
		<end_time> = <high_end_time>
	else
		<end_time> = <low_end_time>
	endif
	CastToInteger \{end_time}
	new_pos = ($jam_highway_play_line_pos - ((<end_time> / 1000.0) * $jam_highway_pixels_per_second))
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] < <end_pos> [0])
		jam_highway_move_end
	else
		SetScreenElementProps id = jam_highway_container Pos = <new_pos>
		Change jam_highway_play_time = <end_time>
		<new_low_bound> = ($jam_highway_start_low_bound + <end_time>)
		<new_high_bound> = ($jam_highway_start_high_bound + <end_time>)
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		Change jam_highway_low_bound = <new_low_bound>
		Change jam_highway_high_bound = <new_high_bound>
		if (<dont_skip> = 0)
			jam_highway_reinit
		endif
	endif
	if (<dont_skip> = 0)
		jam_show_paste_highlight
	endif
endscript

script jam_paste_track \{track = 0}
	printf channel = jam_mode qs(0xa4c13ad4) s = ($jam_tracks [<track>].name_text)
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	copy_distance = ($jam_highway_play_time - $jam_copy_bound_low)
	end_time = ($jam_highway_play_time + <copy_size>)
	jam_delete_range track = <track> low_bound = (($jam_highway_play_time) -5) high_bound = (<end_time> + 5)
	gem_array = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	printf channel = jam_mode qs(0xc5dd4e22) s = <notetrack_size>
	if (<notetrack_size> > 0)
		<count> = 0
		begin
		getnotetrackitem Name = <gem_array> index = <count>
		if ((<gem_time> <= $jam_highway_play_time) && ((<gem_time> + <gem_length>) > $jam_highway_play_time))
			<new_length> = ((($jam_highway_play_time) - <gem_time>))
			CastToInteger \{new_length}
			addnotetrackitem Name = <gem_array> time = <gem_time> length = <new_length> pattern = <gem_pattern>
			if (<count> = 0)
				getjamsessionsound track = ($jam_tracks [<track>].id) index = (<count>)
			else
				getjamsessionsound track = ($jam_tracks [<track>].id) index = ((<count> -2) / 2)
			endif
			findjamsessionsound track = ($jam_tracks [<track>].id) time = <time>
			if (<index> >= 0)
				deletejamsessionsound track = ($jam_tracks [<track>].id) index = <index>
			endif
			addjamsessionsound track = ($jam_tracks [<track>].id) time = <time> string = <note_string> fret = <note_fret> Type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
			break
		endif
		<count> = (<count> + 2)
		if (<count> >= <notetrack_size>)
			break
		endif
		repeat
	endif
	formatText checksumName = clipboard_array '%s_clipboard' s = ($jam_tracks [<track>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	formatText checksumName = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track>].name_text)
	getjamsessionsize track = <clipboard_track>
	<notes_in_clip> = <track_size>
	getjamsessionsize track = ($jam_tracks [<track>].id)
	if ((<notes_in_clip> + <track_size>) >= (($gemarraysize) - 1))
		<notes_in_clip> = (<notes_in_clip> - ((<notes_in_clip> + <track_size>) - (($gemarraysize) - 1)))
		if ($jam_advanced_record = 1)
			if NOT ScriptIsRunning \{show_warning_message}
				SpawnScriptNow \{show_warning_message
					id = jam_recording_spawns
					params = {
						warning_text = qs(0xdd331019)
						start_pos = (15.0, 800.0)
						end_pos = (15.0, -50.0)
					}}
			endif
		else
			SpawnScriptNow jam_note_limit_hit id = <limit_msg> params = {Player = ($jam_current_recording_player)}
		endif
	endif
	if (<notes_in_clip> = 0)
		return
	endif
	session_sound_index = 0
	begin
	if (getjamsessionsound track = <clipboard_track> index = <session_sound_index>)
		new_time = (<time> + <copy_distance>)
		CastToInteger \{new_time}
		if (<new_time> <= $jam_highway_end_time)
			if (<new_time> < $jam_highway_play_time)
				<new_time> = $jam_highway_play_time
			endif
			if (<new_time> > <end_time>)
				<new_time> = <end_time>
			endif
			getjamsessionsound track = <clipboard_track> index = <session_sound_index>
			addjamsessionsound track = ($jam_tracks [<track>].id) time = <new_time> string = <note_string> fret = <note_fret> chord_type = <chord_type> Type = <note_type> effect = <effect> velocity = <velocity>
		endif
	endif
	<session_sound_index> = (<session_sound_index> + 1)
	if (<session_sound_index> >= <notes_in_clip>)
		break
	endif
	repeat
	clipboard_index = 0
	if GlobalExists Name = <clipboard_array> Type = array
		if (<clipboard_size> > 0)
			begin
			getnotetrackitem Name = <clipboard_array> index = <clipboard_index>
			new_time = (<gem_time> + <copy_distance>)
			CastToInteger \{new_time}
			if (<new_time> <= $jam_highway_end_time)
				if (<new_time> < $jam_highway_play_time)
					<new_time> = $jam_highway_play_time
				endif
				if (<new_time> > <end_time>)
					<new_time> = <end_time>
				endif
				if (<new_time> + <gem_length> > $jam_highway_end_time)
					<gem_length> = ($jam_highway_end_time - <new_time>)
					CastToInteger \{gem_length}
				endif
				if (<gem_length> > 0)
					addnotetrackitem Name = <gem_array> time = <new_time> length = <gem_length> pattern = <gem_pattern>
					<check_sustain> = 0
					if (<notes_in_clip> = 1)
						<check_sustain> = 1
					elseif (<clipboard_index> = ((<notes_in_clip> * 2) -2))
						<check_sustain> = 1
					endif
					suffix = '_size'
					AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
					<gem_array_size> = ($<appended_id>)
					if (<index> >= (<gem_array_size> -2))
						<check_sustain> = 0
					endif
					if (<check_sustain> = 1)
						<cur_gem_time> = <new_time>
						<cur_gem_len> = <gem_length>
						<cur_gem_pattern> = <gem_pattern>
						getnotetrackitem Name = <gem_array> index = (<index> + 2)
						if ((<cur_gem_time> + <cur_gem_len>) > <gem_time>)
							<new_length> = (<gem_time> - <cur_gem_time>)
							CastToInteger \{new_length}
							addnotetrackitem Name = <gem_array> time = <cur_gem_time> length = <new_length> pattern = <cur_gem_pattern>
						endif
					endif
				endif
			endif
			<clipboard_index> = (<clipboard_index> + 2)
			if (<clipboard_index> >= (<notes_in_clip> * 2))
				break
			endif
			repeat
		endif
	endif
endscript

script jam_show_paste_highlight 
	if ($jam_copy_bound_low = $jam_copy_bound_high)
		return
	endif
	GetArraySize \{$jam_tracks}
	track_count = 0
	copy_count = 0
	begin
	formatText checksumName = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	if GlobalExists Name = <clipboard_array> Type = array
		if (<clipboard_size> > 0)
			copy_count = (<copy_count> + 1)
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_Size>
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	highlight_low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	highlight_high_pos = ((($jam_highway_play_time + <copy_size>) / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = jam_paste_highlight}
		DestroyScreenElement \{id = jam_paste_highlight}
	endif
	if (<copy_count> > 1)
		CreateScreenElement {
			Type = SpriteElement
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
			Type = SpriteElement
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
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
			if jam_studio_element :desc_resolvealias \{Name = paste_box}
				<resolved_id> :SetProps Pos = (468.0, 800.0) time = 0.2
				<resolved_id> :se_waitprops
			endif
			return
		endif
	endif
	nudge_controls = [nudge nudge_all cancel direction_swap]
	tool_controls = []
	nudge_direction = 1
	jam_update_undo_clipboard
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	track = ($jam_tracks [$jam_current_track].id)
	jam_recording_add_user_control_helpers \{state = nudge_forward}
	Wait \{5
		gameframes}
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = X
		case X
		break_button = circle
	endswitch
	nudge_all_button = Triangle
	swap_dir_button = Square
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	if NOT ($jam_current_quantize = 0)
		if ArrayContains array = <nudge_controls> contains = nudge
			if ControllerMake <choose_button> <controller>
				SoundEvent \{event = ghmix_scroll_up_down}
				if notenudge time = ($jam_highway_play_time) nudge = <quantize> song_length = ($jam_highway_song_length) gem_array = <gem_array> track = <track> direction = <nudge_direction>
					if (<nudge_direction> > 0)
						jam_highway_skip_forwards amount = <quantize>
					else
						jam_highway_skip_backwards amount = <quantize>
					endif
					Wait \{1
						gameframe}
				else
					KillSpawnedScript \{Name = show_warning_message}
					SpawnScriptNow \{show_warning_message
						id = jam_recording_spawns
						params = {
							warning_text = qs(0xf4ef3a8c)
						}}
				endif
			endif
		endif
		if ArrayContains array = <nudge_controls> contains = nudge_all
			if ControllerMake <nudge_all_button> <controller>
				SoundEvent \{event = ghmix_scroll_up_down}
				if notenudge time = ($jam_highway_play_time) nudge = <quantize> song_length = ($jam_highway_song_length) gem_array = <gem_array> track = <track> direction = <nudge_direction> all
					if (<nudge_direction> > 0)
						jam_highway_skip_forwards amount = <quantize>
					else
						jam_highway_skip_backwards amount = <quantize>
					endif
					Wait \{1
						gameframe}
				endif
			endif
		endif
	endif
	if ArrayContains array = <nudge_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			ui_menu_select_sfx
			break
		endif
	endif
	if ($0x1e022966 = true)
		if NOT ($game_mode = training)
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
	Wait \{1
		gameframe}
	repeat
	broadcastevent \{Type = ghmix_stop_nudge}
	jam_recording_add_user_control_helpers
	LaunchEvent \{Type = focus
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
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps Pos = <start_pos> time = 0.0
		<resolved_id> :se_waitprops
	endif
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps Pos = <end_pos> time = 0.2
		<resolved_id> :se_waitprops
	endif
	Wait \{3
		Seconds}
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps Pos = <start_pos> time = 0.2
		<resolved_id> :se_waitprops
	endif
endscript

script initialize_jam_highway 
	seconds_per_screen = ((720.0 / $jam_highway_pixels_per_second [0]) * 1000)
	Change \{jam_highway_start_low_bound = -800}
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
jam_highway_pixels_per_second = (250.0, 0.0)
start_at_index_bars = 0
start_at_index_markers = 0
jam_start_at_index_array = [
	0
	0
	0
	0
	0
]
jam_highway_hammer_on_tolerance = 0
jam_highway_play_time = 0
jam_highway_rotation = -90
jam_highway_play_line_pos_master = (450.0, 389.0)
jam_highway_play_line_pos = (0.0, 0.0)

script jam_recording_switch_instrument 
	if NOT ScreenElementExists \{id = jam_studio_element}
		return
	endif
	SpawnScriptNow \{fade_out_note_text}
	Player = ($jam_current_recording_player)
	getplayerinfo <Player> controller
	if isdrumcontroller controller = <controller>
		if NOT GotParam \{0x777de791}
			if NOT ScriptIsRunning \{show_warning_message}
				SpawnScriptNow \{show_warning_message
					id = jam_recording_spawns
					params = {
						warning_text = qs(0xd8aa2259)
					}}
			endif
			return
		endif
	endif
	LaunchEvent \{Type = unfocus
		target = jam_control_container}
	StopRendering
	Change \{jam_copy_bound_low = 0}
	Change \{jam_copy_bound_high = 0}
	jam_input_melody_stop_sound
	jam_clear_clipboards
	if ScreenElementExists \{id = jam_highway_container_master}
		DestroyScreenElement \{id = jam_highway_container_master}
	endif
	KillSpawnedScript \{Name = create_jam_highway_notetrack}
	KillSpawnedScript \{Name = create_jam_highway_fretbars}
	GetArraySize \{$jam_tracks}
	if ($jam_current_track = (<array_Size> - 1))
		Change \{jam_current_track = 0}
	else
		Change jam_current_track = ($jam_current_track + 1)
	endif
	setplayerinfo <Player> jam_instrument = ($jam_current_track)
	create_studio_now_bar
	jam_highway_reinit
	SpawnScriptNow \{create_jam_multiple_highways
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
	Wait \{10
		gameframes}
	StartRendering
	SpawnScriptNow \{id = jam_recording_spawns
		jam_ghmix_show_scale_reference}
	LaunchEvent \{Type = focus
		target = jam_control_container}
endscript

script jam_highway_reinit 
	Change \{start_at_index_bars = 0}
	Change \{start_at_index_markers = 0}
	Change \{jam_start_at_index_array = [
			0
			0
			0
			0
			0
		]}
endscript

script create_jam_multiple_highways 
	z_priority = 5
	ResolveScreenElementID \{id = jam_studio_element}
	if ScreenElementExists \{id = highway_window_element}
		DestroyScreenElement \{id = highway_window_element}
	endif
	CreateScreenElement \{Type = WindowElement
		parent = jam_studio_element
		id = highway_window_element
		Pos = (394.0, 115.0)
		dims = (717.0, 482.0)}
	CreateScreenElement {
		Type = ContainerElement
		parent = highway_window_element
		id = jam_highway_container_master
		just = [center center]
		Pos = ($jam_highway_play_line_pos_master - (437.0, 96.0))
		Scale = 1
		rot_angle = $jam_highway_rotation
	}
	CreateScreenElement \{Type = ContainerElement
		parent = jam_highway_container_master
		id = jam_highway_container
		Pos = $jam_highway_play_line_pos
		Scale = 1}
	initialize_jam_highway
	suffix = '_fretbars'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_fretbars = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_fretbars> SuffixString = <suffix>
	fretbar_size = <appended_id>
	suffix = '_timesig'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_timesig = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_timesig> SuffixString = <suffix>
	timesig_size = <appended_id>
	suffix = '_jam_markers'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_jam_markers = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
	<jam_markers_size> = <appended_id>
	bar_size = ((($<song_fretbars> [(($<fretbar_size>) - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_highway_container
		texture = white
		just = [left top]
		rgba = [80 80 80 255]
		Pos = (0.0, 56.0)
		dims = ((0.0, 680.0) + <bar_size>)
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
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
		Type = descinterface
		Pos = (0.0, -1000.0)
		rot_angle = 90
		desc = 'jam_loop_marker'}
	loop_start_marker :SetProps \{loop_text = qs(0x3d20eae5)}
	CreateScreenElement \{parent = jam_highway_container
		id = loop_end_marker
		Type = descinterface
		Pos = (0.0, -1000.0)
		rot_angle = 90
		desc = 'jam_loop_marker'}
	loop_end_marker :SetProps \{loop_text = qs(0x3feb20d0)}
	Change jam_highway_end_time = ($<song_fretbars> [($<fretbar_size> - 1)])
	SpawnScriptNow create_jam_highway_fretbars id = jam_recording_spawns params = {<...>}
	if jam_studio_element :desc_resolvealias \{Name = alias_main_inst_text}
		<resolved_id> :se_setprops text = ($jam_tracks [$jam_current_track].name_text)
	endif
	SpawnScriptNow \{create_jam_highway_notetrack
		id = jam_recording_spawns
		params = {
			track = $jam_current_track
			Pos = (0.0, 0.0)
			gem_offset = (0.0, 32.0)
			gem_scale = 0.8
		}}
	GetArraySize \{$jam_tracks}
	<small_gems_begin_pos> = (0.0, 192.0)
	track = ($jam_current_track + 1)
	<count> = 1
	begin
	if (<track> > (<array_Size> - 1))
		<track> = 0
	endif
	SpawnScriptNow create_jam_highway_notetrack id = jam_recording_spawns params = {track = <track> Pos = <small_gems_begin_pos> gem_offset = (0.0, 20.0) gem_scale = 0.55 small_view = 1}
	formatText checksumName = alias_id 'alias_inst_text%s' s = <count>
	if jam_studio_element :desc_resolvealias Name = <alias_id>
		<resolved_id> :se_setprops text = ($jam_tracks [<track>].name_text)
	endif
	<small_gems_begin_pos> = (<small_gems_begin_pos> + (0.0, 115.5))
	<track> = (<track> + 1)
	<count> = (<count> + 1)
	repeat (<array_Size> - 1)
endscript

script create_jam_highway_fretbars 
	<whole_measure_dims> = (7.0, 680.0)
	<quarter_measure_dims> = (4.0, 680.0)
	<bar_offset> = (0.0, 58.0)
	begin
	if ScreenElementExists \{id = jam_highway_bars_container}
		DestroyScreenElement \{id = jam_highway_bars_container}
	endif
	CreateScreenElement \{Type = ContainerElement
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
			formatText TextName = marker qs(0x40e7ccd5) s = <curr_marker_name> c = <curr_marker_count> b = ($jam_lightshow [<curr_marker_lightshow>].name_text)
		else
			formatText TextName = marker qs(0x54c9fe18) s = <curr_marker_name> b = ($jam_lightshow [<curr_marker_lightshow>].name_text)
		endif
		CreateScreenElement {
			parent = jam_highway_bars_container
			Type = descinterface
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
				Type = SpriteElement
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
				Type = SpriteElement
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
			CreateScreenElement {
				Type = SpriteElement
				parent = jam_highway_bars_container
				texture = measure_number_bg
				just = [center center]
				Scale = (2.5, 3.5)
				Pos = ((<bar_pos>) + (0.0, 13.0))
				z_priority = 13
			}
			if (<count> = ($<fretbar_size> - 1))
				formatText \{TextName = marker
					qs(0xfe76608c)}
			else
				formatText TextName = marker qs(0x73307931) s = ((<count> / 4) + 1)
			endif
			CreateScreenElement {
				Type = TextElement
				parent = jam_highway_bars_container
				font = fontgrid_text_a3
				just = [center center]
				Scale = 0.6
				rgba = [220 220 220 255]
				Pos = ((<bar_pos>) + (1.0, 14.0))
				text = <marker>
				rot_angle = (($jam_highway_rotation) * -1)
				z_priority = 14
				Shadow
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
		Wait \{5
			gameframes}
	else
		Wait \{5
			gameframes}
	endif
	repeat
endscript

script cleanup_jam_highway_notetrack 
	jamhighwaynotes_cleanup track = <track>
endscript

script create_jam_highway_notetrack \{small_view = 0}
	OnExitRun cleanup_jam_highway_notetrack params = {track = <track>}
	song_notetrack = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_notetrack> SuffixString = <suffix>
	notetrack_size = <appended_id>
	formatText checksumName = notetrack_cont 'jam_highway_notetrack_containter_%s' s = <track>
	<drum> = 0
	getplayerinfo \{$jam_current_recording_player
		controller}
	if isdrumcontroller controller = <controller>
		<drum> = 1
	endif
	jam_menu_get_lefty \{Player = $jam_current_recording_player}
	if (<drum> = 1)
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
		if NOT (<track> = 3)
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
					texture = kick_bar_white
					dims = (256.0, 32.0)
				}
			]
		endif
	endif
	if ScreenElementExists id = <notetrack_cont>
		DestroyScreenElement id = <notetrack_cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = jam_highway_container
		id = <notetrack_cont>
		Pos = <Pos>
	}
	jamhighwaynotes_init {
		track = <track>
		container = <notetrack_cont>
		gem_textures = <gem_textures>
		song_notetrack = <song_notetrack>
		notetrack_size = <notetrack_size>
		gem_textures = <gem_textures>
		lefty = <lefty>
		small_view = <small_view>
		controller = <controller>
		gem_offset = <gem_offset>
		gem_scale = <gem_scale>
	}
	getplayerinfo ($jam_current_recording_player) jam_instrument
	begin
	jamhighwaynotes_process track = <track> jam_instrument = <jam_instrument>
	Wait \{1
		gameframes}
	repeat
endscript

script jam_create_song_info_boxes 
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_highway_container
		id = studio_highway_infobox
		texture = white
		just = [right top]
		rgba = [50 50 50 255]
		dims = (510.0, 120.0)
		Pos = (0.0, 510.0)
		Scale = 1
		rot_angle = 90
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement {
		Type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_name
		font = fontgrid_text_a3
		just = [left center]
		Scale = 0.8
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
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
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
	<Seconds> = (<Mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<Seconds> / 10)
	if (<sec_check> < 1)
		formatText TextName = song_len qs(0xb76f0df8) a = <minutes> b = <Seconds>
	else
		formatText TextName = song_len qs(0x84b9fd2b) a = <minutes> b = <Seconds>
	endif
	CreateScreenElement {
		Type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_length
		font = fontgrid_text_a3
		just = [left center]
		Scale = 0.6
		rgba = [210 130 0 250]
		Pos = (35.0, 85.0)
		text = <song_len>
		z_priority = (<z_priority> + 1)
	}
	formatText TextName = song_bpm qs(0x3dbb8347) a = ($jam_current_bpm)
	CreateScreenElement {
		Type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_bpm
		font = fontgrid_text_a3
		just = [left center]
		Scale = 0.6
		rgba = [210 130 0 250]
		Pos = (185.0, 85.0)
		text = <song_bpm>
		z_priority = (<z_priority> + 1)
	}
	formatText TextName = num_notes qs(0xf939f6cb) a = <total_notes>
	CreateScreenElement {
		Type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_notes
		font = fontgrid_text_a3
		just = [left center]
		Scale = 0.6
		rgba = [210 130 0 250]
		Pos = (300.0, 85.0)
		text = <num_notes>
		z_priority = (<z_priority> + 1)
	}
	bar_size = ((($<song_fretbars> [($<fretbar_size> - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_highway_container
		id = studio_highway_endbox
		texture = white
		just = [right top]
		rgba = [50 50 50 255]
		dims = (510.0, 370.0)
		Pos = ((370.0, 500.0) + <bar_size>)
		Scale = 1
		rot_angle = 90
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement {
		Type = TextElement
		parent = studio_highway_endbox
		font = fontgrid_text_a11
		just = [left center]
		Scale = 2.2
		rgba = [210 130 0 250]
		Pos = (63.0, 270.0)
		text = qs(0x3a7145e5)
		z_priority = (<z_priority> + 1)
	}
endscript

script jam_update_highway_infobox 
endscript
jam_controls = [
	{
		id = control_end
		texture = icon_jump_end
		name_text = qs(0x2f3f8abc)
		help_text = qs(0x06beca0e)
	}
	{
		id = control_skip_forwards
		texture = icon_forward
		name_text = qs(0xef6d3166)
		help_text = qs(0x80e96b49)
	}
	{
		id = control_playstop
		texture = icon_play
		name_text = qs(0xcdaa4ea8)
		alt_name_text = qs(0x9dbd05c7)
		help_text = qs(0x4445dd4a)
	}
	{
		id = control_record
		texture = icon_record
		name_text = qs(0x66451271)
		help_text = qs(0xc35b4fe8)
	}
	{
		id = control_step_record
		texture = icon_step_record
		name_text = qs(0x1de48f0a)
		help_text = qs(0xe2aaa74b)
	}
	{
		id = control_skip_backwards
		texture = icon_back
		name_text = qs(0x9c8914fd)
		help_text = qs(0x2e95d105)
	}
	{
		id = control_beginning
		texture = icon_jump_begin
		name_text = qs(0x54328aa0)
		help_text = qs(0x9000707d)
	}
	{
		id = control_loop
		texture = icon_loop
		name_text = qs(0x5137d418)
		help_text = qs(0x9ecc1569)
	}
	{
		id = control_delete
		texture = icon_delete
		name_text = qs(0xa32bf91f)
		help_text = qs(0xb08851bd)
	}
	{
		id = control_copy
		texture = icon_copy
		name_text = qs(0x51af3a34)
		help_text = qs(0x9a1f8dfb)
	}
	{
		id = control_paste
		texture = icon_paste
		name_text = qs(0xc84166a2)
		help_text = qs(0x7ef0602d)
	}
	{
		id = control_note_nudge
		texture = icon_nudge
		name_text = qs(0x9f5b93ea)
		help_text = qs(0x075ba84c)
	}
	{
		id = control_marker
		texture = icon_add_marker
		name_text = qs(0x619cf5cd)
		alt_name_text = qs(0xbc4e8553)
		help_text = qs(0x97c16ba1)
	}
	{
		id = control_switch_instrument
		texture = icon_swap_instrument
		name_text = qs(0x6759cd0a)
		help_text = qs(0xe88cd0d2)
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
		Type = SpriteElement
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
		Type = SpriteElement
		id = selection_arrow
		parent = <resolved_id>
		texture = selection_arrow
		just = [left top]
		rgba = [255 255 255 255]
		Scale = 1
		Pos = (($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) + (25.0, -28.0))
		z_priority = (<z_priority> + 5)
	}
	getplayerinfo ($jam_current_recording_player) controller
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
		id = jam_control_container
		exclusive_device = <controller>
		Scale = 1
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
		Type = SpriteElement
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
		Type = SpriteElement
		parent = <id>
		id = ($jam_controls [<count>].id)
		texture = ($jam_controls [<count>].texture)
		just = [left top]
		Scale = 1.2750001
		Pos = (42.5, -2.0)
		rot_angle = 90
		z_priority = (<z_priority> + 3)
	}
	<count> = (<count> + 1)
	repeat <array_Size>
	jam_studio_element :se_setprops control_name_text = ($jam_controls [0].name_text)
	jam_studio_element :se_setprops control_help_text = ($jam_controls [0].help_text)
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
		Type = ContainerElement
		id = studio_nowbar_container
		parent = <resolved_id>
		Pos = (-4.0, 12.5)
		Scale = (0.78, 0.78)
		z_priority = 100
	}
	<gem_params> = {Type = SpriteElement parent = studio_nowbar_container just = [center center] Scale = 1 z_priority = 13}
	<drum> = 0
	<rb_drum> = 0
	getplayerinfo \{$jam_current_recording_player
		controller}
	if isdrumcontroller controller = <controller>
		if isrbdrum controller = <controller>
			<rb_drum> = 1
		endif
		<drum> = 1
	endif
	jam_menu_get_lefty \{Player = $jam_current_recording_player}
	if (<drum> = 1)
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
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [0])
	}
	CreateScreenElement {
		<gem_params>
		texture = red_now_off
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [1])
	}
	CreateScreenElement {
		<gem_params>
		texture = yellow_now_off
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [2])
	}
	CreateScreenElement {
		<gem_params>
		texture = blue_now_off
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [3])
	}
	if NOT (<rb_drum> = 1)
		CreateScreenElement {
			<gem_params>
			texture = orange_now_off
			dims = (64.0, 64.0)
			Pos = (<gem_positions> [4])
		}
	else
		CreateScreenElement {
			<gem_params>
			texture = orange_now_off
			dims = (64.0, 64.0)
			Pos = (<gem_positions> [4])
			rgba = [80 80 80 255]
		}
	endif
	<Player> = ($jam_current_recording_player)
	<gem_on_params> = {Type = SpriteElement parent = studio_nowbar_container just = [center center] Scale = 1 z_priority = 14}
	formatText checksumName = gem_id 'jam_now_on_gr_%s' s = <Player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = green_now_on
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [0])
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_re_%s' s = <Player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = red_now_on
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [1])
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_ye_%s' s = <Player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = yellow_now_on
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [2])
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_bl_%s' s = <Player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = blue_now_on
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [3])
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_or_%s' s = <Player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = orange_now_on
		dims = (64.0, 64.0)
		Pos = (<gem_positions> [4])
	}
	safe_hide id = <gem_id>
endscript

script jam_highway_select_quantize 
	z_priority = 30
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_menu_get_lefty \{Player = $jam_current_recording_player}
	getplayerinfo ($jam_current_recording_player) controller
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
	if NOT (($is_arpeggiator [$jam_current_track] = 1 || ($is_drum_machine = 1 && $jam_current_track = 3)) && ($jam_highway_recording = 1 && $jam_highway_step_recording != 1))
		if (<disallow_snap> = 0)
			if guitarcontrollermake left <controller>
				if (<lefty> = 1)
					change_quantize_right
				else
					change_quantize_left
				endif
			endif
			if guitarcontrollermake right <controller>
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
				jam_studio_element :SetProps snap_text = ($jam_quantize [1].name_text)
			endif
			if (($no_precise_snap = 1) && ($jam_current_quantize = 9))
				Change \{jam_current_quantize = 8}
				jam_studio_element :SetProps snap_text = ($jam_quantize [6].name_text)
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
	Wait \{1
		gameframe}
	repeat
endscript
no_marker_snap = 0
no_precise_snap = 0

script change_quantize_left 
	next_quantize = ($jam_current_quantize - 1)
	GetArraySize ($jam_quantize)
	ghmix_pad_back_sound
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
	jam_studio_element :se_setprops \{snap_arrow_left_scale = 2.0}
	jam_studio_element :se_setprops \{snap_arrow_left_scale = 1.3
		time = 0.15}
	jam_studio_element :se_waitprops
	broadcastevent \{Type = ghmix_snap_changed}
endscript

script change_quantize_right 
	next_quantize = ($jam_current_quantize + 1)
	GetArraySize ($jam_quantize)
	ghmix_pad_back_sound
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
	jam_studio_element :se_setprops \{snap_arrow_right_scale = 2.0}
	jam_studio_element :se_setprops \{snap_arrow_right_scale = 1.3
		time = 0.15}
	jam_studio_element :se_waitprops
	broadcastevent \{Type = ghmix_snap_changed}
endscript
jam_undo_track = -1

script jam_advanced_recording_undo 
	if ($jam_undo_track < 0)
		return
	endif
	gem_array = ($jam_tracks [$jam_undo_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	old_gem_count = ($<appended_id>)
	Change GlobalName = <appended_id> NewValue = 0
	getjamsessionsize track = ($jam_tracks [$jam_undo_track].id)
	if (<track_size> > 0)
		begin
		deletejamsessionsound track = ($jam_tracks [$jam_undo_track].id) index = 0
		getjamsessionsize track = ($jam_tracks [$jam_undo_track].id)
		if NOT (<track_size> > 0)
			break
		endif
		repeat
	endif
	formatText \{checksumName = undo_clipboard_array
		'undo_clipboard'}
	suffix = '_size'
	AppendSuffixToChecksum Base = <undo_clipboard_array> SuffixString = <suffix>
	new_gem_count = ($<appended_id>)
	notetrack_index = 0
	if (<new_gem_count> > 0)
		begin
		getnotetrackitem Name = <undo_clipboard_array> index = <notetrack_index>
		addnotetrackitem Name = <gem_array> time = <gem_time> length = <gem_length> pattern = <gem_pattern>
		index = -1
		findjamsessionsound track = undo_clipboard time = <gem_time>
		if (<index> >= 0)
			getjamsessionsound track = undo_clipboard index = <index>
			addjamsessionsound track = ($jam_tracks [$jam_undo_track].id) time = <time> string = <note_string> fret = <note_fret> Type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <new_gem_count>)
			break
		endif
		repeat
	endif
	if GlobalExists Name = <undo_clipboard_array> Type = array
		destroyscriptarray Name = <undo_clipboard_array>
	endif
	Change \{jam_undo_track = -1}
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
	jam_highway_reinit
endscript

script jam_clear_undo_clipboard 
	getjamsessionsize \{track = undo_clipboard}
	if (<track_size> > 0)
		begin
		deletejamsessionsound \{track = undo_clipboard
			index = 0}
		getjamsessionsize \{track = undo_clipboard}
		if NOT (<track_size> > 0)
			break
		endif
		repeat
	endif
endscript

script jam_update_undo_clipboard 
	jam_clear_undo_clipboard
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	GetArraySize ($<gem_array>)
	notetrack_size = <array_Size>
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	gem_count = ($<appended_id>)
	if (<notetrack_size> <= 0)
		return
	endif
	formatText \{checksumName = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists Name = <undo_clipboard_array> Type = array
		destroyscriptarray Name = <undo_clipboard_array>
	endif
	createscriptarray Name = <undo_clipboard_array> size = <notetrack_size> Heap = heap_song <...>
	if (<gem_count> > 0)
		notetrack_index = 0
		begin
		getnotetrackitem Name = <gem_array> index = <notetrack_index>
		addnotetrackitem Name = <undo_clipboard_array> time = <gem_time> length = <gem_length> pattern = <gem_pattern>
		index = -1
		findjamsessionsound track = ($jam_tracks [$jam_current_track].id) time = <gem_time>
		if (<index> >= 0)
			getjamsessionsound track = ($jam_tracks [$jam_current_track].id) index = <index>
			addjamsessionsound track = undo_clipboard time = <time> string = <note_string> fret = <note_fret> Type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <gem_count>)
			break
		endif
		repeat
	endif
	Change \{jam_undo_track = $jam_current_track}
endscript

script jam_advanced_recording_init_undo 
	if ($jam_undo_track < 0)
		<option_text_id> :se_setprops rgba = [50 50 50 255]
		<option_id> :se_setprops not_focusable
	else
		<option_text_id> :se_setprops rgba = ($menu_unfocus_color)
		<option_id> :se_setprops focusable
	endif
endscript

script jam_clear_track_check 
	getplayerinfo <select_player> jam_instrument
	if ($jam_advanced_record = 1)
		LaunchEvent \{Type = unfocus
			target = jam_pause_container}
		formatText TextName = dialog qs(0x0fc7f97d) s = ($jam_tracks [$jam_current_track].alt_text)
		controller = ($primary_controller)
	else
		LaunchEvent Type = unfocus target = <vmenu_id>
		formatText TextName = dialog qs(0x0fc7f97d) s = ($jam_tracks [<jam_instrument>].alt_text)
		getplayerinfo <select_player> controller
	endif
	clean_up_user_control_helpers
	create_popup_warning_menu {
		title = qs(0xbbcf951c)
		textblock = {
			text = <dialog>
			Pos = (640.0, 370.0)
		}
		player_device = <controller>
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_clear_track_go_back}
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
		destroy_popup_warning_menu
		set_focus_color \{rgba = [
				255
				255
				255
				255
			]}
		set_unfocus_color \{rgba = [
				210
				130
				0
				255
			]}
		jam_recording_add_user_control_helpers
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
	else
		destroy_popup_warning_menu
		ui_event \{event = menu_refresh}
	endif
endscript

script jam_clear_track 
	getplayerinfo <select_player> jam_instrument
	if ($jam_advanced_record = 1)
		jam_update_undo_clipboard
		jam_delete_range \{low_bound = 0
			high_bound = $jam_highway_song_length}
		jam_highway_reinit
		jam_highway_move_beginning
		jam_update_highway_infobox
		jam_recording_update_metaview
	else
		jam_delete_range low_bound = 0 track = <jam_instrument> high_bound = $jam_highway_song_length
	endif
	jam_clear_track_go_back <...>
endscript

script destroy_jam_recording_menu 
	jam_stop_all_sound
	Change \{jam_advanced_record = 0}
	jam_settings_reinit_menu_sounds
	destroy_popup_warning_menu
	if NOT GotParam \{0xd4617269}
		KillSpawnedScript \{Name = jam_recording_check_disconnect}
	endif
	KillSpawnedScript \{id = jam_recording_spawns}
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <jam_player_spawns>
	formatText checksumName = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <input_spawn>
	KillSpawnedScript \{Name = jam_step_wait}
	destroyplayerserverjaminput Player = ($jam_current_recording_player)
	KillSpawnedScript \{Name = fade_out_note_text}
	KillSpawnedScript \{id = jam_input_spawns}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_play_arpeggiator_loop}
	KillSpawnedScript \{Name = jam_play_drum_loop}
	jam_kill_update_note_length Player = ($jam_current_recording_player)
	if ScreenElementExists \{id = jam_studio_element}
		DestroyScreenElement \{id = jam_studio_element}
	endif
	jam_clear_clipboards
	formatText \{checksumName = clipboard_array
		'clipboard'}
	if GlobalExists Name = <clipboard_array> Type = array
		destroyscriptarray Name = <clipboard_array>
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
0xc781af4d = NULL

script 0x8461758e 
	jam_recording_add_user_control_helpers state = <0xc781af4d>
endscript

script jam_recording_add_user_control_helpers \{state = NULL}
	Change 0xc781af4d = <state>
	clean_up_user_control_helpers
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			<skip_button> = start
		elseif ScreenElementExists \{id = jam_studio_element}
			<skip_button> = back
		endif
		add_user_control_helper text = qs(0x784c64ff) button = <skip_button> z = 100
	endif
	switch <state>
		case Loop
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
		if ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0xd97f21c5)
				button = back
				z = 100}
		endif
		case recording
		add_user_control_helper \{text = qs(0xb581da63)
			button = start
			z = 100}
		if NOT controllerhasdpad controller = ($primary_controller)
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x1ff97b8d)
					button = back
					z = 100}
			endif
		endif
		if ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0xd97f21c5)
				button = back
				z = 100}
		endif
		case step_recording
		if NOT ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0x37b6bf56)
				button = strumbar
				z = 100}
		endif
		add_user_control_helper \{text = qs(0xb581da63)
			button = start
			z = 100}
		if NOT controllerhasdpad controller = ($primary_controller)
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x1ff97b8d)
					button = back
					z = 100}
			endif
		endif
		if ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0xd97f21c5)
				button = back
				z = 100}
		endif
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
				z = 100
				all_buttons}
			if NOT controllerhasdpad controller = ($primary_controller)
				if NOT ($game_mode = training)
					add_user_control_helper \{text = qs(0x1ff97b8d)
						button = back
						z = 100}
				endif
			endif
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
			endif
			add_user_control_helper text = ($jam_ghmix_text_skip_backwards) button = yellow z = 100
			add_user_control_helper text = ($jam_ghmix_text_skip_forwards) button = blue z = 100
		elseif ScreenElementExists \{id = jam_band_container}
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
				if GotParam \{instrument}
					if NOT ((<instrument> = 3) || (<instrument> = 4))
						add_user_control_helper \{text = qs(0xbdcf8d77)
							button = back
							z = 100}
					endif
				endif
			endif
		endif
	endswitch
endscript

script jam_recording_cleanup 
	clearjamsession
	jamsession_unload \{song_prefix = 'editable'}
endscript

script jam_recording_pause 
	if ($game_mode = training)
		return
	endif
	LaunchEvent \{Type = unfocus
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
	jam_studio_element :se_setprops time_marker_pos = <new_pos>
	Wait \{10
		gameframes}
	repeat
endscript

script jam_recording_update_metaview 
endscript

script jam_recording_destroy_metaview 
	if ScreenElementExists \{id = jam_metaview_cont}
		DestroyScreenElement \{id = jam_metaview_cont}
	endif
endscript

script jam_studio_hide_tilt_meter 
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
		<pitch_indicator> :se_setprops alpha = 0
	endif
	if ScreenElementExists id = <pitch_meter>
		<pitch_meter> :se_setprops alpha = 0
	endif
endscript

script jam_studio_tilt_meter 
	<Player> = ($jam_current_recording_player)
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
	getplayerinfo <Player> jam_instrument
	switch (<jam_instrument>)
		case 0
		<tilt_var> = jam_tilt_rhythm
		case 1
		<tilt_var> = jam_tilt_lead
		case 2
		<tilt_var> = jam_tilt_bass
		case 3
		<pitch_indicator> :se_setprops alpha = 1
		<pitch_meter> :se_setprops alpha = 1 texture = pitch_meter_whole
		return
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
			<pitch_indicator> :se_setprops alpha = 1
			<pitch_meter> :se_setprops alpha = 1 texture = pitch_meter
		else
			<pitch_indicator> :se_setprops alpha = 1
			<pitch_meter> :se_setprops alpha = 1 texture = pitch_meter_quarter
		endif
	else
		if (<jam_instrument> = 0)
			<pitch_indicator> :se_setprops alpha = 0
			<pitch_meter> :se_setprops alpha = 0
		else
			<pitch_indicator> :se_setprops alpha = 1
			<pitch_meter> :se_setprops alpha = 1 texture = pitch_meter
		endif
	endif
	<last_tilt> = -1
	begin
	if NOT (<last_tilt> = ($<tilt_var>))
		<last_tilt> = ($<tilt_var>)
		if ((<chromatic> = 0) || <jam_instrument> = 0)
			switch (<last_tilt>)
				case 0
				legacydoscreenelementmorph id = <pitch_indicator> time = 0.15 rot_angle = -20
				case 1
				legacydoscreenelementmorph id = <pitch_indicator> time = 0.15 rot_angle = 20
			endswitch
		else
			switch (<last_tilt>)
				case 0
				legacydoscreenelementmorph id = <pitch_indicator> time = 0.15 rot_angle = -45
				case 1
				legacydoscreenelementmorph id = <pitch_indicator> time = 0.15 rot_angle = -15
				case 2
				legacydoscreenelementmorph id = <pitch_indicator> time = 0.15 rot_angle = 15
				case 3
				legacydoscreenelementmorph id = <pitch_indicator> time = 0.15 rot_angle = 45
			endswitch
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_studio_animate_mouse time = 0.1 Pos = (($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) + (25.0, -28.0)) rotation = 0.0
	legacydoscreenelementmorph id = selection_arrow time = <time> Pos = <Pos> rot_angle = <rotation>
endscript

script jam_control_bar_skip_forwards 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> * 2)
	jam_highway_skip_forwards quantize = <quantize>
	ghmix_pad_up_down
endscript

script jam_control_bar_skip_backwards 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> * 2)
	jam_highway_skip_backwards quantize = <quantize>
	ghmix_pad_up_down
endscript

script jam_update_curr_note_text 
	getjamsessionsound track = ($jam_tracks [<jam_instrument>].id) index = <sound_index>
	if (<jam_instrument> != 3)
		if (<jam_instrument> = 4)
			note_fret = (<note_fret> + <velocity>)
		endif
		jam_get_sample_checksum fret = <note_fret> string = <note_string> Type = 0 chord_dir = 0 chord_type = 0 jam_instrument = <jam_instrument>
	endif
	switch <jam_instrument>
		case 0
		if (<note_type> >= 2)
			curr_note_text = ($jam_note_text_string_special)
		else
			if (<chord_type> = 0)
				chord_type_text = ($jam_note_text_string_power)
			elseif (<chord_type> = 3)
				chord_type_text = ($jam_note_text_string_mute)
			else
				formatText TextName = chord_type_text qs(0x0bc409e2) a = ($rhythm_chord_types [<chord_type>])
			endif
			formatText TextName = curr_note_text qs(0x646d1d57) a = <note_text> b = <chord_type_text>
		endif
		case 1
		case 2
		num_octaves = 0
		begin
		if (<note_string> > 0)
			if (<note_string> = 4)
				<note_fret> = (<note_fret> - 8)
			else
				<note_fret> = (<note_fret> - 7)
			endif
			<note_string> = (<note_string> -1)
			<note_fret> = (<note_fret> + 12)
		endif
		if (<note_string> = 0)
			break
		endif
		repeat
		curr_octave = (<note_fret> / 12)
		CastToInteger \{curr_octave}
		formatText TextName = curr_note_text qs(0x78f345f4) s = ($jam_note_text_string_octave) a = <note_text> b = (<curr_octave> + 1)
		case 4
		curr_octave = (<note_fret> / 12)
		CastToInteger \{curr_octave}
		formatText TextName = curr_note_text qs(0x78f345f4) s = ($jam_note_text_string_octave) a = <note_text> b = (<curr_octave> + 1)
		case 3
		if (<note_type> = 0)
			formatText TextName = curr_note_text qs(0x760fe478) s = ($jam_note_text_string_normal) a = <velocity>
		else
			formatText TextName = curr_note_text qs(0x760fe478) s = ($jam_note_text_string_perc) a = <velocity>
		endif
	endswitch
	KillSpawnedScript \{Name = fade_out_note_text}
	jam_studio_element :se_setprops playline_note_text = <curr_note_text>
	jam_studio_element :se_setprops \{playline_note_alpha = 1}
endscript

script jam_clear_curr_note_text 
	if NOT ScriptIsRunning \{fade_out_note_text}
		SpawnScriptNow \{fade_out_note_text}
	endif
endscript

script fade_out_note_text 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / 2)
	Wait (<quantize> / 1000.0) Seconds
	jam_studio_element :se_setprops \{playline_note_alpha = 0
		time = 0.25}
endscript

script jam_ghmix_show_scale_reference 
	getplayerinfo ($jam_current_recording_player) jam_instrument
	font_color = [180 180 180 255]
	button_text_params = {Type = TextElement font = fontgrid_text_a11 just = [center center] Scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {Type = TextBlockElement font = fontgrid_text_a3 just = [left center] rgba = <font_color>}
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
		if (<jam_instrument> = 4)
			<num_notes> = 6
			<background_dim> = (<background_dim> - (0.0, 30.0))
		else
			if NOT (<chosen_scale_index> = 0 || <chosen_scale_index> = 4)
				<num_notes> = 6
				<background_dim> = (<background_dim> - (0.0, 30.0))
			endif
		endif
	endif
	if ScreenElementExists \{id = jam_ghmix_scale_reference}
		DestroyScreenElement \{id = jam_ghmix_scale_reference}
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = jam_ghmix_scale_reference
		parent = jam_studio_element
		Pos = <cont_pos>
		z_priority = 1000
		alpha = 0
		Scale = 0.9
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_ghmix_scale_reference
		texture = white
		just = [center top]
		rgba = [20 20 20 200]
		Pos = <background_pos>
		dims = <background_dim>
		z_priority = 25
	}
	current_root = ($jam_track_rootnotes [<jam_instrument>])
	formatText TextName = scale_header qs(0x646d1d57) a = ($jam_roots [<current_root>]) b = (<chosen_scale>.Name)
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
		Type = SpriteElement
		parent = jam_ghmix_scale_reference
		texture = <sprite>
		just = [left bottom]
		Pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		Scale = 0.68
		z_priority = 26
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	<note_struct> = (<cur_scale> [<loop_count>])
	jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) Type = 0 jam_instrument = <jam_instrument>
	if (<chromatic> = 1)
		main_text = <note_text>
		if (<jam_instrument> = 0)
			<note_struct> = (<cur_scale> [<loop_count> + 7])
		else
			<note_struct> = (<cur_scale> [<loop_count> + 6])
		endif
		jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) Type = 0 jam_instrument = <jam_instrument>
		formatText TextName = final_text qs(0xc0962e7a) a = <main_text> b = <note_text>
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
	jam_ghmix_scale_reference :se_setprops \{alpha = 1
		time = 0}
endscript

script jam_ghmix_remove_scale_reference 
	if ScreenElementExists \{id = jam_ghmix_scale_reference}
		jam_ghmix_scale_reference :se_setprops \{alpha = 0
			time = 0}
		jam_ghmix_scale_reference :se_waitprops
		DestroyScreenElement \{id = jam_ghmix_scale_reference}
	endif
endscript
0x1e022966 = FALSE

script 0xa238e6a3 
	Change \{0x1e022966 = true}
endscript

script 0x807481eb 
	Change \{0x1e022966 = FALSE}
endscript

script 0xc377c1ac 
	if ($0x1e022966 = true)
		return \{true}
	endif
	return \{FALSE}
endscript

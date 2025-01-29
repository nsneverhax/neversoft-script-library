
script musicstudio_ghmix_init \{editing = 0}
	musicstudio_ghmix_set_part
	jam_setup_song editing = <editing> advanced_record = 1 from_song = <from_song>
	if (<editing> = 0)
		musicstudio_jamroom_set_style_from_wizard
	endif
	Change \{jam_advanced_record = 1}
	musicstudio_ghmix_create_highway
	musicstudio_mainobj :musicstudioghmix_init
	musicstudio_mainobj :musicstudioghmix_setupdate \{On = true}
	if musicstudio_mainobj :musicstudio_isusingstream
		musicstudio_mainobj :musicstudio_init \{Stream = true
			using_samples = true}
		musicstudio_player0 :musicstudioplayer_setusingsamples \{using_samples = true}
	else
		musicstudio_mainobj :musicstudio_init \{Stream = FALSE
			using_samples = true}
		musicstudio_player0 :musicstudioplayer_setusingsamples \{using_samples = true}
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_allowopennote open_note_allowed = true
	musicstudio_player0 :musicstudioplayer_setusingsamples \{using_samples = true}
	musicstudio_mainobj :musicstudiohighway_songview \{On = FALSE}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_hide_tilt_meter
	musicstudio_clear_undo_clipboard
	debug_analog_options_disable
	Change \{select_shift = 0}
	notetracker_whammy_set_fast_forward
	musicstudio_stop_menu_music
	musicstudio_menu_update_song_info_text
	musicstudio_reinit_menu_sounds
endscript
jam_highway_playing = 0
jam_highway_recording = 0
jam_highway_step_recording = 0
jam_current_recording_player = 1
jam_advanced_record = 0

script musicstudio_ghmix_create_highway 
	musicstudio_create_highway {
		pixels_per_beat = 60
		visible_after = -440
		visible_before = 100
		highway_pos = (-55.0, 416.0)
		<...>
	}
endscript

script musicstudio_ghmix_deinit 
	KillSpawnedScript \{Name = musicstudio_pulse_tip_text}
	musicstudio_ghmix_destroy_highway
	Change \{jam_advanced_record = 0}
	musicstudio_mainobj :musicstudioghmix_setupdate \{On = FALSE}
	KillSpawnedScript \{id = jam_recording_spawns}
	musicstudio_preview_stop
	musicstudio_playback_stop
	musicstudio_live_record_stop
	musicstudio_step_record_stop
	jam_stop_all_samples
	musicstudio_clear_undo_clipboard
	debug_analog_options_enable
	Change \{select_shift = 1}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	musicstudio_start_menu_music
	musicstudio_reinit_menu_sounds
endscript

script musicstudio_ghmix_destroy_highway 
	if ScreenElementExists \{id = jam_highway_container}
		musicstudio_ghmix_cleanup_highways
	endif
	if ScreenElementExists \{id = jam_highway_container_master}
		DestroyScreenElement \{id = jam_highway_container_master}
	endif
endscript

script musicstudio_ghmix_set_part 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getplayerindex
	<main_player> :musicstudioplayer_getcontroller
	setplayerinfo <Player> controller = <controller>
	if isdrumcontroller controller = <controller>
		setplayerinfo <Player> part = drum
	endif
	if IsGuitarController controller = <controller>
		setplayerinfo <Player> part = guitar
	endif
endscript
musicstudio_fretbars_alpha = 1
musicstudio_measure_numbers_alpha = 1

script musicstudio_ghmix_alpha_highway \{alpha = 0}
	if GotParam \{Everything}
		gems = 1
		fretbars = 1
		measure_numbers = 1
	endif
	if GotParam \{gems}
		GetArraySize ($jam_tracks)
		i = 0
		begin
		formatText checksumName = notetrack_cont 'jam_highway_notetrack_containter_%s' s = <i>
		if ScreenElementExists id = <notetrack_cont>
			<notetrack_cont> :se_setprops alpha = <alpha>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{fretbars}
		Change musicstudio_fretbars_alpha = <alpha>
	endif
	if GotParam \{measure_numbers}
		Change musicstudio_measure_numbers_alpha = <alpha>
	endif
endscript

script musicstudio_playback 
	setslomo ($notetracker_record_speed)
	musicstudio_mainobj :musicstudioghmix_setspeed speed = ($notetracker_record_speed)
	musicstudio_mainobj :musicstudioghmix_play \{On = true
		repeat_selection = true}
	musicstudio_preview
endscript

script musicstudio_playback_stop 
	setslomo \{1.0}
	musicstudio_mainobj :musicstudioghmix_setspeed \{speed = 1.0}
	musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
	musicstudio_preview_stop
endscript

script musicstudio_preview \{hopo = true
		step_record = 0}
	musicstudio_pulse_tip_text_stop
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getcontroller
	musicstudio_mainobj :musicstudio_getmainplayeridindex
	if isdrumcontroller controller = <controller>
		Wait \{8
			gameframes}
	endif
	<main_player> :musicstudioplayer_setinputupdate On = true hopo = <hopo>
	if NOT musicstudio_innotetracker
		<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
		musicstudio_ghmix_show_scale_reference step_record = <step_record> Player = <playerid_index>
		musicstudio_ghmix_refresh_drum_preview_display
	endif
	musicstudio_mainobj :musicstudioghmix_togglescrub \{On = FALSE}
	musicstudio_show_current_note_text
	if NOT (<step_record> = 1 && <instrument> != 3)
		spawnscript id = jam_recording_spawns musicstudio_preview_back_button_spawn params = {Player = <Player>}
	endif
endscript

script musicstudio_preview_stop 
	KillSpawnedScript \{Name = musicstudio_preview}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_setinputupdate On = FALSE
	musicstudio_ghmix_remove_scale_reference
	musicstudio_drum_pad_display_destroy
	musicstudio_nowbar_particles_destroy
	jam_stop_all_samples
	musicstudio_mainobj :musicstudioghmix_togglescrub \{On = true}
	if NOT GotParam \{no_whammy}
		<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	endif
	musicstudio_hide_current_note_text
	musicstudio_hide_tilt_meter
	KillSpawnedScript \{Name = musicstudio_preview_back_button_spawn}
endscript

script musicstudio_preview_back_button_spawn 
	begin
	musicstudio_preview_back_button
	Wait \{10
		gameframe}
	repeat
endscript

script musicstudio_preview_back_button \{Hide = 0}
	musicstudio_preview_back_button_get_active
	musicstudio_preview_back_button_get_name_text
	musicstudio_menu_update_button_text button = back Active = <Active> Hide = <Hide> button_text = <name_text>
	musicstudio_ghmix_refresh_drum_preview_display <...>
endscript

script musicstudio_preview_back_button_get_active 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	switch <instrument>
		case 0
		case 1
		case 2
		case 3
		return \{Active = 1}
		case 4
		return \{Active = 0
			Hide = 1}
	endswitch
	return \{Active = 0}
endscript

script musicstudio_preview_back_button_get_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getcontroller
	switch <instrument>
		case 0
		case 1
		case 2
		if ControllerPressed select <controller>
			return \{name_text = qs(0x76460e0f)}
		else
			return \{name_text = qs(0x9633a340)}
		endif
		case 3
		if ($is_percussion_kit = 1)
			return \{name_text = qs(0x27196410)}
		else
			return \{name_text = qs(0xf60e74c7)}
		endif
		case 4
		return \{name_text = qs(0x00000000)}
	endswitch
	return \{name_text = qs(0x00000000)}
endscript

script musicstudio_live_record 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	musicstudio_countin
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_start_metronome
	musicstudio_playback
	Change \{jam_highway_recording = 1}
	musicstudio_update_undo_clipboard
endscript

script musicstudio_live_record_stop 
	KillSpawnedScript \{Name = musicstudio_live_record}
	KillSpawnedScript \{Name = notetracker_dynamic_singpitch}
	musicstudio_playback_stop
	Change \{jam_highway_recording = 0}
	musicstudio_stop_metronome
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_step_record_init 
	musicstudio_update_undo_clipboard
	musicstudio_force_step_snap
endscript

script musicstudio_step_record 
	musicstudio_preview \{hopo = FALSE
		step_record = 1}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	Change \{jam_highway_recording = 1}
	Change \{jam_highway_step_recording = 1}
	musicstudio_ghmix :Obj_SpawnScriptNow \{musicstudio_step_record_spawn}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getcontroller
	if NOT isdrumcontroller controller = <controller>
		musicstudio_ghmix :Obj_SpawnScriptNow \{musicstudio_step_record_whammy_control}
		step_record_whammy_create_ui \{OFF}
	endif
endscript

script musicstudio_step_record_whammy_control 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		whammy_hold_count = 0
		begin
		if GuitarGetAnalogueInfo controller = ($primary_controller)
			if (<rightx> > 0.3)
				if (<whammy_hold_count> > 3)
					if ScriptIsRunning \{musicstudio_step_record_spawn}
						musicstudio_mainobj :musicstudio_getcurrmainplayer
						<main_player> :musicstudiomenu_setstate {
							id = <ghmix_menu>
							state = musicstudio_step_record_whammy_state
						}
					endif
				endif
				<whammy_hold_count> = (<whammy_hold_count> + 1)
			else
				if NOT ScriptIsRunning \{musicstudio_step_record_spawn}
					musicstudio_mainobj :musicstudio_getcurrmainplayer
					<main_player> :musicstudiomenu_setstate {
						id = <ghmix_menu>
						state = musicstudio_step_record_state
					}
				endif
			endif
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script musicstudio_step_record_spawn 
	begin
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_step instrument = <instrument>
	if NOT (<instrument> = 3)
		hold_count = 0
		wait_before_sustain = 15
		begin
		if NOT ControllerPressed up ($primary_controller)
			if NOT ControllerPressed down ($primary_controller)
				break
			endif
		endif
		if (<hold_count> = <wait_before_sustain>)
			musicstudio_mainobj :musicstudioghmix_play On = true track = ($jam_tracks [<instrument>].id)
		endif
		<hold_count> = (<hold_count> + 1)
		Wait \{1
			gameframe}
		repeat
	endif
	musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
	musicstudio_skip_closest_snap snap = ($jam_quantize [$jam_current_quantize].value)
	repeat
endscript

script musicstudio_step_record_whammy_init 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getcontroller
	if NOT isdrumcontroller controller = <controller>
		step_record_whammy_create_ui \{On}
	endif
	musicstudio_ghmix :Obj_SpawnScriptNow \{musicstudio_step_record_whammy_control}
endscript

script musicstudio_step_record_whammy_deinit 
	step_record_whammy_destroy_ui
	KillSpawnedScript \{Name = musicstudio_step_record_whammy_control}
	KillSpawnedScript \{Name = jam_input_update_note_length}
endscript

script musicstudio_step_record_whammy_skip_forward 
	musicstudio_skip_forward
	musicstudio_step_record_whammy_update_button_text
endscript

script musicstudio_step_record_whammy_skip_backward 
	musicstudio_skip_backward
	musicstudio_step_record_whammy_update_button_text
endscript

script musicstudio_step_record_whammy_update_button_text 
	step_record_whammy_delete_note_name_text
	step_record_whammy_delete_note_get_active
	musicstudio_menu_update_button_text button = red Active = <Active> button_text = <name_text>
endscript

script step_record_whammy_delete_note_get_active 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_getsongtime
		musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 192.0)
		CastToInteger \{note_quantize_ms}
		if ((<note_time> >= (<song_time> - <note_quantize_ms>)) && (<note_time> <= (<song_time> + <note_quantize_ms>)))
			return \{Active = 1}
		endif
	endif
	return \{Active = 0}
endscript

script step_record_whammy_delete_note_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_getsongtime
		musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 192.0)
		CastToInteger \{note_quantize_ms}
		if ((<note_time> >= (<song_time> - <note_quantize_ms>)) && (<note_time> <= (<song_time> + <note_quantize_ms>)))
			return \{name_text = qs(0x4890defe)}
		endif
	endif
	return \{name_text = qs(0xf5b91c89)}
endscript

script step_record_whammy_delete_note 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 192.0)
	CastToInteger \{note_quantize_ms}
	musicstudio_mainobj :musicstudioghmix_deletearea delete_low_bound = (<song_time> - <note_quantize_ms>) delete_high_bound = (<song_time> + <note_quantize_ms>)
	musicstudio_step_record_whammy_update_button_text
endscript

script step_record_whammy_create_ui 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	message = ($ghmix_step_record_whammy_off_message)
	if GotParam \{On}
		message = ($ghmix_step_record_whammy_on_message)
	endif
	pos_offset = (0.0, 0.0)
	if (<instrument> = 3)
		<pos_offset> = (0.0, -45.0)
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		if NOT ScreenElementExists \{id = step_record_whammy_ui}
			CreateScreenElement {
				Type = TextBlockElement
				parent = <ghmix_menu>
				id = step_record_whammy_ui
				font = fontgrid_text_a3
				rgba = [113 121 133 255]
				text = <message>
				just = [left top]
				internal_just = [left top]
				internal_scale = 0.3
				z_priority = 10
				Pos = ((60.0, 278.0) + <pos_offset>)
				dims = (310.0, 50.0)
				single_line = FALSE
				fit_width = wrap
				fit_height = `scale	down	if	larger`
				scale_mode = `per	axis`
			}
			CreateScreenElement \{parent = step_record_whammy_ui
				Type = SpriteElement
				texture = white
				rgba = [
					0
					0
					0
					255
				]
				dims = (325.0, 60.0)
				just = [
					left
					top
				]
				Scale = 1
				alpha = 0.25
				Pos = (-8.0, -6.0)
				z_priority = 9}
		endif
	endif
endscript

script step_record_whammy_destroy_ui 
	if ScreenElementExists \{id = step_record_whammy_ui}
		DestroyScreenElement \{id = step_record_whammy_ui}
	endif
endscript

script musicstudio_step 
	Block \{Type = musicstudio_ghmix_note_recorded}
	if (<instrument> = 3)
		Wait \{4
			frames}
	endif
	musicstudio_skip_forward
endscript

script musicstudio_step_record_stop 
	KillSpawnedScript \{Name = musicstudio_step_record_spawn}
	KillSpawnedScript \{Name = musicstudio_step_record_whammy_control}
	KillSpawnedScript \{Name = jam_input_update_note_length}
	musicstudio_preview_stop \{no_whammy}
	Change \{jam_highway_recording = 0}
	Change \{jam_highway_step_recording = 0}
	musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
	step_record_whammy_destroy_ui
endscript

script musicstudio_step_record_end 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_punch_in_record 
	musicstudio_preview
	Change \{jam_highway_recording = 1}
	Change \{jam_highway_step_recording = 1}
	musicstudio_ghmix :Obj_SpawnScriptNow \{musicstudio_punch_in_record_spawn}
	musicstudio_update_undo_clipboard
	musicstudio_start_metronome
endscript

script musicstudio_punch_in_record_spawn 
	Block \{Type = musicstudio_ghmix_note_recorded}
	musicstudio_playback
endscript

script musicstudio_punch_in_record_stop 
	KillSpawnedScript \{Name = musicstudio_punch_in_record_spawn}
	musicstudio_preview_stop
	musicstudio_playback_stop
	Change \{jam_highway_recording = 0}
	Change \{jam_highway_step_recording = 0}
	musicstudio_stop_metronome
endscript

script musicstudio_loop_init 
	musicstudio_skip_closest_snap
	musicstudio_select_area_init
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
endscript

script musicstudio_loop_deinit 
	musicstudio_select_area_deinit
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_set_loop 
	musicstudio_mainobj :musicstudioghmix_setloop
endscript

script musicstudio_set_loop_a 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_getloop
	if (<song_time> > <loop_end>)
		musicstudio_mainobj :musicstudioghmix_setloop high_bound = (<song_time> + 1)
	endif
	musicstudio_mainobj :musicstudioghmix_setloop low_bound = <song_time>
endscript

script musicstudio_set_loop_b 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if (<song_time> = 0)
		return
	endif
	musicstudio_mainobj :musicstudioghmix_getloop
	if (<song_time> < <loop_start>)
		musicstudio_mainobj :musicstudioghmix_setloop low_bound = (<song_time> -1)
	endif
	musicstudio_mainobj :musicstudioghmix_setloop high_bound = <song_time>
endscript

script musicstudio_clear_loop 
	musicstudio_mainobj :musicstudioghmix_setloop \{CLEAR = true}
endscript

script musicstudio_clear_loop_get_active 
	musicstudio_mainobj :musicstudioghmix_getloop
	if (<loop_start> = -1 || <loop_end> = -1)
		return \{Active = 0}
	endif
	return \{Active = 1}
endscript

script musicstudio_force_skip_to_closest_tick 
	musicstudio_skip_closest_snap snap = (1.0 / 192.0)
endscript

script musicstudio_skip_forward \{speed_multiplier = 1.0}
	notetracker_whammy_set_fast_forward
	if (($notetracker_skip_by_note = 1) && ($musicstudio_editing_mode = notetracker))
		musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 1}
		<snap_time> = <note_time>
	else
		if NOT GotParam \{snap}
			snap = ($jam_quantize [$jam_current_quantize].value)
		endif
		snap = (<snap> * <speed_multiplier>)
		get_next_snap_time time = ($jam_highway_play_time) snap = <snap>
	endif
	musicstudio_mainobj :musicstudioghmix_movehighway time = <snap_time>
	musicstudio_force_skip_to_closest_tick
	printf channel = musicstudio qs(0x21a91fb7) s = <snap_time>
endscript

script musicstudio_skip_backward \{speed_multiplier = 1.0}
	notetracker_whammy_set_rewind
	if (($notetracker_skip_by_note = 1) && ($musicstudio_editing_mode = notetracker))
		musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = -1}
		<snap_time> = <note_time>
	else
		if NOT GotParam \{snap}
			snap = ($jam_quantize [$jam_current_quantize].value)
		endif
		snap = (<snap> * <speed_multiplier>)
		get_prev_snap_time time = ($jam_highway_play_time) snap = <snap>
	endif
	musicstudio_mainobj :musicstudioghmix_movehighway time = <snap_time>
	musicstudio_force_skip_to_closest_tick
endscript

script musicstudio_skip_closest_snap \{snap = 1.0}
	musicstudio_mainobj :musicstudioghmix_getsnaptime time = ($jam_highway_play_time) snap = <snap> direction = 0
	if (($jam_highway_play_time) != <snap_time>)
		musicstudio_mainobj :musicstudioghmix_movehighway time = <snap_time>
	endif
endscript

script musicstudio_skip_forward_select_area \{speed_multiplier = 1.0}
	musicstudio_skip_forward speed_multiplier = <speed_multiplier>
	musicstudio_select_area_update
endscript

script musicstudio_skip_backward_select_area \{speed_multiplier = 1.0}
	musicstudio_skip_backward speed_multiplier = <speed_multiplier>
	musicstudio_select_area_update
endscript

script musicstudio_skip_forward_measure_select_area 
	musicstudio_skip_forward \{snap = 1.0}
	musicstudio_select_area_update
endscript

script musicstudio_skip_backward_measure_select_area 
	musicstudio_skip_backward \{snap = 1.0}
	musicstudio_select_area_update
endscript

script musicstudio_skip_forward_quarter_select_area 
	musicstudio_skip_forward snap = (1.0 / 4.0)
	musicstudio_select_area_update
endscript

script musicstudio_skip_backward_quarter_select_area 
	musicstudio_skip_backward snap = (1.0 / 4.0)
	musicstudio_select_area_update
endscript

script musicstudio_toggle_select_get_name_text 
	musicstudio_mainobj :musicstudioghmix_getselectarea
	if (<select_area_all_tracks> = true)
		return \{name_text = qs(0x7e3f9d58)}
	else
		return \{name_text = qs(0x6fd13c44)}
	endif
endscript

script musicstudio_toggle_select 
	musicstudio_mainobj :musicstudioghmix_toggleselectarea
	musicstudio_toggle_select_get_name_text
	musicstudio_menu_update_button_text button = orange button_text = <name_text>
endscript

script musicstudio_toggle_star_design_select 
	musicstudio_mainobj :musicstudioghmix_toggleselectarea
	musicstudio_toggle_select_get_name_text
	musicstudio_menu_update_button_text button = red button_text = <name_text>
endscript

script musicstudio_select_area_init 
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{reset
		update = true
		use_song_time = true}
endscript

script musicstudio_select_area_deinit 
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{update = FALSE}
	ghmix_menu_remove_area_highlight
endscript

script musicstudio_select_area_update 
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{use_song_time = true}
endscript

script musicstudio_delete_area_init 
	musicstudio_select_area_init
	musicstudio_toggle_select_get_name_text
	musicstudio_menu_update_button_text button = orange button_text = <name_text>
	musicstudio_force_step_snap
	musicstudio_update_undo_clipboard
endscript

script musicstudio_delete_area 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_getselectarea
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 192.0)
	CastToInteger \{note_quantize_ms}
	if (<song_time> = <select_area_end>)
		musicstudio_mainobj :musicstudioghmix_deletearea delete_low_bound = (<song_time> - <note_quantize_ms>) delete_high_bound = (<song_time> + <note_quantize_ms>)
	else
		musicstudio_mainobj :musicstudioghmix_deletearea
	endif
	musicstudio_verify_patterns
	musicstudio_ghmix_highway_reinit_all
endscript

script musicstudio_delete_area_all 
	musicstudio_mainobj :musicstudioghmix_deletearea \{CLEAR = true}
	musicstudio_verify_patterns
	musicstudio_ghmix_highway_reinit_all
	musicstudio_delete_area_all_continue
endscript

script musicstudio_copy_area 
	jam_clear_clipboards
	musicstudio_mainobj :musicstudioghmix_copyarea
endscript

script musicstudio_cut_area 
	musicstudio_update_undo_clipboard
	jam_clear_clipboards
	musicstudio_mainobj :musicstudioghmix_copyarea
	musicstudio_mainobj :musicstudioghmix_deletearea
	musicstudio_verify_patterns
endscript

script musicstudio_paste 
	musicstudio_mainobj :musicstudioghmix_paste
	musicstudio_verify_patterns
	musicstudio_force_skip_to_closest_tick
endscript

script musicstudio_paste_init 
	musicstudio_mainobj :musicstudioghmix_pasteinit
	musicstudio_update_undo_clipboard
endscript

script musicstudio_paste_deinit 
	ghmix_menu_remove_area_highlight
endscript

script musicstudio_paste_skip_forward 
	musicstudio_skip_forward
	musicstudio_mainobj :musicstudioghmix_pasteinit
endscript

script musicstudio_paste_skip_backward 
	musicstudio_skip_backward
	musicstudio_mainobj :musicstudioghmix_pasteinit
endscript

script musicstudio_quantize_area 
	musicstudio_update_undo_clipboard
	musicstudio_mainobj :musicstudioghmix_quantize snap = ($jam_quantize [$jam_current_quantize].value)
endscript

script musicstudio_nudge_init 
	musicstudio_update_undo_clipboard
endscript

script musicstudio_nudge 
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = ($jam_quantize [$jam_current_quantize].value)
	if NOT musicstudio_mainobj :musicstudioghmix_nudge all = FALSE nudge = <note_quantize_ms> direction = <direction>
		musicstudio_show_popup_warning \{warning = qs(0x1ebea482)}
	endif
	musicstudio_verify_patterns
endscript

script musicstudio_nudge_all 
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = ($jam_quantize [$jam_current_quantize].value)
	if NOT musicstudio_mainobj :musicstudioghmix_nudge all = true nudge = <note_quantize_ms> direction = <direction>
		musicstudio_show_popup_warning \{warning = qs(0x1ebea482)}
	endif
	musicstudio_verify_patterns
endscript

script musicstudio_tempo_change_value 
	musicstudio_change_bpm bpm = <curr_value>
	musicstudio_create_fretbars
endscript

script musicstudio_tempo_get_curr_value 
	return curr_value = ($jam_current_bpm)
endscript

script musicstudio_tempo_get_value_bounds 
	low_bpm = 60
	high_bpm = 220
	return low_bound = <low_bpm> high_bound = <high_bpm>
endscript

script musicstudio_tempo_deinit_exit 
	musicstudio_tempo_deinit
	musicstudio_init_all_line6_effects
endscript

script musicstudio_tempo_deinit 
	KillSpawnedScript \{Name = jam_recording_metronome}
endscript

script musicstudio_tempo_preview 
	<menu_id> :GetTags
	KillSpawnedScript \{Name = jam_recording_metronome}
	reset_song_time \{starttime = 0}
	SoundEvent \{event = audio_jam_play_metronome_sfx
		downbeat = 1}
	<menu_id> :Obj_SpawnScriptNow jam_recording_metronome params = {bpm = <curr_value> time = 0 sound_only tempo_preview}
endscript

script jam_recording_metronome \{flash_light = 0}
	if NOT GotParam \{time}
		<curr_time> = $jam_highway_play_time
	else
		<curr_time> = <time>
	endif
	CastToInteger \{curr_time}
	if NOT GotParam \{bpm}
		bpm = ($jam_current_bpm)
	endif
	quantize_to = 1
	ms_per_beat = (60000.0 / <bpm>)
	quantize_fretbar = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_fretbar>)
	CastToInteger \{intervals}
	new_time_fretbar = (<intervals> * <quantize_fretbar>)
	<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
	CastToInteger \{new_time_fretbar}
	quantize_to = 0.25
	ms_per_beat = (60000.0 / <bpm>)
	quantize_measure = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_measure>)
	CastToInteger \{intervals}
	new_time_measure = (<intervals> * <quantize_measure>)
	<new_time_measure> = (<new_time_measure> + <quantize_measure>)
	CastToInteger \{new_time_measure}
	begin
	if GotParam \{tempo_preview}
		GetSongTimeMs
	else
		musicstudio_mainobj :musicstudioghmix_getsongtime
		time = <song_time>
	endif
	CastToInteger \{time}
	if (<time> >= <new_time_measure>)
		<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
		<new_time_measure> = (<new_time_measure> + <quantize_measure>)
		if ($jam_click_track = 1)
			SoundEvent \{event = audio_jam_play_metronome_sfx
				downbeat = 1}
		endif
	endif
	if (<time> >= <new_time_fretbar>)
		<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
		if ($jam_click_track = 1)
			SoundEvent \{event = audio_jam_play_metronome_sfx}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_recording_metronome_stop 
	KillSpawnedScript \{Name = jam_recording_metronome}
endscript

script musicstudio_change_volume_get_name_text 
	musicstudio_volume_get_curr_value Player = <Player>
	formatText TextName = name_text qs(0x414080a3) s = <curr_value>
	return name_text = <name_text>
endscript

script musicstudio_volume_change_value 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mixer_volume_change_value instrument = <instrument> curr_value = <curr_value>
endscript

script musicstudio_volume_get_curr_value 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mixer_volume_get_curr_value instrument = <instrument>
	return curr_value = <curr_value>
endscript

script musicstudio_volume_get_value_bounds 
	low_bpm = 0
	high_bpm = 11
	return low_bound = <low_bpm> high_bound = <high_bpm>
endscript

script musicstudio_volume_up_down_script 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mixer_volume_change_value instrument = <instrument> curr_value = <curr_value>
	musicstudio_volume_preview Player = <Player>
endscript

script musicstudio_volume_deinit 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_update_volume jam_instrument = <instrument>
endscript

script musicstudio_volume_preview 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	if NOT (<instrument> = 3)
		KillSpawnedScript \{Name = musicstudio_play_single_note}
		musicstudio_mainobj :Obj_SpawnScriptNow musicstudio_play_single_note params = {instrument = <instrument>}
	else
		KillSpawnedScript \{Name = musicstudio_drum_kit_preview_loop}
		musicstudio_mainobj :Obj_SpawnScriptNow musicstudio_drum_kit_preview_loop params = {Player = <Player> percussion = 0 pad = snare}
	endif
endscript

script musicstudio_set_star_power_init 
	musicstudio_skip_closest_snap
	musicstudio_select_area_init
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
endscript

script musicstudio_set_star_power_deinit 
	musicstudio_select_area_deinit
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_set_star_power 
	musicstudio_mainobj :musicstudioghmix_setstarpower \{On = true}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <Player> lefty_flip
	musicstudio_mainobj :musicstudiohighway_reinit lefty = <lefty_flip> jam_instrument = <instrument>
	musicstudio_select_area_deinit
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{reset_area
		update = true
		use_song_time = true}
endscript

script musicstudio_remove_star_power 
	musicstudio_mainobj :musicstudioghmix_setstarpower \{On = FALSE}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <Player> lefty_flip
	musicstudio_mainobj :musicstudiohighway_reinit lefty = <lefty_flip> jam_instrument = <instrument>
	musicstudio_select_area_deinit
	musicstudio_select_area_init
endscript

script musicstudio_edit_playable_init 
	musicstudio_update_playables
	musicstudio_skip_closest_snap
	musicstudio_select_area_init
	musicstudio_mainobj :musicstudioghmix_toggleselectarea
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <Player> lefty_flip
	Change \{musicstudio_note_edit_mode = set_playable}
	blackout = [1 1 1 1 1]
	switch <instrument>
		case 0
		<blackout> = [0 1 1 1 0]
		case 1
		<blackout> = [1 1 1 0 0]
		case 2
		<blackout> = [1 0 1 1 0]
		case 4
		<blackout> = [1 1 0 1 0]
	endswitch
	musicstudio_highway_blackout blackout = <blackout>
	GetArraySize \{$jam_tracks}
	track = 0
	begin
	jamhighwaynotes_setplayablemode On = true jam_instrument = <track>
	musicstudio_mainobj :musicstudiohighway_reinit free_all = true lefty = <lefty_flip> jam_instrument = <track>
	<track> = (<track> + 1)
	repeat <array_Size>
endscript

script musicstudio_edit_playable_deinit 
	musicstudio_select_area_deinit
	musicstudio_highway_blackout \{remove}
	Change \{musicstudio_note_edit_mode = None}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <Player> lefty_flip
	GetArraySize \{$jam_tracks}
	track = 0
	begin
	jamhighwaynotes_setplayablemode On = FALSE jam_instrument = <track>
	musicstudio_mainobj :musicstudiohighway_reinit free_all = true lefty = <lefty_flip> jam_instrument = <track>
	<track> = (<track> + 1)
	repeat <array_Size>
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_edit_playable_get_active 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 0 || <instrument> = 1 || <instrument> = 2 || <instrument> = 4)
		return \{Active = 1}
	else
		return \{Active = 0}
	endif
endscript

script musicstudio_edit_playable_get_state 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_state = NULL
	switch <instrument>
		case 0
		case 1
		<musicstudio_state> = musicstudio_guitar_edit_playable_state
		case 2
		case 4
		<musicstudio_state> = musicstudio_bass_edit_playable_state
	endswitch
	return musicstudio_state = <musicstudio_state>
endscript

script musicstudio_set_playable_success 
	musicstudio_select_area_deinit
	musicstudio_select_area_init
	musicstudio_mainobj :musicstudioghmix_toggleselectarea
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <Player> lefty_flip
	GetArraySize \{$jam_tracks}
	track = 0
	begin
	musicstudio_mainobj :musicstudiohighway_reinit free_all = true lefty = <lefty_flip> jam_instrument = <track>
	<track> = (<track> + 1)
	repeat <array_Size>
endscript

script musicstudio_set_playable_lead 
	if ($musicstudio_whammy_rewind > 0)
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 1)
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = true}
	else
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = FALSE}
	endif
	musicstudio_set_playable_success in_game_name = qs(0x9504b94a) inst_name = qs(0x15d22c2f) instrument = <instrument>
endscript

script musicstudio_set_playable_rhythm 
	if ($musicstudio_whammy_rewind > 0)
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 0)
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = true}
	else
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = FALSE}
	endif
	musicstudio_set_playable_success in_game_name = qs(0x9504b94a) inst_name = qs(0xdfa3a913) instrument = <instrument>
endscript

script musicstudio_set_playable_bass 
	if ($musicstudio_whammy_rewind > 0)
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 2)
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = true}
	else
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = FALSE}
	endif
	musicstudio_set_playable_success in_game_name = qs(0x7d4f9214) inst_name = qs(0xa0244a86) instrument = <instrument>
endscript

script musicstudio_set_playable_keyboard 
	if ($musicstudio_whammy_rewind > 0)
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 4)
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = true}
	else
		musicstudio_mainobj :musicstudioghmix_setplayabletrack \{On = FALSE}
	endif
	musicstudio_set_playable_success in_game_name = qs(0x7d4f9214) inst_name = qs(0x58ce03d1) instrument = <instrument>
endscript

script musicstudio_enable_scrub 
	if musicstudio_mainobj :musicstudioghmix_isscrubenabled
		musicstudio_mainobj :musicstudioghmix_togglescrub \{enable = FALSE}
	else
		musicstudio_mainobj :musicstudioghmix_togglescrub \{enable = true}
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_get_scrub_text
		musicstudio_menu_update_button_text button = green button_text = <name_text>
	endif
endscript

script musicstudio_get_scrub_text 
	if musicstudio_mainobj :musicstudioghmix_isscrubenabled
		formatText \{TextName = name_text
			qs(0xbf97e95d)}
	else
		formatText \{TextName = name_text
			qs(0x20d0229c)}
	endif
	return name_text = <name_text>
endscript

script musicstudio_start_metronome 
	if musicstudio_mainobj :musicstudioghmix_getmetronome
		musicstudio_mainobj :musicstudioghmix_getsongtime
		KillSpawnedScript \{Name = jam_recording_metronome}
		musicstudio_ghmix :Obj_SpawnScriptNow jam_recording_metronome params = {bpm = ($jam_current_bpm) time = <song_time> sound_only}
	endif
endscript

script musicstudio_stop_metronome 
	KillSpawnedScript \{Name = jam_recording_metronome}
endscript

script musicstudio_countin 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 4.0)
	count_wait = (<note_quantize_ms> / 1000)
	musicstudio_mainobj :musicstudioghmix_getquantizetime time = <song_time> snap = (1.0 / 4.0)
	wait_for_next_fretbar = (<quantize_time> - <song_time>)
	if (<wait_for_next_fretbar> < 0)
		wait_for_next_fretbar = (<wait_for_next_fretbar> * -1)
	endif
	<wait_for_next_fretbar> = (<wait_for_next_fretbar> / 1000.0)
	SoundEvent \{event = audio_jam_play_metronome_sfx}
	Wait <count_wait> Seconds
	SoundEvent \{event = audio_jam_play_metronome_sfx}
	Wait <count_wait> Seconds
	SoundEvent \{event = audio_jam_play_metronome_sfx}
	Wait <count_wait> Seconds
	SoundEvent \{event = audio_jam_play_metronome_sfx}
	if (<wait_for_next_fretbar> = 0)
		Wait <count_wait> Seconds
		SoundEvent \{event = audio_jam_play_metronome_sfx}
	else
		Wait <wait_for_next_fretbar> Seconds
	endif
endscript

script musicstudio_enable_metronome 
	if musicstudio_mainobj :musicstudioghmix_getmetronome
		musicstudio_mainobj :musicstudioghmix_setmetronome \{On = FALSE}
	else
		musicstudio_mainobj :musicstudioghmix_setmetronome \{On = true}
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_get_metronome_text
		musicstudio_menu_update_button_text button = red button_text = <name_text>
	endif
endscript

script musicstudio_get_metronome_text 
	if musicstudio_mainobj :musicstudioghmix_getmetronome
		formatText \{TextName = name_text
			qs(0xf66e4b85)}
	else
		formatText \{TextName = name_text
			qs(0x51e9e6b6)}
	endif
	return name_text = <name_text>
endscript

script musicstudio_change_snap_left 
	musicstudio_mainobj :musicstudioghmix_changesnap \{direction = -1}
endscript

script musicstudio_change_snap_right 
	musicstudio_mainobj :musicstudioghmix_changesnap \{direction = 1}
endscript

script musicstudio_change_step_snap_left 
	musicstudio_mainobj :musicstudioghmix_changesnap \{force_step_snap
		direction = -1}
endscript

script musicstudio_change_step_snap_right 
	musicstudio_mainobj :musicstudioghmix_changesnap \{force_step_snap
		direction = 1}
endscript

script musicstudio_force_step_snap 
	musicstudio_mainobj :musicstudioghmix_changesnap \{force_step_snap}
endscript

script musicstudio_change_bpm 
	musicstudio_mainobj :musicstudioghmix_changebpm bpm = <bpm>
	musicstudio_ghmix_highway_reinit_all
	musicstudio_menu_update_song_info_text
endscript

script musicstudio_undo 
	musicstudio_mainobj :musicstudioghmix_getundotrack
	if (<undo_track> < 0)
		return
	endif
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	applyundoclipboard track = ($jam_tracks [<track_count>].id)
	<track_count> = (<track_count> + 1)
	repeat (<array_Size> - 1)
	musicstudio_mainobj :musicstudioghmix_setundotrack \{undo_track = -1}
	musicstudio_mainobj :musicstudioghmix_movehighway time = <undo_time>
endscript

script musicstudio_undo_get_active 
	musicstudio_mainobj :musicstudioghmix_getundotrack
	if (<undo_track> < 0)
		return \{Active = 0}
	endif
	return \{Active = 1}
endscript

script musicstudio_clear_undo_clipboard 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	clearundoclipboard track = ($jam_tracks [<track_count>].id)
	<track_count> = (<track_count> + 1)
	repeat (<array_Size> - 1)
	musicstudio_mainobj :musicstudioghmix_setundotrack \{undo_track = -1}
endscript

script musicstudio_update_undo_clipboard 
	musicstudio_clear_undo_clipboard
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	updateundoclipboard track = ($jam_tracks [<track_count>].id)
	<track_count> = (<track_count> + 1)
	repeat (<array_Size> - 1)
	musicstudio_mainobj :musicstudioghmix_setundotrack undo_track = <instrument>
endscript

script jam_clear_clipboards 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	cleartrackclipboard track = ($jam_tracks [<track_count>].id)
	<track_count> = (<track_count> + 1)
	repeat <array_Size>
endscript

script musicstudio_ghmix_song_mode 
	ui_event \{event = menu_replace
		data = {
			state = uistate_musicstudio_ghmix_song
			editing = 1
			from_track = 1
		}}
endscript

script musicstudio_ghmix_track_mode 
	ui_event \{event = menu_replace
		data = {
			state = uistate_musicstudio_ghmix
			editing = 1
			from_song = 1
		}}
endscript

script musicstudio_save \{from_notetracker = 0}
	if (<from_notetracker> = 1)
		musicstudio_ghmix_cleanup_highways
		uistate = uistate_musicstudio_notetracker
		setsonginfo \{streamfile = $jam_notetracker_mp3}
	else
		uistate = uistate_musicstudio_ghmix
	endif
	if musicstudio_mainobj :musicstudiohighway_issongview
		uistate = uistate_musicstudio_ghmix_song
	endif
	if ($jam_band_new_song = 1)
		musicstudio_save_as
	else
		jam_save_song_setup from_notetracker = <from_notetracker>
		Change \{memcard_after_func = musicstudio_save_after_func}
		ui_memcard_save_jam event = menu_back data = {state = <uistate> editing = 1}
	endif
endscript

script musicstudio_save_after_func 
	Change \{jam_band_new_song = 0}
endscript

script musicstudio_save_as 
	jam_save_song_setup
	song_view = 0
	if musicstudio_mainobj :musicstudiohighway_issongview
		song_view = 1
	endif
	ui_event event = menu_change data = {state = uistate_jam_publish_text_entry text = ($memcard_jamsession_file_name) save_as = 1 song_view = <song_view>}
endscript

script musicstudio_save_as_and_quit 
	jam_save_song_setup
	ui_event event = menu_change data = {state = uistate_jam_publish_text_entry text = ($memcard_jamsession_file_name) save_as_and_quit = 1}
endscript

script musicstudio_save_and_quit 
	if ($jam_band_new_song = 1)
		musicstudio_save_as_and_quit
	else
		jam_save_song_setup
		Change \{memcard_after_func = musicstudio_save_after_func}
		ui_memcard_save_jam \{event = menu_back
			data = {
				state = uistate_jam_select_song
				show_popup = 0
			}}
	endif
endscript

script musicstudio_quit_without_saving 
	ui_event \{event = menu_back
		data = {
			state = uistate_jam_select_song
			show_popup = 0
		}}
endscript
musicstudio_ghmix_tracks = [
	{
		name_text = qs(0x7d5eb9c0)
		info_text = qs(0xf9b3974f)
		instrument = 0
	}
	{
		name_text = qs(0xc1665045)
		info_text = qs(0x334825db)
		instrument = 1
	}
	{
		name_text = qs(0x4f551cbe)
		info_text = qs(0xfcd91e1c)
		instrument = 2
	}
	{
		name_text = qs(0xf3e03f27)
		info_text = qs(0xf6c9d9ff)
		instrument = 3
	}
	{
		name_text = qs(0x09aa4fdd)
		info_text = qs(0xdee2d310)
		instrument = 4
	}
]

script musicstudio_track_select_get_active 
	getcontrollertype controller = ($primary_controller)
	if (<controller_type> = drum)
		return \{Active = 0}
	endif
	return \{Active = 1}
endscript

script musicstudio_get_list_checksum_tracks 
	return \{list_checksum = musicstudio_ghmix_tracks}
endscript

script musicstudio_select_track_get_selected 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	return selected = <instrument>
endscript

script musicstudio_select_track_focus 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_ghmix_inst_text_show instrument = <index>
	GetArraySize ($musicstudio_ghmix_tracks)
	if (<index> < <instrument>)
		if (<index> = 0 && <instrument> = (<array_Size> - 1))
			<direction> = 1
		else
			<direction> = -1
		endif
	else
		if (<instrument> = 0 && <index> = (<array_Size> - 1))
			<direction> = -1
		else
			<direction> = 1
		endif
	endif
	if (<index> = <instrument>)
		<direction> = 0
	endif
	musicstudio_mainobj :musicstudioghmix_switchinstrument direction = <direction>
	hide_note_text
endscript

script musicstudio_select_track 
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudioghmix_switchinstrument \{direction = 0}
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
	if GotParam \{song}
		musicstudio_ghmix_song_create_highway instrument = <new_instrument>
	else
		musicstudio_ghmix_create_highway instrument = <new_instrument>
	endif
	musicstudio_mainobj :musicstudioghmix_movehighway time = <curr_song_time>
	musicstudio_clear_note_text
	jam_stop_all_samples
	musicstudio_clear_undo_clipboard
	jam_clear_clipboards
endscript

script musicstudio_select_track_init 
	musicstudio_mainobj :musicstudioghmix_togglescrub \{On = FALSE}
	hide_note_text
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	musicstudio_ghmix_alpha_highway \{alpha = 0.0
		Everything}
	musicstudio_highway_blackout \{blackout = [
			1
			1
			1
			1
			1
			1
		]}
endscript

script musicstudio_select_track_deinit 
	musicstudio_mainobj :musicstudioghmix_togglescrub \{On = true}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_select_track
	musicstudio_highway_blackout \{remove}
	musicstudio_ghmix_inst_text_hide
endscript

script musicstudio_song_select_track_deinit 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_select_track \{song}
	musicstudio_highway_blackout \{remove}
	musicstudio_ghmix_inst_text_hide
endscript
musicstudio_mute_menu_sounds = 0

script musicstudio_toggle_menu_sounds_get_name_text 
	if ($musicstudio_mute_menu_sounds = 1)
		return \{name_text = qs(0xeb12ae77)}
	else
		return \{name_text = qs(0x3cf02d3f)}
	endif
endscript

script musicstudio_toggle_menu_sounds 
	if (($musicstudio_mute_menu_sounds) = 0)
		Change \{musicstudio_mute_menu_sounds = 1}
		setsoundbussparams \{Front_End = {
				vol = -100
			}}
	else
		musicstudio_reinit_menu_sounds
	endif
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_toggle_menu_sounds_get_name_text
		musicstudio_menu_update_button_text button = green button_text = <name_text> Player = <Player>
	else
		musicstudio_toggle_menu_sounds_get_name_text
		musicstudio_menu_update_button_text button = yellow button_text = <name_text>
	endif
endscript

script musicstudio_reinit_menu_sounds 
	Change \{musicstudio_mute_menu_sounds = 0}
	setsoundbussparams {Front_End = {vol = ($default_BussSet.Front_End.vol)}}
endscript

script musicstudio_toggle_lefty_flip 
	getplayerinfo <Player> lefty_flip
	getplayerinfo <Player> part
	getplayerinfo <Player> controller
	if (<lefty_flip> = 1)
		<lefty_flip> = 0
	else
		<lefty_flip> = 1
	endif
	setplayerinfo <Player> lefty_flip = <lefty_flip>
	if (<part> = guitar || <part> = bass)
		get_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip'
		if (<lefty_flip> != <user_option>)
			save_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
		endif
		get_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip'
		if (<lefty_flip> != <user_option>)
			save_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
		endif
	elseif (<part> = drum)
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'lefty_flip'
		if (<lefty_flip> != <user_option>)
			save_progression_instrument_user_option part = <part> controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
		endif
	endif
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_toggle_lefty_flip_get_name_text Player = <Player>
		musicstudio_menu_update_button_text button = red button_text = <name_text> Player = <Player>
		musicstudio_mainobj :musicstudiojamroom_rebuildallhighways specific_player = <Player>
	else
		musicstudio_ghmix_highway_reinit_all Player = <Player>
		musicstudio_toggle_lefty_flip_get_name_text Player = <Player>
		musicstudio_menu_update_button_text button = blue button_text = <name_text>
	endif
endscript

script musicstudio_toggle_lefty_flip_get_name_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getplayerindex
	getplayerinfo <Player> lefty_flip
	if (<lefty_flip> = 1)
		return \{name_text = qs(0x995b12ed)}
	endif
	return \{name_text = qs(0xee7a817c)}
endscript

script musicstudio_show_note_limit_warning 
	musicstudio_recording_get_active
	if (<Active> = 0)
		formatText TextName = note_limit_warning qs(0xe8c99e36) s = ($musicstudio_max_notes_per_song)
		if ScreenElementExists \{id = musicstudio_ghmix}
			musicstudio_ghmix :Obj_SpawnScriptNow musicstudio_show_popup_warning params = {warning = <note_limit_warning>}
		endif
	endif
endscript

script musicstudio_recording_get_active 
	if musicstudio_is_recording_locked
		return \{Active = 0}
	endif
	return \{Active = 1}
endscript

script musicstudio_record_state_init 
	Wait \{1
		gameframe}
	musicstudio_show_note_consumption
endscript

script musicstudio_show_note_consumption 
	musicstudio_mainobj :musicstudio_getnoteresourceinfo
	musicstudio_recording_get_active
	if (<Active> = 0)
		formatText TextName = note_consumption_text qs(0x7c9f2ddf) a = <num_notes_used> b = ($musicstudio_max_notes_per_song)
		musicstudio_menu_update_button_text button = back no_icon button_text = <note_consumption_text> rgba = [255 50 50 255]
	else
		formatText TextName = note_consumption_text qs(0x7c9f2ddf) a = <num_notes_used> b = ($musicstudio_max_notes_per_song)
		musicstudio_menu_update_button_text button = back no_icon button_text = <note_consumption_text> rgba = [60 70 80 255]
	endif
endscript

script musicstudio_show_pattern_consumption 
	musicstudio_mainobj :musicstudioghmix_getnumuserpatterns
	printstruct channel = musicstudio <...>
	formatText TextName = pattern_consumption_text qs(0x838ac935) a = <num_user_patterns>
	musicstudio_menu_update_button_text button = back no_icon button_text = <pattern_consumption_text> rgba = [255 50 50 255]
endscript

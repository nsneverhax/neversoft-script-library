notetracker_record_mode = Overwrite
notetracker_overwrite_kill_ahead_range = 120
notetracker_overwrite_kill_behind_range = 90
notetracker_play_speed = 1
notetracker_strum_mode = enabled
musicstudio_editing_mode = ghmix
notetracker_scrolling = 0

script ui_create_musicstudio_notetracker FileName = ($jam_notetracker_mp3) usecdn = 0
	Change \{jam_whammy_direction = 1}
	if (<FileName> = '')
		GetSongInfo
		Change jam_notetracker_mp3 = <streamfile>
		Change jam_notetracker_usecdn = <usecdn>
	else
		Change jam_notetracker_mp3 = <FileName>
		Change jam_notetracker_usecdn = <usecdn>
	endif
	SetSongInfo \{streamfile = $jam_notetracker_mp3}
	CreateScreenElement \{parent = root_window
		id = musicstudio_ghmix
		type = DescInterface
		desc = 'musicstudio_notetracker'
		Pos = (0.0, 0.0)}
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :SE_SetProps alpha = 0.9
		musicstudio_mainobj :MusicStudio_GetMainPlayerController
		musicstudio_mainobj :MusicStudio_GetMainPlayerIdIndex
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <playerid_index>
		<player_object> :MusicStudioMenu_Init player = <playerid_index> controller = <controller>
		<player_object> :MusicStudioMenu_SetState {
			id = <ghmix_menu>
			state = notetracker_main_menu_state
		}
	endif
	musicstudio_notetracker_init editing = <editing>
	musicstudio_notetracker_update_record_mode
	musicstudio_notetracker_update_strum
	musicstudio_notetracker_change_speed \{reset}
	musicstudio_notetracker_control_helpers
	Change \{ghmix_highway_show_waveform_z = 0.0}
endscript

script ui_destroy_musicstudio_notetracker 
	printf \{qs(0xd0f16a2b)}
	killspawnedscript \{name = notetracker_scroll_forward}
	DestroyScreenElement \{id = musicstudio_ghmix}
	clean_up_user_control_helpers
	unloadmp3 name = ($jam_notetracker_mp3)
endscript

script ui_init_musicstudio_notetracker 
	Change \{jam_notetracking = 1}
endscript

script ui_deinit_musicstudio_notetracker 
	Change \{jam_notetracking = 0}
	musicstudio_notetracker_deinit
endscript

script notetracker_setup_scripts 
	printf \{qs(0xdb152e50)}
	spawnscriptnow \{musicstudio_set_ambience
		params = {
			ambience = notetracker_choose_ambience
		}}
	spawnscriptnow \{notetracker_on_enter}
endscript

script notetracker_on_enter 
	printf \{qs(0xf0387d93)}
	Change \{musicstudio_editing_mode = notetracker}
	ui_event <...>
endscript

script ghmix_on_enter 
	printf \{qs(0x93bbfe43)}
	Change \{musicstudio_editing_mode = ghmix}
	ui_event <...>
endscript

script MusicStudio_InNotetracker 
	if ($musicstudio_editing_mode = notetracker)
		return \{true}
	endif
	return \{false}
endscript

script MusicStudio_InGHMix 
	if ($musicstudio_editing_mode = ghmix)
		return \{true}
	endif
	return \{false}
endscript

script musicstudio_notetracker_cycle_play_speed 
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_playback_speed_text
			param = playback_speed_text}
		if GotParam \{reset}
			Change \{notetracker_play_speed = 1}
		else
			Change notetracker_play_speed = ($notetracker_play_speed + 0.25)
			if ($notetracker_play_speed > 1)
				Change \{notetracker_play_speed = 0.25}
			endif
		endif
		switch $notetracker_play_speed
			case 0.25
			play_speed_fraction_text = qs(0x4d32be7a)
			case 0.5
			play_speed_fraction_text = qs(0x1b6819fc)
			case 0.75
			play_speed_fraction_text = qs(0x00fa1f71)
			case 1.0
			play_speed_fraction_text = qs(0x3578f23b)
		endswitch
		FormatText TextName = play_speed_text qs(0x264c68ca) d = <play_speed_fraction_text>
		<playback_speed_text> :SE_SetProps text = <play_speed_text>
	endif
endscript

script musicstudio_notetracker_cycle_instrument 
	notetracker_switch_instrument_left
endscript

script musicstudio_notetracker_toggle_strum 
	if ($notetracker_strum_mode = enabled)
		Change \{notetracker_strum_mode = disabled}
	else
		Change \{notetracker_strum_mode = enabled}
	endif
	musicstudio_notetracker_update_strum
endscript

script musicstudio_notetracker_toggle_skip_by_note 
	if (notetracker_skip_by_note = 1)
		Change \{notetracker_skip_by_note = 0}
	else
		Change \{notetracker_skip_by_note = 1}
	endif
endscript

script musicstudio_notetracker_update_strum 
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_strum_mode_text
			param = strum_mode_text}
		if ($notetracker_strum_mode = enabled)
			FormatText \{TextName = text
				qs(0x99662129)}
		else
			FormatText \{TextName = text
				qs(0x43366fde)}
		endif
		<strum_mode_text> :SE_SetProps text = <text>
	endif
endscript

script musicstudio_notetracker_change_record_mode 
	if ($notetracker_record_mode = insert)
		Change \{notetracker_record_mode = Overwrite}
		musicstudio_notetracker_show_killzone
	else
		Change \{notetracker_record_mode = insert}
		musicstudio_notetracker_hide_killzone
	endif
	musicstudio_notetracker_update_record_mode
endscript

script musicstudio_notetracker_show_killzone 
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_highway
			param = ghmix_highway}
		if <ghmix_highway> :Desc_ResolveAlias name = ghmix_nowbar param = ghmix_nowbar
			musicstudio_mainobj :MusicStudioHighway_GetPosFromTime \{time = $notetracker_overwrite_kill_ahead_range}
			ahead_pos = (<Pos> - (10.0, 0.0))
			musicstudio_mainobj :MusicStudioHighway_GetPosFromTime \{time = $notetracker_overwrite_kill_behind_range}
			behind_pos = <Pos>
			dims = ((-1 * (<behind_pos> + <ahead_pos>)) + (180.0, 3.0))
			<ghmix_nowbar> :SE_SetProps {
				killzone_alpha = 0.4
				killzone_pos = <ahead_pos>
				killzone_dims = <dims>
			}
		endif
	endif
endscript

script musicstudio_notetracker_hide_killzone 
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_highway
			param = ghmix_highway}
		if <ghmix_highway> :Desc_ResolveAlias name = ghmix_nowbar param = ghmix_nowbar
			<ghmix_nowbar> :SE_SetProps {
				killzone_alpha = 0
			}
		endif
	endif
endscript
notetracker_record_speed = 1.0
JamPitchShift1 = {
	Effect = PitchShift
	name = JamPitchShift
	pitch = 1.0
	maxchannels = 2
	fftsize = 2048
}

script musicstudio_notetracker_change_speed \{nt_speed_change = -0.1}
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_playback_speed_text
			param = playback_speed_text}
		if GotParam \{reset}
			Change \{notetracker_record_speed = 1}
		else
			if GotParam \{Cycle}
				if ($notetracker_record_speed > 0.75)
					Change \{notetracker_record_speed = 0.75}
				else
					if ($notetracker_record_speed > 0.5)
						Change \{notetracker_record_speed = 0.5}
					else
						Change \{notetracker_record_speed = 1}
					endif
				endif
			else
				Change notetracker_record_speed = ($notetracker_record_speed + <nt_speed_change>)
				if ($notetracker_record_speed < 0.25)
					Change \{notetracker_record_speed = 1.0}
				else
					if ($notetracker_record_speed > 1.0)
						Change \{notetracker_record_speed = 1.0}
					endif
				endif
			endif
			if ($notetracker_record_speed = 1.0)
				FormatText TextName = play_speed_text qs(0x73d2a81d) d = (qs(0x863e4c0e))
			else
				FormatText TextName = play_speed_text qs(0x73d2a81d) d = ($notetracker_record_speed)
			endif
			pitch = (1.0 / $notetracker_record_speed)
			Change structurename = JamPitchShift1 pitch = <pitch>
			SetDSPEffectParams effects = [{Effect = PitchShift name = JamPitchShift pitch = <pitch>}]
			if musicstudio_mainobj :MusicStudioGhmix_IsPlaying
				<speed> = ($notetracker_record_speed)
				setslomo <speed>
				musicstudio_mainobj :MusicStudioGhmix_SetSpeed speed = <speed>
			endif
			<playback_speed_text> :SE_SetProps text = <play_speed_text>
			PlaySound Menu_ColorWheel_Rotate vol = 4 pitch_percent = ($notetracker_record_speed * 100) buss = front_end
		endif
	endif
endscript

script musicstudio_notetracker_update_record_mode 
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_record_mode_text
			param = record_mode_text}
		if ($notetracker_record_mode = insert)
			<record_mode_text> :SE_SetProps text = qs(0x6a3a06d0)
		else
			<record_mode_text> :SE_SetProps text = qs(0x6ffdc571)
			musicstudio_notetracker_show_killzone
		endif
	endif
endscript

script notetracker_drum_select_increasedspeed \{increasedspeed = 0.0
		kick_held = 0}
	musicstudio_mainobj :MusicStudio_GetMainPlayerController
	musicstudio_mainobj :MusicStudio_GetMainPlayerIdIndex
	if isdrumcontroller controller = <controller>
		GetHeldPattern controller = <controller> player = <playerid_index>
		if (<hold_pattern> = 1048576)
			if (<kick_held> = 0)
				increasedspeed = (<increasespeed> + 1.0)
				if (<increasedspeed> > 2.5)
					increasedspeed = 0.0
				endif
			endif
			kick_held = 1
		else
			kick_held = 0
		endif
	endif
	return increasedspeed = <increasedspeed> kick_held = <kick_held>
endscript

script notetracker_skip_direction \{select_area = 0
		Dir = up}
	if musicstudio_mainobj :MusicStudioGhmix_IsPlaying
		return
	endif
	if ScriptIsRunning \{notetracker_playback}
		return
	endif
	if ($notetracker_scrolling = 1)
		return
	endif
	if ($notetracker_skip_by_note = 1)
		notetracker_skip_direction_by_note <...>
		return
	endif
	increasedspeed = 0.0
	<skip_script> speed_multiplier = (1.0 * $notetracker_movement_speed * (1.0 + <increasedspeed>))
	notetracker_calculate_quickedit_actions
	Change \{notetracker_scrolling = 1}
	musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
	<main_player> :MusicStudioPlayer_GetPlayerIndex
	GetStartTime
	begin
	if NOT ControllerPressed <Dir>
		Change \{notetracker_scrolling = 0}
		return
	endif
	GetElapsedTime starttime = <starttime>
	if (<elapsedtime> > 200)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<Dir> = up)
		notetracker_playback \{scrolling}
	endif
	GetArraySize ($jam_quantize)
	old_increasedspeed = -1.0
	begin
	if NOT ControllerPressed <Dir>
		break
	endif
	if ($notetracker_in_quickedit = 1)
		notetracker_calculate_quickedit_actions
	endif
	notetracker_drum_select_increasedspeed increasedspeed = <increasedspeed>
	if (<Dir> = up)
		if (<old_increasedspeed> != <increasedspeed>)
			notetracker_skip_forward_setspeed <...>
			old_increasedspeed = <increasedspeed>
		endif
	else
		<skip_script> snap = ($jam_quantize [(<array_size> - 1)].value) speed_multiplier = (2.0 * $notetracker_movement_speed * (1.0 + <increasedspeed>))
	endif
	wait \{1
		gameframes}
	repeat
	if (<Dir> = up)
		notetracker_playback_stop \{scrolling}
	endif
	Change \{notetracker_scrolling = 0}
endscript

script notetracker_skip_direction_by_note 
	<frame_count> = 10
	begin
	<frame_count> = (<frame_count> + 1)
	if NOT ControllerPressed <Dir>
		return
	endif
	if (<frame_count> >= 10)
		<frame_count> = 0
		<skip_script>
	endif
	wait \{1
		gameframes}
	repeat
endscript

script notetracker_skip_forward \{select_area = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0x5f0baf7c)}
	notetracker_whammy_set_fast_forward
	if (<select_area> = 0)
		skip_script = musicstudio_skip_forward
	else
		skip_script = musicstudio_skip_forward_select_area
	endif
	notetracker_skip_direction <...> Dir = up
endscript

script notetracker_skip_forward_setspeed 
	speed = (1.0 * $notetracker_movement_speed * (1.0 + <increasedspeed>))
	setslomo <speed>
	musicstudio_mainobj :MusicStudioGhmix_SetSpeed speed = <speed>
	pitch = (1.0 / <speed>)
	Change structurename = JamPitchShift1 pitch = <pitch>
	SetDSPEffectParams effects = [{Effect = PitchShift name = JamPitchShift pitch = <pitch>}]
endscript

script notetracker_scroll_forward 
endscript

script notetracker_skip_backward \{select_area = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0x3b13e003)}
	notetracker_whammy_set_rewind
	if (<select_area> = 0)
		skip_script = musicstudio_skip_backward
	else
		skip_script = musicstudio_skip_backward_select_area
	endif
	notetracker_skip_direction <...> Dir = down
endscript

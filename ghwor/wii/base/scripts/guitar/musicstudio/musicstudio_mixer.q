musicstudio_curr_mixer_track = 0

script musicstudio_mixer_setup 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	Change musicstudio_curr_mixer_track = <instrument>
	musicstudio_highway_blackout \{blackout = [
			1
			1
			1
			1
			0
		]}
	Change \{musicstudio_show_nowbar_particles = 0}
	musicstudio_ghmix_alpha_highway \{alpha = 0.0
		gems
		fretbars}
	musicstudio_mixer_update
	musicstudio_mixer_update_header_text
endscript

script musicstudio_mixer_init 
	musicstudio_mixer_update_header_text
	musicstudio_mixer_update
	musicstudio_mixer_update_blackout
endscript

script musicstudio_mixer_deinit 
	Change \{musicstudio_show_nowbar_particles = 1}
	musicstudio_highway_blackout \{remove}
	musicstudio_ghmix_alpha_highway \{alpha = 1.0
		Everything}
	musicstudio_mixer_hide
	musicstudio_mainobj :musicstudioghmix_setspeed \{speed = 1.0}
	musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
	musicstudio_mainobj :musicstudioghmix_togglescrub \{On = true}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_mixer_update_header_text 
	formatText TextName = header_text qs(0x2edcd014) s = ($jam_tracks [($musicstudio_curr_mixer_track)].alt_text)
	musicstudio_set_state_header_text header_text = <header_text>
endscript

script musicstudio_mixer_update_button_text 
	musicstudio_mixer_volume_get_name_text
	musicstudio_menu_update_button_text button = green button_text = <name_text>
	musicstudio_mixer_pan_get_name_text
	musicstudio_mixer_pan_get_active
	musicstudio_menu_update_button_text button = red button_text = <name_text> Active = <Active>
endscript

script musicstudio_mixer_switch_track_right 
	GetArraySize ($jam_tracks)
	<array_Size> = (<array_Size> - 1)
	Change musicstudio_curr_mixer_track = ($musicstudio_curr_mixer_track + 1)
	if ($musicstudio_curr_mixer_track >= <array_Size>)
		Change \{musicstudio_curr_mixer_track = 0}
	endif
	musicstudio_mixer_update_blackout
	musicstudio_mixer_update
	musicstudio_mixer_update_button_text
	musicstudio_mixer_update_header_text
endscript

script musicstudio_mixer_switch_track_left 
	GetArraySize ($jam_tracks)
	<array_Size> = (<array_Size> - 1)
	Change musicstudio_curr_mixer_track = ($musicstudio_curr_mixer_track - 1)
	if ($musicstudio_curr_mixer_track < 0)
		Change musicstudio_curr_mixer_track = (<array_Size> - 1)
	endif
	musicstudio_mixer_update_blackout
	musicstudio_mixer_update
	musicstudio_mixer_update_button_text
	musicstudio_mixer_update_header_text
endscript

script musicstudio_mixer_update_blackout 
	GetArraySize ($jam_tracks)
	<array_Size> = (<array_Size> - 1)
	blackout_array = [1 1 1 1 1]
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	instrument = (<instrument> + 1)
	index = 0
	begin
	if (<instrument> >= <array_Size>)
		<instrument> = 0
	endif
	if (<instrument> = ($musicstudio_curr_mixer_track))
		SetArrayElement ArrayName = blackout_array index = <index> NewValue = 0
	endif
	<instrument> = (<instrument> + 1)
	<index> = (<index> + 1)
	repeat <array_Size>
	musicstudio_highway_blackout blackout = <blackout_array>
endscript

script musicstudio_mixer_play_stop 
	if musicstudio_mainobj :musicstudioghmix_isplaying
		musicstudio_mainobj :musicstudioghmix_setspeed \{speed = 1.0}
		musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
		musicstudio_mainobj :musicstudioghmix_togglescrub \{On = true}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	else
		musicstudio_mainobj :musicstudioghmix_togglescrub \{On = FALSE}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
		musicstudio_mainobj :musicstudioghmix_setspeed \{speed = 1.0}
		musicstudio_mainobj :musicstudioghmix_play \{On = true
			repeat_selection = true}
	endif
	musicstudio_mixer_play_stop_get_name_text
	musicstudio_menu_update_button_text button = yellow button_text = <name_text>
endscript

script musicstudio_mixer_play_stop_get_name_text 
	if musicstudio_mainobj :musicstudioghmix_isplaying
		return \{name_text = qs(0x962a2b74)}
	else
		return \{name_text = qs(0x23e0b711)}
	endif
endscript

script musicstudio_mixer_volume_get_name_text 
	musicstudio_mixer_volume_get_curr_value
	formatText TextName = name_text qs(0x414080a3) s = <curr_value>
	return name_text = <name_text>
endscript

script musicstudio_mixer_volume_change_value 
	if NOT GotParam \{instrument}
		instrument = $musicstudio_curr_mixer_track
	endif
	settrackinfo track = ($jam_tracks [<instrument>].id) Volume = <curr_value>
	musicstudio_update_volume jam_instrument = <instrument>
endscript

script musicstudio_mixer_volume_get_curr_value 
	if NOT GotParam \{instrument}
		instrument = ($musicstudio_curr_mixer_track)
	endif
	gettrackinfo track = ($jam_tracks [<instrument>].id)
	return curr_value = <Volume>
endscript

script musicstudio_mixer_volume_get_value_bounds 
	low_bpm = 0
	high_bpm = 11
	return low_bound = <low_bpm> high_bound = <high_bpm>
endscript

script musicstudio_mixer_volume_up_down_script 
	musicstudio_mixer_volume_change_value curr_value = <curr_value>
	musicstudio_mixer_update
endscript

script musicstudio_mixer_volume_deinit 
	musicstudio_update_volume jam_instrument = ($musicstudio_curr_mixer_track)
endscript
musicstudio_mixer_volume_change_value_state = {
	name_text = qs(0x2b14da7d)
	tool_tip = ms_tool_tip_scroll_volume
	append_text = qs(0x7aed003b)
	num_tabs = 4
	change_value_script = musicstudio_mixer_volume_change_value
	up_down_script = musicstudio_mixer_volume_up_down_script
	get_curr_value_script = musicstudio_mixer_volume_get_curr_value
	get_value_bounds_script = musicstudio_mixer_volume_get_value_bounds
	deinit_script = musicstudio_mixer_volume_deinit
}

script musicstudio_mixer_input_volume_get_active 
	return \{Active = 0}
endscript

script musicstudio_mixer_input_volume_change_value 
	settrackinfo track = ($jam_tracks [($musicstudio_curr_mixer_track)].id) Volume = <curr_value>
	musicstudio_update_volume jam_instrument = ($musicstudio_curr_mixer_track)
endscript

script musicstudio_mixer_input_volume_get_curr_value 
	gettrackinfo track = ($jam_tracks [($musicstudio_curr_mixer_track)].id)
	return curr_value = <Volume>
endscript

script musicstudio_mixer_input_volume_up_down_script 
	musicstudio_mixer_input_volume_change_value curr_value = <curr_value>
	musicstudio_mixer_update
endscript

script musicstudio_mixer_input_volume_deinit 
endscript
musicstudio_mixer_input_volume_change_value_state = {
	name_text = qs(0xc1d31b44)
	tool_tip = ms_tool_tip_scroll_input_volume
	append_text = qs(0x7a0d4b0d)
	num_tabs = 4
	change_value_script = musicstudio_mixer_input_volume_change_value
	up_down_script = musicstudio_mixer_input_volume_up_down_script
	get_curr_value_script = musicstudio_mixer_input_volume_get_curr_value
	get_value_bounds_script = musicstudio_mixer_volume_get_value_bounds
	deinit_script = musicstudio_mixer_input_volume_deinit
}

script musicstudio_mixer_pan_get_name_text 
	musicstudio_mixer_pan_get_curr_value
	formatText TextName = pan_text qs(0xf5c966bb) s = <curr_value>
	return name_text = <pan_text>
endscript
musicstudio_mixer_pan_last_curr_value = -1

script musicstudio_mixer_pan_init 
	Change \{musicstudio_mixer_pan_last_curr_value = -1}
endscript

script musicstudio_mixer_pan_change_value 
	if NOT (<curr_value> = $musicstudio_mixer_pan_last_curr_value)
		pan1x = (<curr_value> / 5.0)
		PlaySound {
			ghmix2_scroll_sound
			buss = Front_End
			pan1x = <pan1x>
			pan1y = 1.0
			pan2x = <pan1x>
			pan2y = 1.0
		}
	endif
	Change musicstudio_mixer_pan_last_curr_value = <curr_value>
	if NOT GotParam \{instrument}
		instrument = ($musicstudio_curr_mixer_track)
	endif
	settrackinfo track = ($jam_tracks [<instrument>].id) pan = <curr_value>
	musicstudio_update_pan instrument = <instrument>
endscript

script musicstudio_mixer_pan_get_curr_value 
	if NOT GotParam \{instrument}
		instrument = ($musicstudio_curr_mixer_track)
	endif
	gettrackinfo track = ($jam_tracks [<instrument>].id)
	return curr_value = <pan>
endscript

script musicstudio_mixer_pan_get_active 
	return \{Active = 1}
endscript

script musicstudio_mixer_pan_get_value_bounds 
	low_bpm = -5
	high_bpm = 5
	return low_bound = <low_bpm> high_bound = <high_bpm>
endscript

script musicstudio_mixer_pan_up_down_script 
	musicstudio_mixer_pan_change_value curr_value = <curr_value>
	musicstudio_mixer_update
endscript

script musicstudio_mixer_pan_deinit 
	Change \{musicstudio_mixer_pan_last_curr_value = -1}
endscript
musicstudio_mixer_pan_change_value_state = {
	name_text = qs(0xf2fc6e12)
	tool_tip = ms_tool_tip_scroll_pan
	append_text = qs(0x3a5780e4)
	num_tabs = 4
	init_script = musicstudio_mixer_pan_init
	change_value_script = musicstudio_mixer_pan_change_value
	up_down_script = musicstudio_mixer_pan_up_down_script
	get_curr_value_script = musicstudio_mixer_pan_get_curr_value
	get_value_bounds_script = musicstudio_mixer_pan_get_value_bounds
	deinit_script = musicstudio_mixer_pan_deinit
	no_scrolling_sound
}

script musicstudio_mixer_update 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_mixer
			param = mixer}
		<mixer> :se_setprops alpha = 1
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
		curr_instrument = <instrument>
		GetArraySize ($jam_tracks)
		<array_Size> = (<array_Size> - 1)
		index = 1
		instrument = (<instrument> + 1)
		begin
		if (<instrument> >= <array_Size>)
			<instrument> = 0
		endif
		formatText checksumName = track_mixer_checksum 'mixer_%i' i = <index>
		if <mixer> :desc_resolvealias Name = <track_mixer_checksum> param = track_mixer
			pod1_rgba_on = [217 39 34 255]
			pod2_rgba_on = [125 56 51 255]
			pod_rgba_off = [91 91 91 255]
			pod_rgba_text_on = [220 220 220 255]
			pod_rgba_text_off = [135 135 135 255]
			none_volume_rgba = [152 196 142 255]
			pod1_rgba = <pod_rgba_off>
			pod1_text_rgba = <pod_rgba_text_off>
			pod2_rgba = <pod_rgba_off>
			pod2_text_rgba = <pod_rgba_text_off>
			volume_rgba = <none_volume_rgba>
			musicstudio_mixer_volume_get_curr_value instrument = <instrument>
			volume_bar_y = (160 * (<curr_value> / 11.0))
			gettrackinfo track = ($jam_tracks [<instrument>].id)
			alpha = 1.0
			volume_dims = ((22.0, 0.0) + ((0.0, 1.0) * <volume_bar_y>))
			if NOT (<instrument> = <curr_instrument>)
				<volume_dims> = ((16.0, 0.0) + ((0.0, 1.0) * <volume_bar_y>))
			endif
			if NOT (<instrument> = ($musicstudio_curr_mixer_track))
				<alpha> = 0.25
			endif
			musicstudio_mixer_pan_get_active instrument = <instrument>
			if (<Active> = 1)
				pan_alpha = 1.0
			else
				pan_alpha = 0.1
			endif
			musicstudio_mixer_input_volume_get_active instrument = <instrument>
			if (<Active> = 1)
				input_volume_alpha = 1.0
			else
				input_volume_alpha = 0.1
			endif
			musicstudio_mixer_pan_get_curr_value instrument = <instrument>
			knob_rot_angle = (-90 + (180 * ((<curr_value> + 5) / 10.0)))
			input_knob_rot_angle = (-90 + (180 * (<Volume> / 11.0)))
			<track_mixer> :se_setprops {
				pod1_rgba = <pod1_rgba>
				pod1_text_rgba = <pod1_text_rgba>
				pod2_rgba = <pod2_rgba>
				pod2_text_rgba = <pod2_text_rgba>
				knob_rot_angle = <knob_rot_angle>
				input_knob_rot_angle = <input_knob_rot_angle>
				volume_dims = <volume_dims>
				volume_rgba = <volume_rgba>
				arrow_cont_pos = ((0.0, -1.0) * <volume_bar_y>)
				alpha = <alpha>
				input_volume_alpha = <input_volume_alpha>
				pan_alpha = <pan_alpha>
			}
		endif
		<index> = (<index> + 1)
		<instrument> = (<instrument> + 1)
		repeat <array_Size>
	endif
endscript

script musicstudio_mixer_hide 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_mixer
			param = mixer}
		<mixer> :se_setprops alpha = 0
	endif
endscript

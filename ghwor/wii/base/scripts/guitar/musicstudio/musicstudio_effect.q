default_line6_track_effects = {
	rhythm = 0
	lead = 0
	bass = -1
	drum = -1
	melody = -1
}
default_line6_song_effects = [
	0
	0
]
musicstudio_preview_sound_id = NULL
jam_current_instrument_effects = [
	0
	0
	0
	0
	0
	0
]
jam_current_active_effects = [
	0
	0
	0
	0
	0
	0
]

script musicstudio_preview_effect 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_play_sound_get_buss instrument = <instrument>
	printf \{qs(0x28ebebdc)}
	printstruct <...>
	printf \{qs(0x03ac90f0)}
	if (<instrument> != 3)
		stopsound \{$musicstudio_preview_sound_id
			fade_time = 0.1
			fade_type = linear}
		Wait \{1
			gameframe}
		jam_get_sample_checksum fret = 0 string = 0 Type = 0 jam_instrument = <instrument> chord_type = 0
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = <buss>
		Change musicstudio_preview_sound_id = <sample_checksum>
	else
		musicstudio_mainobj :musicstudio_getplayerfromindex
		<player_object> :musicstudioplayer_getcontroller
		jam_input_drum_strum {
			hold_pattern = 1048576
			velocity = 100
			controller = <controller>
			select_player = <Player>
			loop_pitch = 0
			Loop
		}
	endif
endscript

script musicstudio_change_effect 
	return
endscript

script musicstudio_init_all_line6_effects 
endscript

script musicstudio_destroy_all_line6_effects 
	Change \{last_set_line6_0 = -1}
	Change \{last_set_line6_1 = -1}
endscript

script musicstudio_refresh_current_instrument_effect 
	printf \{qs(0x2a1dc4ae)}
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_change_effect instrument = <instrument>
endscript

script musicstudio_change_and_preview_effect \{effect_sub_type = a}
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	printf \{qs(0x6c0ca307)}
	printstruct <...>
	printf \{qs(0x03ac90f0)}
	musicstudio_preview_effect Player = <Player>
endscript

script musicstudio_get_preview_types 
	musicstudio_mainobj :musicstudioghmix_geteffectfocus
	musicstudio_mainobj :musicstudio_setsongeffectindex type_index = <current_effect_focus> effect_index = <index>
	musicstudio_mainobj :musicstudio_getcurrentabtype effect_type_index = <current_effect_focus>
	if (<line6_effect_ab> = a)
		<preview0> = a
		<preview1> = b
	else
		<preview0> = b
		<preview1> = a
	endif
	return preview0 = <preview0> preview1 = <preview1>
endscript

script musicstudio_preview_alternate_effect 
	musicstudio_get_preview_types index = <index>
	musicstudio_change_and_preview_effect effect_sub_type = <preview1> Player = <Player> index = <index>
endscript

script musicstudio_effect_focus 
	musicstudio_get_preview_types index = <index>
	musicstudio_change_and_preview_effect effect_sub_type = <preview0> Player = <Player> index = <index>
endscript

script musicstudio_get_selected_effect 
	if NOT GotParam \{instrument}
		musicstudio_get_player_instrument Player = <Player>
	endif
	return selected = ($jam_current_instrument_effects [<instrument>])
endscript

script musicstudio_effect_select_get_active 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 0 || <instrument> = 1)
		return \{Active = 1}
	endif
	return \{Active = 0}
endscript

script get_current_effect_line_text 
	if NOT GotParam \{instrument}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
	endif
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		<name_text> = qs(0xaddc9006)
		case 1
		<name_text> = qs(0x86f1c3c5)
		default
		<name_text> = qs(0x128bfaaa)
	endswitch
	formatText TextName = name_text qs(0xfce235b7) a = <name_text>
	return name_text = <name_text>
endscript

script change_current_effect 
	musicstudio_toggle_effect Player = <Player>
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudiomenu_setstate {
				id = <jamroom_player_menu>
				state = musicstudio_effect_settings_state
			}
		endif
	else
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudiomenu_setstate {
				id = <ghmix_menu>
				state = musicstudio_effect_settings_state
			}
		endif
	endif
	musicstudio_line6pod_refresh Player = <Player>
endscript

script musicstudio_toggle_effect 
	if NOT GotParam \{instrument}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_getinstrument
	endif
	<track> = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = <track>
	<effect_type_index> = (<effect_type_index> + 1)
	if (<effect_type_index> >= 2)
		if (<track> = rhythm || <track> = lead)
			<effect_type_index> = 0
		else
			<effect_type_index> = -1
		endif
	endif
	musicstudio_mainobj :musicstudio_settrackeffectindex track = <track> effect_type_index = <effect_type_index>
endscript

script musicstudio_init_line6_effects_menu 
	musicstudio_line6pod_refresh Player = <Player>
endscript

script musicstudio_back_from_effect_menu 
	musicstudio_line6pod_destroy Player = <Player>
endscript

script musicstudio_get_effect_back_state 
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		return \{musicstudio_state = musicstudio_jamroom_track_settings_state}
	else
		return \{musicstudio_state = musicstudio_transport_state}
	endif
endscript

script musicstudio_set_gobal_effect_focus 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :musicstudioghmix_seteffectfocus current_effect_focus = <effect_type_index>
endscript

script musicstudio_effect_select_choose 
	RequireParams \{[
			Player
			index
		]}
	if NOT GotParam \{instrument}
		musicstudio_get_player_instrument Player = <Player>
	endif
	settrackinfo track = ($jam_tracks [<instrument>].id) effect = <index>
	SetArrayElement ArrayName = jam_current_instrument_effects globalarray index = <instrument> NewValue = <index>
	printf \{qs(0x497d9cc4)}
	printstruct <...>
	printf \{qs(0x03ac90f0)}
endscript

script musicstudio_line6pod_scrolling_text \{Scale = 1
		parent = root_window}
	<Scale> = 0.4
	rgba = [68 32 2 255]
	CreateScreenElement {
		Type = ContainerElement
		parent = <scroll_window_id>
		id = <scroll_id>
		Pos = (0.0, 0.0)
		just = [left top]
		Scale = <Scale>
	}
	CreateScreenElement {
		Type = TextElement
		parent = <scroll_id>
		just = [left top]
		Pos = (0.0, 0.0)
		Scale = 1.0
		text = <text>
		font = fontgrid_text_a3
		rgba = <rgba>
		z_priority = 65
	}
	GetScreenElementDims id = <id>
	<scaled_width> = (<width> * <Scale>)
	if (<scaled_width> > <window_width>)
		new_width = (<width> + 100)
		CreateScreenElement {
			Type = TextElement
			parent = <scroll_id>
			just = [left top]
			Pos = ((1.0, 0.0) * <new_width>)
			Scale = 1.0
			text = <text>
			font = fontgrid_text_a3
			rgba = <rgba>
			z_priority = 65
		}
		<scroll_id> :se_setprops Pos = (0.0, 0.0)
		Wait \{1.0
			Seconds}
		begin
		<scroll_id> :se_setprops Pos = ((-1.0, 0.0) * (<new_width> * <Scale>)) time = <time>
		<scroll_id> :se_waitprops
		<scroll_id> :se_setprops Pos = (0.0, 0.0)
		repeat
	endif
endscript

script musicstudio_line6pod_set_ab_text 
	if (<ab> = a)
		<window_id> = scrolling_text_window1
		formatText checksumName = scroll_window_id 'line6_scrolling_window1_%s' s = <Player>
		formatText checksumName = scroll_id 'line6_scrolling_text1_%s' s = <Player>
		height = -27
	else
		<window_id> = scrolling_text_window2
		formatText checksumName = scroll_window_id 'line6_scrolling_window2_%s' s = <Player>
		formatText checksumName = scroll_id 'line6_scrolling_text2_%s' s = <Player>
		height = 22
	endif
	formatText checksumName = line6_pod_id 'line6_pod_%a' a = <Player>
	if <line6_pod_id> :desc_resolvealias Name = scrolling_text_window2
		<window_width> = 130
		CreateScreenElement {
			parent = <resolved_id>
			id = <scroll_window_id>
			Type = WindowElement
			just = [center center]
			pos_anchor = [center center]
			Pos = ((12.0, 0.0) + ((0.0, 1.0) * <height>))
			dims = ((0.0, 100.0) + ((1.0, 0.0) * <window_width>))
		}
		<scroll_window_id> :obj_spawnscript musicstudio_line6pod_scrolling_text params = {
			parent = <resolved_id>
			scroll_window_id = <scroll_window_id>
			scroll_id = <scroll_id>
			Player = <Player>
			window_width = <window_width>
			text = <text>
			time = 10
		}
	endif
endscript

script musicstudio_line6pod_refresh 
	musicstudio_line6pod_destroy Player = <Player>
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	line6_pod1_alpha = 0
	line6_pod2_alpha = 0
	switch (<effect_type_index>)
		case 0
		<line6_pod1_alpha> = 1
		case 1
		<line6_pod2_alpha> = 1
	endswitch
	musicstudio_highway_blackout \{blackout = [
			1
			1
			1
			1
			1
		]}
	formatText checksumName = line6_pod_window_id 'line6_pod_window_%a' a = <Player>
	formatText checksumName = line6_pod_id 'line6_pod_%a' a = <Player>
	if ScreenElementExists \{id = musicstudio_ghmix}
		CreateScreenElement {
			parent = musicstudio_ghmix
			Type = descinterface
			id = <line6_pod_id>
			pos_anchor = [center center]
			just = [center center]
			Pos = (-180.0, -38.0)
			Scale = 1.0
			desc = 'line6_pod_advanced'
			line6_pod1_alpha = <line6_pod1_alpha>
			line6_pod2_alpha = <line6_pod2_alpha>
		}
	else
		formatText checksumName = container_id 'gem_containerp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <container_id>
			if ScreenElementExists id = <line6_pod_window_id>
				DestroyScreenElement id = <line6_pod_window_id>
			endif
			CreateScreenElement {
				Type = WindowElement
				parent = <container_id>
				id = <line6_pod_window_id>
				just = [center top]
				pos_anchor = [center top]
				Pos = (-1.0, 235.0)
				dims = (220.0, 126.0)
			}
			CreateScreenElement {
				parent = <line6_pod_window_id>
				Type = descinterface
				id = <line6_pod_id>
				pos_anchor = [center center]
				just = [center center]
				Pos = (0.0, 113.0)
				Scale = 1.075
				desc = 'line6_pod_advanced'
				line6_pod1_alpha = <line6_pod1_alpha>
				line6_pod2_alpha = <line6_pod2_alpha>
			}
		endif
	endif
	musicstudio_get_line6_effect_strings_for_player Player = <Player>
	<line6_pod_id> :SetProps effect_text = <effect_title>
	<line6_pod_id> :SetProps amp_text = qs(0x00000000)
	<line6_pod_id> :SetProps fx_text = qs(0x00000000)
	if ScreenElementExists \{id = musicstudio_ghmix}
		musicstudio_line6pod_set_ab_text Player = <Player> ab = a text = <a_title>
		musicstudio_line6pod_set_ab_text Player = <Player> ab = b text = <b_title>
	endif
endscript

script musicstudio_line6pod_destroy 
	formatText checksumName = line6_pod_id 'line6_pod_%a' a = <Player>
	if ScreenElementExists id = <line6_pod_id>
		DestroyScreenElement id = <line6_pod_id>
	endif
	musicstudio_highway_blackout \{remove}
	KillSpawnedScript \{Name = musicstudio_line6pod_scrolling_text}
endscript

script jam_load_effect \{loaded_effects = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
		]}
	track_count = 0
	begin
	gettrackinfo track = ($jam_tracks [<track_count>].id)
	SetArrayElement ArrayName = loaded_effects index = <track_count> NewValue = <effect>
	printf channel = jam_mode qs(0x2d0a9ddf) s = <effect>
	<track_count> = (<track_count> + 1)
	repeat 4
	Change jam_current_instrument_effects = <loaded_effects>
	printf channel = jam_mode qs(0x2d0a9ddf) s = ($jam_current_instrument_effects [0])
endscript

script jam_save_effect 
endscript

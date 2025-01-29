default_line6_track_effects = {
	rhythm = 1
	lead = 0
	bass = -1
	drum = -1
	melody = -1
}
default_line6_song_effects = [
	0
	1
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

script musicstudio_get_line6_buss_from_type 
	switch <Type>
		case 0
		return \{buss = line61_jammode}
		case 1
		return \{buss = line62_jammode}
	endswitch
	script_assert \{qs(0x2a3829ff)}
endscript

script musicstudio_preview_effect 
	musicstudio_mainobj :musicstudioghmix_geteffectfocus
	musicstudio_get_line6_buss_from_type Type = <current_effect_focus>
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> != 3)
		musicstudio_audible_scale_preview Player = <Player>
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

script musicstudio_effect_set_marker_effect 
	musicstudio_change_effect {
		effect_type_index = <current_effect_focus>
		explicit_ab = a
	}
endscript

script musicstudio_change_effect \{instrument_adjusts = 1}
	if NOT GotParam \{effect_type_index}
		musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	endif
	if (<effect_type_index> = -1)
		return
	endif
	musicstudio_get_effect_list_checksum effect_type = <effect_type_index>
	musicstudio_mainobj :musicstudio_getsongeffectindex type_index = <effect_type_index>
	<effect_struct> = (($<list_checksum>) [<effect_index>])
	<recreate> = true
	switch <effect_type_index>
		case 0
		if ($last_set_line6_0 = <effect_index>)
			<recreate> = FALSE
		else
			Change last_set_line6_0 = <effect_index>
		endif
		case 1
		if ($last_set_line6_1 = <effect_index>)
			<recreate> = FALSE
		else
			Change last_set_line6_1 = <effect_index>
		endif
	endswitch
	musicstudio_get_line6_buss_from_type Type = <effect_type_index>
	if (<recreate> = true)
		StopSoundsByBuss <buss>
		destroysoundbusseffects buss = <buss> buss_array = [all]
	endif
	if GotParam \{explicit_ab}
		<line6_effect_ab> = <explicit_ab>
	else
		musicstudio_mainobj :musicstudio_getcurrentabtype effect_type_index = <effect_type_index>
	endif
	if (<line6_effect_ab> = a)
		<real_effect> = (<effect_struct>.a)
		printf \{qs(0x43cb037e)}
	else
		<real_effect> = (<effect_struct>.b)
		printf \{qs(0x6a03b78c)}
	endif
	printstruct <real_effect>
	if StructureContains structure = <real_effect> line6
		<global_name> = (<real_effect>.global_name)
		getsonginfo
		if (<guitar_sound> = 0)
			if StructureContains structure = <real_effect> global_name_strat
				<global_name> = (<real_effect>.global_name_strat)
			endif
		else
			if StructureContains structure = <real_effect> global_name_truck
				<global_name> = (<real_effect>.global_name_truck)
			endif
		endif
		<line6_effect> = ($<global_name>)
		createmusicstudioline6soundbusseffects buss = <buss> effect = <line6_effect> recreate = <recreate>
		<current_effect_type_index> = <effect_type_index>
		if (<current_effect_type_index> = 1)
			createmusicstudioline6soundbusseffects buss = <buss> effect = $multitap_delay_rhythm_guitar recreate = <recreate>
		endif
	endif
	if GotParam \{instrument}
		musicstudio_update_pan instrument = <instrument>
		musicstudio_update_volume jam_instrument = <instrument>
	endif
endscript

script musicstudio_init_all_line6_effects 
	GetArraySize ($jam_tracks)
	inst_count = 0
	begin
	musicstudio_change_effect instrument = <inst_count>
	<inst_count> = (<inst_count> + 1)
	repeat (<array_Size> - 1)
endscript

script musicstudio_destroy_all_line6_effects 
	destroysoundbusseffects \{line61_jammode = [
			all
		]}
	destroysoundbusseffects \{line62_jammode = [
			all
		]}
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
	musicstudio_mainobj :musicstudioghmix_geteffectfocus
	musicstudio_mainobj :musicstudio_setsongeffectindex type_index = <current_effect_focus> effect_index = <index>
	musicstudio_change_effect {
		instrument = <instrument>
		explicit_ab = <effect_sub_type>
		effect_type_index = <current_effect_focus>
	}
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_line6pod_destroy Player = <Player>
	else
		musicstudio_line6pod_refresh Player = <Player>
	endif
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

script musicstudio_effect_get_active 
	return \{Active = 1}
endscript

script musicstudio_get_selected_effect 
	musicstudio_mainobj :musicstudioghmix_geteffectfocus
	musicstudio_mainobj :musicstudio_getsongeffectindex type_index = <current_effect_focus>
	return selected = <effect_index>
endscript

script musicstudio_effect_select_get_active 
	if GotParam \{Player}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_getinstrument
	else
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
	endif
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	if (<effect_type_index> = 0 || <effect_type_index> = 1)
		return \{Active = 1}
	endif
	return \{Active = 0}
endscript

script get_current_effect_line_text 
	if GotParam \{Player}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_getinstrument
	else
		if NOT GotParam \{instrument}
			musicstudio_mainobj :musicstudio_getcurrmainplayer
			<main_player> :musicstudioplayer_getinstrument
		endif
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

script get_current_effect_name_text 
	if GotParam \{Player}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_getinstrument
	else
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
	endif
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :musicstudioghmix_geteffectfocus
	musicstudio_mainobj :musicstudio_getsongeffectindex type_index = <effect_type_index>
	switch <effect_type_index>
		case 0
		formatText TextName = effect_text qs(0x3d84b1fa) a = (($musicstudio_line6_0_array [<effect_index>]).name_text)
		if musicstudio_mainobj :musicstudiojamroom_isinjamroom
			<effect_text> = qs(0xdc6e5e8d)
		endif
		case 1
		formatText TextName = effect_text qs(0x3d84b1fa) a = (($musicstudio_line6_1_array [<effect_index>]).name_text)
		if musicstudio_mainobj :musicstudiojamroom_isinjamroom
			<effect_text> = qs(0xdc6e5e8d)
		endif
		default
		formatText \{TextName = effect_text
			qs(0x9dd9821b)}
	endswitch
	return name_text = <effect_text>
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
	musicstudio_init_all_line6_effects
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
	if GotParam \{Player}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_getinstrument
	else
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
	endif
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :musicstudioghmix_seteffectfocus current_effect_focus = <effect_type_index>
endscript

script musicstudio_get_effect_list_checksum 
	if NOT GotParam \{effect_type}
		musicstudio_mainobj :musicstudioghmix_geteffectfocus
		<effect_type> = <current_effect_focus>
	endif
	switch <effect_type>
		case 0
		<effect_list> = musicstudio_line6_0_array
		case 1
		<effect_list> = musicstudio_line6_1_array
	endswitch
	return list_checksum = <effect_list>
endscript

script musicstudio_effect_select_choose 
endscript

script musicstudio_get_line6_effect_strings_for_player 
	<effect_title> = qs(0x82cf35c6)
	<a_title> = qs(0x82cf35c6)
	<b_title> = qs(0x82cf35c6)
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = -1)
		printf \{qs(0x936e4949)}
		return effect_title = <effect_title> a_title = <a_title> b_title = <b_title>
	endif
	<track> = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = <track>
	switch (<effect_type_index>)
		case 0
		<effect_list> = musicstudio_line6_0_array
		case 1
		<effect_list> = musicstudio_line6_1_array
	endswitch
	if ((<effect_type_index> = 0) || (<effect_type_index> = 1))
		musicstudio_mainobj :musicstudio_getsongeffectindex type_index = <effect_type_index>
		<curr_effect> = (($<effect_list>) [<effect_index>])
		if StructureContains structure = <curr_effect> name_text
			<effect_title> = (<curr_effect>.name_text)
		endif
		if StructureContains structure = <curr_effect> a
			<sub_struct> = (<curr_effect>.a)
			if StructureContains structure = <sub_struct> version_text
				<a_title> = (<sub_struct>.version_text)
			endif
		endif
		if StructureContains structure = <curr_effect> b
			<sub_struct> = (<curr_effect>.b)
			if StructureContains structure = <sub_struct> version_text
				<b_title> = (<sub_struct>.version_text)
			endif
		endif
		return effect_title = <effect_title> a_title = <a_title> b_title = <b_title>
	else
		return \{effect_title = qs(0x9dd9821b)
			a_title = qs(0x9dd9821b)
			b_title = qs(0x9dd9821b)}
	endif
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
	track_count = 0
	effects = ($jam_current_instrument_effects)
	begin
	effect = (<effects> [<track_count>])
	settrackinfo track = ($jam_tracks [<track_count>].id) effect = <effect>
	printf channel = jam_mode qs(0x0c5f8b33) s = <effect>
	<track_count> = (<track_count> + 1)
	repeat 4
endscript

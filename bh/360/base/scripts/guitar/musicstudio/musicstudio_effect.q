default_line6_track_effects = {
	rhythm = 1
	lead = 0
	bass = -1
	Drum = -1
	melody = -1
}
default_line6_song_effects = [
	0
	1
]
musicstudio_preview_sound_id = null

script musicstudio_get_line6_buss_from_type 
	switch <type>
		case 0
		return \{buss = Line61_JamMode}
		case 1
		return \{buss = Line62_JamMode}
	endswitch
	script_assert \{qs(0x2a3829ff)}
endscript

script musicstudio_preview_effect 
	musicstudio_mainobj :MusicStudioGhmix_GetEffectFocus
	musicstudio_get_line6_buss_from_type type = <current_effect_focus>
	musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
	<player_object> :MusicStudioPlayer_GetInstrument
	if (<instrument> != 3)
		musicstudio_audible_scale_preview player = <player>
	else
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex
		<player_object> :MusicStudioPlayer_GetController
		jam_input_drum_strum {
			hold_pattern = 1048576
			velocity = 100
			controller = <controller>
			select_player = <player>
			loop_pitch = 0
			loop
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
		musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	endif
	if (<effect_type_index> = -1)
		return
	endif
	musicstudio_get_effect_list_checksum effect_type = <effect_type_index>
	musicstudio_mainobj :MusicStudio_GetSongEffectIndex type_index = <effect_type_index>
	<effect_struct> = (($<list_checksum>) [<effect_index>])
	<recreate> = true
	switch <effect_type_index>
		case 0
		if ($last_set_line6_0 = <effect_index>)
			<recreate> = false
		else
			Change last_set_line6_0 = <effect_index>
		endif
		case 1
		if ($last_set_line6_1 = <effect_index>)
			<recreate> = false
		else
			Change last_set_line6_1 = <effect_index>
		endif
	endswitch
	musicstudio_get_line6_buss_from_type type = <effect_type_index>
	if (<recreate> = true)
		StopSoundsByBuss <buss>
		DestroySoundBussEffects buss = <buss> buss_array = [all]
	endif
	if GotParam \{explicit_ab}
		<line6_effect_ab> = <explicit_ab>
	else
		musicstudio_mainobj :MusicStudio_GetCurrentABType effect_type_index = <effect_type_index>
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
		GetSongInfo
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
		CreateMusicStudioLine6SoundBussEffects buss = <buss> Effect = <line6_effect> recreate = <recreate>
		<current_effect_type_index> = <effect_type_index>
		if (<current_effect_type_index> = 1)
			CreateMusicStudioLine6SoundBussEffects buss = <buss> Effect = $MultiTap_Delay_Rhythm_Guitar recreate = <recreate>
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
	repeat (<array_size> - 1)
endscript

script musicstudio_destroy_all_line6_effects 
	DestroySoundBussEffects \{Line61_JamMode = [
			all
		]}
	DestroySoundBussEffects \{Line62_JamMode = [
			all
		]}
	Change \{last_set_line6_0 = -1}
	Change \{last_set_line6_1 = -1}
endscript

script musicstudio_refresh_current_instrument_effect 
	printf \{qs(0x2a1dc4ae)}
	musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
	<player_object> :MusicStudioPlayer_GetInstrument
	musicstudio_change_effect instrument = <instrument>
endscript

script musicstudio_change_and_preview_effect \{effect_sub_type = a}
	musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
	<player_object> :MusicStudioPlayer_GetInstrument
	musicstudio_mainobj :MusicStudioGhmix_GetEffectFocus
	musicstudio_mainobj :MusicStudio_SetSongEffectIndex type_index = <current_effect_focus> effect_index = <index>
	musicstudio_change_effect {
		instrument = <instrument>
		explicit_ab = <effect_sub_type>
		effect_type_index = <current_effect_focus>
	}
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		musicstudio_line6pod_destroy player = <player>
	else
		musicstudio_line6pod_refresh player = <player>
	endif
	musicstudio_preview_effect player = <player>
endscript

script musicstudio_get_preview_types 
	musicstudio_mainobj :MusicStudioGhmix_GetEffectFocus
	musicstudio_mainobj :MusicStudio_SetSongEffectIndex type_index = <current_effect_focus> effect_index = <index>
	musicstudio_mainobj :MusicStudio_GetCurrentABType effect_type_index = <current_effect_focus>
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
	musicstudio_change_and_preview_effect effect_sub_type = <preview1> player = <player> index = <index>
endscript

script musicstudio_effect_focus 
	musicstudio_get_preview_types index = <index>
	musicstudio_change_and_preview_effect effect_sub_type = <preview0> player = <player> index = <index>
endscript

script musicstudio_effect_get_active 
	return \{active = 1}
endscript

script musicstudio_get_selected_effect 
	musicstudio_mainobj :MusicStudioGhmix_GetEffectFocus
	musicstudio_mainobj :MusicStudio_GetSongEffectIndex type_index = <current_effect_focus>
	return selected = <effect_index>
endscript

script musicstudio_effect_select_get_active 
	if GotParam \{player}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
	else
		musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
		<main_player> :MusicStudioPlayer_GetInstrument
	endif
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	if (<effect_type_index> = 0 || <effect_type_index> = 1)
		return \{active = 1}
	endif
	return \{active = 0}
endscript

script get_current_effect_line_text 
	if GotParam \{player}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
	else
		if NOT GotParam \{instrument}
			musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
			<main_player> :MusicStudioPlayer_GetInstrument
		endif
	endif
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		<name_text> = qs(0xaddc9006)
		case 1
		<name_text> = qs(0x86f1c3c5)
		default
		<name_text> = qs(0x128bfaaa)
	endswitch
	FormatText TextName = name_text qs(0xfce235b7) a = <name_text>
	return name_text = <name_text>
endscript

script get_current_effect_name_text 
	if GotParam \{player}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
	else
		musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
		<main_player> :MusicStudioPlayer_GetInstrument
	endif
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :MusicStudioGhmix_GetEffectFocus
	musicstudio_mainobj :MusicStudio_GetSongEffectIndex type_index = <effect_type_index>
	switch <effect_type_index>
		case 0
		FormatText TextName = Effect_text qs(0x3d84b1fa) a = (($musicstudio_line6_0_array [<effect_index>]).name_text)
		if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
			<Effect_text> = qs(0xdc6e5e8d)
		endif
		case 1
		FormatText TextName = Effect_text qs(0x3d84b1fa) a = (($musicstudio_line6_1_array [<effect_index>]).name_text)
		if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
			<Effect_text> = qs(0xdc6e5e8d)
		endif
		default
		FormatText \{TextName = Effect_text
			qs(0x9dd9821b)}
	endswitch
	return name_text = <Effect_text>
endscript

script change_current_effect 
	musicstudio_toggle_effect player = <player>
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		FormatText checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
		if <musicstudio_menu> :Desc_ResolveAlias name = alias_jamroom_player_menu param = jamroom_player_menu
			musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
			<player_object> :MusicStudioMenu_SetState {
				id = <jamroom_player_menu>
				state = musicstudio_effect_settings_state
			}
		endif
	else
		if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_menu
				param = ghmix_menu}
			musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
			<player_object> :MusicStudioMenu_SetState {
				id = <ghmix_menu>
				state = musicstudio_effect_settings_state
			}
		endif
	endif
	musicstudio_init_all_line6_effects
	musicstudio_line6pod_refresh player = <player>
endscript

script musicstudio_toggle_effect 
	if NOT GotParam \{instrument}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
	endif
	<track> = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = <track>
	<effect_type_index> = (<effect_type_index> + 1)
	if (<effect_type_index> >= 2)
		if (<track> = rhythm || <track> = lead)
			<effect_type_index> = 0
		else
			<effect_type_index> = -1
		endif
	endif
	musicstudio_mainobj :MusicStudio_SetTrackEffectIndex track = <track> effect_type_index = <effect_type_index>
endscript

script musicstudio_init_line6_effects_menu 
	musicstudio_line6pod_refresh player = <player>
endscript

script musicstudio_back_from_effect_menu 
	musicstudio_line6pod_destroy player = <player>
endscript

script musicstudio_get_effect_back_state 
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		return \{musicstudio_state = musicstudio_jamroom_track_settings_state}
	else
		return \{musicstudio_state = musicstudio_transport_state}
	endif
endscript

script musicstudio_set_gobal_effect_focus 
	if GotParam \{player}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
	else
		musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
		<main_player> :MusicStudioPlayer_GetInstrument
	endif
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :MusicStudioGhmix_SetEffectFocus current_effect_focus = <effect_type_index>
endscript

script musicstudio_get_effect_list_checksum 
	if NOT GotParam \{effect_type}
		musicstudio_mainobj :MusicStudioGhmix_GetEffectFocus
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
	musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
	<player_object> :MusicStudioPlayer_GetInstrument
	if (<instrument> = -1)
		printf \{qs(0x936e4949)}
		return effect_title = <effect_title> a_title = <a_title> b_title = <b_title>
	endif
	<track> = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = <track>
	switch (<effect_type_index>)
		case 0
		<effect_list> = musicstudio_line6_0_array
		case 1
		<effect_list> = musicstudio_line6_1_array
	endswitch
	if ((<effect_type_index> = 0) || (<effect_type_index> = 1))
		musicstudio_mainobj :MusicStudio_GetSongEffectIndex type_index = <effect_type_index>
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

script musicstudio_line6pod_scrolling_text \{scale = 1
		parent = root_window}
	<scale> = 0.4
	rgba = [68 32 2 255]
	CreateScreenElement {
		type = ContainerElement
		parent = <scroll_window_id>
		id = <scroll_id>
		Pos = (0.0, 0.0)
		just = [left top]
		scale = <scale>
	}
	CreateScreenElement {
		type = TextElement
		parent = <scroll_id>
		just = [left top]
		Pos = (0.0, 0.0)
		scale = 1.0
		text = <text>
		font = fontgrid_text_A3
		rgba = <rgba>
		z_priority = 65
	}
	GetScreenElementDims id = <id>
	<scaled_width> = (<width> * <scale>)
	if (<scaled_width> > <window_width>)
		new_width = (<width> + 100)
		CreateScreenElement {
			type = TextElement
			parent = <scroll_id>
			just = [left top]
			Pos = ((1.0, 0.0) * <new_width>)
			scale = 1.0
			text = <text>
			font = fontgrid_text_A3
			rgba = <rgba>
			z_priority = 65
		}
		<scroll_id> :SE_SetProps Pos = (0.0, 0.0)
		wait \{1.0
			seconds}
		begin
		<scroll_id> :SE_SetProps Pos = ((-1.0, 0.0) * (<new_width> * <scale>)) time = <time>
		<scroll_id> :SE_WaitProps
		<scroll_id> :SE_SetProps Pos = (0.0, 0.0)
		repeat
	endif
endscript

script musicstudio_line6pod_set_ab_text 
	if (<ab> = a)
		<window_id> = scrolling_text_window1
		FormatText checksumname = scroll_window_id 'line6_scrolling_window1_%s' s = <player>
		FormatText checksumname = scroll_id 'line6_scrolling_text1_%s' s = <player>
		height = -27
	else
		<window_id> = scrolling_text_window2
		FormatText checksumname = scroll_window_id 'line6_scrolling_window2_%s' s = <player>
		FormatText checksumname = scroll_id 'line6_scrolling_text2_%s' s = <player>
		height = 22
	endif
	FormatText checksumname = line6_pod_id 'line6_pod_%a' a = <player>
	if <line6_pod_id> :Desc_ResolveAlias name = scrolling_text_window2
		<window_width> = 130
		CreateScreenElement {
			parent = <resolved_id>
			id = <scroll_window_id>
			type = WindowElement
			just = [center center]
			pos_anchor = [center center]
			Pos = ((12.0, 0.0) + ((0.0, 1.0) * <height>))
			dims = ((0.0, 100.0) + ((1.0, 0.0) * <window_width>))
		}
		<scroll_window_id> :Obj_SpawnScript musicstudio_line6pod_scrolling_text params = {
			parent = <resolved_id>
			scroll_window_id = <scroll_window_id>
			scroll_id = <scroll_id>
			player = <player>
			window_width = <window_width>
			text = <text>
			time = 10
		}
	endif
endscript

script musicstudio_line6pod_refresh 
	musicstudio_line6pod_destroy player = <player>
	musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
	<player_object> :MusicStudioPlayer_GetInstrument
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	LINE6_pod1_alpha = 0
	LINE6_pod2_alpha = 0
	switch (<effect_type_index>)
		case 0
		<LINE6_pod1_alpha> = 1
		case 1
		<LINE6_pod2_alpha> = 1
	endswitch
	musicstudio_highway_blackout \{blackout = [
			1
			1
			1
			1
			1
		]}
	FormatText checksumname = line6_pod_window_id 'line6_pod_window_%a' a = <player>
	FormatText checksumname = line6_pod_id 'line6_pod_%a' a = <player>
	if ScreenElementExists \{id = musicstudio_ghmix}
		CreateScreenElement {
			parent = musicstudio_ghmix
			type = DescInterface
			id = <line6_pod_id>
			pos_anchor = [center center]
			just = [center center]
			Pos = (-180.0, -38.0)
			scale = 1.0
			desc = 'line6_pod_advanced'
			LINE6_pod1_alpha = <LINE6_pod1_alpha>
			LINE6_pod2_alpha = <LINE6_pod2_alpha>
		}
	else
		FormatText checksumname = container_id 'gem_containerp%p' p = <player> AddToStringLookup = true
		if ScreenElementExists id = <container_id>
			if ScreenElementExists id = <line6_pod_window_id>
				DestroyScreenElement id = <line6_pod_window_id>
			endif
			CreateScreenElement {
				type = WindowElement
				parent = <container_id>
				id = <line6_pod_window_id>
				just = [center top]
				pos_anchor = [center top]
				Pos = (-1.0, 235.0)
				dims = (220.0, 126.0)
			}
			CreateScreenElement {
				parent = <line6_pod_window_id>
				type = DescInterface
				id = <line6_pod_id>
				pos_anchor = [center center]
				just = [center center]
				Pos = (0.0, 113.0)
				scale = 1.075
				desc = 'line6_pod_advanced'
				LINE6_pod1_alpha = <LINE6_pod1_alpha>
				LINE6_pod2_alpha = <LINE6_pod2_alpha>
			}
		endif
	endif
	musicstudio_get_line6_effect_strings_for_player player = <player>
	<line6_pod_id> :SetProps Effect_text = <effect_title>
	<line6_pod_id> :SetProps amp_text = qs(0x00000000)
	<line6_pod_id> :SetProps fx_text = qs(0x00000000)
	if ScreenElementExists \{id = musicstudio_ghmix}
		musicstudio_line6pod_set_ab_text player = <player> ab = a text = <a_title>
		musicstudio_line6pod_set_ab_text player = <player> ab = b text = <b_title>
	endif
endscript

script musicstudio_line6pod_destroy 
	FormatText checksumname = line6_pod_id 'line6_pod_%a' a = <player>
	if ScreenElementExists id = <line6_pod_id>
		DestroyScreenElement id = <line6_pod_id>
	endif
	musicstudio_highway_blackout \{remove}
	killspawnedscript \{name = musicstudio_line6pod_scrolling_text}
endscript

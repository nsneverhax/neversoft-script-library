
script musicstudio_ghmix_song_init \{editing = 0}
	musicstudio_ghmix_set_part
	musicstudio_ghmix_song_create_highway
	musicstudio_mainobj :musicstudioghmix_init
	musicstudio_mainobj :musicstudioghmix_setupdate \{on = true}
	musicstudio_mainobj :musicstudioghmix_changesnap \{snap_index = 0}
	musicstudio_skip_closest_snap
	musicstudio_mainobj :musicstudiohighway_songview \{on = true}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_mainobj :musicstudioghmix_togglescrub \{enable = false}
	debug_analog_options_disable
	change \{select_shift = 0}
	notetracker_whammy_set_fast_forward
	musicstudio_stop_menu_music
	musicstudio_menu_update_song_info_text
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
	musicstudio_hide_tilt_meter
	musicstudio_reinit_menu_sounds
endscript

script musicstudio_ghmix_song_create_highway 
	musicstudio_create_highway {
		pixels_per_beat = 8
		visible_after = -440
		visible_before = 100
		highway_pos = (-55.0, 416.0)
		gem_scale = 0.35000002
		small_view = 1
		<...>
	}
endscript

script musicstudio_ghmix_song_deinit 
	killspawnedscript \{name = musicstudio_pulse_tip_text}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = false
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudiohighway_songview \{on = false}
	musicstudio_mainobj :musicstudioghmix_setupdate \{on = false}
	debug_analog_options_enable
	change \{select_shift = 1}
	jam_stop_all_samples
	musicstudio_start_menu_music
	musicstudio_reinit_menu_sounds
endscript

script musicstudio_ghmix_song_playback 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = false
	musicstudio_mainobj :musicstudioghmix_play \{on = true
		repeat_selection = true}
endscript

script musicstudio_ghmix_song_playback_stop 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_playback_stop
	musicstudio_skip_closest_snap
endscript

script musicstudio_record_pattern_green 
	musicstudio_mainobj :musicstudioghmix_recordpattern \{color = green}
	musicstudio_verify_patterns
endscript

script musicstudio_record_pattern_red 
	musicstudio_mainobj :musicstudioghmix_recordpattern \{color = red}
	musicstudio_verify_patterns
endscript

script musicstudio_record_pattern_yellow 
	musicstudio_mainobj :musicstudioghmix_recordpattern \{color = yellow}
	musicstudio_verify_patterns
endscript

script musicstudio_record_pattern_blue 
	musicstudio_mainobj :musicstudioghmix_recordpattern \{color = blue}
	musicstudio_verify_patterns
endscript

script musicstudio_record_pattern_orange 
	musicstudio_mainobj :musicstudioghmix_recordpattern \{color = orange}
	musicstudio_verify_patterns
endscript

script musicstudio_verify_patterns 
	if musicstudio_mainobj :musicstudiohighway_issongview
		musicstudio_mainobj :musicstudiohighway_verifypatterns
	endif
endscript

script musicstudio_record_pattern_get_active 
	musicstudio_mainobj :musicstudioghmix_getpatternhandle color = <color>
	find_index_from_pattern_handle pattern_handle = <pattern_handle>
	if (<found> = 1)
		return \{active = 1}
	endif
	return \{active = 0}
endscript

script get_pattern_name_text \{localized = 1
		show_user_text = 0}
	requireparams \{[
			category
			sub_category
			type
		]
		all}
	if (<show_user_text> = 1)
		if gotparam \{on_disk}
			if (<on_disk> = 1)
				show_user_text = 0
			else
				show_user_text = 1
			endif
		endif
	endif
	category_text = ($ghmix_pattern_categories [<category>].name_text)
	sub_category_text = ($ghmix_pattern_sub_categories [<sub_category>].name_text)
	type_text = ($ghmix_pattern_types [<type>].name_text)
	if (<localized> = 1)
		if gotparam \{color}
			formattext textname = pattern_name_text qs(0x99066721) a = <category_text> b = <sub_category_text> c = <type_text>
		else
			formattext textname = pattern_name_text qs(0xd1f94500) a = <category_text> b = <sub_category_text> c = <type_text>
		endif
		if (<show_user_text> = 1)
			formattext textname = pattern_name_text qs(0x8b800d58) a = <pattern_name_text>
		endif
	else
		formattext textname = pattern_name_text '%a_%b_%c' a = <category_text> b = <sub_category_text> c = <type_text>
		if (<show_user_text> = 1)
			formattext textname = pattern_name_text '\\L(USER) %a' a = <pattern_name_text>
		endif
	endif
	return pattern_name_text = <pattern_name_text>
endscript

script get_pattern_rgba 
	requireparams \{[
			category
			sub_category
		]
		all}
	category_rgba = ($ghmix_pattern_categories [<category>].rgba)
	sub_category_rgba = ($ghmix_pattern_sub_categories [<sub_category>].rgba)
	return category_rgba = <category_rgba> sub_category_rgba = <sub_category_rgba>
endscript

script get_pattern_index_from_handle \{pattern_handle = -1}
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist allow_instruments = <allow_instruments>
	if (<pattern_handle> >= 0)
		getarraysize <pattern_list>
		found = 0
		i = 0
		begin
		if (<pattern_handle> = <pattern_list> [<i>].handle)
			<found> = 1
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if (<found> = 1)
			return pattern_index = <i>
		else
			return \{pattern_index = -1}
		endif
	else
		return \{pattern_index = -1}
	endif
endscript

script get_pattern_name_text_from_handle \{pattern_handle = -1}
	if (<pattern_handle> >= 0)
		find_index_from_pattern_handle pattern_handle = <pattern_handle>
		if (<found> = 1)
			get_pattern_name_text_from_index index = <i> show_user_text = 1
			return pattern_name_text = <pattern_name_text>
		else
			return \{pattern_name_text = qs(0xd777e3c0)}
		endif
	else
		return \{pattern_name_text = qs(0xd777e3c0)}
	endif
endscript

script find_index_from_pattern_handle 
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist allow_instruments = <allow_instruments>
	getarraysize <pattern_list>
	found = 0
	i = 0
	begin
	if (<pattern_handle> = <pattern_list> [<i>].handle)
		<found> = 1
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return i = <i> found = <found>
endscript

script get_pattern_name_text_from_index \{index = -1
		show_user_text = 0}
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist allow_instruments = <allow_instruments>
	curr_category = (<pattern_list> [<index>].category)
	curr_sub_category = (<pattern_list> [<index>].sub_category)
	curr_type = (<pattern_list> [<index>].type)
	curr_on_disk = (<pattern_list> [<index>].on_disk)
	get_pattern_name_text {
		category = <curr_category>
		sub_category = <curr_sub_category>
		type = <curr_type>
		on_disk = <curr_on_disk>
		show_user_text = <show_user_text>
	}
	return pattern_name_text = <pattern_name_text>
endscript

script musicstudio_preview_curr_pattern_get_active \{color = green}
	musicstudio_mainobj :musicstudioghmix_getpatternhandle color = <color>
	if (<pattern_handle> = -1)
		return \{active = 0}
	endif
	return \{active = 1}
endscript

script musicstudio_get_pattern_text_green 
	musicstudio_mainobj :musicstudioghmix_getpatternhandle \{color = green}
	get_pattern_name_text_from_handle pattern_handle = <pattern_handle>
	return name_text = <pattern_name_text>
endscript

script musicstudio_get_pattern_text_red 
	musicstudio_mainobj :musicstudioghmix_getpatternhandle \{color = red}
	get_pattern_name_text_from_handle pattern_handle = <pattern_handle>
	return name_text = <pattern_name_text>
endscript

script musicstudio_get_pattern_text_yellow 
	musicstudio_mainobj :musicstudioghmix_getpatternhandle \{color = yellow}
	get_pattern_name_text_from_handle pattern_handle = <pattern_handle>
	return name_text = <pattern_name_text>
endscript

script musicstudio_get_pattern_text_blue 
	musicstudio_mainobj :musicstudioghmix_getpatternhandle \{color = blue}
	get_pattern_name_text_from_handle pattern_handle = <pattern_handle>
	return name_text = <pattern_name_text>
endscript

script musicstudio_get_pattern_text_orange 
	musicstudio_mainobj :musicstudioghmix_getpatternhandle \{color = orange}
	get_pattern_name_text_from_handle pattern_handle = <pattern_handle>
	return name_text = <pattern_name_text>
endscript

script ghmix_assign_pattern 
	ghmix_get_sort_type
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	musicstudio_mainobj :musicstudioghmix_assignpattern pattern_handle = (<pattern_list> [<index>].handle) color = <color>
endscript

script ghmix_get_pattern_instrument_text 
	instrument = (<pattern_list> [<index>].instrument)
	formattext textname = instrument_text qs(0x6dcd2e48) a = ($jam_tracks [<instrument>].alt_text)
	return instrument_text = <instrument_text>
endscript

script ghmix_get_pattern_info_text 
	num_measures = (<pattern_list> [<index>].num_measures)
	if (<num_measures> = 1)
		formattext textname = measure_text qs(0x06e1efa2) a = <num_measures>
	else
		formattext textname = measure_text qs(0xa8960d56) a = <num_measures>
	endif
	num_notes = (<pattern_list> [<index>].num_notes)
	if (<num_notes> = 1)
		formattext textname = note_text qs(0xa24b7643) a = <num_notes>
	else
		formattext textname = note_text qs(0x662040b1) a = <num_notes>
	endif
	formattext textname = pattern_info_text qs(0x53cfde30) a = <measure_text> b = <note_text>
	return pattern_info_text = <pattern_info_text>
endscript

script ghmix_focus_pattern 
	ghmix_get_sort_type
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	ghmix_get_pattern_info_text index = <index> pattern_list = <pattern_list>
	formattext textname = pattern_info_text qs(0x1e9c76ca) b = <pattern_info_text>
	<id> :se_setprops tip_text = <pattern_info_text>
endscript

script ghmix_preview_curr_pattern \{color = green}
	musicstudio_mainobj :musicstudioghmix_getpatternhandle color = <color>
	get_pattern_index_from_handle pattern_handle = <pattern_handle>
	get_pattern_name_text_from_handle pattern_handle = <pattern_handle>
	ghmix_preview_pattern index = <pattern_index> name_text = <pattern_name_text> color = <color>
endscript

script ghmix_preview_pattern 
	wait \{2
		gameframes}
	ghmix_get_sort_type
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	ghmix_get_pattern_info_text index = <index> pattern_list = <pattern_list>
	ghmix_get_pattern_instrument_text index = <index> pattern_list = <pattern_list>
	formattext textname = preview_text qs(0xdf3f32a3) a = <name_text> b = <pattern_info_text> c = <instrument_text>
	musicstudio_show_popup_warning warning = <preview_text> heading_text = qs(0xc8efb1b1) after_script = ghmix_stop_preview_pattern
	ghmix_get_sort_type
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	musicstudio_mainobj :musicstudioghmix_previewpattern pattern_handle = (<pattern_list> [<index>].handle) color = <color> on = true
endscript

script ghmix_stop_preview_pattern 
	musicstudio_mainobj :musicstudioghmix_previewpattern \{on = false}
	jam_stop_all_sound
endscript

script ghmix_get_sort_type 
	sort_type = none
	if ($musicstudio_scrolling_sort = 1)
		<sort_type> = category
	elseif ($musicstudio_scrolling_sort = 2)
		<sort_type> = sub_category
	endif
	return sort_type = <sort_type>
endscript

script ghmix_get_allow_instruments 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	switch <instrument>
		case 0
		allow_instruments = [0]
		case 1
		allow_instruments = [1]
		case 2
		allow_instruments = [2]
		case 3
		allow_instruments = [3]
		case 4
		allow_instruments = [4]
	endswitch
	return allow_instruments = <allow_instruments>
endscript

script ghmix_get_selected_pattern 
	ghmix_get_sort_type
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	musicstudio_mainobj :musicstudioghmix_getpatternhandle color = <color>
	selected = 0
	getarraysize <pattern_list>
	if (<array_size> > 0)
		i = 0
		begin
		if (<pattern_handle> = <pattern_list> [<i>].handle)
			<selected> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	printf channel = musicstudio qs(0x92c6086f) s = <selected>
	return selected = <selected>
endscript

script ghmix_pattern_get_num_measures 
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist allow_instruments = <allow_instruments>
	num_measures = 0
	getarraysize <pattern_list>
	if (<array_size> > 0)
		i = 0
		begin
		if (<pattern_handle> = <pattern_list> [<i>].handle)
			<num_measures> = (<pattern_list> [<i>].num_measures)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return num_measures = <num_measures>
endscript

script ghmix_get_pattern_list 
	ghmix_get_sort_type
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	return list = <pattern_list>
endscript

script ghmix_get_pattern_list_name_text 
	get_pattern_name_text_from_index show_user_text = 1 index = <index>
	return name_text = <pattern_name_text>
endscript

script ghmix_get_user_pattern_selected 
	return \{selected = 0}
endscript

script musicstudio_manage_patterns_get_active 
	musicstudio_mainobj :musicstudioghmix_getnumuserpatterns
	if (<num_user_patterns> > 0)
		return \{active = 1}
	endif
	return \{active = 0}
endscript

script ghmix_get_user_pattern_list 
	sort_type = category
	allow_instruments = [0 1 2 3 4]
	musicstudio_mainobj :musicstudio_getuserpatternlist sort_type = <sort_type> allow_instruments = <allow_instruments>
	return list = <pattern_list>
endscript

script ghmix_get_user_pattern_list_name_text \{index = -1
		show_user_text = 0}
	ghmix_get_user_pattern_list
	curr_category = (<list> [<index>].category)
	curr_sub_category = (<list> [<index>].sub_category)
	curr_type = (<list> [<index>].type)
	curr_on_disk = (<list> [<index>].on_disk)
	curr_instrument = (<list> [<index>].instrument)
	get_pattern_name_text {
		category = <curr_category>
		sub_category = <curr_sub_category>
		type = <curr_type>
		on_disk = <curr_on_disk>
		show_user_text = <show_user_text>
	}
	instrument_name = ($jam_tracks [<curr_instrument>].name_text)
	formattext textname = full_pattern_name_text qs(0xe91be69c) a = <instrument_name> b = <pattern_name_text>
	return name_text = <full_pattern_name_text>
endscript
musicstudio_ghmix_song_curr_delete_pattern_index = -1
musicstudio_popup_delete_pattern = {
	name_text = qs(0x6ecabffa)
	go_back_script = ghmix_song_delete_pattern_go_back
	options = [
		{
			text = qs(0xf7723015)
			tool_tip = qs(0x66f85661)
			func = ghmix_song_delete_pattern_go_back
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0x271a1633)
			tool_tip = qs(0x66f85661)
			func = ghmix_song_delete_pattern
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}

script ghmix_song_check_delete_pattern 
	change musicstudio_ghmix_song_curr_delete_pattern_index = <index>
	destroy_dialog_box
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudiomenu_setpopupstate {
			id = <ghmix_menu>
			popup_state = musicstudio_popup_delete_pattern
			no_deinit
		}
	endif
endscript

script ghmix_song_delete_pattern 
	ghmix_get_user_pattern_list
	if (($musicstudio_ghmix_song_curr_delete_pattern_index) >= 0)
		musicstudio_mainobj :musicstudio_deletepatternfromlocalmemory pattern_handle = (<list> [($musicstudio_ghmix_song_curr_delete_pattern_index)].handle)
	endif
	ghmix_song_delete_pattern_go_back
endscript

script ghmix_song_delete_pattern_go_back 
	destroy_dialog_box
	musicstudio_mainobj :musicstudio_getmainplayeridindex
	player = <playerid_index>
	musicstudio_mainobj :musicstudioghmix_getnumuserpatterns
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
		param = id}
	if (<num_user_patterns> > 0)
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<player_object> :musicstudiomenu_setscrollingstate {
			id = <id>
			scrolling_state = musicstudio_scrolling_manage_patterns
		}
	else
		if <id> :desc_resolvealias name = alias_scrolling_cont param = scrolling_cont
			if <id> :desc_resolvealias name = alias_scrolling_menu_elements param = scrolling_menu_elements
				musicstudio_scrolling_remove {id = <id>
					player = <player>
					prev_state = ghmix_song_edit_state
					scrolling_cont = <scrolling_cont>
					scrolling_state = musicstudio_scrolling_manage_patterns
					scrolling_menu_elements = <scrolling_menu_elements>}
			endif
		endif
	endif
	change \{musicstudio_ghmix_song_curr_delete_pattern_index = -1}
endscript

script musicstudio_save_pattern_get_active 
	musicstudio_mainobj :musicstudioghmix_getnumuserpatterns
	if (<num_user_patterns> < ($musicstudio_saved_patterns_max))
		return \{active = 1}
	endif
	return \{active = 0}
endscript

script musicstudio_save_pattern_get_name_text 
	musicstudio_save_pattern_get_active
	if (<active> = 1)
		name_text = qs(0x76b43939)
	else
		formattext textname = name_text qs(0x84766c89) a = ($musicstudio_saved_patterns_max) b = ($musicstudio_saved_patterns_max)
	endif
	return name_text = <name_text>
endscript

script save_pattern_check_duplicate 
	musicstudio_mainobj :musicstudioghmix_getpatternname
	ghmix_get_allow_instruments
	musicstudio_mainobj :musicstudio_getpatternlist allow_instruments = <allow_instruments>
	getarraysize <pattern_list>
	<duplicate> = 0
	if (<array_size> > 0)
		<index> = 0
		begin
		curr_category = (<pattern_list> [<index>].category)
		curr_sub_category = (<pattern_list> [<index>].sub_category)
		curr_type = (<pattern_list> [<index>].type)
		curr_on_disk = (<pattern_list> [<index>].on_disk)
		if NOT (<curr_on_disk> = 1)
			if (<curr_category> = <category> &&
					<curr_sub_category> = <sub_category> &&
					<curr_type> = <type>)
				<duplicate> = 1
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return duplicate = <duplicate>
endscript

script save_pattern_force_custom 
	getarraysize ($ghmix_pattern_categories)
	ghmix_set_pattern_category index = (<array_size> - 1)
	getarraysize ($ghmix_pattern_sub_categories)
	ghmix_set_pattern_sub_category index = (<array_size> - 1)
	getarraysize ($ghmix_pattern_types)
	ghmix_set_pattern_type index = (<array_size> - 1)
endscript
musicstudio_popup_save_pattern_check = {
	name_text = qs(0x25917715)
	options = [
		{
			text = qs(0xf7723015)
			tool_tip = qs(0x362714b4)
			func = save_pattern_go_back
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xf77909ae)
			tool_tip = qs(0x362714b4)
			func = save_pattern
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}

script save_pattern_check 
	save_pattern_check_duplicate
	if (<duplicate> = 1)
		destroy_dialog_box
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
				param = ghmix_menu}
			musicstudio_mainobj :musicstudio_getcurrmainplayer
			<main_player> :musicstudiomenu_setpopupstate {
				id = <ghmix_menu>
				popup_state = musicstudio_popup_save_pattern_check
				no_deinit
			}
		endif
	else
		save_pattern
	endif
endscript

script save_pattern 
	destroy_dialog_box
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_savepattern source_track_id = ($jam_tracks [<instrument>].id) dump_pattern = false
	musicstudio_verify_patterns
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
	musicstudio_select_area_deinit
endscript

script save_pattern_go_back 
	destroy_dialog_box
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudiomenu_setstate {
			id = <ghmix_menu>
			state = ghmix_song_transport_state
		}
	endif
	musicstudio_verify_patterns
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
	musicstudio_select_area_deinit
endscript

script save_pattern_and_dump 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_savepattern source_track_id = ($jam_tracks [<instrument>].id) dump_pattern = true
	musicstudio_select_area_deinit
endscript

script save_pattern_init 
	reinit_pattern_name
	musicstudio_select_area_init
endscript

script save_pattern_update_name 
	musicstudio_show_pattern_consumption
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = false
	musicstudio_mainobj :musicstudioghmix_getpatternname
	musicstudio_update_pattern_name_text {
		category = <category>
		sub_category = <sub_category>
		type = <type>
	}
	musicstudio_show_pattern_name
endscript

script get_save_pattern_success_text 
	get_pattern_name_text {
		category = <category>
		sub_category = <sub_category>
		type = <type>
		show_user_text = 0
	}
	formattext textname = save_pattern_success_text qs(0x66c97b83) s = <pattern_name_text>
	return save_pattern_success_text = <save_pattern_success_text>
endscript

script save_pattern_deinit 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	musicstudio_hide_pattern_name
endscript

script reinit_pattern_name 
	musicstudio_mainobj :musicstudioghmix_setpatternname {
		category = ($ghmix_song_last_category)
		sub_category = ($ghmix_song_last_sub_category)
		type = ($ghmix_song_last_type)
	}
endscript
ghmix_song_last_category = 0
ghmix_song_last_sub_category = 0
ghmix_song_last_type = 0

script ghmix_set_pattern_category 
	musicstudio_mainobj :musicstudioghmix_setpatternname category = <index>
	change ghmix_song_last_category = <index>
endscript

script ghmix_set_pattern_sub_category 
	musicstudio_mainobj :musicstudioghmix_setpatternname sub_category = <index>
	change ghmix_song_last_sub_category = <index>
endscript

script ghmix_set_pattern_type 
	musicstudio_mainobj :musicstudioghmix_setpatternname type = <index>
	change ghmix_song_last_type = <index>
endscript

script ghmix_get_selected_category 
	musicstudio_mainobj :musicstudioghmix_getpatternname
	return selected = <category>
endscript

script ghmix_get_selected_sub_category 
	musicstudio_mainobj :musicstudioghmix_getpatternname
	return selected = <sub_category>
endscript

script ghmix_get_selected_type 
	musicstudio_mainobj :musicstudioghmix_getpatternname
	return selected = <type>
endscript

script ghmix_get_category_list_checksum 
	return \{list_checksum = ghmix_pattern_categories}
endscript

script ghmix_get_sub_category_list_checksum 
	return \{list_checksum = ghmix_pattern_sub_categories}
endscript

script ghmix_get_type_list_checksum 
	return \{list_checksum = ghmix_pattern_types}
endscript

script ghmix_song_switch_instrument_left 
	printf \{channel = musicstudio
		qs(0xcaa97e5c)}
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudioghmix_switchinstrument \{direction = 1}
	musicstudio_ghmix_song_create_highway instrument = <new_instrument>
	musicstudio_mainobj :musicstudioghmix_movehighway time = <curr_song_time>
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
endscript

script ghmix_song_switch_instrument_right 
	printf \{channel = musicstudio
		qs(0x55bba7ae)}
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudioghmix_switchinstrument \{direction = -1}
	musicstudio_ghmix_song_create_highway instrument = <new_instrument>
	musicstudio_mainobj :musicstudioghmix_movehighway time = <curr_song_time>
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
endscript

script musicstudio_load_patterns 
	loadpak \{'jams/jam1.pak'
		heap = heap_song
		no_vram}
	getarraysize ($musicstudio_patterns)
	index = 0
	begin
	file_name = ($musicstudio_patterns [<index>].file)
	formattext textname = file_path 'jams/patterns/%a.jam' a = <file_name>
	setsearchallassetcontexts
	musicstudio_mainobj :musicstudio_loadpatternfrompak file_path = <file_path>
	setsearchallassetcontexts \{off}
	<index> = (<index> + 1)
	repeat <array_size>
	unloadpak \{'jams/jam1.pak'}
	waitunloadpak \{'jams/jam1.pak'}
endscript

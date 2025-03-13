
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
			get_pattern_name_text_from_index index = <i> show_user_text = 1
			return pattern_name_text = <pattern_name_text>
		else
			return \{pattern_name_text = qs(0xd777e3c0)}
		endif
	else
		return \{pattern_name_text = qs(0xd777e3c0)}
	endif
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

script save_pattern_force_custom 
	getarraysize ($ghmix_pattern_categories)
	ghmix_set_pattern_category index = (<array_size> - 1)
	getarraysize ($ghmix_pattern_sub_categories)
	ghmix_set_pattern_sub_category index = (<array_size> - 1)
	getarraysize ($ghmix_pattern_types)
	ghmix_set_pattern_type index = (<array_size> - 1)
endscript

script save_pattern 
	save_pattern_force_custom
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_savepattern source_track_id = ($jam_tracks [<instrument>].id) dump_pattern = false
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
	formattext \{textname = save_pattern_success_text
		qs(0x66c97b83)
		s = qs(0xd2cd3957)}
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
		qs(0xc38237bd)}
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudioghmix_switchinstrument \{direction = 1}
	musicstudio_ghmix_song_create_highway instrument = <new_instrument>
	musicstudio_mainobj :musicstudioghmix_movehighway time = <curr_song_time>
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
endscript

script ghmix_song_switch_instrument_right 
	printf \{channel = musicstudio
		qs(0x1dde951c)}
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudioghmix_switchinstrument \{direction = -1}
	musicstudio_ghmix_song_create_highway instrument = <new_instrument>
	musicstudio_mainobj :musicstudioghmix_movehighway time = <curr_song_time>
	musicstudio_mainobj :musicstudioghmix_refreshpatterns
endscript

script musicstudio_load_patterns 
	loadpak \{'jams/jam1.pak'}
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

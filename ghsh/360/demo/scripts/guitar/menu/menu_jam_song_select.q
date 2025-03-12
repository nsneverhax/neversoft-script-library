
script create_jam_song_select_menu \{curr_tab = 0
		advanced_record = 0
		show_popup = 0}
	printf \{channel = jam_mode
		qs(0xb3a21306)}
	do_jam_loading
	jam_init_menu_light_show
	startrendering
	if (<show_popup> = 1)
		stoprendering
	endif
	if (<advanced_record> = 1)
		if NOT ($target_jam_camera_prop = jam_song_select)
			change \{target_jam_camera_prop = jam_ghmix_song_select}
			jam_camera_wait
		endif
	else
		if NOT ($target_jam_camera_prop = jam_song_select)
			change \{target_jam_camera_prop = jam_song_select}
			jam_camera_wait
		endif
	endif
	if ($jam_reverb = 0)
		jam_init_reverb
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = jam_song_select_container}
	if (<curr_tab> = 0)
		<line_pos> = (237.0, 510.0)
	else
		<line_pos> = (237.0, 480.0)
	endif
	change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	song_text_params = {type = textelement font = fontgrid_bordello just = [left center] scale = 0.8 rgba = [255 255 255 255]}
	song_info_text_params = {type = textelement font = fontgrid_bordello just = [left center] scale = 0.35000002 rgba = ($default_color_scheme.text_color)}
	setplayerinfo 1 controller = ($primary_controller)
	if (<curr_tab> = 0)
		directorylisting = $jam_curr_directory_listing
		make_generic_menu \{title = qs(0xa38d930d)
			pad_back_script = menu_jam_song_select_back
			vmenu_id = create_my_song_menu
			dims = (400.0, 600.0)
			tags = {
				debug_me
			}
			scrolling}
		getarraysize <directorylisting>
		jam_get_num_songs
		if (<user_song_count> < ($jam_max_user_songs))
			if (<advanced_record> = 0)
				add_generic_menu_text_item \{icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_jam_song_wizard
					additional_focus_script = menu_jam_create_example_song_focus}
			else
				change \{jam_current_recording_player = 1}
				setplayerinfo \{1
					jam_instrument = 0}
				add_generic_menu_text_item {
					icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_recording
					choose_state_data = {back_to_jam_band = 0 current_instrument = 0 player = ($jam_current_recording_player)}
					additional_focus_script = menu_jam_create_example_song_focus
				}
			endif
		else
			add_generic_menu_text_item \{icon = icon_jam_create_new
				text = qs(0x1bca1511)
				pad_choose_script = jam_create_song_failed_dialog
				dialog = 0
				pad_choose_params = {
					dialog = 0
				}
				additional_focus_script = menu_jam_create_example_song_focus}
		endif
		has_download_songs = 0
		first_local_song = 0
		if (<array_size> > 0)
			createscriptarray name = jam_download_songs size = <array_size> heap = $heap_song
			index = 0
			begin
			show_local_song = 1
			if structurecontains structure = (<directorylisting> [<index>]) downloaded
				if ((<directorylisting> [<index>].downloaded) = 1)
					<show_local_song> = 0
					<has_download_songs> = 1
					setarrayelement arrayname = jam_download_songs globalarray index = <index> newvalue = 1
				endif
			endif
			if (<show_local_song> = 1)
				if (<first_local_song> = 0)
					add_generic_menu_text_item \{text = qs(0x322ff13f)
						heading
						not_focusable}
					<first_local_song> = 1
				endif
				setarrayelement arrayname = jam_download_songs globalarray index = <index> newvalue = 0
				add_generic_menu_text_item {
					text = (<directorylisting> [<index>].filename)
					pad_choose_script = jam_song_select_load_song
					pad_choose_params = {index = <index> filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
					pad_start_script = delete_jam_song_confirm
					pad_start_params = {filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
					additional_focus_script = menu_jam_create_song_focus
				}
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
		if (<has_download_songs> = 1)
			if netsessionfunc \{func = can_view_user_content}
				add_generic_menu_text_item \{text = qs(0xed613e2c)
					heading
					not_focusable}
				index = 0
				begin
				if ($jam_download_songs [<index>] = 1)
					add_generic_menu_text_item {
						text = (<directorylisting> [<index>].filename)
						pad_choose_script = jam_song_select_load_song
						pad_choose_params = {index = <index> filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
						pad_start_script = delete_jam_song_confirm
						pad_start_params = {filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
						additional_focus_script = menu_jam_create_song_focus
					}
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		if globalexists \{name = jam_download_songs
				type = array}
			printf \{channel = jam_mode
				qs(0xa047b8ba)}
			destroyscriptarray \{name = jam_download_songs}
		endif
		getarraysize ($jam_song_assets)
		num_assets = <array_size>
		if (<num_assets> > 0)
			add_generic_menu_text_item \{text = qs(0x98e2380b)
				heading
				not_focusable}
			index = 0
			begin
			if NOT structurecontains structure = ($jam_song_assets [<index>]) no_qp
				add_generic_menu_text_item {
					text = ($jam_song_assets [<index>].display_name)
					pad_choose_script = jam_song_select_load_song
					pad_choose_params = {index = <index> filename = ($jam_song_assets [<index>].filename) advanced_record = <advanced_record> example_song = 1}
					additional_focus_script = menu_jam_create_example_song_focus
				}
			endif
			<index> = (<index> + 1)
			repeat <num_assets>
		endif
		bx_refreshmenuitemsindexes \{vmenu_id = create_my_song_menu}
		bx_genericmenu_setupscrollbar num_items = <num_items>
	endif
	change \{jam_band_new_song = 0}
	destroy_jam_song_select_popup
	if (<show_popup> = 1)
		startrendering
		create_jam_song_select_popup advanced_record = <advanced_record>
	else
		launchevent \{type = focus
			target = current_menu}
	endif
	create_viewport_ui \{texture = `tex\zones\z_studio\rm_studio_monitor_gh_mix.dds`
		texdict = `zones/z_studio/z_studio.tex`
		keep_current_level}
	spawnscriptnow menu_jam_screensaver params = {window_id = <window_id>}
	<window_id> :obj_spawnscriptnow menu_jam_screensaver params = {window_id = <window_id>}
	destroy_loading_screen
endscript

script menu_jam_screensaver 
	createscreenelement {
		parent = <window_id>
		type = spriteelement
		texture = load_record
		rgba = [200 200 200 255]
		dims = (20.0, 20.0)
		scale = 10
		alpha = 1
		pos = (320.0, 135.0)
		z_priority = 1000
		alpha = 0
	}
	if NOT gotparam \{no_fade}
		<id> :se_setprops alpha = 1 rot_angle = 360 time = 2
		<id> :se_waitprops
	else
		<id> :se_setprops alpha = 1
	endif
	begin
	<id> :se_setprops rot_angle = 0
	<id> :se_setprops rot_angle = 360 time = 2
	<id> :se_waitprops
	repeat
endscript

script menu_jam_screensaver_loading 
	createscreenelement {
		type = textblockelement
		parent = <window_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = [150 150 150 255]
		pos = (320.0, 135.0)
		dims = (170.0, 40.0)
		text = qs(0x37f4c584)
		z_priority = 1000
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	time_between = 0.1
	loading_text_base = qs(0xabf4f150)
	period_array = [qs(0x00000000) qs(0xefb47879) qs(0xab24dd29) qs(0xb723938a)]
	count = 0
	begin
	formattext textname = loading_text qs(0xeef7df84) s = <loading_text_base> a = (<period_array> [<count>])
	<id> :setprops text = <loading_text>
	wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script menu_jam_song_select_back 
	destroy_jam_play_select_menu
	generic_event_back
endscript

script menu_jam_create_song_focus 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0x271a1633)
		button = start
		z = 100}
endscript

script menu_jam_create_example_song_focus 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script delete_jam_song_confirm 
	launchevent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	formattext textname = delete_dialog qs(0xa983b69d) s = <filename>
	create_popup_warning_menu {
		textblock = {
			text = <delete_dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {cancel_delete_jam_song}
				text = qs(0xf7723015)
			}
			{
				func = {delete_jam_song}
				func_params = {<...>}
				text = qs(0x271a1633)
			}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
endscript

script cancel_delete_jam_song 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0x271a1633)
		button = start
		z = 100}
	launchevent \{type = focus
		target = current_menu}
endscript

script delete_jam_song \{advanced_record = 0}
	launchevent \{type = unfocus
		target = current_menu}
	launchevent \{type = unfocus
		target = pu_warning_vmenu}
	clean_up_user_control_helpers
	change memcard_jamsession_file_name = <filename>
	ui_memcard_delete_jam event = menu_back data = {state = uistate_jam_select_song advanced_record = <advanced_record> show_popup = 0}
endscript

script destroy_jam_song_select_menu 
	killspawnedscript \{name = create_jam_song_select_menu}
	set_focus_color
	set_unfocus_color
	killspawnedscript \{name = menu_jam_screensaver}
	destroy_viewport_ui
	printf \{qs(0x04b8b2cc)}
	if screenelementexists \{id = jam_song_select_container}
		destroyscreenelement \{id = jam_song_select_container}
	endif
	destroy_jam_play_select_menu
	destroy_generic_menu
	destroy_jam_song_select_popup
	jam_destroy_tutorial_menu
	killspawnedscript \{id = jam_song_select_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript
jam_selected_song = qs(0xef150ff7)

script jam_song_select_load_song \{advanced_record = 0
		example_song = 0}
	printf \{channel = jam_mode
		qs(0x84934677)}
	clearjamsession
	jam_recording_create_editable_arrays
	if (<example_song> = 0)
		directorylisting = ($jam_curr_directory_listing)
		year = (<directorylisting> [<index>].year)
	else
		year = 2008
	endif
	change_jamsession_songlist_props_struct year = <year>
	ui_event_add_params example_song = <example_song>
	block \{type = taskmenu_callback}
	if NOT (<example_song> = 1)
		change memcard_jamsession_file_name = <filename>
		ui_memcard_load_jam event = menu_back data = {show_popup = 1 example_song = <example_song>}
	else
		loadjam file_name = <filename>
		change jam_selected_song = <filename>
		create_jam_song_select_popup example_song = <example_song> advanced_record = <advanced_record>
	endif
endscript

script create_jam_song_select_popup \{advanced_record = 0
		example_song = 0}
	stoprendering
	if screenelementexists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	ui_event_get_stack
	getarraysize <stack>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'jam_select_song')
			if structurecontains structure = (<stack> [<i>]) example_song
				example_song = (<stack> [<i>].example_song)
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	getsonginfo
	if NOT (<downloaded> = 1 || <example_song> = 1)
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs(0xbc9429b6)
			textblock = {
				text = qs(0x00000000)
				dims = (840.0, 600.0)
				pos = (640.0, 370.0)
				scale = 0.55
			}
			player_device = <player_device>
			options = [
				{
					func = jam_popup_play_song
					func_params = {advanced_record = <advanced_record>}
					text = qs(0x56fbf662)
				}
				{
					func = jam_popup_edit_song
					func_params = {advanced_record = <advanced_record>}
					text = qs(0x42474b0a)
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
			focus_index = 0
		}
	else
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs(0xbc9429b6)
			textblock = {
				text = qs(0x00000000)
				dims = (840.0, 600.0)
				pos = (640.0, 370.0)
				scale = 0.55
			}
			player_device = <player_device>
			options = [
				{
					func = jam_popup_play_song
					func_params = {<...>}
					text = qs(0x56fbf662)
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
		}
	endif
	gettrackinfo \{track = rhythm}
	change jam_current_bpm = <bpm>
	change jam_current_tuning = <tuning>
	getarraysize \{$drum_kits}
	printf channel = jam_mode qs(0xdf0adb60) s = <drum_kit>
	if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	change jam_current_drum_kit = <drum_kit>
	loaddrumkitall drum_kit = ($drum_kits [<drum_kit>].string_id) percussion_kit = ($drum_kits [<drum_kit>].percussion_string_id) async = 0
	loadmelodykit melody_kit = <melody_kit>
	if gotparam \{bass_kit}
		change bass_kit_mode = <bass_kit>
		loadbasskit bass_kit = <bass_kit>
	else
		setsonginfo \{bass_kit = 0}
		change \{bass_kit_mode = 0}
	endif
	jam_init_volumes
	jam_init_pan
	change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
		]}
	jam_load_scale
	jam_load_effect
	player_device = ($primary_controller)
	cas_update_band_logo \{album_art}
	pushassetcontext context = ($cas_band_logo_details.assetcontext)
	createscreenelement {
		type = spriteelement
		parent = popup_warning_container
		texture = ($cas_band_logo_details.textureasset)
		just = [left center]
		rgba = [255 255 255 250]
		pos = (375.0, 300.0)
		dims = (150.0, 150.0)
		z_priority = 10000
	}
	popassetcontext
	create_jam_song_info_text parent = popup_warning_container pos = (540.0, 288.0) rgba = [180 180 180 250] filename = ($jam_selected_song)
	startrendering
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
endscript

script create_jam_song_info_text \{column_offset = (220.0, 0.0)
		z_priority = 1000
		rgba = [
			210
			130
			0
			250
		]
		num_ratings = 0}
	note_count_text = [qs(0x00000000) qs(0x00000000) qs(0x00000000) qs(0x00000000) qs(0x00000000)]
	tracks_recorded_text = qs(0x00000000)
	count = 0
	last_end_time = 0
	all_tracks = 1
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		end_time = ($<gem_array> [(($<notetrack_size>) - 2)])
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
		formattext textname = note_count qs(0xd7ee902f) a = ($jam_tracks [<count>].name_text) b = (($<notetrack_size>) / 2) s = qs(0x42c9738e)
		formattext textname = tracks_recorded_text qs(0xdc07585f) s = <tracks_recorded_text> a = ($jam_tracks [<count>].name_text)
		setarrayelement arrayname = note_count_text index = <count> newvalue = <note_count>
	else
		formattext textname = note_count qs(0x5e97b9d2) a = ($jam_tracks [<count>].name_text) s = qs(0x71d71562)
		setarrayelement arrayname = note_count_text index = <count> newvalue = <note_count>
		all_tracks = 0
	endif
	<count> = (<count> + 1)
	repeat 5
	if (<tracks_recorded_text> = qs(0x00000000))
		formattext \{textname = tracks_recorded_text
			qs(0xf36d10c8)}
	endif
	if (<all_tracks> = 1)
		formattext \{textname = tracks_recorded_text
			qs(0x711df7be)}
	endif
	mod a = <last_end_time> b = 60000
	<seconds> = (<mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		formattext textname = length_text qs(0x6b8769fa) a = <minutes> b = <seconds>
	else
		formattext textname = length_text qs(0x830308cc) a = <minutes> b = <seconds>
	endif
	gettrackinfo \{track = rhythm}
	formattext textname = bpm_text qs(0x21072c11) a = <bpm>
	getsonginfo
	getarraysize \{$jam_genre_list}
	if (<genre> < 0 || <genre> >= <array_size>)
		formattext textname = genre_text qs(0xd0ef7f05) a = <genre>
	else
		formattext textname = genre_text qs(0x4d3a8435) a = ($jam_genre_list [<genre>].name_text)
	endif
	if (<artist> = qs(0x00000000))
		<artist> = qs(0x2dc91c7c)
	endif
	if screenelementexists \{id = song_preview_element}
		platform_prefix = qs(0x03ac90f0)
		if isxenon
			<platform_prefix> = qs(0x035582ab)
		elseif isps3
			<platform_prefix> = qs(0xcb8c08a3)
		else
			<platform_prefix> = qs(0x84cd9e64)
		endif
		if ((<file_id>.file_id [0]) = 0)
			formattext textname = file_id_text qs(0xd6df1a7a) a = (<file_id>.file_id [1]) p = <platform_prefix>
		else
			formattext textname = file_id_text qs(0xb05112d6) a = (<file_id>.file_id [1]) b = (<file_id>.file_id [0]) p = <platform_prefix>
		endif
		if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
			file_id_text = qs(0x03ac90f0)
		endif
		if NOT (<num_ratings> = 0)
			formattext textname = ratings_text qs(0x90047b5d) a = <num_ratings>
		else
			ratings_text = qs(0x03ac90f0)
		endif
		song_preview_element :se_setprops {
			song_name_text = <filename>
			artist_name_text = <artist>
			note_count01_text = (<note_count_text> [0])
			note_count02_text = (<note_count_text> [1])
			note_count03_text = (<note_count_text> [2])
			note_count04_text = (<note_count_text> [3])
			note_count05_text = (<note_count_text> [4])
			length_text = <length_text>
			bpm_text = <bpm_text>
			genre_text = <genre_text>
			file_id_text = <file_id_text>
			num_ratings_text = <ratings_text>
		}
	else
		if (<genre> < 0 || <genre> >= <array_size>)
			formattext textname = length_text qs(0xe3cd7faf) s = <length_text> b = qs(0xd0ef7f05)
		else
			formattext textname = length_text qs(0xe3cd7faf) s = <length_text> b = ($jam_genre_list [<genre>].name_text)
		endif
		createscreenelement {
			parent = <parent>
			type = descinterface
			desc = 'jam_song_info_text'
			pos = (190.0, 115.0)
			scale = 0.75
			song_name_text = <filename>
			artist_name_text = <artist>
			tracks_recorded_text = <tracks_recorded_text>
			song_length_text = <length_text>
			bpm_text = <bpm_text>
			genre_text = <genre_text>
			z_priority = 1000
		}
	endif
	return song_length = <last_end_time>
endscript

script jam_song_options_select_back \{advanced_record = 0}
	ui_menu_select_sfx
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
	ui_event event = menu_replace data = {state = uistate_jam_select_song show_popup = 0 advanced_record = <advanced_record> <...>}
endscript

script destroy_jam_song_select_popup 
	destroy_popup_warning_menu
endscript

script jam_popup_play_song 
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	jam_recording_create_jamsession_arrays
	song_prefix = 'editable'
	formattext checksumname = arraylist '%s_arraylist' s = <song_prefix> addtostringlookup = true
	song_prefix = 'jamsession'
	formattext checksumname = arraylist2 '%s_arraylist' s = <song_prefix> addtostringlookup = true
	jamsession_copymarkerarrays \{song = editable}
	jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	create_jam_play_select_menu <...> advanced_record = <advanced_record>
endscript

script jam_popup_edit_song \{advanced_record = 0}
	printf \{channel = jam_mode
		qs(0xb17f9063)}
	printf channel = jam_mode qs(0x169e2126) s = ($jam_selected_song) a = <advanced_record>
	if (<advanced_record> = 0)
		generic_event_choose state = uistate_jam_band data = {editing = 1 advanced_record = <advanced_record>}
	else
		change \{jam_current_recording_player = 1}
		setplayerinfo \{1
			jam_instrument = 0}
		generic_event_choose state = uistate_recording data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 player = ($jam_current_recording_player)}
	endif
endscript

script jam_popup_publish_song 
	printf \{channel = jam_mode
		qs(0x2b876e21)}
	getsonginfo
	printf channel = jam_mode qs(0xe2e069d2) a = <genre> b = <song_version>
	generic_event_choose state = uistate_jam_publish_song data = {filename = <filename> newfilename = <filename> new_genre = <genre>}
endscript

script load_jam_assets 
	getarraysize <directorylisting>
	num_saves = <array_size>
	getarraysize ($jam_song_assets)
	num_assets = <array_size>
	if (<num_assets> <= 0)
		return
	endif
	i = 0
	new_asset = 0
	begin
	curr_asset = ($jam_song_assets [<i>].filename)
	j = 0
	found_for_add = 0
	begin
	if (<num_saves> <= 0)
		break
	endif
	curr_save = (<directorylisting> [<j>].filename)
	if (<curr_save> = <curr_asset>)
		<found_for_add> = 1
	endif
	<j> = (<j> + 1)
	repeat <num_saves>
	if NOT (<found_for_add> = 1)
		formattext textname = curr_asset '%s' s = <curr_asset>
		loadjam file_name = <curr_asset>
		<new_asset> = 1
	else
		printf channel = jam_mode qs(0x472cadcd) s = <curr_asset>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return new_asset = <new_asset>
endscript

script loadjam \{file_name = 'output'
		save = 1}
	loadpak \{'jams/jam1.pak'}
	prepend = 'jams/'
	formattext textname = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x56336457) s = <file_path>
	setsearchallassetcontexts
	loadjamsessionfrompak jamname = <file_path>
	setsearchallassetcontexts \{off}
	setsonginfo \{song_version = $jam_song_version}
	unloadpak \{'jams/jam1.pak'}
	waitunloadpak \{'jams/jam1.pak'}
endscript

script savejam \{file_name = 'output'}
	setsonginfo \{downloaded = 0}
	getsonginfo
	printstruct channel = jam_mode <...>
	prepend = 'dumps\\'
	formattext textname = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x86fca5dc) s = <file_path>
	savejamsessiontofile jamname = <file_path>
endscript

script create_jam_play_select_menu 
	launchevent \{type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	destroy_jam_song_select_menu
	make_generic_menu {
		title = qs(0x81bf948c)
		pad_back_script = jam_play_select_menu_go_back
		pad_back_params = {advanced_record = <advanced_record> <...>}
		menu_id = jam_play_select_menu
		vmenu_id = jam_play_select_vmenu
		dims = (400.0, 300.0)
	}
	<has_guitar> = 0
	<has_drums> = 0
	<has_melody> = 0
	<normal_controller> = 0
	if NOT isguitarcontroller \{controller = $primary_controller}
		if NOT isdrumcontroller \{controller = $primary_controller}
			<normal_controller> = 1
		endif
	endif
	guitar_end_time = 0
	bass_end_time = 0
	drum_end_time = 0
	melody_end_time = 0
	suffix = '_size'
	getsonginfo
	if ((isguitarcontroller controller = $primary_controller) || ($allow_controller_for_all_instruments = 1 && <normal_controller> = 1))
		if isguitarcontroller \{controller = $primary_controller}
			setplayerinfo \{1
				part = guitar}
		endif
		if (<playback_track1> >= 0)
			guitar_gem_array = ($jam_tracks [<playback_track1>].gem_array)
			appendsuffixtochecksum base = <guitar_gem_array> suffixstring = <suffix>
			guitar_gem_array_size = ($<appended_id>)
			if (<guitar_gem_array_size> > 0)
				<end_time> = ($<guitar_gem_array> [(<guitar_gem_array_size> - 2)])
				<guitar_end_time> = <end_time>
				mod a = <end_time> b = 60000
				<seconds> = (<mod> / 1000)
				<minutes> = (<end_time> / 60000)
				<sec_check> = (<seconds> / 10)
				if (<sec_check> < 1)
					formattext textname = txt qs(0x478b2b32) a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track1>].name_text)
				else
					formattext textname = txt qs(0xa1ab49a8) a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track1>].name_text)
				endif
				add_generic_menu_text_item {
					text = <txt>
					pad_choose_script = create_jam_difficulty_select_menu
					pad_choose_params = {inst = 0 end_time = <guitar_end_time> advanced_record = <advanced_record>}
				}
				<has_guitar> = 1
			endif
		endif
		if (<playback_track2> >= 0)
			bass_gem_array = ($jam_tracks [<playback_track2>].gem_array)
			appendsuffixtochecksum base = <bass_gem_array> suffixstring = <suffix>
			bass_gem_array_size = ($<appended_id>)
			if (<bass_gem_array_size> > 0)
				<end_time> = ($<bass_gem_array> [(<bass_gem_array_size> - 2)])
				<bass_end_time> = <end_time>
				mod a = <end_time> b = 60000
				<seconds> = (<mod> / 1000)
				<minutes> = (<end_time> / 60000)
				<sec_check> = (<seconds> / 10)
				if (<sec_check> < 1)
					formattext textname = txt qs(0xcb7a4122) a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track2>].name_text)
				else
					formattext textname = txt qs(0xb55eae1e) a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track2>].name_text)
				endif
				add_generic_menu_text_item {
					text = <txt>
					pad_choose_script = create_jam_difficulty_select_menu
					pad_choose_params = {inst = 2 end_time = <bass_end_time> advanced_record = <advanced_record>}
				}
				<has_guitar> = 1
			endif
		endif
	endif
	if ((isdrumcontroller controller = $primary_controller) || ($allow_controller_for_all_instruments = 1 && <normal_controller> = 1))
		if isdrumcontroller \{controller = $primary_controller}
			setplayerinfo \{1
				part = drum}
		endif
		<drum_array> = ($jam_tracks [3].gem_array)
		appendsuffixtochecksum base = <drum_array> suffixstring = <suffix>
		if (($<appended_id>) > 0)
			<end_time> = ($<drum_array> [($<appended_id> - 2)])
			<drum_end_time> = <end_time>
			mod a = <end_time> b = 60000
			<seconds> = (<mod> / 1000)
			<minutes> = (<end_time> / 60000)
			<sec_check> = (<seconds> / 10)
			if (<sec_check> < 1)
				formattext textname = txt qs(0xe86526ca) a = <minutes> b = <seconds>
			else
				formattext textname = txt qs(0xb9d0eb24) a = <minutes> b = <seconds>
			endif
			add_generic_menu_text_item {
				text = <txt>
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {inst = 3 end_time = <drum_end_time> advanced_record = <advanced_record>}
			}
			<has_drums> = 1
		endif
	endif
	if (<normal_controller> = 1)
		<melody_array> = ($jam_tracks [4].gem_array)
		appendsuffixtochecksum base = <melody_array> suffixstring = <suffix>
		if (($<appended_id>) > 0)
			<end_time> = ($<melody_array> [($<appended_id> - 2)])
			<melody_end_time> = <end_time>
			mod a = <end_time> b = 60000
			<seconds> = (<mod> / 1000)
			<minutes> = (<end_time> / 60000)
			<sec_check> = (<seconds> / 10)
			if (<sec_check> < 1)
				formattext textname = txt qs(0x3b75eef4) a = <minutes> b = <seconds>
			else
				formattext textname = txt qs(0x89cc3e1e) a = <minutes> b = <seconds>
			endif
			add_generic_menu_text_item {
				text = <txt>
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {inst = 4 end_time = <melody_end_time> advanced_record = <advanced_record>}
			}
			<has_melody> = 1
		endif
	endif
	if ((isguitarcontroller controller = $primary_controller) && (<has_guitar> = 0))
		<txt> = qs(0x5e078424)
		add_generic_menu_text_item {
			text = <txt>
			pad_choose_script = jam_play_select_menu_go_back
		}
	elseif ((isdrumcontroller controller = $primary_controller) && (<has_drums> = 0))
		<txt> = qs(0x22cc40dc)
		add_generic_menu_text_item {
			text = <txt>
			pad_choose_script = jam_play_select_menu_go_back
		}
	endif
	if NOT (isguitarcontroller controller = $primary_controller)
		if NOT (isdrumcontroller controller = $primary_controller)
			if (<has_melody> = 0)
				<txt> = qs(0x8689f8f3)
				add_generic_menu_text_item {
					text = <txt>
					pad_choose_script = jam_play_select_menu_go_back
				}
			endif
		endif
	endif
	launchevent \{type = focus
		target = jam_play_select_vmenu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 110}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 110}
endscript

script destroy_jam_play_select_menu 
	if screenelementexists \{id = jam_play_select_menu}
		destroyscreenelement \{id = jam_play_select_menu}
	endif
	change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	if screenelementexists \{id = current_menu}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script jam_play_select_menu_go_back 
	stoprendering
	destroy_jam_play_select_menu
	destroy_popup_warning_menu
	create_jam_song_select_popup <...> example_song = <example_song>
endscript

script jam_create_song_failed_dialog \{dialog = 0}
	launchevent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formattext \{textname = dialog
			qs(0x17581596)
			s = $jam_max_user_songs}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x18965bea)
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_create_song_failed_go_back}
				text = qs(0x320a8d1c)
			}
		]
		long
	}
endscript

script jam_create_song_failed_go_back 
	destroy_popup_warning_menu
	launchevent \{type = focus
		target = current_menu}
endscript

script jam_auto_generate_guitar_gem_array 
	rhythm_gem_array = ($jam_tracks [0].gem_array)
	lead_gem_array = ($jam_tracks [1].gem_array)
	appendsuffixtochecksum base = <rhythm_gem_array> suffixstring = '_size'
	rhythm_array_size = <appended_id>
	appendsuffixtochecksum base = <lead_gem_array> suffixstring = '_size'
	lead_array_size = <appended_id>
	formattext \{checksumname = guitar_gem_array
		'guitar_gem_array'}
	if globalexists name = <guitar_gem_array> type = array
		destroyscriptarray name = <guitar_gem_array>
	endif
	createscriptarray name = <guitar_gem_array> size = (($gemarraysize) * 4) heap = $heap_song <...>
	appendsuffixtochecksum base = <guitar_gem_array> suffixstring = '_size'
	guitar_gem_array_size = <appended_id>
	ms_per_beat = (60000.0 / $jam_current_bpm)
	measure_quantize = (<ms_per_beat> * 4)
	quarter_quantize = <ms_per_beat>
	lead_index = 0
	rhythm_index = 0
	curr_time = 0
	record_lead = 0
	lead_done = 0
	rhythm_done = 0
	begin
	getnotetrackitem name = <rhythm_gem_array> index = <rhythm_index>
	rhythm_gem_time = <gem_time>
	rhythm_gem_length = <gem_length>
	rhythm_gem_pattern = <gem_pattern>
	getnotetrackitem name = <lead_gem_array> index = <lead_index>
	lead_gem_time = <gem_time>
	lead_gem_length = <gem_length>
	lead_gem_pattern = <gem_pattern>
	lead_note_end = (<lead_gem_time> + <lead_gem_length>)
	rhythm_note_end = (<rhythm_gem_time> + <rhythm_gem_length>)
	rhythm_measure = (<rhythm_gem_time> / <measure_quantize>)
	lead_measure = (<lead_gem_time> / <measure_quantize>)
	casttointeger \{rhythm_measure}
	casttointeger \{lead_measure}
	next_lead_measure_time = ((<lead_measure> + 1) * <measure_quantize>)
	next_rhythm_measure_time = ((<rhythm_measure> + 1) * <measure_quantize>)
	if (<next_rhythm_measure_time> < <next_lead_measure_time>)
		<record_lead> = 0
	else
		<record_lead> = 1
	endif
	if (<lead_done> = 1)
		<record_lead> = 0
	endif
	if (<rhythm_done> = 1)
		<record_lead> = 1
	endif
	if (<record_lead> = 0)
		<curr_time> = <rhythm_note_end>
		addnotetrackitem name = <guitar_gem_array> time = <rhythm_gem_time> length = <rhythm_gem_length> pattern = <rhythm_gem_pattern>
	else
		<curr_time> = <lead_note_end>
		addnotetrackitem name = <guitar_gem_array> time = <lead_gem_time> length = <lead_gem_length> pattern = <lead_gem_pattern>
	endif
	begin
	if (<rhythm_index> < $<rhythm_array_size>)
		getnotetrackitem name = <rhythm_gem_array> index = <rhythm_index>
		rhythm_gem_time = <gem_time>
		rhythm_gem_length = <gem_length>
		rhythm_gem_pattern = <gem_pattern>
		if NOT (<rhythm_gem_length> > 0)
			if (<rhythm_gem_time> > <curr_time>)
				break
			endif
		elseif (<rhythm_gem_time> >= <curr_time>)
			break
		endif
	else
		<rhythm_done> = 1
		break
	endif
	<rhythm_index> = (<rhythm_index> + 2)
	repeat
	begin
	if (<lead_index> < $<lead_array_size>)
		getnotetrackitem name = <lead_gem_array> index = <lead_index>
		lead_gem_time = <gem_time>
		lead_gem_length = <gem_length>
		lead_gem_pattern = <gem_pattern>
		if NOT (<lead_gem_length> > 0)
			if (<lead_gem_time> > <curr_time>)
				break
			endif
		elseif (<lead_gem_time> >= <curr_time>)
			break
		endif
	else
		<lead_done> = 1
		break
	endif
	<lead_index> = (<lead_index> + 2)
	repeat
	if (<lead_done> = 1)
		if (<rhythm_done> = 1)
			break
		endif
	endif
	repeat
	printf \{channel = jam_mode
		qs(0xa5bed1cf)}
endscript

script jam_auto_generate_melody_gem_array 
	melody_gem_array = ($jam_tracks [4].gem_array)
	appendsuffixtochecksum base = <melody_gem_array> suffixstring = '_size'
	melody_array_size = <appended_id>
	vocal_gem_array = temp_vocal_array
	if globalexists name = <vocal_gem_array> type = integer
		destroyscriptarray name = <vocal_gem_array>
	endif
	createscriptarray name = <vocal_gem_array> size = ($gemarraysize * 3) heap = $heap_song
	appendsuffixtochecksum base = <vocal_gem_array> suffixstring = '_size'
	vocal_gem_array_size = <appended_id>
	<midi_low> = 999
	<midi_high> = -1
	<counter> = 0
	<melody_index> = 0
	getjamsessionsize track = ($jam_tracks [4].id)
	default_phrase_array = [0 3 1000 3]
	change jamsession_vocals_phrases = <default_phrase_array>
	<phrases> = <default_phrase_array>
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize_ms = (<ms_per_beat> / 4)
	last_gem_time = -999
	if (<track_size> > 0)
		begin
		getnotetrackitem name = <melody_gem_array> index = (<counter> * 2)
		melody_gem_time = <gem_time>
		melody_gem_length = <gem_length>
		getjamsessionsound track = melody index = <counter>
		jam_get_single_sample_for_melody string = <note_string> fret = <note_fret>
		if (<velocity> >= 127)
			<velocity> = 0
		endif
		<final_midi_note> = (68 + <pitch_shift> + <velocity>)
		if (<final_midi_note> < <midi_low>)
			<midi_low> = <final_midi_note>
		elseif (<final_midi_note> > <midi_high>)
			<midi_high> = <final_midi_note>
		endif
		add_note = 1
		if ((<counter> + 1) < <track_size>)
			getnotetrackitem name = <melody_gem_array> index = ((<counter> + 1) * 2)
			next_gem_time = <gem_time>
			time_dif_after = (<next_gem_time> - <melody_gem_time>)
			time_dif_before = (<melody_gem_time> - <last_gem_time>)
			if (<time_dif_after> <= <quantize_ms>)
				if (<time_dif_before> <= (<quantize_ms> * 2))
					add_note = 0
				endif
			endif
		endif
		if (<add_note> = 1)
			setarrayelement arrayname = <vocal_gem_array> globalarray index = <melody_index> newvalue = <melody_gem_time>
			setarrayelement arrayname = <vocal_gem_array> globalarray index = (<melody_index> + 1) newvalue = <melody_gem_length>
			setarrayelement arrayname = <vocal_gem_array> globalarray index = (<melody_index> + 2) newvalue = <final_midi_note>
			<melody_index> = (<melody_index> + 3)
			<last_gem_time> = <melody_gem_time>
		endif
		<counter> = (<counter> + 1)
		repeat <track_size>
	endif
	setarrayelement arrayname = jamsession_vocals_phrases globalarray index = 2 newvalue = (<gem_time> + <gem_length>)
	change globalname = <vocal_gem_array_size> newvalue = <melody_index>
	setarrayelement arrayname = jamsession_vocals_note_range globalarray index = 0 newvalue = <midi_low>
	setarrayelement arrayname = jamsession_vocals_note_range globalarray index = 1 newvalue = <midi_high>
	if globalexists \{name = jamsession_song_vocals
			type = array}
		destroyscriptarray \{name = jamsession_song_vocals}
	endif
	createscriptarray name = jamsession_song_vocals size = ($gemarraysize * 3) heap = $heap_song
	copyfinalscriptarray \{sourcename = temp_vocal_array
		destname = jamsession_song_vocals}
	if globalexists name = <vocal_gem_array> type = array
		destroyscriptarray name = <vocal_gem_array>
	endif
endscript
jamsession_diffcrunchparams = {
	drum = {
		easy = {
			filter_note_time_array = [
				{
					type = 4096
					time = 4
				}
				{
					type = 256
					time = 4
				}
				{
					type = 16
					time = 4
				}
				{
					type = 1
					time = 4
				}
				{
					type = 65536
					time = 4
				}
				{
					type = 1048576
					time = 1
				}
			]
			chord_filter = standard_drum_filter
		}
		medium = {
			filter_note_time_array = [
				{
					type = 4096
					time = 16
				}
				{
					type = 256
					time = 8
				}
				{
					type = 16
					time = 4
				}
				{
					type = 1
					time = 8
				}
				{
					type = 65536
					time = 4
				}
				{
					type = 1048576
					time = 0.5
				}
			]
			chord_filter = standard_drum_filter
		}
		hard = {
			filter_note_time_array = [
				{
					type = 4096
					time = 32
				}
				{
					type = 256
					time = 16
				}
				{
					type = 16
					time = 8
				}
				{
					type = 1
					time = 16
				}
				{
					type = 65536
					time = 8
				}
				{
					type = 1048576
					time = 4
				}
			]
			chord_filter = standard_drum_filter
		}
		expert = {
			filter_note_time_array = [
				{
					type = 4096
					time = 32
				}
				{
					type = 256
					time = 32
				}
				{
					type = 16
					time = 32
				}
				{
					type = 1
					time = 32
				}
				{
					type = 65536
					time = 32
				}
				{
					type = 1048576
					time = 32
				}
			]
			chord_filter = standard_drum_filter
		}
	}
	guitar = {
		easy = {
			convert_note_mask = 69632
			convert_note_to = 256
			filter_note_time = 4
			chord_filter = lowest_single_note
		}
		medium = {
			convert_note_mask = 65536
			convert_note_to = 4096
			filter_note_time = 8
			chord_filter = lowest_single_chord_medium
		}
		hard = {
			filter_note_time = 16
			chord_filter = lowest_single_chord_hard
		}
		expert = {
			filter_note_time = 32
		}
	}
	bass = {
		easy = {
			convert_note_mask = 69632
			convert_note_to = 256
			convert_note_mask2 = 1048576
			convert_note_to2 = 1
			filter_note_time = 4
			chord_filter = lowest_single_note
		}
		medium = {
			convert_note_mask = 65536
			convert_note_to = 4096
			convert_note_mask2 = 1048576
			convert_note_to2 = 1
			filter_note_time = 8
			chord_filter = lowest_single_chord_medium
		}
		hard = {
			filter_note_time = 16
			chord_filter = lowest_single_chord_hard
		}
		expert = {
			filter_note_time = 32
		}
	}
}

script create_jam_difficulty_select_menu 
	destroy_jam_play_select_menu
	destroy_popup_warning_menu
	curr_default_difficulty = ($default_difficulty [$primary_controller])
	focus_index = 0
	if gotparam \{curr_default_difficulty}
		switch (<curr_default_difficulty>)
			case easy
			focus_index = 1
			case medium
			focus_index = 2
			case hard
			focus_index = 3
			case expert
			focus_index = 4
		endswitch
	endif
	make_generic_menu {
		title = qs(0x9f281c76)
		pad_back_script = jam_difficulty_select_go_back
		pad_back_params = {advanced_record = <advanced_record>}
		menu_id = jam_difficulty_select_menu
		vmenu_id = jam_difficulty_select_vmenu
		dims = (400.0, 300.0)
	}
	add_generic_menu_text_item {
		text = qs(0x74d6a0a0)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = easy_rhythm inst = <inst> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs(0x8d657387)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = easy inst = <inst> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs(0x6ef11a01)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = medium inst = <inst> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs(0x51b06d2f)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = hard inst = <inst> end_time = <end_time> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs(0x334908ac)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = expert inst = <inst> end_time = <end_time>}
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent type = focus target = jam_difficulty_select_vmenu data = {child_index = <focus_index>}
endscript

script jam_difficulty_select_go_back 
	destroy_popup_warning_menu
	destroy_jam_play_select_menu
	if screenelementexists \{id = jam_difficulty_select_menu}
		destroyscreenelement \{id = jam_difficulty_select_menu}
	endif
	create_jam_play_select_menu advanced_record = <advanced_record>
endscript

script process_gem_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 2.0)
	processgemtimes name = <editable_dest> name_fretbar = editable_fretbars offset_time = <offset_time>
endscript

script process_sound_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 2.0)
	processsoundtimes offset_time = <offset_time>
endscript

script setup_jam_song \{difficulty = hard}
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = easy_rhythm)
		<difficulty_real> = easy
	endif
	time_interval = (60000.0 / $jam_current_bpm)
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	i = 1
	begin
	new_fretbar_time = (<last_fretbar_time> + (<time_interval> * <i>))
	casttointeger \{new_fretbar_time}
	addscriptarrayitem name = editable_fretbars integer = <new_fretbar_time>
	<i> = (<i> + 1)
	repeat 12
	copyfinalscriptarray \{sourcename = editable_fretbars
		destname = jamsession_fretbars}
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	process_gem_times editable_dest = <gem_array>
	<count> = (<count> + 1)
	repeat 5
	process_sound_times
	getsonginfo
	jam_copy_in_game_playback_arrays
	switch (<inst>)
		case 0
		source = ($jam_tracks [<playback_track1>].gem_array)
		formattext checksumname = editable_dest 'editable_song_%s' s = <difficulty_text>
		formattext checksumname = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons name = <editable_dest> name_fretbar = editable_fretbars guitar
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		if globalexists \{name = guitar_gem_array
				type = array}
			destroyscriptarray \{name = guitar_gem_array}
		endif
		setplayerinfo 1 jam_instrument = <playback_track1>
		change jam_playback_instrument = <playback_track1>
		set_jam_song_star_sequence {
			output_array = jamsession_expert_star
			editable_array = editable_expert_star
			gem_array = <source>
		}
		case 2
		source = ($jam_tracks [<playback_track2>].gem_array)
		formattext checksumname = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
		formattext checksumname = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = bass
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons name = <editable_dest> name_fretbar = editable_fretbars
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo \{1
			part = bass}
		setplayerinfo 1 jam_instrument = <playback_track2>
		change jam_playback_instrument = <playback_track2>
		set_jam_song_star_sequence {
			output_array = jamsession_rhythm_expert_star
			editable_array = editable_rhythm_expert_star
			gem_array = <source>
		}
		case 3
		source = editable_song_drum_expert
		formattext \{checksumname = editable_dest
			'editable_song_drum_%s'
			s = 'hard'}
		formattext checksumname = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = drum
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processdrumvelocity name = <editable_dest>
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo \{1
			part = drum}
		setplayerinfo \{1
			jam_instrument = 3}
		change \{jam_playback_instrument = 3}
		set_jam_song_star_sequence {
			output_array = jamsession_drum_expert_star
			editable_array = editable_drum_expert_star
			gem_array = <source>
		}
		case 4
		jam_auto_generate_melody_gem_array end_time = <end_time>
		copyfinalscriptarray \{sourcename = editable_song_expert
			destname = jamsession_song_hard}
		setplayerinfo \{1
			part = vocals}
		vocals_distribute_mics
		setplayerinfo \{1
			jam_instrument = 4}
		change \{jam_playback_instrument = 4}
	endswitch
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<songlist> = ($jamsession_songlist_props)
	<song_struct> = (<songlist>.jamsession)
	return <...>
endscript

script setup_jam_song_qp 
	time_interval = (60000.0 / $jam_current_bpm)
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	i = 1
	begin
	new_fretbar_time = (<last_fretbar_time> + (<time_interval> * <i>))
	casttointeger \{new_fretbar_time}
	addscriptarrayitem name = editable_fretbars integer = <new_fretbar_time>
	<i> = (<i> + 1)
	repeat 12
	copyfinalscriptarray \{sourcename = editable_fretbars
		destname = jamsession_fretbars}
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	process_gem_times editable_dest = <gem_array>
	<count> = (<count> + 1)
	repeat 5
	process_sound_times
	jam_copy_in_game_playback_arrays
	getsonginfo
	<i> = 1
	begin
	getplayerinfo <i> difficulty
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = easy_rhythm)
		<difficulty_real> = easy
	endif
	getplayerinfo <i> part
	switch (<part>)
		case guitar
		inst = 0
		case bass
		inst = 2
		case drum
		inst = 3
		case vocals
		inst = 4
		default
		inst = -1
	endswitch
	switch (<inst>)
		case 0
		<blank_guitar> = 0
		if (<playback_track1> = -1)
			<playback_track1> = <inst>
			<blank_guitar> = 1
		endif
		source = ($jam_tracks [<playback_track1>].gem_array)
		formattext checksumname = editable_dest 'editable_song_%s' s = <difficulty_text>
		formattext checksumname = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
		if (<blank_guitar> = 1)
			addnotetrackitem name = <source> time = (<end_time> + 100) length = 0 pattern = 1048576
		endif
		generatediffscriptarray {sourcename = <source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons name = <editable_dest> name_fretbar = editable_fretbars guitar
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		if globalexists \{name = guitar_gem_array
				type = array}
			destroyscriptarray \{name = guitar_gem_array}
		endif
		setplayerinfo <i> jam_instrument = <playback_track1>
		set_jam_song_star_sequence {
			output_array = jamsession_expert_star
			editable_array = editable_expert_star
			gem_array = <source>
		}
		case 2
		<blank_bass> = 0
		if (<playback_track2> = -1)
			<playback_track2> = <inst>
			<blank_bass> = 1
		endif
		source = ($jam_tracks [<playback_track2>].gem_array)
		formattext checksumname = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
		formattext checksumname = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
		if (<blank_bass> = 1)
			addnotetrackitem name = <source> time = (<end_time> + 100) length = 0 pattern = 1048576
		endif
		generatediffscriptarray {sourcename = <source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = bass
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons name = <editable_dest> name_fretbar = editable_fretbars
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo <i> part = bass
		setplayerinfo <i> jam_instrument = <playback_track2>
		set_jam_song_star_sequence {
			output_array = jamsession_rhythm_expert_star
			editable_array = editable_rhythm_expert_star
			gem_array = <source>
		}
		case 3
		source = editable_song_drum_expert
		formattext checksumname = editable_dest 'editable_song_drum_%s' s = <difficulty_text>
		formattext checksumname = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = drum
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processdrumvelocity name = <editable_dest>
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo <i> part = drum
		setplayerinfo <i> jam_instrument = 3
		set_jam_song_star_sequence {
			output_array = jamsession_drum_expert_star
			editable_array = editable_drum_expert_star
			gem_array = <source>
		}
		case 4
		jam_auto_generate_melody_gem_array end_time = <end_time>
		copyfinalscriptarray \{sourcename = editable_song_expert
			destname = jamsession_song_hard}
		setplayerinfo <i> part = vocals
		vocals_distribute_mics
		setplayerinfo <i> jam_instrument = 4
		default
		printf 'error invalid inst %a' a = <inst> channel = jrdebug
	endswitch
	<i> = (<i> + 1)
	repeat <players>
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<songlist> = ($jamsession_songlist_props)
	<song_struct> = (<songlist>.jamsession)
	return <...>
endscript

script change_jamsession_songlist_props_struct \{title = qs(0xab6a4722)
		artist = qs(0x4194c91d)
		year = 2008}
	temp0 = {
		(($jamsession_songlist_props).jamsession)
		title = <title>
		artist = <artist>
		year_num = <year>
	}
	temp1 = {
		jamsession = <temp0>
	}
	change jamsession_songlist_props = <temp1>
endscript

script start_jam_song \{difficulty = hard}
	progression_cashmilestonesclear
	setup_jam_song difficulty = <difficulty> inst = <inst> end_time = <end_time>
	difficulty = <difficulty>
	change structurename = player1_status difficulty = <difficulty>
	change structurename = player2_status difficulty = <difficulty>
	change structurename = player3_status difficulty = <difficulty>
	change structurename = player4_status difficulty = <difficulty>
	change \{game_mode = p1_quickplay}
	killcamanim \{name = jam_view_cam}
	change \{jam_view_cam_created = 0}
	destroy_jam_song_select_menu
	change player1_device = ($primary_controller)
	change structurename = player1_status controller = ($primary_controller)
	create_loading_screen \{jam_mode = 1}
	change \{current_level = load_z_studio}
	getsonginfo
	change_jamsession_songlist_props_struct title = $jam_selected_song artist = <artist>
	i = 1
	begin
	usefourlanehighway {player = <i> reset}
	i = (<i> + 1)
	repeat ($current_num_players)
	resumecontrollerchecking
	change \{sysnotify_paused_controllers = [
		]}
	change \{unknown_drum_type = 0}
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend_menu_music}
	start_song song_name = <song_name> device_num = ($primary_controller) difficulty = <difficulty> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>
	destroy_loading_screen
	generic_event_choose \{state = uistate_gameplay}
endscript

script jam_copy_in_game_playback_arrays 
	formattext \{checksumname = jamsession_dest_in_game
		'jamsession_song_in_game'}
	copyfinalscriptarray sourcename = editable_song_expert destname = <jamsession_dest_in_game>
	formattext \{checksumname = jamsession_dest_in_game
		'jamsession_song_rhythm_in_game'}
	copyfinalscriptarray sourcename = editable_song_rhythm_expert destname = <jamsession_dest_in_game>
	formattext \{checksumname = jamsession_dest_in_game
		'jamsession_song_guitarcoop_in_game'}
	copyfinalscriptarray sourcename = editable_song_guitarcoop_expert destname = <jamsession_dest_in_game>
	formattext \{checksumname = jamsession_dest_in_game
		'jamsession_song_drum_in_game'}
	copyfinalscriptarray sourcename = editable_song_drum_expert destname = <jamsession_dest_in_game>
	formattext \{checksumname = jamsession_dest_in_game
		'jamsession_song_rhythmcoop_in_game'}
	copyfinalscriptarray sourcename = editable_song_rhythmcoop_expert destname = <jamsession_dest_in_game>
endscript
current_jam_camera_prop = none
target_jam_camera_prop = none
jam_camera_changing = 0
jam_view_cam_created = 0
jam_view_cam_morph_time = 0.6

script jam_camera_script \{start_camera = jam_look_at_mixer}
	change current_jam_camera_prop = <start_camera>
	ccam_domorph {
		($jam_camera_props.<start_camera>)
	}
	begin
	if NOT ($current_jam_camera_prop = $target_jam_camera_prop)
		change \{jam_camera_changing = 1}
		local_camera_prop = ($target_jam_camera_prop)
		ccam_domorph {
			($jam_camera_props.<local_camera_prop>)
			time = ($jam_view_cam_morph_time)
			motion = smooth
		}
		ccam_waitmorph
		change current_jam_camera_prop = <local_camera_prop>
		change \{jam_camera_changing = 0}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_camera_wait 
	wait \{2
		gameframe}
	begin
	if ($jam_camera_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_start_song_from_quickplay 
	createscreenelement \{type = spriteelement
		id = bx_hideglitch_bg
		parent = root_window
		texture = main_menu_bg_1
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		dims = (1280.0, 720.0)}
	unload_songqpak
	clearjamsession
	jam_recording_create_editable_arrays
	if (<example_song> = 0)
		change memcard_jamsession_file_name = <filename>
		new_data = {event = menu_replace state = uistate_jam_quickplay_event}
		ui_event_wait event = menu_replace data = {state = uistate_memcard type = load_jam event_params = {<new_data> quickplay_next_song_flow = 1}}
	else
		change jam_selected_song = <filename>
		loadjam file_name = <filename>
		ui_event_wait \{event = menu_replace
			state = uistate_jam_quickplay_event}
	endif
endscript

script jam_quickplay_do_next_song 
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		if screenelementexists \{id = jam_ratesong_dialog}
			destroyscreenelement \{id = jam_ratesong_dialog}
		endif
		ui_memcard_autosave \{state = uistate_setlist}
		return
	endif
	if (($current_song) = jamsession)
		jam_quickplay_get_and_start_song
	else
		change \{songtime_paused = 0}
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
endscript

script jam_quickplay_get_and_start_song 
	<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<filename> = (($jam_song_assets) [<jam_directory_index>].filename)
	else
		<filename> = ($jam_curr_directory_listing [<jam_directory_index>].filename)
	endif
	jam_start_song_from_quickplay filename = <filename> example_song = <example_song>
endscript

script jam_quickplay_save_song_score 
	<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<filename> = (($jam_song_assets) [<jam_directory_index>].filename)
	else
		<filename> = ($jam_curr_directory_listing [<jam_directory_index>].filename)
	endif
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{1
		part}
	getplayerinfo \{1
		score}
	new_score = <score>
	get_difficulty_text_nl difficulty = <difficulty>
	get_formatted_songname_for_jam_mode song_prefix = <filename> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	score = 0
	getglobaltags <songname> params = score noassert = 1
	if (<new_score> > <score>)
		casttointeger \{new_score}
		setglobaltags <songname> params = {score = <new_score>}
	endif
endscript

script ui_memcard_load_jam \{event = menu_replace
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = load_jam event_params = {event = <event> data = <data>}}
endscript
jamsession_max_star_sequences = 6

script set_jam_song_star_sequence 
	appendsuffixtochecksum base = <gem_array> suffixstring = '_size'
	size = ($<appended_id>)
	index = 0
	output_index = 0
	target_time = 30000
	if (<size> >= 2)
		begin
		if (($<gem_array> [<index>]) > <target_time>)
			sub_index = <index>
			notes = 0
			if NOT (<sub_index> < 2)
				begin
				if (<sub_index> < 2)
					break
				endif
				if (($<gem_array> [<sub_index> - 2]) > <target_time> - 3000)
					sub_index = (<sub_index> - 2)
					notes = (<notes> + 1)
				else
					break
				endif
				repeat 10
				start = ($<gem_array> [<sub_index>])
				end = (($<gem_array> [<index> - 2]) - <start>)
				if (<end> > 0)
					printf channel = jam_mode qs(0x7a24e6e4) a = <start> b = <end>
					new_element = [0 0 0]
					setarrayelement arrayname = new_element index = 0 newvalue = <start>
					setarrayelement arrayname = new_element index = 1 newvalue = <end>
					setarrayelement arrayname = new_element index = 2 newvalue = <notes>
					setarrayelement arrayname = <editable_array> globalarray index = <output_index> newvalue = <new_element>
					output_index = (<output_index> + 1)
				endif
			endif
			target_time = (<target_time> + 30000)
		endif
		index = (<index> + 2)
		repeat (<size> / 2)
	endif
	appendsuffixtochecksum base = <editable_array> suffixstring = '_size'
	change globalname = <appended_id> newvalue = ($jamsession_max_star_sequences)
	copyfinalscriptarray sourcename = <editable_array> destname = <output_array>
endscript

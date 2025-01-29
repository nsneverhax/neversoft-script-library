jam_selected_song = qs(0xef150ff7)
jam_selected_song_name = qs(0xef150ff7)
musicstudio_in_studio_playback_jam_index = 0
musicstudio_in_studio_playback_example_song = 0

script musicstudio_update_selected_song_name 
	Change jam_selected_song = <FileName>
	if NOT GotParam \{song_name}
		Change jam_selected_song_name = ($jam_selected_song)
	else
		Change jam_selected_song_name = <song_name>
	endif
	printf channel = musicstudio qs(0xf6cf1bb4) s = ($jam_selected_song_name)
endscript

script create_jam_song_select_menu \{curr_tab = 0
		advanced_record = 0
		show_popup = 0
		to_ghmix_now = 0}
	if (<to_ghmix_now> = 1)
		ui_event_remove_params \{param = to_ghmix_now}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_musicstudio_jamroom_wizard
				curr_tab = 0
				musicstudio_ghmix = 1
				init_style_select = 1
			}}
		return
	endif
	printf \{channel = jam_mode
		qs(0xb3a21306)}
	destroy_band
	load_gempaks
	if NOT (<show_popup> = 1)
		if (<advanced_record> = 0)
			musicstudio_set_ambience \{ambience = jam_room_choose_ambience}
		else
			musicstudio_set_ambience \{ambience = ghmix_choose_ambience}
		endif
	endif
	StartRendering
	if (<show_popup> = 1)
		StopRendering
	endif
	if ($jam_reverb = 0)
		jam_init_reverb
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_song_select_container}
	if (<curr_tab> = 0)
		<line_pos> = (237.0, 510.0)
	else
		<line_pos> = (237.0, 480.0)
	endif
	song_text_params = {Type = TextElement font = fontgrid_text_a1 just = [left center] Scale = 0.8 rgba = [255 255 255 255]}
	song_info_text_params = {Type = TextElement font = fontgrid_title_a1 just = [left center] Scale = 0.35000002 rgba = ($default_color_scheme.text_color)}
	setplayerinfo 1 controller = ($primary_controller)
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_setinstrument instrument = 0
	if (<curr_tab> = 0)
		directorylisting = $jam_curr_directory_listing
		make_generic_menu \{title = qs(0xa38d930d)
			pad_back_script = menu_jam_song_select_back
			vmenu_id = create_my_song_menu
			dims = (400.0, 600.0)
			tags = {
				debug_me
			}
			scrolling
			desc = 'generic_musicstudio_menu'
			$musicstudio_menu_sound_scripts
			pad_back_params = {
				nosound
			}}
		GetArraySize <directorylisting>
		jam_get_num_songs
		if (<user_song_count> < ($jam_max_user_songs))
			if (<advanced_record> = 0)
				add_generic_musicstudio_menu_text_item \{icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_musicstudio_jamroom_wizard
					choose_state_data = {
						curr_tab = 0
						musicstudio_ghmix = 0
						init_style_select = 1
					}
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {
						ambience = create_new_jam_room_choose_ambience
					}}
			elseif (<advanced_record> = 1)
				Change \{jam_current_recording_player = 1}
				setplayerinfo \{1
					jam_instrument = 0}
				add_generic_musicstudio_menu_text_item {
					icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_recording
					choose_state_data = {back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player)}
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
				}
			elseif (<advanced_record> = 2)
				Change \{jam_current_recording_player = 1}
				setplayerinfo \{1
					jam_instrument = 0}
				add_generic_musicstudio_menu_text_item {
					icon = icon_jam_create_new
					text = qs(0x1bca1511)
					pad_choose_script = jam_song_select_load_song
					pad_choose_params = {pattern_load = 1 back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player)}
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
				}
			endif
		else
			add_generic_musicstudio_menu_text_item \{icon = icon_jam_create_new
				text = qs(0x1bca1511)
				pad_choose_script = jam_create_song_failed_dialog
				dialog = 0
				pad_choose_params = {
					dialog = 0
				}
				additional_focus_script = menu_jam_create_song_focus
				additional_unfocus_script = menu_jam_create_song_unfocus
				additional_choose_script = musicstudio_set_ambience
				additional_choose_params = {
					ambience = create_new_ghmix_choose_ambience
				}}
		endif
		has_download_songs = 0
		first_local_song = 0
		if (<array_Size> > 0)
			createscriptarray Name = jam_download_songs size = <array_Size> Heap = quota_misc
			index = 0
			begin
			show_local_song = 1
			if StructureContains structure = (<directorylisting> [<index>]) downloaded
				if ((<directorylisting> [<index>].downloaded) = 1)
					<show_local_song> = 0
					<has_download_songs> = 1
					SetArrayElement ArrayName = jam_download_songs globalarray index = <index> NewValue = 1
				endif
			endif
			if (<show_local_song> = 1)
				if (<first_local_song> = 0)
					if NOT ((<directorylisting> [<index>].song_version) = 0)
						add_generic_musicstudio_menu_text_item \{text = qs(0x322ff13f)
							heading}
						<first_local_song> = 1
					endif
				endif
				SetArrayElement ArrayName = jam_download_songs globalarray index = <index> NewValue = 0
				if NOT ((<directorylisting> [<index>].song_version) = 0)
					add_generic_musicstudio_menu_text_item {
						text = (<directorylisting> [<index>].FileName)
						pad_choose_script = jam_song_select_load_song
						pad_choose_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
						pad_square_script = delete_jam_song_confirm
						pad_square_params = {FileName = (<directorylisting> [<index>].FileName)
							actual_file_name = (<directorylisting> [<index>].actual_file_name)
							advanced_record = <advanced_record>
						}
						additional_choose_script = musicstudio_set_ambience
						additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
					}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
		if (<has_download_songs> = 1)
			if NetSessionFunc \{func = can_view_user_content}
				add_generic_musicstudio_menu_text_item \{text = qs(0xed613e2c)
					heading}
				index = 0
				begin
				if ($jam_download_songs [<index>] = 1)
					add_generic_musicstudio_menu_text_item {
						text = (<directorylisting> [<index>].FileName)
						pad_choose_script = jam_song_select_load_song
						pad_choose_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
						pad_square_script = delete_jam_song_confirm
						pad_square_params = {FileName = (<directorylisting> [<index>].FileName)
							actual_file_name = (<directorylisting> [<index>].actual_file_name)
							advanced_record = <advanced_record>
						}
						additional_choose_script = musicstudio_set_ambience
						additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
					}
				endif
				<index> = (<index> + 1)
				repeat <array_Size>
			endif
		endif
		if GlobalExists \{Name = jam_download_songs
				Type = array}
			printf \{channel = jam_mode
				qs(0xa047b8ba)}
			destroyscriptarray \{Name = jam_download_songs}
		endif
		GetArraySize ($jam_song_assets)
		num_assets = <array_Size>
		add_generic_musicstudio_menu_text_item \{text = qs(0x98e2380b)
			heading}
		index = 0
		begin
		if NOT StructureContains structure = ($jam_song_assets [<index>]) no_qp
			add_generic_musicstudio_menu_text_item {
				text = ($jam_song_assets [<index>].display_name)
				pad_choose_script = jam_song_select_load_song
				pad_choose_params = {index = <index> FileName = ($jam_song_assets [<index>].FileName) advanced_record = <advanced_record> example_song = 1}
				additional_focus_script = menu_jam_create_song_focus
				additional_unfocus_script = menu_jam_create_song_unfocus
				additional_choose_script = musicstudio_set_ambience
				additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
			}
		endif
		<index> = (<index> + 1)
		repeat <num_assets>
	endif
	Change \{jam_band_new_song = 0}
	destroy_jam_song_select_popup
	if (<show_popup> = 1)
		StartRendering
		create_jam_song_select_popup advanced_record = <advanced_record>
	else
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script menu_jam_song_select_back 
	destroy_jam_play_select_menu
	jam_stop_all_sound
	generic_event_back \{nosound}
endscript

script menu_jam_create_song_focus 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script menu_jam_create_song_unfocus 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0x271a1633)
		button = blue
		z = 100}
endscript

script delete_jam_song_confirm 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	formatText TextName = delete_dialog qs(0xa983b69d) s = <FileName>
	create_dialog_box {
		body_text = <delete_dialog>
		options = [
			{
				func = cancel_delete_jam_song
				text = qs(0xf7723015)
				sound_func = musicstudio_menu_music_select
			}
			{
				func = delete_jam_song
				func_params = {<...>}
				text = qs(0x271a1633)
				sound_func = musicstudio_menu_music_select
			}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
endscript

script cancel_delete_jam_song 
	destroy_dialog_box
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0x271a1633)
		button = blue
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script delete_jam_song \{advanced_record = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent \{Type = unfocus
		target = dialog_box_vmenu}
	clean_up_user_control_helpers
	Change memcard_jamsession_file_name = <FileName>
	Change memcard_jamsession_actual_file_name = <actual_file_name>
	ui_memcard_delete_jam event = menu_back data = {state = uistate_jam_select_song advanced_record = <advanced_record> show_popup = 0}
endscript

script destroy_jam_song_select_menu 
	KillSpawnedScript \{Name = create_jam_song_select_menu}
	set_focus_color
	set_unfocus_color
	KillSpawnedScript \{Name = menu_jam_screensaver}
	printf \{qs(0x04b8b2cc)}
	if ScreenElementExists \{id = jam_song_select_container}
		DestroyScreenElement \{id = jam_song_select_container}
	endif
	destroy_jam_play_select_menu
	destroy_generic_menu
	destroy_jam_song_select_popup
	KillSpawnedScript \{id = jam_song_select_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script jam_song_select_load_song \{advanced_record = 0
		example_song = 0
		pattern_load = 0}
	printf \{channel = jam_mode
		qs(0x84934677)}
	musicstudio_toggle_auto_play_all_off
	clearcustomsong
	jam_recording_create_editable_arrays
	musicstudio_create_fretbars
	if (<pattern_load> = 1)
		Change memcard_jamsession_file_name = ($memcard_jamsession_file_name_patterns)
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_musicstudio_jamroom_wizard
				curr_tab = 0
				musicstudio_ghmix = 1
				init_style_select = 1
			}}
		return
	endif
	if (<example_song> = 0)
		directorylisting = ($jam_curr_directory_listing)
		year = (<directorylisting> [<index>].year)
	else
		year = 2010
	endif
	change_jamsession_songlist_props_struct year = <year>
	Change musicstudio_in_studio_playback_jam_index = <index>
	Change musicstudio_in_studio_playback_example_song = <example_song>
	if NOT (<example_song> = 1)
		Change memcard_jamsession_file_name = <FileName>
		Change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
		musicstudio_update_selected_song_name FileName = <FileName>
		ui_memcard_load_jam event = menu_back data = {show_popup = 1 example_song = <example_song>}
	else
		create_loading_screen
		Wait \{2
			gameframes}
		loadjam file_name = <FileName>
		musicstudio_update_selected_song_name FileName = <FileName> song_name = ($jam_song_assets [<index>].display_name)
		create_jam_song_select_popup advanced_record = <advanced_record>
		destroy_loading_screen
	endif
endscript

script create_jam_song_select_popup \{advanced_record = 0}
	StopRendering
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	getsonginfo
	editable = 1
	if (<downloaded> = 1)
		<editable> = 0
	elseif (<example_song> = 1)
		<editable> = 0
	endif
	destroy_generic_menu
	if (<editable> = 1)
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0x03ac90f0)
			body_text = qs(0x03ac90f0)
			player_device = <player_device>
			options = [
				{
					func = jam_popup_play_song
					func_params = {advanced_record = <advanced_record>}
					text = qs(0x56fbf662)
					sound_func = musicstudio_menu_music_select
				}
				{
					func = jam_popup_edit_song
					func_params = {advanced_record = <advanced_record>}
					text = qs(0x42474b0a)
					sound_func = musicstudio_menu_music_final_select
				}
				{
					func = jam_popup_publish_song
					func_params = {FileName = ($jam_selected_song)}
					text = qs(0x44f29f0d)
					sound_func = musicstudio_menu_music_final_select
				}
				{
					func = jam_popup_preview_song
					func_params = {FileName = ($jam_selected_song) advanced_record = <advanced_record>}
					text = qs(0x1cb59b1e)
					sound_func = musicstudio_menu_music_select
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
			$musicstudio_menu_sound_scripts
		}
	else
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0x03ac90f0)
			body_text = qs(0x03ac90f0)
			player_device = <player_device>
			options = [
				{
					func = jam_popup_play_song
					func_params = {<...>}
					text = qs(0x56fbf662)
					sound_func = musicstudio_menu_music_select
				}
				{
					func = jam_popup_preview_song
					func_params = {FileName = ($jam_selected_song) advanced_record = <advanced_record>}
					text = qs(0x1cb59b1e)
					sound_func = musicstudio_menu_music_select
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
			$musicstudio_menu_sound_scripts
		}
	endif
	event_handlers = [
		{pad_up musicstudio_menu_music_scroll}
		{pad_down musicstudio_menu_music_scroll}
	]
	dialog_box_vmenu :se_setprops event_handlers = <event_handlers>
	create_loading_screen
	Wait \{2
		gameframes}
	musicstudio_initialize_song
	destroy_loading_screen
	if ScreenElementExists \{id = dialog_box_vmenu}
		dialog_box_vmenu :se_setprops \{block_events}
	endif
	player_device = ($primary_controller)
	CreateScreenElement \{Type = SpriteElement
		parent = dialog_box_container
		texture = default_band_logo
		just = [
			left
			center
		]
		rgba = [
			255
			255
			255
			250
		]
		Pos = (380.0, 335.0)
		dims = (135.0, 135.0)
		z_priority = 100000}
	CreateScreenElement \{Type = TextBlockElement
		parent = dialog_box_container
		font = fontgrid_title_a1
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		Scale = 1
		rgba = [
			15
			15
			15
			250
		]
		Pos = (643.0, 206.0)
		dims = (255.0, 50.0)
		text = qs(0x92f7b72f)
		z_priority = 100000
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original}
	create_jam_song_info_text parent = dialog_box_container column_offset = 0 rgba = [180 180 180 250] FileName = ($jam_selected_song_name)
	if ScreenElementExists \{id = dialog_box_vmenu}
		dialog_box_vmenu :se_setprops \{unblock_events}
		dialog_box_vmenu :menu_changeselection
		dialog_box_vmenu :menu_changeselection \{up}
	endif
	StartRendering
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script musicstudio_initialize_song 
	getsonginfo
	Change jam_current_bpm = <bpm>
	Change jam_current_tuning = <tuning>
	GetArraySize \{$drum_kits}
	printf channel = jam_mode qs(0xdf0adb60) s = <drum_kit>
	if ((<drum_kit> >= <array_Size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	Change jam_current_drum_kit = <drum_kit>
	Change jam_current_percussion_kit = <percussion_kit>
	loaddrumkitall \{async = 0}
	musicstudio_instrument_loadall
	if GotParam \{bass_kit}
		Change bass_kit_mode = <bass_kit>
		loadbasskit bass_kit = <bass_kit>
	else
		setsonginfo \{bass_kit = 0}
		Change \{bass_kit_mode = 0}
	endif
	musicstudio_init_volumes
	musicstudio_init_pan
	jam_init_scales
	Change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
		]}
	jam_load_scale
	jam_load_effect
	musicstudio_init_all_line6_effects
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
	track_count = 0
	last_end_time = 0
	all_tracks = 1
	begin
	gettracksize track = ($jam_tracks [<track_count>].id)
	if (<track_size> > 0)
		getcustomnote track = ($jam_tracks [<track_count>].id) index = (<track_size> - 1)
		if (<note_time> > <last_end_time>)
			<last_end_time> = <note_time>
		endif
		formatText TextName = note_count qs(0xd7ee902f) a = ($jam_tracks [<track_count>].name_text) b = <track_size> s = qs(0x42c9738e)
		formatText TextName = tracks_recorded_text qs(0xdc07585f) s = <tracks_recorded_text> a = ($jam_tracks [<track_count>].name_text)
		SetArrayElement ArrayName = note_count_text index = <track_count> NewValue = <note_count>
	else
		formatText TextName = note_count qs(0x5e97b9d2) a = ($jam_tracks [<track_count>].name_text) s = qs(0x71d71562)
		SetArrayElement ArrayName = note_count_text index = <track_count> NewValue = <note_count>
		all_tracks = 0
	endif
	<track_count> = (<track_count> + 1)
	repeat 5
	if (<tracks_recorded_text> = qs(0x00000000))
		formatText \{TextName = tracks_recorded_text
			qs(0xf36d10c8)}
	endif
	if (<all_tracks> = 1)
		formatText \{TextName = tracks_recorded_text
			qs(0x711df7be)}
	endif
	Mod a = <last_end_time> b = 60000
	<Seconds> = (<Mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<Seconds> / 10)
	if (<sec_check> < 1)
		formatText TextName = length_text qs(0x6b8769fa) a = <minutes> b = <Seconds>
	else
		formatText TextName = length_text qs(0x830308cc) a = <minutes> b = <Seconds>
	endif
	gettrackinfo \{track = rhythm}
	formatText TextName = bpm_text qs(0x21072c11) a = <bpm>
	getsonginfo
	GetArraySize \{$jam_genre_list}
	if (<genre> < 0 || <genre> >= <array_Size>)
		formatText TextName = genre_text qs(0xd0ef7f05) a = <genre>
	else
		formatText TextName = genre_text qs(0x4d3a8435) a = ($jam_genre_list [<genre>].name_text)
	endif
	if (<artist> = qs(0x00000000))
		<artist> = qs(0x2dc91c7c)
	endif
	if ScreenElementExists \{id = song_preview_element}
		platform_prefix = qs(0x03ac90f0)
		if isXenon
			<platform_prefix> = qs(0x035582ab)
		elseif isps3
			<platform_prefix> = qs(0xcb8c08a3)
		else
			<platform_prefix> = qs(0x84cd9e64)
		endif
		if ((<file_id>.file_id [0]) = 0)
			formatText TextName = file_id_text qs(0xd6df1a7a) a = (<file_id>.file_id [1]) p = <platform_prefix>
		else
			formatText TextName = file_id_text qs(0xb05112d6) a = (<file_id>.file_id [1]) b = (<file_id>.file_id [0]) p = <platform_prefix>
		endif
		if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
			file_id_text = qs(0x03ac90f0)
		endif
		if NOT (<num_ratings> = 0)
			formatText TextName = ratings_text qs(0x90047b5d) a = <num_ratings>
		else
			ratings_text = qs(0x03ac90f0)
		endif
		song_preview_element :se_setprops {
			song_name_text = <FileName>
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
		if (<genre> < 0 || <genre> >= <array_Size>)
			formatText TextName = length_text qs(0xe3cd7faf) s = <length_text> b = qs(0xd0ef7f05)
		else
			formatText TextName = length_text qs(0xe3cd7faf) s = <length_text> b = ($jam_genre_list [<genre>].name_text)
		endif
		CreateScreenElement {
			parent = <parent>
			Type = descinterface
			desc = 'jam_song_info_text'
			Pos = (1200.0, 618.0)
			Scale = 1.0
			song_name_text = <FileName>
			artist_name_text = <artist>
			tracks_recorded_text = <tracks_recorded_text>
			song_length_text = <length_text>
			bpm_text = <bpm_text>
			genre_text = <genre_text>
			z_priority = 100000
			autosizedims = true
		}
	endif
	return song_length = <last_end_time>
endscript

script jam_song_options_select_back \{advanced_record = 0}
	musicstudio_menu_music_back
	jamsession_unload \{song_prefix = 'editable'}
	clearcustomsong
	ui_event event = menu_back data = {no_sound show_popup = 0 advanced_record = <advanced_record> <...>}
endscript

script destroy_jam_song_select_popup 
	destroy_dialog_box
endscript

script jam_popup_play_song 
	getcontrollertype controller = ($primary_controller)
	if (<controller_type> != guitar && <controller_type> != drum)
		data = {practice = 0}
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	jam_recording_create_jamsession_arrays
	song_prefix = 'editable'
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	formatText checksumName = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	jamsession_copymarkerarrays \{song = editable}
	jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	create_jam_play_select_menu <...> advanced_record = <advanced_record>
endscript

script jam_popup_preview_song 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	destroy_dialog_box
	destroy_jam_song_select_menu
	create_song_preview_menu FileName = ($jam_selected_song_name) song_select = 1 advanced_record = <advanced_record>
endscript

script jam_popup_preview_song_go_back 
	create_jam_song_select_popup advanced_record = <advanced_record>
endscript

script jam_popup_edit_song \{advanced_record = 0}
	printf \{channel = jam_mode
		qs(0xb17f9063)}
	printf channel = jam_mode qs(0x169e2126) s = ($jam_selected_song) a = <advanced_record>
	if (<advanced_record> = 0)
		generic_event_choose no_sound state = uistate_jam_band data = {editing = 1 advanced_record = <advanced_record>}
	elseif (<advanced_record> = 1)
		Change \{jam_current_recording_player = 1}
		setplayerinfo \{1
			jam_instrument = 0}
		generic_event_choose no_sound state = uistate_recording data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 Player = ($jam_current_recording_player)}
	elseif (<advanced_record> = 2)
		Change \{jam_current_recording_player = 1}
		setplayerinfo \{1
			jam_instrument = 0}
		generic_event_choose no_sound state = uistate_musicstudio_ghmix data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 Player = ($jam_current_recording_player)}
	endif
endscript

script jam_popup_publish_song 
	printf \{channel = jam_mode
		qs(0x2b876e21)}
	getsonginfo
	printf channel = jam_mode qs(0xe2e069d2) a = <genre> b = <song_version>
	generic_event_choose no_sound state = uistate_jam_publish_song data = {FileName = <FileName> newfilename = <FileName> new_genre = <genre>}
endscript

script create_jam_play_select_menu 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	destroy_dialog_box
	destroy_jam_song_select_menu
	make_generic_menu {
		title = qs(0x81bf948c)
		pad_back_script = jam_play_select_menu_go_back
		pad_back_params = {advanced_record = <advanced_record> <...>}
		menu_id = jam_play_select_menu
		vmenu_id = jam_play_select_vmenu
		dims = (400.0, 300.0)
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
	}
	getsonginfo
	if IsGuitarController \{controller = $primary_controller}
		if (<playback_track1> < 0 && <playback_track2> < 0)
			<txt> = qs(0xf0d9901a)
			add_generic_musicstudio_menu_text_item {
				text = <txt>
				pad_choose_script = jam_play_select_menu_go_back
			}
		else
			add_generic_musicstudio_menu_text_item \{text = qs(0x9aa23e37)
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {
					inst = 0
				}}
			add_generic_musicstudio_menu_text_item \{text = qs(0xa04da847)
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {
					inst = 2
				}}
		endif
	elseif isdrumcontroller \{controller = $primary_controller}
		if (<playback_track_drums> < 0)
			add_generic_musicstudio_menu_text_item \{text = qs(0x98800cc9)
				pad_choose_script = start_jam_song
				pad_choose_params = {
					difficulty = beginner
					inst = 3
				}
				pad_choose_sound = musicstudio_menu_music_final_select}
		else
			add_generic_musicstudio_menu_text_item \{text = qs(0xfa92fd5e)
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {
					inst = 3
				}}
		endif
	else
		add_generic_musicstudio_menu_text_item \{text = qs(0xe08354bc)
			pad_choose_script = start_jam_song_check_vocals
			pad_choose_params = {
				callback = start_jam_song
				callback_params = {
					difficulty = beginner
					inst = 4
				}
			}
			pad_choose_sound = musicstudio_menu_music_final_select}
	endif
	LaunchEvent \{Type = focus
		target = jam_play_select_vmenu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 110}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 110}
endscript

script start_jam_song_check_vocals 
	if ScreenElementExists \{id = jam_play_select_vmenu}
		jam_play_select_vmenu :se_setprops \{block_events}
	endif
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		part = vocals}
	vocals_distribute_mics \{allow_default_headset}
	if jam_vocals_is_invalid
		return
	endif
	SpawnScriptNow <callback> params = {<callback_params> device_num = <device_num>}
endscript

script jam_vocals_is_invalid 
	get_num_mics_plugged_in
	getplayerinfo \{1
		mic_type}
	if (<num_mics_plugged_in> = 0 || <mic_type> = None)
		if isxenonorwindx
			text = qs(0xec4dbd17)
		else
			text = qs(0x588788f4)
		endif
		create_dialog_box {
			no_background
			heading_text = qs(0xaa163738)
			body_text = <text>
			options = [
				{
					func = ui_event
					func_params = {event = menu_refresh}
					text = qs(0x0e41fe46)
				}
			]
		}
		return \{true}
	endif
	return \{FALSE}
endscript

script destroy_jam_play_select_menu 
	if ScreenElementExists \{id = jam_play_select_menu}
		DestroyScreenElement \{id = jam_play_select_menu}
	endif
endscript

script jam_play_select_menu_go_back 
	destroy_jam_play_select_menu
	destroy_dialog_box
	create_jam_song_select_popup <...>
endscript

script jam_create_song_failed_dialog \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText \{TextName = dialog
			qs(0x17581596)
			s = $jam_max_user_songs}
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0x18965bea)
		body_text = <dialog>
		options = [
			{
				func = jam_create_song_failed_go_back
				text = qs(0x320a8d1c)
				sound_func = musicstudio_menu_music_back
			}
		]
	}
endscript

script jam_create_song_failed_go_back 
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script create_jam_difficulty_select_menu 
	destroy_jam_play_select_menu
	destroy_dialog_box
	curr_default_difficulty = ($default_difficulty [$primary_controller])
	focus_index = 0
	if GotParam \{curr_default_difficulty}
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
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
	}
	add_generic_musicstudio_menu_text_item {
		text = qs(0x74d6a0a0)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = beginner inst = <inst>}
		pad_choose_sound = musicstudio_menu_music_final_select
	}
	add_generic_musicstudio_menu_text_item {
		text = qs(0x8d657387)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = easy inst = <inst>}
		pad_choose_sound = musicstudio_menu_music_final_select
	}
	add_generic_musicstudio_menu_text_item {
		text = qs(0x6ef11a01)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = medium inst = <inst>}
		pad_choose_sound = musicstudio_menu_music_final_select
	}
	add_generic_musicstudio_menu_text_item {
		text = qs(0x51b06d2f)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = hard inst = <inst>}
		pad_choose_sound = musicstudio_menu_music_final_select
	}
	add_generic_musicstudio_menu_text_item {
		text = qs(0x334908ac)
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = expert inst = <inst>}
		pad_choose_sound = musicstudio_menu_music_final_select
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent Type = focus target = jam_difficulty_select_vmenu data = {child_index = <focus_index>}
endscript

script jam_difficulty_select_go_back 
	destroy_dialog_box
	destroy_jam_play_select_menu
	if ScreenElementExists \{id = jam_difficulty_select_menu}
		DestroyScreenElement \{id = jam_difficulty_select_menu}
	endif
	create_jam_play_select_menu advanced_record = <advanced_record>
endscript

script change_jamsession_songlist_props_struct \{title = qs(0xab6a4722)
		artist = qs(0x4194c91d)
		year = 2009}
	temp0 = {
		(($jamsession_songlist_props).jamsession)
		title = <title>
		artist = <artist>
		year_num = <year>
	}
	temp1 = {
		jamsession = <temp0>
	}
	Change jamsession_songlist_props = <temp1>
endscript

script start_jam_song \{difficulty = hard}
	destroy_generic_menu
	create_loading_screen
	musicstudio_stop_menu_music
	begin
	if NOT issoundplaying \{jm_menu_finalselect}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	unload_musicstudio_previews
	load_musicstudio_gameplay_sfx
	difficulty = <difficulty>
	setplayerinfo 1 difficulty = <difficulty>
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		Band = 1}
	setplayerinfo 2 difficulty = <difficulty>
	setplayerinfo 3 difficulty = <difficulty>
	setplayerinfo 4 difficulty = <difficulty>
	Change \{game_mode = quickplay}
	switch <inst>
		case 0
		case 1
		setplayerinfo \{1
			part = guitar}
		setplayerinfo \{1
			stored_part = guitar}
		case 2
		setplayerinfo \{1
			part = bass}
		setplayerinfo \{1
			stored_part = bass}
		case 3
		setplayerinfo \{1
			part = drum}
		setplayerinfo \{1
			stored_part = drum}
		case 4
		case 5
		setplayerinfo \{1
			part = vocals}
		setplayerinfo \{1
			stored_part = vocals}
	endswitch
	musicstudio_setup_custom_song
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	destroy_jam_song_select_menu
	setplayerinfo 1 controller = ($primary_controller)
	Change \{current_level = load_z_studio}
	getsonginfo
	change_jamsession_songlist_props_struct title = ($jam_selected_song_name) artist = <artist>
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		usefourlanehighway {Player = <Player> reset}
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	ResumeControllerChecking
	clear_paused_controllers
	Change \{unknown_drum_type = 0}
	if musicstudio_mainobj :musicstudio_isinmusicstudio
		if NOT ($current_level = load_z_visualizer)
			Change \{current_level = load_z_visualizer}
			Load_Venue \{block_scripts = 0}
		endif
	endif
	start_song song_name = <song_name> device_num = ($primary_controller) difficulty = <difficulty> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>
	destroy_loading_screen
	generic_event_choose \{state = Uistate_gameplay}
endscript

script jam_copy_in_game_playback_arrays 
	formatText \{checksumName = jamsession_dest_in_game
		'jamsession_song_in_game'}
	copyfinalscriptarray sourcename = editable_song_expert destname = <jamsession_dest_in_game>
	formatText \{checksumName = jamsession_dest_in_game
		'jamsession_song_rhythm_in_game'}
	copyfinalscriptarray sourcename = editable_song_rhythm_expert destname = <jamsession_dest_in_game>
	formatText \{checksumName = jamsession_dest_in_game
		'jamsession_song_guitarcoop_in_game'}
	copyfinalscriptarray sourcename = editable_song_guitarcoop_expert destname = <jamsession_dest_in_game>
	formatText \{checksumName = jamsession_dest_in_game
		'jamsession_song_drum_in_game'}
	copyfinalscriptarray sourcename = editable_song_drum_expert destname = <jamsession_dest_in_game>
	formatText \{checksumName = jamsession_dest_in_game
		'jamsession_song_rhythmcoop_in_game'}
	copyfinalscriptarray sourcename = editable_song_rhythmcoop_expert destname = <jamsession_dest_in_game>
endscript
current_jam_camera_prop = None
target_jam_camera_prop = None
jam_camera_changing = 0
jam_view_cam_created = 0
jam_view_cam_morph_time = 0.6

script jam_camera_script \{start_camera = jam_look_at_mixer}
	return
endscript

script jam_camera_wait 
	printf \{qs(0xaea213d4)}
	return
	Wait \{2
		gameframe}
	begin
	if ($jam_camera_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_quickplay_do_next_song \{is_definitely_last_song = 1}
	if (<is_definitely_last_song> = 1)
		if playlist_isfinished
			if ScreenElementExists \{id = jam_ratesong_dialog}
				DestroyScreenElement \{id = jam_ratesong_dialog}
			endif
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
			ui_event \{event = menu_back
				data = {
					state = uistate_songlist
				}}
			return
		endif
	endif
	Change \{songtime_paused = 0}
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
endscript

script jam_quickplay_get_and_start_song 
	get_jam_filename \{Type = current}
	play_song_start_song_from_quickplay {
		is_jam = 1
		loading_transition = 0
		FileName = <FileName>
		example_song = <example_song>
		jam_display_name = <jam_display_name>
		show_mainmenu_bg = <show_mainmenu_bg>
	}
endscript

script ui_memcard_load_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {Type = load_jam event_params = {event = <event> data = <data>}}
endscript

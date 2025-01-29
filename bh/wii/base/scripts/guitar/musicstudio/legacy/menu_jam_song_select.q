jam_selected_song = $wii_jam_custom_song
jam_selected_song_name = $wii_jam_custom_song
0xd39bb588 = 0

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
	if NOT ViewportExists \{id = bg_viewport}
		destroy_bg_viewport
		setup_bg_viewport
	endif
	if NOT (<show_popup> = 1)
		if (<advanced_record> = 0)
			musicstudio_set_ambience \{ambience = jam_room_choose_ambience}
		else
			musicstudio_set_ambience \{ambience = ghmix_choose_ambience}
		endif
	endif
	destroy_loading_screen
	StartRendering
	if ($jam_reverb = 0)
		jam_init_reverb
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_song_select_container}
	if (<show_popup> = 1)
		create_jam_song_select_popup advanced_record = <advanced_record>
		return
	endif
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
	0xb5e042e0
	if (<curr_tab> = 0)
		directorylisting = $jam_curr_directory_listing
		make_generic_menu \{title = qs(0xa38d930d)
			pad_choose_script = 0x4280f060
			pad_choose_params = {
				func = menu_jam_song_select_back
			}
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
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
				}
			elseif (<advanced_record> = 2)
				Change \{jam_current_recording_player = 1}
				setplayerinfo \{1
					jam_instrument = 0}
				add_generic_musicstudio_menu_text_item \{icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_musicstudio_jamroom_wizard
					choose_state_data = {
						curr_tab = 0
						musicstudio_ghmix = 1
						init_style_select = 1
					}
					additional_focus_script = menu_jam_create_song_focus
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {
						ambience = create_new_ghmix_choose_ambience
					}}
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
				additional_choose_script = musicstudio_set_ambience
				additional_choose_params = {
					ambience = create_new_ghmix_choose_ambience
				}}
		endif
		has_download_songs = 0
		first_local_song = 0
		if (<array_Size> > 0)
			createscriptarray Name = jam_download_songs size = <array_Size> Heap = quota_song
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
				if ($enable_loading = 0)
					add_generic_menu_text_item {
						text = (<directorylisting> [<index>].FileName)
						not_focusable
					}
				else
					if NOT ((<directorylisting> [<index>].song_version) = 0)
						add_generic_musicstudio_menu_text_item {
							text = (<directorylisting> [<index>].FileName)
							pad_choose_script = 0x4280f060
							pad_choose_params = {func = jam_song_select_load_song index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
							pad_square_script = delete_jam_song_confirm
							pad_square_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
							additional_focus_script = 0x8505e339
							additional_choose_script = musicstudio_set_ambience
							additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
						}
					endif
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
						pad_choose_script = 0x4280f060
						pad_choose_params = {func = jam_song_select_load_song index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
						pad_square_script = delete_jam_song_confirm
						pad_square_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
						additional_focus_script = 0x8505e339
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
		if (<num_assets> > 0)
			begin
			if NOT StructureContains structure = ($jam_song_assets [<index>]) no_qp
				add_generic_musicstudio_menu_text_item {
					text = ($jam_song_assets [<index>].display_name)
					pad_choose_script = 0x4280f060
					pad_choose_params = {func = jam_song_select_load_song index = <index> FileName = ($jam_song_assets [<index>].FileName) advanced_record = <advanced_record> example_song = 1}
					additional_focus_script = menu_jam_create_song_focus
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
				}
			endif
			<index> = (<index> + 1)
			repeat <num_assets>
		endif
	endif
	Change \{jam_band_new_song = 0}
	destroy_jam_song_select_popup
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script menu_jam_screensaver 
	CreateScreenElement {
		parent = <window_id>
		Type = SpriteElement
		texture = load_record
		rgba = [200 200 200 255]
		dims = (20.0, 20.0)
		Scale = 10
		alpha = 1
		Pos = (320.0, 135.0)
		z_priority = 1000
		alpha = 0
	}
	if NOT GotParam \{no_fade}
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
	CreateScreenElement {
		Type = TextBlockElement
		parent = <window_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = [150 150 150 255]
		Pos = (320.0, 135.0)
		dims = (170.0, 40.0)
		text = qs(0x37f4c584)
		z_priority = 1000
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	time_between = 0.1
	loading_text_base = qs(0xabf4f150)
	period_array = [qs(0x00000000) qs(0xefb47879) qs(0xab24dd29) qs(0xb723938a)]
	count = 0
	begin
	formatText TextName = loading_text qs(0xeef7df84) s = <loading_text_base> a = (<period_array> [<count>])
	<id> :SetProps text = <loading_text>
	Wait <time_between> Seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script menu_jam_song_select_back 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
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

script 0x8505e339 
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
		z = 10000}
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
	Change memcard_jamsession_actual_file_name = ($jam_curr_directory_listing [<index>].actual_file_name)
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
	jam_destroy_tutorial_menu
	KillSpawnedScript \{id = jam_song_select_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script jam_song_select_load_song \{advanced_record = 0
		example_song = 0
		pattern_load = 0}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	printf \{channel = jam_mode
		qs(0x84934677)}
	musicstudio_toggle_auto_play_all_off
	clearcustomsong
	jam_recording_create_editable_arrays
	musicstudio_create_fretbars
	if (<pattern_load> = 1)
		Change memcard_jamsession_file_name = ($memcard_jamsession_file_name_patterns)
		ui_memcard_load_jam event = menu_back data = {show_popup = 0 to_ghmix_now = 1 example_song = <example_song>}
		return
	endif
	if (<example_song> = 0)
		directorylisting = ($jam_curr_directory_listing)
		year = (<directorylisting> [<index>].year)
	else
		year = 2009
	endif
	change_jamsession_songlist_props_struct year = <year>
	clean_up_user_control_helpers
	if NOT (<example_song> = 1)
		Change memcard_jamsession_file_name = <FileName>
		Change memcard_jamsession_actual_file_name = ($jam_curr_directory_listing [<index>].actual_file_name)
		musicstudio_update_selected_song_name FileName = <FileName>
		ui_memcard_load_jam event = menu_back data = {show_popup = 1 example_song = <example_song>}
	else
		create_loading_screen \{no_background = 1}
		loadjam file_name = <FileName>
		musicstudio_update_selected_song_name FileName = <FileName> song_name = ($jam_song_assets [<index>].display_name)
		create_jam_song_select_popup advanced_record = <advanced_record>
		destroy_loading_screen
	endif
endscript

script create_jam_song_select_popup \{advanced_record = 0}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	begin
	savegame_get_ui_id \{savegame = 0}
	if NOT ScreenElementExists id = <ui_id>
		break
	endif
	WaitOneGameFrame
	repeat
	create_loading_screen \{no_background = 1}
	destroy_generic_menu
	getsonginfo
	musicstudio_initialize_song
	destroy_loading_screen
	StartRendering
	editable = 1
	if (<downloaded> = 1)
		<editable> = 0
	elseif (<example_song> = 1)
		<editable> = 0
	endif
	0xb5e042e0
	if (<editable> = 1)
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0x00000000)
			body_text = qs(0x00000000)
			player_device = <player_device>
			no_controller_helper
			options = [
				{
					func = 0x4280f060
					func_params = {func = jam_popup_play_song advanced_record = <advanced_record>}
					text = qs(0x56fbf662)
					sound_func = musicstudio_menu_music_select
				}
				{
					func = 0x4280f060
					func_params = {func = jam_popup_edit_song advanced_record = <advanced_record>}
					text = qs(0x42474b0a)
					sound_func = musicstudio_menu_music_final_select
				}
				{
					func = 0x4280f060
					func_params = {func = jam_popup_publish_song FileName = ($jam_selected_song)}
					text = qs(0x44f29f0d)
					sound_func = musicstudio_menu_music_final_select
				}
				{
					func = 0x4280f060
					func_params = {func = jam_popup_preview_song FileName = ($jam_selected_song) advanced_record = <advanced_record>}
					text = qs(0x1cb59b1e)
					sound_func = musicstudio_menu_music_select
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
			$musicstudio_menu_sound_scripts
		}
		<menu_id> :se_setprops Pos = {(0.0, -20.0) relative}
	else
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0x00000000)
			body_text = qs(0x00000000)
			player_device = <player_device>
			no_controller_helper
			options = [
				{
					func = 0x4280f060
					func_params = {func = jam_popup_play_song advanced_record = <advanced_record>}
					text = qs(0x56fbf662)
					sound_func = musicstudio_menu_music_select
				}
				{
					func = 0x4280f060
					func_params = {func = jam_popup_preview_song FileName = ($jam_selected_song) advanced_record = <advanced_record>}
					text = qs(0x1cb59b1e)
					sound_func = musicstudio_menu_music_select
				}
			]
			back_button_script = 0x4280f060
			back_button_params = {func = jam_song_options_select_back advanced_record = <advanced_record>}
			$musicstudio_menu_sound_scripts
		}
	endif
	event_handlers = [
		{pad_up musicstudio_menu_music_scroll}
		{pad_down musicstudio_menu_music_scroll}
	]
	if ScreenElementExists id = <menu_id>
		<menu_id> :se_setprops event_handlers = <event_handlers>
	else
		SoftAssert qs(0x5a193f2a) m = <menu_id>
	endif
	player_device = ($primary_controller)
	cas_update_band_logo \{album_art}
	PushAssetContext context = ($cas_band_logo_details.AssetContext)
	if isngc
		texture = default_band_logo
	else
		texture = ($cas_band_logo_details.textureasset)
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = dialog_box_container
		texture = <texture>
		just = [left center]
		rgba = [255 255 255 250]
		Pos = (355.0, 306.0)
		dims = (160.0, 160.0)
		z_priority = 1000
	}
	PopAssetContext
	create_jam_song_info_text parent = dialog_box_container column_offset = 0 rgba = [180 180 180 250] FileName = ($jam_selected_song_name)
	LaunchEvent Type = focus target = <menu_id>
endscript

script 0xb5e042e0 
	Change \{0xd39bb588 = 0}
endscript

script 0x4280f060 
	RequireParams \{[
			func
		]
		all}
	printf \{'jam_prevent_button_mash'
		channel = 0xeb05fdc5}
	if ($0xd39bb588 = 1)
		return
	endif
	Change \{0xd39bb588 = 1}
	<func> <...>
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
	loaddrumkitall \{async = 0
		heap_drums = quota_drums
		heap_percussion = quota_percussion}
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
			Pos = (280.0, 140.0)
			Scale = 1.0
			song_name_text = <FileName>
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
	musicstudio_menu_music_back
	jamsession_unload \{song_prefix = 'editable'}
	clearcustomsong
	ui_event event = menu_back data = {no_sound show_popup = 0 advanced_record = <advanced_record> <...>}
endscript

script destroy_jam_song_select_popup 
	destroy_dialog_box
endscript

script jam_popup_play_song 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
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
		current_menu :se_setprops \{block_events}
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
	if notetracker_is_using_stream
		add_generic_musicstudio_menu_text_item \{text = qs(0x1439e8f9)
			pad_choose_script = start_jam_song_check_vocals
			pad_choose_params = {
				callback = create_jam_difficulty_select_menu
				callback_params = {
					inst = 5
				}
			}}
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
			text = qs(0x8f72ec73)
		endif
		create_dialog_box {
			no_background
			heading_text = qs(0xaa163738)
			body_text = <text>
			options = [
				{
					func = ui_event
					func_params = {event = menu_refresh}
					text = qs(0x320a8d1c)
				}
			]
		}
		return \{true}
	endif
	return \{FALSE}
endscript

script add_jam_play_select_option \{playback_track = 0
		instrument = 0}
	gettracksize track = ($jam_tracks [<playback_track>].id)
	if (<track_size> > 0)
		getcustomnote track = ($jam_tracks [<playback_track>].id) index = (<track_size> - 1)
		get_minutes_and_seconds_text time = <note_time>
		formatText TextName = play_text qs(0x29f9736b) s = ($jam_tracks [<jam_instrument>].name_text) a = ($jam_tracks [<playback_track>].name_text) b = <minutes_and_seconds_text>
		add_generic_musicstudio_menu_text_item {
			text = <play_text>
			pad_choose_script = create_jam_difficulty_select_menu
			pad_choose_params = {inst = <jam_instrument> advanced_record = <advanced_record>}
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
	StopRendering
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
		template = large_body
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

script jam_auto_generate_guitar_gem_array 
	rhythm_gem_array = ($jam_tracks [0].gem_array)
	lead_gem_array = ($jam_tracks [1].gem_array)
	AppendSuffixToChecksum Base = <rhythm_gem_array> SuffixString = '_size'
	rhythm_array_size = <appended_id>
	AppendSuffixToChecksum Base = <lead_gem_array> SuffixString = '_size'
	lead_array_size = <appended_id>
	formatText \{checksumName = guitar_gem_array
		'guitar_gem_array'}
	if GlobalExists Name = <guitar_gem_array> Type = array
		destroyscriptarray Name = <guitar_gem_array>
	endif
	createscriptarray Name = <guitar_gem_array> size = (($gemarraysize) * 4) Heap = quota_song <...>
	AppendSuffixToChecksum Base = <guitar_gem_array> SuffixString = '_size'
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
	getnotetrackitem Name = <rhythm_gem_array> index = <rhythm_index>
	rhythm_gem_time = <gem_time>
	rhythm_gem_length = <gem_length>
	rhythm_gem_pattern = <gem_pattern>
	getnotetrackitem Name = <lead_gem_array> index = <lead_index>
	lead_gem_time = <gem_time>
	lead_gem_length = <gem_length>
	lead_gem_pattern = <gem_pattern>
	lead_note_end = (<lead_gem_time> + <lead_gem_length>)
	rhythm_note_end = (<rhythm_gem_time> + <rhythm_gem_length>)
	rhythm_measure = (<rhythm_gem_time> / <measure_quantize>)
	lead_measure = (<lead_gem_time> / <measure_quantize>)
	CastToInteger \{rhythm_measure}
	CastToInteger \{lead_measure}
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
		addnotetrackitem Name = <guitar_gem_array> time = <rhythm_gem_time> length = <rhythm_gem_length> pattern = <rhythm_gem_pattern>
	else
		<curr_time> = <lead_note_end>
		addnotetrackitem Name = <guitar_gem_array> time = <lead_gem_time> length = <lead_gem_length> pattern = <lead_gem_pattern>
	endif
	begin
	if (<rhythm_index> < $<rhythm_array_size>)
		getnotetrackitem Name = <rhythm_gem_array> index = <rhythm_index>
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
		getnotetrackitem Name = <lead_gem_array> index = <lead_index>
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
endscript

script jam_auto_generate_melody_gem_array 
	melody_gem_array = ($jam_tracks [4].gem_array)
	AppendSuffixToChecksum Base = <melody_gem_array> SuffixString = '_size'
	melody_array_size = <appended_id>
	vocal_gem_array = temp_vocal_array
	if GlobalExists Name = <vocal_gem_array> Type = integer
		destroyscriptarray Name = <vocal_gem_array>
	endif
	if GlobalExists \{Name = jamsession_song_vocals
			Type = array}
		destroyscriptarray \{Name = jamsession_song_vocals}
	endif
	if GlobalExists \{Name = jamsession_lyrics
			Type = array}
		destroyscriptarray \{Name = jamsession_lyrics}
	endif
	if GlobalExists \{Name = jamsession_vocals_markers
			Type = array}
		destroyscriptarray \{Name = jamsession_vocals_markers}
	endif
	if GlobalExists \{Name = jamsession_vocals_phrases
			Type = array}
		destroyscriptarray \{Name = jamsession_vocals_phrases}
	endif
	createscriptarray Name = <vocal_gem_array> size = ($gemarraysize * 3) Heap = quota_song
	AppendSuffixToChecksum Base = <vocal_gem_array> SuffixString = '_size'
	vocal_gem_array_size = <appended_id>
	<midi_low> = 999
	<midi_high> = -1
	<counter> = 0
	<melody_index> = 0
	gettracksize track = ($jam_tracks [4].id)
	default_phrase_array = [0 3 1000 3]
	Change jamsession_vocals_phrases = <default_phrase_array>
	<phrases> = <default_phrase_array>
	if (<track_size> > 0)
		begin
		getnotetrackitem Name = <melody_gem_array> index = (<counter> * 2)
		melody_gem_time = <gem_time>
		melody_gem_length = <gem_length>
		getjamsessionsound track = melody index = <counter>
		jam_get_single_sample_for_melody string = <note_string> fret = <note_fret> jam_instrument = 4
		if (<velocity> >= 127)
			<velocity> = 0
		endif
		<final_midi_note> = (68 + <pitch_shift> + <velocity>)
		if (<final_midi_note> < <midi_low>)
			<midi_low> = <final_midi_note>
		elseif (<final_midi_note> > <midi_high>)
			<midi_high> = <final_midi_note>
		endif
		SetArrayElement ArrayName = <vocal_gem_array> globalarray index = <melody_index> NewValue = <gem_time>
		SetArrayElement ArrayName = <vocal_gem_array> globalarray index = (<melody_index> + 1) NewValue = <gem_length>
		SetArrayElement ArrayName = <vocal_gem_array> globalarray index = (<melody_index> + 2) NewValue = <final_midi_note>
		<melody_index> = (<melody_index> + 3)
		<counter> = (<counter> + 1)
		repeat (<track_size>)
	endif
	SetArrayElement ArrayName = jamsession_vocals_phrases globalarray index = 2 NewValue = (<gem_time> + <gem_length>)
	Change GlobalName = <vocal_gem_array_size> NewValue = (<track_size> * 3)
	SetArrayElement ArrayName = jamsession_vocals_note_range globalarray index = 0 NewValue = <midi_low>
	SetArrayElement ArrayName = jamsession_vocals_note_range globalarray index = 1 NewValue = <midi_high>
	if GlobalExists \{Name = jamsession_song_vocals
			Type = array}
		destroyscriptarray \{Name = jamsession_song_vocals}
	endif
	createscriptarray Name = jamsession_song_vocals size = ($gemarraysize * 3) Heap = quota_song
	copyfinalscriptarray \{sourcename = temp_vocal_array
		destname = jamsession_song_vocals}
	createscriptarray \{Name = jamsession_lyrics
		size = 0
		Heap = quota_song}
	createscriptarray \{Name = jamsession_vocals_phrases
		size = 4
		Heap = quota_song}
	SetArrayElement \{ArrayName = jamsession_vocals_phrases
		globalarray
		index = 0
		NewValue = 0}
	SetArrayElement \{ArrayName = jamsession_vocals_phrases
		globalarray
		index = 1
		NewValue = 3}
	SetArrayElement \{ArrayName = jamsession_vocals_phrases
		globalarray
		index = 2
		NewValue = 1000}
	SetArrayElement \{ArrayName = jamsession_vocals_phrases
		globalarray
		index = 3
		NewValue = 3}
	if GlobalExists Name = <vocal_gem_array> Type = array
		destroyscriptarray Name = <vocal_gem_array>
	endif
endscript

script should_end_phrase 
	end_phrase = 0
	StringLength string = <phrase>
	if (<vocal_lyric_finished> = FALSE &&
			<str_len> < 50)
		return \{end_phrase = 0}
	endif
	if (<str_len> > 0 &&
			<vocal_phrase_end> = 1)
		printf \{qs(0x46997af8)}
		end_phrase = 1
	elseif (<counter> = (<track_size> - 1))
		printf \{qs(0xbe6996bb)}
		end_phrase = 1
	elseif (<str_len> > 40 &&
			<vocal_join> = 0)
		printf \{qs(0x7b6b4a4c)}
		end_phrase = 1
	elseif (<vocal_join> = 0)
		<last_note_time> = (<note_time> + <note_length>)
		getcustomnote track = ($jam_tracks [<instrument>].id) index = (<counter> + 1)
		if (<last_note_time> + 1000 < <note_time>)
			printf \{qs(0x8031f8d8)}
			end_phrase = 1
		endif
	elseif (<str_len> > 60)
		printf \{qs(0x7865b4c6)}
		end_phrase = 1
	endif
	return end_phrase = <end_phrase>
endscript

script jam_auto_generate_vocals_gem_array 
	getsonginfo
	FileName = <streamfile>
	if stringcontains text = <FileName> substring = '.fsb'
		stringremove text = <FileName> remove = '.fsb' new_string = stemname
	else
		stringremove text = <FileName> remove = '.mp3' new_string = stemname
	endif
	formatText TextName = FileName '%s.txt' s = <stemname>
	printf qs(0x3cdd3637) s = <FileName>
	musicstudio_mainobj :musicstudio_loadlyrics FileName = <FileName>
	instrument = 5
	vocals_gem_array = ($jam_tracks [<instrument>].gem_array)
	vocal_gem_array = temp_vocal_array
	if GlobalExists Name = <vocal_gem_array> Type = integer
		destroyscriptarray Name = <vocal_gem_array>
	endif
	if GlobalExists \{Name = jamsession_song_vocals
			Type = array}
		destroyscriptarray \{Name = jamsession_song_vocals}
	endif
	if GlobalExists \{Name = jamsession_lyrics
			Type = array}
		destroyscriptarray \{Name = jamsession_lyrics}
	endif
	if GlobalExists \{Name = jamsession_vocals_markers
			Type = array}
		destroyscriptarray \{Name = jamsession_vocals_markers}
	endif
	if GlobalExists \{Name = jamsession_vocals_phrases
			Type = array}
		destroyscriptarray \{Name = jamsession_vocals_phrases}
	endif
	createscriptarray Name = <vocal_gem_array> size = ($gemarraysize * 3) Heap = quota_song
	AppendSuffixToChecksum Base = <vocal_gem_array> SuffixString = '_size'
	vocal_gem_array_size = <appended_id>
	gettracksize track = ($jam_tracks [<instrument>].id)
	num_lyrics = 0
	num_phrases = 0
	counter = 0
	num_joins = 0
	num_skips = 0
	phrase = ''
	if (<track_size> > 0)
		begin
		getcustomnote track = ($jam_tracks [<instrument>].id) index = <counter>
		if (<vocal_skip> = 1)
			num_skips = (<num_skips> + 1)
		else
			if NOT (<vocal_lyric> = '')
				num_lyrics = (<num_lyrics> + 1)
				formatText TextName = phrase '%s%l' s = <phrase> l = <vocal_lyric>
			endif
			should_end_phrase <...>
			if (<end_phrase> = 1)
				num_phrases = (<num_phrases> + 1)
				phrase = ''
			else
				if (<vocal_lyric_finished> = true)
					formatText TextName = phrase '%s ' s = <phrase>
				endif
				if (<vocal_join> = 1 &&
						<vocal_spoken> = 0)
					if (<counter> + 1 < <track_size>)
						getcustomnote track = ($jam_tracks [<instrument>].id) index = (<counter> + 1)
						if (<vocal_skip> = 0 &&
								<vocal_spoken> = 0)
							num_joins = (<num_joins> + 1)
						endif
					endif
				endif
			endif
		endif
		<counter> = (<counter> + 1)
		repeat (<track_size>)
	endif
	createscriptarray Name = jamsession_lyrics size = <num_lyrics> Type = structure Heap = quota_song
	createscriptarray Name = jamsession_song_vocals size = ((<track_size> + <num_joins>) * 3) Heap = quota_song
	createscriptarray Name = jamsession_vocals_markers size = <num_phrases> Type = structure Heap = quota_song
	createscriptarray Name = jamsession_vocals_phrases size = ((<num_phrases> + 1) * 2) Heap = quota_song
	SetArrayElement \{ArrayName = jamsession_vocals_phrases
		globalarray
		index = 0
		NewValue = 0}
	SetArrayElement \{ArrayName = jamsession_vocals_phrases
		globalarray
		index = 1
		NewValue = 3}
	midi_low = 999
	midi_high = -1
	counter = 0
	melody_index = 0
	lyric_index = 0
	phrase_counter = 0
	lyric_started = 0
	phrase_started = 0
	phrase_starttime = 0
	phrase = ''
	if (<track_size> > 0)
		begin
		getcustomnote track = ($jam_tracks [<instrument>].id) index = (<counter>)
		if (<vocal_skip> = 1)
		else
			if NOT (<vocal_lyric> = '')
				processed_lyric = <vocal_lyric>
				if (<lyric_started>)
					formatText TextName = processed_lyric '=%s' s = <processed_lyric>
				endif
				lyric_started = 0
				if (<vocal_lyric_finished> = FALSE)
					lyric_started = 1
				endif
				SetArrayElement ArrayName = jamsession_lyrics globalarray index = <lyric_index> NewValue = {time = <note_time> text = <processed_lyric>}
				<lyric_index> = (<lyric_index> + 1)
			endif
			if (<vocal_spoken> = 1)
				final_midi_note = 26
			else
				<vocal_octave> = (<vocal_octave> - 1)
				<vocal_pitch> = (<vocal_pitch> - 4)
				<final_midi_note> = (64 + <vocal_pitch> + <vocal_octave> * 12)
				if (<final_midi_note> < <midi_low>)
					<midi_low> = <final_midi_note>
				elseif (<final_midi_note> > <midi_high>)
					<midi_high> = <final_midi_note>
				endif
			endif
			SetArrayElement ArrayName = jamsession_song_vocals globalarray index = <melody_index> NewValue = <note_time>
			SetArrayElement ArrayName = jamsession_song_vocals globalarray index = (<melody_index> + 1) NewValue = <note_length>
			SetArrayElement ArrayName = jamsession_song_vocals globalarray index = (<melody_index> + 2) NewValue = <final_midi_note>
			if NOT (<vocal_lyric> = '')
				formatText TextName = phrase '%s%l' s = <phrase> l = <vocal_lyric>
				if (<phrase_started> = 0)
					phrase_started = 1
					phrase_starttime = <note_time>
				endif
			endif
			should_end_phrase <...>
			if (<end_phrase> = 1)
				SetArrayElement ArrayName = jamsession_vocals_markers globalarray index = <phrase_counter> NewValue = {time = <phrase_starttime> marker = <phrase>}
				SetArrayElement ArrayName = jamsession_vocals_phrases globalarray index = ((<phrase_counter> + 1) * 2) NewValue = <phrase_starttime>
				SetArrayElement ArrayName = jamsession_vocals_phrases globalarray index = (((<phrase_counter> + 1) * 2) + 1) NewValue = 3
				phrase_counter = (<phrase_counter> + 1)
				phrase = ''
				phrase_started = 0
			else
				if (<vocal_lyric_finished> = true)
					formatText TextName = phrase '%s ' s = <phrase>
				endif
				if (<vocal_join> = 1 &&
						<vocal_spoken> = 0)
					<last_note_time> = (<note_time> + <note_length>)
					if (<counter> + 1 < <track_size>)
						getcustomnote track = ($jam_tracks [<instrument>].id) index = (<counter> + 1)
						if (<vocal_skip> = 0 &&
								<vocal_spoken> = 0)
							<melody_index> = (<melody_index> + 3)
							SetArrayElement ArrayName = jamsession_song_vocals globalarray index = <melody_index> NewValue = (<last_note_time>)
							SetArrayElement ArrayName = jamsession_song_vocals globalarray index = (<melody_index> + 1) NewValue = (<note_time> - <last_note_time>)
							SetArrayElement ArrayName = jamsession_song_vocals globalarray index = (<melody_index> + 2) NewValue = 2
						endif
					endif
				endif
			endif
			<melody_index> = (<melody_index> + 3)
		endif
		<counter> = (<counter> + 1)
		repeat (<track_size>)
	endif
	SetArrayElement ArrayName = jamsession_vocals_note_range globalarray index = 0 NewValue = <midi_low>
	SetArrayElement ArrayName = jamsession_vocals_note_range globalarray index = 1 NewValue = <midi_high>
	if GlobalExists Name = <vocal_gem_array> Type = array
		destroyscriptarray Name = <vocal_gem_array>
	endif
	printstruct ($jamsession_song_vocals)
	printstruct ($jamsession_lyrics)
	printstruct ($jamsession_vocals_markers)
	printstruct ($jamsession_vocals_phrases)
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
	create_loading_screen \{jam_mode = 1}
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
	Change \{game_mode = p1_quickplay}
	switch <inst>
		case 0
		case 1
		setplayerinfo \{1
			part = guitar}
		case 2
		setplayerinfo \{1
			part = bass}
		case 3
		setplayerinfo \{1
			part = drum}
		case 4
		case 5
		setplayerinfo \{1
			part = vocals}
	endswitch
	musicstudio_setup_custom_song
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	if ($notetracker_quickplay_active = 0)
		destroy_jam_song_select_menu
	endif
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
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music}
	if musicstudio_mainobj :musicstudio_isinmusicstudio
		if NOT ($current_level = load_z_visualizer)
			Change \{current_level = load_z_visualizer}
			Load_Venue \{block_scripts = 0}
		endif
	endif
	start_song song_name = <song_name> device_num = ($primary_controller) difficulty = <difficulty> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>
	destroy_loading_screen
	generic_event_choose \{no_sound
		state = Uistate_gameplay}
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
	Change current_jam_camera_prop = <start_camera>
	CCam_DoMorph {
		($jam_camera_props.<start_camera>)
	}
	begin
	if NOT ($current_jam_camera_prop = $target_jam_camera_prop)
		Change \{jam_camera_changing = 1}
		local_camera_prop = ($target_jam_camera_prop)
		CCam_DoMorph {
			($jam_camera_props.<local_camera_prop>)
			time = ($jam_view_cam_morph_time)
			motion = smooth
		}
		CCam_WaitMorph
		Change current_jam_camera_prop = <local_camera_prop>
		Change \{jam_camera_changing = 0}
	endif
	Wait \{1
		gameframe}
	repeat
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

script jam_start_song_from_quickplay 
	RequireParams \{[
			FileName
			actual_filename
		]
		all}
	unload_songqpak
	clearcustomsong
	musicstudio_mainobj :musicstudio_getcurrentheap
	jam_recording_create_editable_arrays Heap = <Heap>
	if (<example_song> = 0)
		Change memcard_jamsession_file_name = <FileName>
		Change memcard_jamsession_actual_file_name = <actual_filename>
		musicstudio_update_selected_song_name FileName = <FileName>
		Hide_Band
		new_data = {event = menu_replace state = uistate_jam_quickplay_event}
		ui_event_wait event = menu_replace data = {state = uistate_memcard Type = load_jam event_params = <new_data>}
	else
		musicstudio_update_selected_song_name FileName = <FileName> song_name = <jam_display_name>
		loadjam file_name = <FileName> song_name = <FileName>
		ui_event_wait \{event = menu_replace
			state = uistate_jam_quickplay_event}
	endif
endscript

script jam_quickplay_do_next_song \{is_definitely_last_song = 1}
	if (<is_definitely_last_song> = 1)
		if gman_songfunc \{func = is_play_list_finished}
			if ScreenElementExists \{id = jam_ratesong_dialog}
				DestroyScreenElement \{id = jam_ratesong_dialog}
			endif
			ui_memcard_autosave \{state = uistate_songlist}
			return
		endif
	endif
	gman_songtool_getcurrentsong
	if (<current_song> = jamsession)
		if ($wii_current_mode != play_jam)
			ui_event_wait \{event = menu_replace
				state = uistate_quickplay_get_and_start_song}
		else
			jam_quickplay_get_and_start_song
		endif
	else
		musicstudio_instrument_unloadall
		Change \{songtime_paused = 0}
		if ($wii_current_mode != core)
			ui_event_wait \{event = menu_replace
				state = uistate_quickplay_get_and_start_song}
		else
			ui_event \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		endif
	endif
endscript

script jam_quickplay_get_and_start_song 
	get_jam_filename \{Type = current}
	jam_start_song_from_quickplay FileName = <FileName> actual_filename = <actual_filename> example_song = <example_song> jam_display_name = <jam_display_name>
endscript

script jam_quickplay_save_song_score 
	get_jam_filename \{Type = current}
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{1
		part}
	getplayerinfo \{1
		score}
	new_score = <score>
	get_difficulty_text_nl difficulty = <difficulty>
	get_formatted_songname_for_jam_mode song_prefix = <FileName> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	score = 0
	GetGlobalTags <songname> params = score noassert = 1
	if (<new_score> > <score>)
		CastToInteger \{new_score}
		SetGlobalTags <songname> params = {score = <new_score>}
	endif
endscript

script ui_memcard_load_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {Type = load_jam event_params = {event = <event> data = <data>}}
endscript

script song_is_jamsession 
	RequireParams \{[
			song
		]
		all}
	if checksumequals a = <song> b = jamsession
		return \{true}
	endif
	return \{FALSE}
endscript

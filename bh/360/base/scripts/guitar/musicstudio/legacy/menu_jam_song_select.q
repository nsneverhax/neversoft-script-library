jam_selected_song = qs(0xef150ff7)
jam_selected_song_name = qs(0xef150ff7)

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
				state = UIstate_musicstudio_jamroom_wizard
				curr_tab = 0
				musicstudio_ghmix = 1
				init_style_select = 1
			}}
		return
	endif
	printf \{channel = jam_mode
		qs(0xb3a21306)}
	destroy_band
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
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_song_select_container}
	if (<curr_tab> = 0)
		<line_pos> = (237.0, 510.0)
	else
		<line_pos> = (237.0, 480.0)
	endif
	song_text_params = {type = TextElement font = fontgrid_text_A1 just = [left center] scale = 0.8 rgba = [255 255 255 255]}
	song_info_text_params = {type = TextElement font = fontgrid_title_a1 just = [left center] scale = 0.35000002 rgba = ($default_color_scheme.text_color)}
	SetPlayerInfo 1 controller = ($primary_controller)
	musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
	<main_player> :MusicStudioPlayer_SetInstrument instrument = 0
	if (<curr_tab> = 0)
		directorylisting = $jam_curr_directory_listing
		make_generic_menu \{Title = qs(0xa38d930d)
			pad_back_script = menu_jam_song_select_back
			vmenu_id = create_my_song_menu
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
					choose_state = UIstate_musicstudio_jamroom_wizard
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
				SetPlayerInfo \{1
					jam_instrument = 0}
				add_generic_musicstudio_menu_text_item {
					icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_recording
					choose_state_data = {back_to_jam_band = 0 current_instrument = 0 player = ($jam_current_recording_player)}
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
				}
			elseif (<advanced_record> = 2)
				Change \{jam_current_recording_player = 1}
				SetPlayerInfo \{1
					jam_instrument = 0}
				add_generic_musicstudio_menu_text_item {
					icon = icon_jam_create_new
					text = qs(0x1bca1511)
					pad_choose_script = jam_song_select_load_song
					pad_choose_params = {pattern_load = 1 back_to_jam_band = 0 current_instrument = 0 player = ($jam_current_recording_player)}
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
		if (<array_size> > 0)
			CreateScriptArray name = jam_download_songs size = <array_size> heap = heap_song
			index = 0
			begin
			show_local_song = 1
			if StructureContains structure = (<directorylisting> [<index>]) downloaded
				if ((<directorylisting> [<index>].downloaded) = 1)
					<show_local_song> = 0
					<has_download_songs> = 1
					SetArrayElement arrayName = jam_download_songs GlobalArray index = <index> newValue = 1
				endif
			endif
			if (<show_local_song> = 1)
				if (<first_local_song> = 0)
					add_generic_musicstudio_menu_text_item \{text = qs(0x322ff13f)
						heading}
					<first_local_song> = 1
				endif
				SetArrayElement arrayName = jam_download_songs GlobalArray index = <index> newValue = 0
				add_generic_musicstudio_menu_text_item {
					text = (<directorylisting> [<index>].FileName)
					pad_choose_script = jam_song_select_load_song
					pad_choose_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
					pad_square_script = delete_jam_song_confirm
					pad_square_params = {FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
					additional_choose_script = musicstudio_set_ambience
					additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
				}
			endif
			<index> = (<index> + 1)
			repeat <array_size>
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
						pad_square_params = {FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
						additional_choose_script = musicstudio_set_ambience
						additional_choose_params = {ambience = create_new_ghmix_choose_ambience}
					}
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		if GlobalExists \{name = jam_download_songs
				type = array}
			printf \{channel = jam_mode
				qs(0xa047b8ba)}
			DestroyScriptArray \{name = jam_download_songs}
		endif
		GetArraySize ($jam_song_assets)
		num_assets = <array_size>
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
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script menu_jam_screensaver 
	CreateScreenElement {
		parent = <window_id>
		type = SpriteElement
		texture = load_record
		rgba = [200 200 200 255]
		dims = (20.0, 20.0)
		scale = 10
		alpha = 1
		Pos = (320.0, 135.0)
		z_priority = 1000
		alpha = 0
	}
	if NOT GotParam \{no_fade}
		<id> :SE_SetProps alpha = 1 rot_angle = 360 time = 2
		<id> :SE_WaitProps
	else
		<id> :SE_SetProps alpha = 1
	endif
	begin
	<id> :SE_SetProps rot_angle = 0
	<id> :SE_SetProps rot_angle = 360 time = 2
	<id> :SE_WaitProps
	repeat
endscript

script menu_jam_screensaver_loading 
	CreateScreenElement {
		type = TextBlockElement
		parent = <window_id>
		font = fontgrid_text_A3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = [150 150 150 255]
		Pos = (320.0, 135.0)
		dims = (170.0, 40.0)
		text = qs(0x37f4c584)
		z_priority = 1000
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = original
	}
	time_between = 0.1
	loading_text_base = qs(0xabf4f150)
	period_array = [qs(0x00000000) qs(0xefb47879) qs(0xab24dd29) qs(0xb723938a)]
	count = 0
	begin
	FormatText TextName = loading_text qs(0xeef7df84) s = <loading_text_base> a = (<period_array> [<count>])
	<id> :SetProps text = <loading_text>
	wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script menu_jam_song_select_back 
	destroy_jam_play_select_menu
	jam_stop_all_sound
	generic_event_back \{nosound}
endscript

script jam_tutorial_button_focus 
	retail_menu_focus \{id = jam_tutorial_button}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_tutorial_button_unfocus 
	retail_menu_unfocus \{id = jam_tutorial_button}
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
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	FormatText TextName = delete_dialog qs(0xa983b69d) s = <FileName>
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
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script delete_jam_song \{advanced_record = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent \{type = unfocus
		target = dialog_box_vmenu}
	clean_up_user_control_helpers
	Change memcard_jamsession_file_name = <FileName>
	ui_memcard_delete_jam event = menu_back data = {state = UIstate_jam_select_song advanced_record = <advanced_record> show_popup = 0}
endscript

script destroy_jam_song_select_menu 
	killspawnedscript \{name = create_jam_song_select_menu}
	set_focus_color
	set_unfocus_color
	killspawnedscript \{name = menu_jam_screensaver}
	printf \{qs(0x04b8b2cc)}
	if ScreenElementExists \{id = jam_song_select_container}
		DestroyScreenElement \{id = jam_song_select_container}
	endif
	destroy_jam_play_select_menu
	destroy_generic_menu
	destroy_jam_song_select_popup
	jam_destroy_tutorial_menu
	killspawnedscript \{id = jam_song_select_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script jam_song_select_load_song \{advanced_record = 0
		example_song = 0
		pattern_load = 0}
	printf \{channel = jam_mode
		qs(0x84934677)}
	musicstudio_toggle_auto_play_all_off
	ClearCustomSong
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
	if NOT (<example_song> = 1)
		Change memcard_jamsession_file_name = <FileName>
		ui_memcard_load_jam event = menu_back data = {show_popup = 1 example_song = <example_song>}
	else
		create_loading_screen \{jam_mode = 1}
		LoadJam file_name = <FileName>
		musicstudio_update_selected_song_name FileName = <FileName> song_name = ($jam_song_assets [<index>].display_name)
		create_jam_song_select_popup advanced_record = <advanced_record>
		destroy_loading_screen
	endif
endscript

script create_jam_song_select_popup \{advanced_record = 0}
	StopRendering
	if ScreenElementExists \{id = current_menu}
		current_menu :SE_SetProps \{block_events}
	endif
	GetSongInfo
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
			heading_text = qs(0x00000000)
			body_text = qs(0x00000000)
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
		<menu_id> :SE_SetProps Pos = {(0.0, -20.0) relative}
	else
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0x00000000)
			body_text = qs(0x00000000)
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
	create_loading_screen
	musicstudio_initialize_song
	destroy_loading_screen
	if ScreenElementExists id = <menu_id>
		<menu_id> :SE_SetProps event_handlers = <event_handlers>
		<menu_id> :SE_SetProps block_events
	else
		softassert qs(0x5a193f2a) m = <menu_id>
	endif
	player_device = ($primary_controller)
	cas_update_band_logo \{album_art}
	PushAssetContext context = ($CAS_Band_Logo_Details.AssetContext)
	CreateScreenElement {
		type = SpriteElement
		parent = dialog_box_container
		texture = ($CAS_Band_Logo_Details.textureasset)
		just = [left center]
		rgba = [255 255 255 250]
		Pos = (380.0, 300.0)
		dims = (150.0, 150.0)
		z_priority = 1000
	}
	PopAssetContext
	create_jam_song_info_text parent = dialog_box_container column_offset = 0 rgba = [180 180 180 250] FileName = ($jam_selected_song_name)
	if ScreenElementExists id = <menu_id>
		<menu_id> :SE_SetProps unblock_events
		<menu_id> :Menu_ChangeSelection
		<menu_id> :Menu_ChangeSelection up
	endif
	StartRendering
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
endscript

script musicstudio_initialize_song 
	GetSongInfo
	Change jam_current_bpm = <bpm>
	Change jam_current_tuning = <tuning>
	GetArraySize \{$drum_kits}
	printf channel = jam_mode qs(0xdf0adb60) s = <drum_kit>
	if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	Change jam_current_drum_kit = <drum_kit>
	Change jam_current_percussion_kit = <percussion_kit>
	LoadDrumKitAll \{async = 0}
	MusicStudio_Instrument_LoadAll {
		keyboard_index = <keyboard_sound>
		guitar_index = <guitar_sound>
		bass_index = <bass_sound>
	}
	if GotParam \{bass_kit}
		Change bass_kit_mode = <bass_kit>
		LoadBassKit bass_kit = <bass_kit>
	else
		SetSongInfo \{bass_kit = 0}
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
	GetTrackSize track = ($jam_tracks [<track_count>].id)
	if (<track_size> > 0)
		GetCustomNote track = ($jam_tracks [<track_count>].id) index = (<track_size> - 1)
		if (<note_time> > <last_end_time>)
			<last_end_time> = <note_time>
		endif
		FormatText TextName = note_count qs(0xd7ee902f) a = ($jam_tracks [<track_count>].name_text) b = <track_size> s = qs(0x42c9738e)
		FormatText TextName = tracks_recorded_text qs(0xdc07585f) s = <tracks_recorded_text> a = ($jam_tracks [<track_count>].name_text)
		SetArrayElement arrayName = note_count_text index = <track_count> newValue = <note_count>
	else
		FormatText TextName = note_count qs(0x5e97b9d2) a = ($jam_tracks [<track_count>].name_text) s = qs(0x71d71562)
		SetArrayElement arrayName = note_count_text index = <track_count> newValue = <note_count>
		all_tracks = 0
	endif
	<track_count> = (<track_count> + 1)
	repeat 5
	if (<tracks_recorded_text> = qs(0x00000000))
		FormatText \{TextName = tracks_recorded_text
			qs(0xf36d10c8)}
	endif
	if (<all_tracks> = 1)
		FormatText \{TextName = tracks_recorded_text
			qs(0x711df7be)}
	endif
	Mod a = <last_end_time> b = 60000
	<seconds> = (<Mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		FormatText TextName = length_text qs(0x6b8769fa) a = <minutes> b = <seconds>
	else
		FormatText TextName = length_text qs(0x830308cc) a = <minutes> b = <seconds>
	endif
	GetTrackInfo \{track = rhythm}
	FormatText TextName = bpm_text qs(0x21072c11) a = <bpm>
	GetSongInfo
	GetArraySize \{$jam_genre_list}
	if (<genre> < 0 || <genre> >= <array_size>)
		FormatText TextName = genre_text qs(0xd0ef7f05) a = <genre>
	else
		FormatText TextName = genre_text qs(0x4d3a8435) a = ($jam_genre_list [<genre>].name_text)
	endif
	if (<artist> = qs(0x00000000))
		<artist> = qs(0x2dc91c7c)
	endif
	if ScreenElementExists \{id = song_preview_element}
		platform_prefix = qs(0x03ac90f0)
		if isXenon
			<platform_prefix> = qs(0x035582ab)
		elseif IsPS3
			<platform_prefix> = qs(0xcb8c08a3)
		else
			<platform_prefix> = qs(0x84cd9e64)
		endif
		if ((<file_id>.file_id [0]) = 0)
			FormatText TextName = file_id_text qs(0xd6df1a7a) a = (<file_id>.file_id [1]) p = <platform_prefix>
		else
			FormatText TextName = file_id_text qs(0xb05112d6) a = (<file_id>.file_id [1]) b = (<file_id>.file_id [0]) p = <platform_prefix>
		endif
		if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
			file_id_text = qs(0x03ac90f0)
		endif
		if NOT (<num_ratings> = 0)
			FormatText TextName = ratings_text qs(0x90047b5d) a = <num_ratings>
		else
			ratings_text = qs(0x03ac90f0)
		endif
		song_preview_element :SE_SetProps {
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
		if (<genre> < 0 || <genre> >= <array_size>)
			FormatText TextName = length_text qs(0xe3cd7faf) s = <length_text> b = qs(0xd0ef7f05)
		else
			FormatText TextName = length_text qs(0xe3cd7faf) s = <length_text> b = ($jam_genre_list [<genre>].name_text)
		endif
		CreateScreenElement {
			parent = <parent>
			type = DescInterface
			desc = 'jam_song_info_text'
			Pos = (-50.0, 0.0)
			scale = 1.0
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
	ClearCustomSong
	ui_event event = menu_back data = {no_sound show_popup = 0 advanced_record = <advanced_record> <...>}
endscript

script destroy_jam_song_select_popup 
	destroy_dialog_box
endscript

script jam_popup_play_song 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	jam_recording_create_jamsession_arrays
	song_prefix = 'editable'
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	FormatText checksumname = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	jamsession_copymarkerarrays \{song = editable}
	jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	create_jam_play_select_menu <...> advanced_record = <advanced_record>
endscript

script jam_popup_preview_song 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
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
		SetPlayerInfo \{1
			jam_instrument = 0}
		generic_event_choose no_sound state = uistate_recording data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 player = ($jam_current_recording_player)}
	elseif (<advanced_record> = 2)
		Change \{jam_current_recording_player = 1}
		SetPlayerInfo \{1
			jam_instrument = 0}
		generic_event_choose no_sound state = UIstate_musicstudio_ghmix data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 player = ($jam_current_recording_player)}
	endif
endscript

script jam_popup_publish_song 
	printf \{channel = jam_mode
		qs(0x2b876e21)}
	GetSongInfo
	printf channel = jam_mode qs(0xe2e069d2) a = <genre> b = <song_version>
	generic_event_choose no_sound state = uistate_jam_publish_song data = {FileName = <FileName> newfilename = <FileName> new_genre = <genre>}
endscript

script create_jam_play_select_menu 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	destroy_dialog_box
	destroy_jam_song_select_menu
	make_generic_menu {
		Title = qs(0x81bf948c)
		pad_back_script = jam_play_select_menu_go_back
		pad_back_params = {advanced_record = <advanced_record> <...>}
		menu_id = jam_play_select_menu
		vmenu_id = jam_play_select_vmenu
		dims = (400.0, 300.0)
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
	}
	GetSongInfo
	if isguitarcontroller \{controller = $primary_controller}
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
	LaunchEvent \{type = focus
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
		jam_play_select_vmenu :SE_SetProps \{block_events}
	endif
	SetPlayerInfo \{1
		in_game = 1}
	SetPlayerInfo \{1
		part = vocals}
	vocals_distribute_mics \{allow_default_headset}
	if jam_vocals_is_invalid
		return
	endif
	spawnscriptnow <callback> params = {<callback_params> device_num = <device_num>}
endscript

script jam_vocals_is_invalid 
	get_num_mics_plugged_in
	GetPlayerInfo \{1
		mic_type}
	if (<num_mics_plugged_in> = 0 || <mic_type> = None)
		if IsXenonOrWinDX
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
	return \{false}
endscript

script add_jam_play_select_option \{playback_track = 0
		instrument = 0}
	GetTrackSize track = ($jam_tracks [<playback_track>].id)
	if (<track_size> > 0)
		GetCustomNote track = ($jam_tracks [<playback_track>].id) index = (<track_size> - 1)
		get_minutes_and_seconds_text time = <note_time>
		FormatText TextName = play_text qs(0x29f9736b) s = ($jam_tracks [<jam_instrument>].name_text) a = ($jam_tracks [<playback_track>].name_text) b = <minutes_and_seconds_text>
		add_generic_musicstudio_menu_text_item {
			text = <play_text>
			pad_choose_script = create_jam_difficulty_select_menu
			pad_choose_params = {inst = <jam_instrument> advanced_record = <advanced_record>}
		}
		return \{true}
	endif
	return \{false}
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
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
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
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script jam_auto_generate_guitar_gem_array 
	rhythm_gem_array = ($jam_tracks [0].gem_array)
	lead_gem_array = ($jam_tracks [1].gem_array)
	AppendSuffixToChecksum base = <rhythm_gem_array> SuffixString = '_size'
	rhythm_array_size = <appended_id>
	AppendSuffixToChecksum base = <lead_gem_array> SuffixString = '_size'
	lead_array_size = <appended_id>
	FormatText \{checksumname = guitar_gem_array
		'guitar_gem_array'}
	if GlobalExists name = <guitar_gem_array> type = array
		DestroyScriptArray name = <guitar_gem_array>
	endif
	CreateScriptArray name = <guitar_gem_array> size = (($gemarraysize) * 4) heap = heap_song <...>
	AppendSuffixToChecksum base = <guitar_gem_array> SuffixString = '_size'
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
	GetNoteTrackItem name = <rhythm_gem_array> index = <rhythm_index>
	rhythm_gem_time = <gem_time>
	rhythm_gem_length = <gem_length>
	rhythm_gem_pattern = <gem_pattern>
	GetNoteTrackItem name = <lead_gem_array> index = <lead_index>
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
		AddNoteTrackItem name = <guitar_gem_array> time = <rhythm_gem_time> length = <rhythm_gem_length> pattern = <rhythm_gem_pattern>
	else
		<curr_time> = <lead_note_end>
		AddNoteTrackItem name = <guitar_gem_array> time = <lead_gem_time> length = <lead_gem_length> pattern = <lead_gem_pattern>
	endif
	begin
	if (<rhythm_index> < $<rhythm_array_size>)
		GetNoteTrackItem name = <rhythm_gem_array> index = <rhythm_index>
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
		GetNoteTrackItem name = <lead_gem_array> index = <lead_index>
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
	AppendSuffixToChecksum base = <melody_gem_array> SuffixString = '_size'
	melody_array_size = <appended_id>
	vocal_gem_array = temp_vocal_array
	if GlobalExists name = <vocal_gem_array> type = integer
		DestroyScriptArray name = <vocal_gem_array>
	endif
	if GlobalExists \{name = jamsession_song_vocals
			type = array}
		DestroyScriptArray \{name = jamsession_song_vocals}
	endif
	if GlobalExists \{name = jamsession_lyrics
			type = array}
		DestroyScriptArray \{name = jamsession_lyrics}
	endif
	if GlobalExists \{name = jamsession_vocals_markers
			type = array}
		DestroyScriptArray \{name = jamsession_vocals_markers}
	endif
	if GlobalExists \{name = jamsession_vocals_phrases
			type = array}
		DestroyScriptArray \{name = jamsession_vocals_phrases}
	endif
	CreateScriptArray name = <vocal_gem_array> size = ($gemarraysize * 3) heap = heap_song
	AppendSuffixToChecksum base = <vocal_gem_array> SuffixString = '_size'
	vocal_gem_array_size = <appended_id>
	<midi_low> = 999
	<midi_high> = -1
	<counter> = 0
	<melody_index> = 0
	GetTrackSize track = ($jam_tracks [4].id)
	default_phrase_array = [0 3 1000 3]
	Change jamsession_vocals_phrases = <default_phrase_array>
	<phrases> = <default_phrase_array>
	if (<track_size> > 0)
		begin
		GetNoteTrackItem name = <melody_gem_array> index = (<counter> * 2)
		melody_gem_time = <gem_time>
		melody_gem_length = <gem_length>
		GetJamSessionSound track = melody index = <counter>
		jam_get_single_sample_for_melody string = <note_string> Fret = <note_fret> jam_instrument = 4
		if (<velocity> >= 127)
			<velocity> = 0
		endif
		<final_midi_note> = (68 + <pitch_shift> + <velocity>)
		if (<final_midi_note> < <midi_low>)
			<midi_low> = <final_midi_note>
		elseif (<final_midi_note> > <midi_high>)
			<midi_high> = <final_midi_note>
		endif
		SetArrayElement arrayName = <vocal_gem_array> GlobalArray index = <melody_index> newValue = <gem_time>
		SetArrayElement arrayName = <vocal_gem_array> GlobalArray index = (<melody_index> + 1) newValue = <gem_length>
		SetArrayElement arrayName = <vocal_gem_array> GlobalArray index = (<melody_index> + 2) newValue = <final_midi_note>
		<melody_index> = (<melody_index> + 3)
		<counter> = (<counter> + 1)
		repeat (<track_size>)
	endif
	SetArrayElement arrayName = jamsession_vocals_phrases GlobalArray index = 2 newValue = (<gem_time> + <gem_length>)
	Change globalname = <vocal_gem_array_size> newValue = (<track_size> * 3)
	SetArrayElement arrayName = jamsession_vocals_note_range GlobalArray index = 0 newValue = <midi_low>
	SetArrayElement arrayName = jamsession_vocals_note_range GlobalArray index = 1 newValue = <midi_high>
	if GlobalExists \{name = jamsession_song_vocals
			type = array}
		DestroyScriptArray \{name = jamsession_song_vocals}
	endif
	CreateScriptArray name = jamsession_song_vocals size = ($gemarraysize * 3) heap = heap_song
	CopyFinalScriptArray \{sourcename = temp_vocal_array
		destname = jamsession_song_vocals}
	CreateScriptArray \{name = jamsession_lyrics
		size = 0
		heap = heap_song}
	CreateScriptArray \{name = jamsession_vocals_phrases
		size = 4
		heap = heap_song}
	SetArrayElement \{arrayName = jamsession_vocals_phrases
		GlobalArray
		index = 0
		newValue = 0}
	SetArrayElement \{arrayName = jamsession_vocals_phrases
		GlobalArray
		index = 1
		newValue = 3}
	SetArrayElement \{arrayName = jamsession_vocals_phrases
		GlobalArray
		index = 2
		newValue = 1000}
	SetArrayElement \{arrayName = jamsession_vocals_phrases
		GlobalArray
		index = 3
		newValue = 3}
	if GlobalExists name = <vocal_gem_array> type = array
		DestroyScriptArray name = <vocal_gem_array>
	endif
endscript

script should_end_phrase 
	end_phrase = 0
	StringLength string = <phrase>
	if (<vocal_lyric_finished> = false &&
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
		GetCustomNote track = ($jam_tracks [<instrument>].id) index = (<counter> + 1)
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
	GetSongInfo
	FileName = <streamfile>
	if StringContains text = <FileName> substring = '.fsb'
		StringRemove text = <FileName> remove = '.fsb' new_string = stemname
	else
		StringRemove text = <FileName> remove = '.mp3' new_string = stemname
	endif
	FormatText TextName = FileName '%s.txt' s = <stemname>
	printf qs(0x3cdd3637) s = <FileName>
	musicstudio_mainobj :MusicStudio_LoadLyrics FileName = <FileName>
	instrument = 5
	vocals_gem_array = ($jam_tracks [<instrument>].gem_array)
	vocal_gem_array = temp_vocal_array
	if GlobalExists name = <vocal_gem_array> type = integer
		DestroyScriptArray name = <vocal_gem_array>
	endif
	if GlobalExists \{name = jamsession_song_vocals
			type = array}
		DestroyScriptArray \{name = jamsession_song_vocals}
	endif
	if GlobalExists \{name = jamsession_lyrics
			type = array}
		DestroyScriptArray \{name = jamsession_lyrics}
	endif
	if GlobalExists \{name = jamsession_vocals_markers
			type = array}
		DestroyScriptArray \{name = jamsession_vocals_markers}
	endif
	if GlobalExists \{name = jamsession_vocals_phrases
			type = array}
		DestroyScriptArray \{name = jamsession_vocals_phrases}
	endif
	CreateScriptArray name = <vocal_gem_array> size = ($gemarraysize * 3) heap = heap_song
	AppendSuffixToChecksum base = <vocal_gem_array> SuffixString = '_size'
	vocal_gem_array_size = <appended_id>
	GetTrackSize track = ($jam_tracks [<instrument>].id)
	num_lyrics = 0
	num_phrases = 0
	counter = 0
	num_joins = 0
	num_skips = 0
	phrase = ''
	if (<track_size> > 0)
		begin
		GetCustomNote track = ($jam_tracks [<instrument>].id) index = <counter>
		if (<vocal_skip> = 1)
			num_skips = (<num_skips> + 1)
		else
			if NOT (<vocal_lyric> = '')
				num_lyrics = (<num_lyrics> + 1)
				FormatText TextName = phrase '%s%l' s = <phrase> l = <vocal_lyric>
			endif
			should_end_phrase <...>
			if (<end_phrase> = 1)
				num_phrases = (<num_phrases> + 1)
				phrase = ''
			else
				if (<vocal_lyric_finished> = true)
					FormatText TextName = phrase '%s ' s = <phrase>
				endif
				if (<vocal_join> = 1 &&
						<vocal_spoken> = 0)
					if (<counter> + 1 < <track_size>)
						GetCustomNote track = ($jam_tracks [<instrument>].id) index = (<counter> + 1)
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
	CreateScriptArray name = jamsession_lyrics size = <num_lyrics> type = structure heap = heap_song
	CreateScriptArray name = jamsession_song_vocals size = ((<track_size> + <num_joins> - <num_skips>) * 3) heap = heap_song
	CreateScriptArray name = jamsession_vocals_markers size = <num_phrases> type = structure heap = heap_song
	CreateScriptArray name = jamsession_vocals_phrases size = ((<num_phrases> + 1) * 2) heap = heap_song
	SetArrayElement \{arrayName = jamsession_vocals_phrases
		GlobalArray
		index = 0
		newValue = 0}
	SetArrayElement \{arrayName = jamsession_vocals_phrases
		GlobalArray
		index = 1
		newValue = 3}
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
		GetCustomNote track = ($jam_tracks [<instrument>].id) index = (<counter>)
		if (<vocal_skip> = 1)
		else
			if NOT (<vocal_lyric> = '')
				processed_lyric = <vocal_lyric>
				if (<lyric_started>)
					FormatText TextName = processed_lyric '=%s' s = <processed_lyric>
				endif
				lyric_started = 0
				if (<vocal_lyric_finished> = false)
					lyric_started = 1
				endif
				SetArrayElement arrayName = jamsession_lyrics GlobalArray index = <lyric_index> newValue = {time = <note_time> text = <processed_lyric>}
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
			SetArrayElement arrayName = jamsession_song_vocals GlobalArray index = <melody_index> newValue = <note_time>
			SetArrayElement arrayName = jamsession_song_vocals GlobalArray index = (<melody_index> + 1) newValue = <note_length>
			SetArrayElement arrayName = jamsession_song_vocals GlobalArray index = (<melody_index> + 2) newValue = <final_midi_note>
			if NOT (<vocal_lyric> = '')
				FormatText TextName = phrase '%s%l' s = <phrase> l = <vocal_lyric>
				if (<phrase_started> = 0)
					phrase_started = 1
					phrase_starttime = <note_time>
				endif
			endif
			should_end_phrase <...>
			if (<end_phrase> = 1)
				SetArrayElement arrayName = jamsession_vocals_markers GlobalArray index = <phrase_counter> newValue = {time = <phrase_starttime> marker = <phrase>}
				SetArrayElement arrayName = jamsession_vocals_phrases GlobalArray index = ((<phrase_counter> + 1) * 2) newValue = <phrase_starttime>
				SetArrayElement arrayName = jamsession_vocals_phrases GlobalArray index = (((<phrase_counter> + 1) * 2) + 1) newValue = 3
				phrase_counter = (<phrase_counter> + 1)
				phrase = ''
				phrase_started = 0
			else
				if (<vocal_lyric_finished> = true)
					FormatText TextName = phrase '%s ' s = <phrase>
				endif
				if (<vocal_join> = 1 &&
						<vocal_spoken> = 0)
					<last_note_time> = (<note_time> + <note_length>)
					if (<counter> + 1 < <track_size>)
						GetCustomNote track = ($jam_tracks [<instrument>].id) index = (<counter> + 1)
						if (<vocal_skip> = 0 &&
								<vocal_spoken> = 0)
							<melody_index> = (<melody_index> + 3)
							SetArrayElement arrayName = jamsession_song_vocals GlobalArray index = <melody_index> newValue = (<last_note_time>)
							SetArrayElement arrayName = jamsession_song_vocals GlobalArray index = (<melody_index> + 1) newValue = (<note_time> - <last_note_time>)
							SetArrayElement arrayName = jamsession_song_vocals GlobalArray index = (<melody_index> + 2) newValue = 2
						endif
					endif
				endif
			endif
			<melody_index> = (<melody_index> + 3)
		endif
		<counter> = (<counter> + 1)
		repeat (<track_size>)
	endif
	SetArrayElement arrayName = jamsession_vocals_note_range GlobalArray index = 0 newValue = <midi_low>
	SetArrayElement arrayName = jamsession_vocals_note_range GlobalArray index = 1 newValue = <midi_high>
	if GlobalExists name = <vocal_gem_array> type = array
		DestroyScriptArray name = <vocal_gem_array>
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
		Title = qs(0x9f281c76)
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
	LaunchEvent type = focus target = jam_difficulty_select_vmenu data = {child_index = <focus_index>}
endscript

script jam_difficulty_select_go_back 
	destroy_dialog_box
	destroy_jam_play_select_menu
	if ScreenElementExists \{id = jam_difficulty_select_menu}
		DestroyScreenElement \{id = jam_difficulty_select_menu}
	endif
	create_jam_play_select_menu advanced_record = <advanced_record>
endscript

script change_jamsession_songlist_props_struct \{Title = qs(0xab6a4722)
		artist = qs(0x4194c91d)
		year = 2009}
	temp0 = {
		(($jamsession_songlist_props).jamsession)
		Title = <Title>
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
	if NOT issoundplaying \{JM_Menu_FinalSelect}
		break
	endif
	wait \{1
		gameframe}
	repeat
	difficulty = <difficulty>
	SetPlayerInfo 1 difficulty = <difficulty>
	SetPlayerInfo \{1
		in_game = 1}
	SetPlayerInfo \{1
		Band = 1}
	SetPlayerInfo 2 difficulty = <difficulty>
	SetPlayerInfo 3 difficulty = <difficulty>
	SetPlayerInfo 4 difficulty = <difficulty>
	Change \{game_mode = p1_quickplay}
	switch <inst>
		case 0
		case 1
		SetPlayerInfo \{1
			part = guitar}
		case 2
		SetPlayerInfo \{1
			part = bass}
		case 3
		SetPlayerInfo \{1
			part = Drum}
		case 4
		case 5
		SetPlayerInfo \{1
			part = vocals}
	endswitch
	musicstudio_setup_custom_song
	KillCamAnim \{name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	if ($notetracker_quickplay_active = 0)
		destroy_jam_song_select_menu
	endif
	SetPlayerInfo 1 controller = ($primary_controller)
	Change \{current_level = load_z_Studio}
	GetSongInfo
	change_jamsession_songlist_props_struct Title = ($jam_selected_song_name) artist = <artist>
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		UseFourLaneHighway {player = <player> reset}
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	ResumeControllerChecking
	clear_paused_controllers
	Change \{unknown_drum_type = 0}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd_Menu_Music}
	if musicstudio_mainobj :MusicStudio_IsInMusicStudio
		if NOT ($current_level = load_z_visualizer)
			Change \{current_level = load_z_visualizer}
			Load_Venue \{block_scripts = 0}
		endif
	endif
	start_song song_name = <song_name> device_num = ($primary_controller) difficulty = <difficulty> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>
	destroy_loading_screen
	generic_event_choose \{no_sound
		state = uistate_gameplay}
endscript

script jam_copy_in_game_playback_arrays 
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_in_game'}
	CopyFinalScriptArray sourcename = editable_song_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_rhythm_in_game'}
	CopyFinalScriptArray sourcename = editable_song_rhythm_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_guitarcoop_in_game'}
	CopyFinalScriptArray sourcename = editable_song_guitarcoop_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_drum_in_game'}
	CopyFinalScriptArray sourcename = editable_song_drum_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_rhythmcoop_in_game'}
	CopyFinalScriptArray sourcename = editable_song_rhythmcoop_expert destname = <jamsession_dest_in_game>
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
	wait \{1
		gameframe}
	repeat
endscript

script jam_camera_wait 
	printf \{qs(0xaea213d4)}
	return
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
	unload_songqpak
	ClearCustomSong
	jam_recording_create_editable_arrays
	if (<example_song> = 0)
		Change memcard_jamsession_file_name = <FileName>
		hide_band
		new_data = {event = menu_replace state = uistate_jam_quickplay_event}
		ui_event_wait event = menu_replace data = {state = uistate_memcard type = load_jam event_params = <new_data>}
	else
		musicstudio_update_selected_song_name FileName = <FileName> song_name = <jam_display_name>
		LoadJam file_name = <FileName> song_name = <FileName>
		ui_event_wait \{event = menu_replace
			state = uistate_jam_quickplay_event}
	endif
endscript

script jam_quickplay_do_next_song \{is_definitely_last_song = 1}
	if (<is_definitely_last_song> = 1)
		if GMan_SongFunc \{func = is_play_list_finished}
			if ScreenElementExists \{id = jam_ratesong_dialog}
				DestroyScreenElement \{id = jam_ratesong_dialog}
			endif
			ui_memcard_autosave \{state = uistate_songlist}
			return
		endif
	endif
	GMan_SongTool_GetCurrentSong
	if (<current_song> = jamsession)
		jam_quickplay_get_and_start_song
	else
		Change \{songtime_paused = 0}
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
endscript

script jam_quickplay_get_and_start_song 
	get_jam_filename \{type = current}
	jam_start_song_from_quickplay FileName = <FileName> example_song = <example_song> jam_display_name = <jam_display_name>
endscript

script jam_quickplay_save_song_score 
	get_jam_filename \{type = current}
	GetPlayerInfo \{1
		difficulty}
	GetPlayerInfo \{1
		part}
	GetPlayerInfo \{1
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
	generic_event_choose no_sound state = uistate_memcard data = {type = load_jam event_params = {event = <event> data = <data>}}
endscript

script song_is_jamsession 
	RequireParams \{[
			song
		]
		all}
	if checksumequals a = <song> b = jamsession
		return \{true}
	endif
	return \{false}
endscript

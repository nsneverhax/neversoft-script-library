
script create_jam_song_select_menu \{curr_tab = 0
		advanced_record = 0
		show_popup = 0}
	printf \{channel = jam_mode
		qs(0xb3a21306)}
	jam_init_menu_light_show
	StartRendering
	if (<show_popup> = 1)
		StopRendering
	endif
	if (<advanced_record> = 1)
		if NOT ($target_jam_camera_prop = jam_song_select)
			Change \{target_jam_camera_prop = jam_ghmix_song_select}
			jam_camera_wait
		endif
	else
		if NOT ($target_jam_camera_prop = jam_song_select)
			Change \{target_jam_camera_prop = jam_song_select}
			jam_camera_wait
		endif
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
	Change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	Change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	song_text_params = {Type = TextElement font = fontgrid_text_a8 just = [left center] Scale = 0.8 rgba = [255 255 255 255]}
	song_info_text_params = {Type = TextElement font = fontgrid_title_a1 just = [left center] Scale = 0.35000002 rgba = ($default_color_scheme.text_color)}
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
		GetArraySize <directorylisting>
		jam_get_num_songs
		if (<user_song_count> < ($jam_max_user_songs))
			if (<advanced_record> = 0)
				add_generic_menu_icon_item \{icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_jam_song_wizard
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus}
			else
				Change \{jam_current_recording_player = 1}
				setplayerinfo \{1
					jam_instrument = 0}
				add_generic_menu_icon_item {
					icon = icon_jam_create_new
					text = qs(0x1bca1511)
					choose_state = uistate_recording
					choose_state_data = {back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player)}
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus
				}
			endif
		else
			add_generic_menu_icon_item \{icon = icon_jam_create_new
				text = qs(0x1bca1511)
				pad_choose_script = jam_create_song_failed_dialog
				dialog = 0
				pad_choose_params = {
					dialog = 0
				}
				additional_focus_script = menu_jam_create_song_focus
				additional_unfocus_script = menu_jam_create_song_unfocus}
		endif
		has_download_songs = 0
		first_local_song = 0
		if (<array_Size> > 0)
			createscriptarray Name = jam_download_songs size = <array_Size> Heap = heap_song
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
					add_generic_menu_text_item \{text = qs(0x322ff13f)
						heading}
					<first_local_song> = 1
				endif
				SetArrayElement ArrayName = jam_download_songs globalarray index = <index> NewValue = 0
				add_generic_menu_text_item {
					text = (<directorylisting> [<index>].FileName)
					pad_choose_script = jam_song_select_load_song
					pad_choose_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
					pad_start_script = delete_jam_song_confirm
					pad_start_params = {FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
				}
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
		if (<has_download_songs> = 1)
			if NetSessionFunc \{func = can_view_user_content}
				add_generic_menu_text_item \{text = qs(0xed613e2c)
					heading}
				index = 0
				begin
				if ($jam_download_songs [<index>] = 1)
					add_generic_menu_text_item {
						text = (<directorylisting> [<index>].FileName)
						pad_choose_script = jam_song_select_load_song
						pad_choose_params = {index = <index> FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
						pad_start_script = delete_jam_song_confirm
						pad_start_params = {FileName = (<directorylisting> [<index>].FileName) advanced_record = <advanced_record>}
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
		add_generic_menu_text_item \{text = qs(0x98e2380b)
			heading}
		index = 0
		begin
		if NOT StructureContains structure = ($jam_song_assets [<index>]) no_qp
			add_generic_menu_text_item {
				text = ($jam_song_assets [<index>].display_name)
				pad_choose_script = jam_song_select_load_song
				pad_choose_params = {index = <index> FileName = ($jam_song_assets [<index>].FileName) advanced_record = <advanced_record> example_song = 1}
				additional_focus_script = menu_jam_create_song_focus
				additional_unfocus_script = menu_jam_create_song_unfocus
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
	create_viewport_ui \{texture = `tex\zones\z_studio\rm_studio_monitor_gh_mix.dds`
		texdict = `zones/z_studio/z_studio.tex`
		keep_current_level}
	SpawnScriptNow menu_jam_screensaver params = {window_id = <window_id>}
	<window_id> :Obj_SpawnScriptNow menu_jam_screensaver params = {window_id = <window_id>}
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
	destroy_jam_play_select_menu
	generic_event_back
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
		button = start
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
		button = start
		z = 100}
endscript

script delete_jam_song_confirm 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	formatText TextName = delete_dialog qs(0xa983b69d) s = <FileName>
	create_popup_warning_menu {
		textblock = {
			text = <delete_dialog>
			Pos = (640.0, 370.0)
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
	Change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	Change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
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
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script delete_jam_song \{advanced_record = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent \{Type = unfocus
		target = pu_warning_vmenu}
	clean_up_user_control_helpers
	Change memcard_jamsession_file_name = <FileName>
	ui_memcard_delete_jam event = menu_back data = {state = uistate_jam_select_song advanced_record = <advanced_record> show_popup = 0}
endscript

script destroy_jam_song_select_menu 
	KillSpawnedScript \{Name = create_jam_song_select_menu}
	set_focus_color
	set_unfocus_color
	KillSpawnedScript \{Name = menu_jam_screensaver}
	destroy_viewport_ui
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
	if NOT (<example_song> = 1)
		Change memcard_jamsession_file_name = <FileName>
		ui_memcard_load_jam event = menu_back data = {show_popup = 1 example_song = <example_song>}
	else
		loadjam file_name = <FileName>
		Change jam_selected_song = <FileName>
		create_jam_song_select_popup example_song = <example_song> advanced_record = <advanced_record>
	endif
endscript

script create_jam_song_select_popup \{advanced_record = 0
		example_song = 0}
	StopRendering
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	getsonginfo
	if NOT (<downloaded> = 1 || <example_song> = 1)
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs(0xbc9429b6)
			textblock = {
				text = qs(0x00000000)
				dims = (840.0, 600.0)
				Pos = (640.0, 370.0)
				Scale = 0.55
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
				{
					func = jam_popup_publish_song
					func_params = {FileName = ($jam_selected_song)}
					text = qs(0x44f29f0d)
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
		}
	else
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs(0xbc9429b6)
			textblock = {
				text = qs(0x00000000)
				dims = (840.0, 600.0)
				Pos = (640.0, 370.0)
				Scale = 0.55
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
	if popupelement :desc_resolvealias \{Name = alias_dlog_vmenu}
		<resolved_id> :se_setprops block_events
	endif
	gettrackinfo \{track = rhythm}
	Change jam_current_bpm = <bpm>
	Change jam_current_tuning = <tuning>
	GetArraySize \{$drum_kits}
	printf channel = jam_mode qs(0xdf0adb60) s = <drum_kit>
	if ((<drum_kit> >= <array_Size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	Change jam_current_drum_kit = <drum_kit>
	loaddrumkitall drum_kit = ($drum_kits [<drum_kit>].string_id) percussion_kit = ($drum_kits [<drum_kit>].percussion_string_id) async = 0
	loadmelodykit melody_kit = <melody_kit>
	jam_init_volumes
	jam_init_pan
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
	player_device = ($primary_controller)
	cas_update_band_logo \{album_art}
	PushAssetContext context = ($cas_band_logo_details.AssetContext)
	CreateScreenElement {
		Type = SpriteElement
		parent = popup_warning_container
		texture = ($cas_band_logo_details.textureasset)
		just = [left center]
		rgba = [255 255 255 250]
		Pos = (350.0, 305.0)
		dims = (170.0, 170.0)
		z_priority = 1000
	}
	PopAssetContext
	create_jam_song_info_text parent = popup_warning_container Pos = (540.0, 288.0) rgba = [180 180 180 250] FileName = ($jam_selected_song)
	if popupelement :desc_resolvealias \{Name = alias_dlog_vmenu}
		<resolved_id> :se_setprops unblock_events
		<resolved_id> :menu_changeselection
		<resolved_id> :menu_changeselection up
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
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		end_time = ($<gem_array> [(($<notetrack_size>) - 2)])
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
		formatText TextName = note_count qs(0xd7ee902f) a = ($jam_tracks [<count>].name_text) b = (($<notetrack_size>) / 2) s = qs(0x42c9738e)
		formatText TextName = tracks_recorded_text qs(0xdc07585f) s = <tracks_recorded_text> a = ($jam_tracks [<count>].name_text)
		SetArrayElement ArrayName = note_count_text index = <count> NewValue = <note_count>
	else
		formatText TextName = note_count qs(0x5e97b9d2) a = ($jam_tracks [<count>].name_text) s = qs(0x71d71562)
		SetArrayElement ArrayName = note_count_text index = <count> NewValue = <note_count>
		all_tracks = 0
	endif
	<count> = (<count> + 1)
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
	formatText \{TextName = bpm_text
		qs(0x21072c11)
		a = $jam_current_bpm}
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
			Pos = (190.0, 115.0)
			Scale = 0.75
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
	ui_menu_select_sfx
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
	ui_event event = menu_replace data = {state = uistate_jam_select_song show_popup = 0 advanced_record = <advanced_record> <...>}
endscript

script destroy_jam_song_select_popup 
	destroy_popup_warning_menu
endscript

script jam_popup_play_song 
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

script jam_popup_edit_song \{advanced_record = 0}
	printf \{channel = jam_mode
		qs(0xb17f9063)}
	printf channel = jam_mode qs(0x169e2126) s = ($jam_selected_song) a = <advanced_record>
	if (<advanced_record> = 0)
		generic_event_choose state = uistate_jam_band data = {editing = 1 advanced_record = <advanced_record>}
	else
		Change \{jam_current_recording_player = 1}
		setplayerinfo \{1
			jam_instrument = 0}
		generic_event_choose state = uistate_recording data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 Player = ($jam_current_recording_player)}
	endif
endscript

script jam_popup_publish_song 
	printf \{channel = jam_mode
		qs(0x2b876e21)}
	getsonginfo
	printf channel = jam_mode qs(0xe2e069d2) a = <genre> b = <song_version>
	generic_event_choose state = uistate_jam_publish_song data = {FileName = <FileName> newfilename = <FileName> new_genre = <genre>}
endscript

script load_jam_assets 
	GetArraySize <directorylisting>
	num_saves = <array_Size>
	GetArraySize ($jam_song_assets)
	num_assets = <array_Size>
	if (<num_assets> <= 0)
		return
	endif
	i = 0
	new_asset = 0
	begin
	curr_asset = ($jam_song_assets [<i>].FileName)
	j = 0
	found_for_add = 0
	begin
	if (<num_saves> <= 0)
		break
	endif
	curr_save = (<directorylisting> [<j>].FileName)
	if (<curr_save> = <curr_asset>)
		<found_for_add> = 1
	endif
	<j> = (<j> + 1)
	repeat <num_saves>
	if NOT (<found_for_add> = 1)
		formatText TextName = curr_asset '%s' s = <curr_asset>
		loadjam file_name = <curr_asset>
		<new_asset> = 1
	else
		printf channel = jam_mode qs(0x472cadcd) s = <curr_asset>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return new_asset = <new_asset>
endscript

script loadjam \{file_name = 'output'
		save = 1}
	LoadPak \{'jams/jam1.pak'}
	prepend = 'jams/'
	formatText TextName = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x56336457) s = <file_path>
	SetSearchAllAssetContexts
	loadjamsessionfrompak jamname = <file_path>
	SetSearchAllAssetContexts \{OFF}
	setsonginfo \{song_version = $jam_song_version}
	UnLoadPak \{'jams/jam1.pak'}
	WaitUnloadPak \{'jams/jam1.pak'}
endscript

script savejam \{file_name = 'output'}
	setsonginfo \{downloaded = 0}
	getsonginfo
	printstruct channel = jam_mode <...>
	prepend = 'dumps\\'
	formatText TextName = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x86fca5dc) s = <file_path>
	savejamsessiontofile jamname = <file_path>
endscript

script create_jam_play_select_menu 
	LaunchEvent \{Type = unfocus
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
	if NOT IsGuitarController \{controller = $primary_controller}
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
	if ((IsGuitarController controller = $primary_controller) || ($allow_controller_for_all_instruments = 1 && <normal_controller> = 1))
		if IsGuitarController \{controller = $primary_controller}
			setplayerinfo \{1
				part = guitar}
		endif
		if (<playback_track1> >= 0)
			guitar_gem_array = ($jam_tracks [<playback_track1>].gem_array)
			AppendSuffixToChecksum Base = <guitar_gem_array> SuffixString = <suffix>
			guitar_gem_array_size = ($<appended_id>)
			if (<guitar_gem_array_size> > 0)
				<end_time> = ($<guitar_gem_array> [(<guitar_gem_array_size> - 2)])
				<guitar_end_time> = <end_time>
				Mod a = <end_time> b = 60000
				<Seconds> = (<Mod> / 1000)
				<minutes> = (<end_time> / 60000)
				<sec_check> = (<Seconds> / 10)
				if (<sec_check> < 1)
					formatText TextName = txt qs(0x478b2b32) a = <minutes> b = <Seconds> s = ($jam_tracks [<playback_track1>].name_text)
				else
					formatText TextName = txt qs(0xa1ab49a8) a = <minutes> b = <Seconds> s = ($jam_tracks [<playback_track1>].name_text)
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
			AppendSuffixToChecksum Base = <bass_gem_array> SuffixString = <suffix>
			bass_gem_array_size = ($<appended_id>)
			if (<bass_gem_array_size> > 0)
				<end_time> = ($<bass_gem_array> [(<bass_gem_array_size> - 2)])
				<bass_end_time> = <end_time>
				Mod a = <end_time> b = 60000
				<Seconds> = (<Mod> / 1000)
				<minutes> = (<end_time> / 60000)
				<sec_check> = (<Seconds> / 10)
				if (<sec_check> < 1)
					formatText TextName = txt qs(0xcb7a4122) a = <minutes> b = <Seconds> s = ($jam_tracks [<playback_track2>].name_text)
				else
					formatText TextName = txt qs(0xb55eae1e) a = <minutes> b = <Seconds> s = ($jam_tracks [<playback_track2>].name_text)
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
		AppendSuffixToChecksum Base = <drum_array> SuffixString = <suffix>
		if (($<appended_id>) > 0)
			<end_time> = ($<drum_array> [($<appended_id> - 2)])
			<drum_end_time> = <end_time>
			Mod a = <end_time> b = 60000
			<Seconds> = (<Mod> / 1000)
			<minutes> = (<end_time> / 60000)
			<sec_check> = (<Seconds> / 10)
			if (<sec_check> < 1)
				formatText TextName = txt qs(0xe86526ca) a = <minutes> b = <Seconds>
			else
				formatText TextName = txt qs(0xb9d0eb24) a = <minutes> b = <Seconds>
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
		AppendSuffixToChecksum Base = <melody_array> SuffixString = <suffix>
		if (($<appended_id>) > 0)
			<end_time> = ($<melody_array> [($<appended_id> - 2)])
			<melody_end_time> = <end_time>
			Mod a = <end_time> b = 60000
			<Seconds> = (<Mod> / 1000)
			<minutes> = (<end_time> / 60000)
			<sec_check> = (<Seconds> / 10)
			if (<sec_check> < 1)
				formatText TextName = txt qs(0x3b75eef4) a = <minutes> b = <Seconds>
			else
				formatText TextName = txt qs(0x89cc3e1e) a = <minutes> b = <Seconds>
			endif
			add_generic_menu_text_item {
				text = <txt>
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {inst = 4 end_time = <melody_end_time> advanced_record = <advanced_record>}
			}
		endif
	endif
	if ((IsGuitarController controller = $primary_controller) && (<has_guitar> = 0))
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
	if NOT (IsGuitarController controller = $primary_controller)
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

script destroy_jam_play_select_menu 
	if ScreenElementExists \{id = jam_play_select_menu}
		DestroyScreenElement \{id = jam_play_select_menu}
	endif
	Change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	Change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script jam_play_select_menu_go_back 
	StopRendering
	destroy_jam_play_select_menu
	destroy_popup_warning_menu
	create_jam_song_select_popup <...> example_song = <example_song>
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
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x18965bea)
		textblock = {
			text = <dialog>
			Pos = (640.0, 370.0)
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
	createscriptarray Name = <guitar_gem_array> size = (($gemarraysize) * 4) Heap = heap_song <...>
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
	printf \{channel = jam_mode
		qs(0xa5bed1cf)}
endscript

script jam_auto_generate_melody_gem_array 
	melody_gem_array = ($jam_tracks [4].gem_array)
	AppendSuffixToChecksum Base = <melody_gem_array> SuffixString = '_size'
	melody_array_size = <appended_id>
	vocal_gem_array = temp_vocal_array
	if GlobalExists Name = <vocal_gem_array> Type = integer
		destroyscriptarray Name = <vocal_gem_array>
	endif
	createscriptarray Name = <vocal_gem_array> size = ($gemarraysize * 3) Heap = heap_song
	AppendSuffixToChecksum Base = <vocal_gem_array> SuffixString = '_size'
	vocal_gem_array_size = <appended_id>
	<midi_low> = 999
	<midi_high> = -1
	<counter> = 0
	<melody_index> = 0
	getjamsessionsize track = ($jam_tracks [4].id)
	default_phrase_array = [0 3 1000 3]
	Change jamsession_vocals_phrases = <default_phrase_array>
	<phrases> = <default_phrase_array>
	if (<track_size> > 0)
		begin
		getnotetrackitem Name = <melody_gem_array> index = (<counter> * 2)
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
	createscriptarray Name = jamsession_song_vocals size = ($gemarraysize * 3) Heap = heap_song
	copyfinalscriptarray \{sourcename = temp_vocal_array
		destname = jamsession_song_vocals}
	if GlobalExists Name = <vocal_gem_array> Type = array
		destroyscriptarray Name = <vocal_gem_array>
	endif
endscript
jamsession_diffcrunchparams = {
	drum = {
		easy = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 4
				}
				{
					Type = 256
					time = 4
				}
				{
					Type = 16
					time = 4
				}
				{
					Type = 1
					time = 4
				}
				{
					Type = 65536
					time = 4
				}
				{
					Type = 1048576
					time = 1
				}
			]
			chord_filter = standard_drum_filter
		}
		medium = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 16
				}
				{
					Type = 256
					time = 8
				}
				{
					Type = 16
					time = 4
				}
				{
					Type = 1
					time = 8
				}
				{
					Type = 65536
					time = 4
				}
				{
					Type = 1048576
					time = 0.5
				}
			]
			chord_filter = standard_drum_filter
		}
		hard = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 32
				}
				{
					Type = 256
					time = 16
				}
				{
					Type = 16
					time = 8
				}
				{
					Type = 1
					time = 16
				}
				{
					Type = 65536
					time = 8
				}
				{
					Type = 1048576
					time = 4
				}
			]
			chord_filter = standard_drum_filter
		}
		expert = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 32
				}
				{
					Type = 256
					time = 32
				}
				{
					Type = 16
					time = 32
				}
				{
					Type = 1
					time = 32
				}
				{
					Type = 65536
					time = 32
				}
				{
					Type = 1048576
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
	LaunchEvent Type = focus target = jam_difficulty_select_vmenu data = {child_index = <focus_index>}
endscript

script jam_difficulty_select_go_back 
	destroy_popup_warning_menu
	destroy_jam_play_select_menu
	if ScreenElementExists \{id = jam_difficulty_select_menu}
		DestroyScreenElement \{id = jam_difficulty_select_menu}
	endif
	create_jam_play_select_menu advanced_record = <advanced_record>
endscript

script process_gem_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 2.0)
	processgemtimes Name = <editable_dest> name_fretbar = editable_fretbars offset_time = <offset_time>
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
	CastToInteger \{new_fretbar_time}
	addscriptarrayitem Name = editable_fretbars integer = <new_fretbar_time>
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
		Source = ($jam_tracks [<playback_track1>].gem_array)
		formatText checksumName = editable_dest 'editable_song_%s' s = <difficulty_text>
		formatText checksumName = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			Type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons Name = <editable_dest> name_fretbar = editable_fretbars guitar
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		if GlobalExists \{Name = guitar_gem_array
				Type = array}
			destroyscriptarray \{Name = guitar_gem_array}
		endif
		setplayerinfo 1 jam_instrument = <playback_track1>
		Change jam_playback_instrument = <playback_track1>
		case 2
		Source = ($jam_tracks [<playback_track2>].gem_array)
		formatText checksumName = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
		formatText checksumName = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			Type = bass
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons Name = <editable_dest> name_fretbar = editable_fretbars
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo \{1
			part = bass}
		setplayerinfo 1 jam_instrument = <playback_track2>
		Change jam_playback_instrument = <playback_track2>
		case 3
		Source = editable_song_drum_expert
		formatText \{checksumName = editable_dest
			'editable_song_drum_%s'
			s = 'hard'}
		formatText checksumName = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			Type = drum
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processdrumvelocity Name = <editable_dest>
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo \{1
			part = drum}
		setplayerinfo \{1
			jam_instrument = 3}
		Change \{jam_playback_instrument = 3}
		case 4
		generatediffscriptarray {sourcename = ($jam_tracks [4].gem_array)
			destname = ($jam_tracks [4].gem_array)
			diff = hard
			Type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		jam_auto_generate_melody_gem_array end_time = <end_time>
		copyfinalscriptarray \{sourcename = editable_song_expert
			destname = jamsession_song_hard}
		setplayerinfo \{1
			part = vocals}
		vocals_distribute_mics
		setplayerinfo \{1
			jam_instrument = 4}
		Change \{jam_playback_instrument = 4}
	endswitch
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<SongList> = ($jamsession_songlist_props)
	<song_struct> = (<SongList>.jamsession)
	return <...>
endscript

script setup_jam_song_qp 
	time_interval = (60000.0 / $jam_current_bpm)
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	i = 1
	begin
	new_fretbar_time = (<last_fretbar_time> + (<time_interval> * <i>))
	CastToInteger \{new_fretbar_time}
	addscriptarrayitem Name = editable_fretbars integer = <new_fretbar_time>
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
		Source = ($jam_tracks [<playback_track1>].gem_array)
		formatText checksumName = editable_dest 'editable_song_%s' s = <difficulty_text>
		formatText checksumName = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
		if (<blank_guitar> = 1)
			addnotetrackitem Name = <Source> time = (<end_time> + 100) length = 0 pattern = 1048576
		endif
		generatediffscriptarray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			Type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons Name = <editable_dest> name_fretbar = editable_fretbars guitar
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		if GlobalExists \{Name = guitar_gem_array
				Type = array}
			destroyscriptarray \{Name = guitar_gem_array}
		endif
		setplayerinfo <i> jam_instrument = <playback_track1>
		case 2
		<blank_bass> = 0
		if (<playback_track2> = -1)
			<playback_track2> = <inst>
			<blank_bass> = 1
		endif
		Source = ($jam_tracks [<playback_track2>].gem_array)
		formatText checksumName = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
		formatText checksumName = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
		if (<blank_bass> = 1)
			addnotetrackitem Name = <Source> time = (<end_time> + 100) length = 0 pattern = 1048576
		endif
		generatediffscriptarray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			Type = bass
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processhammerons Name = <editable_dest> name_fretbar = editable_fretbars
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo <i> part = bass
		setplayerinfo <i> jam_instrument = <playback_track2>
		case 3
		Source = editable_song_drum_expert
		formatText checksumName = editable_dest 'editable_song_drum_%s' s = <difficulty_text>
		formatText checksumName = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
		generatediffscriptarray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			Type = drum
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		processdrumvelocity Name = <editable_dest>
		copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
		setplayerinfo <i> part = drum
		setplayerinfo <i> jam_instrument = 3
		case 4
		generatediffscriptarray {sourcename = ($jam_tracks [4].gem_array)
			destname = ($jam_tracks [4].gem_array)
			diff = hard
			Type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
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
	<SongList> = ($jamsession_songlist_props)
	<song_struct> = (<SongList>.jamsession)
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
	Change jamsession_songlist_props = <temp1>
endscript

script start_jam_song \{difficulty = hard}
	progression_cashmilestonesclear
	setup_jam_song difficulty = <difficulty> inst = <inst> end_time = <end_time>
	difficulty = <difficulty>
	Change structurename = player1_status difficulty = <difficulty>
	Change structurename = player2_status difficulty = <difficulty>
	Change structurename = player3_status difficulty = <difficulty>
	Change structurename = player4_status difficulty = <difficulty>
	Change \{game_mode = p1_quickplay}
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	destroy_jam_song_select_menu
	Change player1_device = ($primary_controller)
	Change structurename = player1_status controller = ($primary_controller)
	create_loading_screen \{jam_mode = 1}
	Change \{current_level = load_z_studio}
	getsonginfo
	change_jamsession_songlist_props_struct title = $jam_selected_song artist = <artist>
	i = 1
	begin
	usefourlanehighway {Player = <i> reset}
	i = (<i> + 1)
	repeat ($current_num_players)
	ResumeControllerChecking
	Change \{sysnotify_paused_controllers = [
		]}
	Change \{unknown_drum_type = 0}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music}
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
	unload_songqpak
	clearjamsession
	jam_recording_create_editable_arrays
	if (<example_song> = 0)
		Change memcard_jamsession_file_name = <FileName>
		new_data = {event = menu_replace state = uistate_jam_quickplay_event}
		ui_event_wait event = menu_replace data = {state = uistate_memcard Type = load_jam event_params = <new_data>}
	else
		Change jam_selected_song = <FileName>
		loadjam file_name = <FileName>
		ui_event_wait \{event = menu_replace
			state = uistate_jam_quickplay_event}
	endif
endscript

script jam_quickplay_do_next_song 
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		if ScreenElementExists \{id = jam_ratesong_dialog}
			DestroyScreenElement \{id = jam_ratesong_dialog}
		endif
		ui_memcard_autosave \{state = uistate_setlist}
		return
	endif
	if (($current_song) = jamsession)
		jam_quickplay_get_and_start_song
	else
		ui_event \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
endscript

script jam_quickplay_get_and_start_song 
	<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<FileName> = (($jam_song_assets) [<jam_directory_index>].FileName)
	else
		<FileName> = ($jam_curr_directory_listing [<jam_directory_index>].FileName)
	endif
	jam_start_song_from_quickplay FileName = <FileName> example_song = <example_song>
endscript

script jam_quickplay_save_song_score 
	<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<FileName> = (($jam_song_assets) [<jam_directory_index>].FileName)
	else
		<FileName> = ($jam_curr_directory_listing [<jam_directory_index>].FileName)
	endif
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
	generic_event_choose state = uistate_memcard data = {Type = load_jam event_params = {event = <event> data = <data>}}
endscript

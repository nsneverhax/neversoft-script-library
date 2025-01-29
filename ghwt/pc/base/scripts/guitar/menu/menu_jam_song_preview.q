
script create_song_preview_menu \{ghtunes = 0
		num_ratings = 0}
	menu_music_off
	clean_up_user_control_helpers
	if screenelementexists \{id = song_preview_element}
		destroyscreenelement \{id = song_preview_element}
	endif
	if (<ghtunes> = 0)
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if (<ghtunes> = 0)
		createscreenelement {
			parent = root_window
			id = song_preview_element
			type = descinterface
			desc = 'gh_tunes_preview'
			event_handlers = [
				{pad_back song_preview_menu_back params = {ghtunes = <ghtunes>}}
				{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes>}}
			]
			exclusive_device = ($primary_controller)
			helper_text_ghtunes_alpha = 0
			helper_text_preview_alpha = 1
			just = [bottom right]
			rot_angle = 90
			z_priority = 100
		}
	else
		event_handlers = [
			{pad_back song_preview_menu_back params = {ghtunes = <ghtunes> board_index = <board_index> start_at = <start_at>}}
			{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes>}}
			{pad_option2 song_preview_save_song params = {ghtunes = <ghtunes> filename = <filename> board_index = <board_index> start_at = <start_at>}}
			{pad_square ghtunes_view_user_content params = {selected_index = <selected_index> ghtunes = <ghtunes> filename = <filename> board_index = <board_index> start_at = <start_at> user_id = <user_id> user_name = <user_name>}}
			{pad_start song_preview_show_gamercard params = {user_id = <user_id>}}
			{pad_l1 ghtunes_show_terms_of_service params = {parent_menu = song_preview_element user_id = <user_id> selected_index = <selected_index>}}
		]
		createscreenelement {
			parent = root_window
			id = song_preview_element
			type = descinterface
			desc = 'gh_tunes_preview'
			event_handlers = <event_handlers>
			exclusive_device = ($primary_controller)
			helper_text_ghtunes_alpha = 1
			helper_text_preview_alpha = 0
			just = [bottom right]
			rot_angle = 90
		}
	endif
	launchevent \{type = unfocus
		target = song_preview_element}
	if NOT gotparam \{file_id}
		getsonginfo
	endif
	create_jam_song_info_text parent = song_preview_element pos = (485.0, 332.0) column_offset = (215.0, 0.0) z_priority = 60 filename = <filename> file_id = <file_id> num_ratings = <num_ratings>
	song_preview_draw_album_cover
	if (<ghtunes> = 0)
		jam_publish_draw_album_cover
	endif
	if screenelementexists \{id = song_preview_element}
		soundevent \{event = ghtunes_on}
		song_preview_element :setprops \{playbar_dims = (0.0, 14.0)}
		song_preview_element :setprops \{rot_angle = -1
			time = 0.2}
		song_preview_element :se_waitprops
		song_preview_element :setprops \{rot_angle = 1
			time = 0.02}
		song_preview_element :se_waitprops
		song_preview_element :setprops \{rot_angle = -0.5
			time = 0.02}
		song_preview_element :se_waitprops
		song_preview_element :setprops \{rot_angle = 0.5
			time = 0.02}
		song_preview_element :se_waitprops
		song_preview_element :setprops \{rot_angle = 0
			time = 0.02}
		song_preview_element :se_waitprops
	endif
	getsonginfo
	getarraysize \{$drum_kits}
	printf channel = jam_mode qs(0xdf0adb60) s = <drum_kit>
	if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	change jam_current_drum_kit = <drum_kit>
	loaddrumkitall drum_kit = ($drum_kits [<drum_kit>].string_id) percussion_kit = ($drum_kits [<drum_kit>].percussion_string_id) async = 0
	wait \{1
		gameframe}
	getarraysize \{$pause_melody_kit_options}
	if ((<melody_kit> >= <array_size>) || (<melody_kit> < 0))
		<melody_kit> = 0
	endif
	change jam_current_melody_kit = <melody_kit>
	loadmelodykit melody_kit = <melody_kit>
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 0
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 1
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 2
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 4
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_drum_playback
		params = {
			start_time = 0
		}}
	spawnscriptnow song_preview_update_playbar params = {song_length = <song_length>}
	change song_preview_curr_song_length = <song_length>
	if screenelementexists \{id = song_preview_element}
		song_preview_element :setprops \{timer_text = qs(0x959c9972)}
	endif
	clean_up_user_control_helpers
	if (<ghtunes> = 0)
		add_user_control_helper \{text = qs(0xb458b767)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xb458b767)
			button = green
			z = 100000}
		if current_band_has_band_name controller = ($primary_controller)
			add_user_control_helper \{text = qs(0xe618e644)
				button = yellow
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 100000}
		if NOT iswinport
			if isxenon
				if gotparam \{user_id}
					add_user_control_helper \{text = qs(0x9a7d1fe5)
						button = start
						z = 100000}
				endif
			endif
		endif
		add_user_control_helper \{text = qs(0xd9bf4807)
			button = blue
			z = 100000}
	endif
	launchevent \{type = focus
		target = song_preview_element}
endscript

script song_preview_show_gamercard 
	printf \{channel = jam_mode
		'song_preview_show_gamercard'}
	if isxenon
		if gotparam \{user_id}
			netsessionfunc func = showgamercard params = {player_xuid = (<user_id>.user_id)}
		endif
	endif
endscript

script song_preview_save_song 
	if NOT current_band_has_band_name controller = ($primary_controller)
		return
	endif
	printf \{channel = jam_mode
		qs(0xa6dda4fd)}
	if screenelementexists \{id = song_preview_element}
		launchevent \{type = unfocus
			target = song_preview_element}
	endif
	if (<ghtunes> = 0)
		return
	endif
	directorylisting = $jam_curr_directory_listing
	getarraysize <directorylisting>
	if (<array_size> > 0)
		index = 0
		begin
		if ((<directorylisting> [<index>].filename) = <filename>)
			song_preview_save_song_failed dialog = 0 <...>
			return
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	soundevent \{event = ghtunes_ui_select}
	destroy_song_preview_menu \{ghtunes = 1}
	change \{memcard_after_func = song_preview_unload}
	change memcard_jamsession_file_name = <filename>
	ui_memcard_save_jam event = menu_back data = {state = uistate_jam_ghtunes straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
	achievements_this_is_totally_legal controller = ($primary_controller)
endscript

script song_preview_save_song_failed \{dialog = 0}
	launchevent \{type = unfocus
		target = song_preview_element}
	soundevent \{event = menu_warning_sfx}
	clean_up_user_control_helpers
	jam_stop_all_sound
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = song_preview_update_playbar}
	switch <dialog>
		case 0
		formattext \{textname = dialog
			qs(0xbcf241ef)}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x86289d11)
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {song_preview_menu_back}
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script song_preview_play_pause \{0x071c4498 = 0}
	if iswinport
		if (<0x071c4498> = 1)
			0x071c4498 = 0
			if (((scriptisrunning guitar_jam_playback_recording) = 0) && ((scriptisrunning guitar_jam_drum_playback) = 0))
				return
			endif
		endif
	endif
	printf \{channel = jam_mode
		qs(0xe0524aa4)}
	soundevent \{event = ghtunes_ui_select}
	if scriptisrunning \{guitar_jam_playback_recording}
		getsongtimems
		change song_preview_curr_song_time = <time>
		killspawnedscript \{name = guitar_jam_playback_recording}
		killspawnedscript \{name = guitar_jam_drum_playback}
		killspawnedscript \{name = song_preview_update_playbar}
	elseif scriptisrunning \{guitar_jam_drum_playback}
		getsongtimems
		change song_preview_curr_song_time = <time>
		killspawnedscript \{name = guitar_jam_playback_recording}
		killspawnedscript \{name = guitar_jam_drum_playback}
		killspawnedscript \{name = song_preview_update_playbar}
	else
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 0
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 1
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 2
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 4
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_drum_playback
			params = {
				start_time = $song_preview_curr_song_time
			}}
		spawnscriptnow \{song_preview_update_playbar
			params = {
				song_length = $song_preview_curr_song_length
			}}
	endif
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_lead) fade_type = log_fast fade_time = 0.3
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
endscript
song_preview_curr_song_length = 0
song_preview_curr_song_time = 0

script song_preview_update_playbar 
	if NOT screenelementexists \{id = song_preview_element}
		return
	endif
	song_preview_element :setprops \{playbar_dims = (0.0, 14.0)}
	playbar_max_x = 344
	begin
	getsongtimems
	if (<time> >= <song_length>)
		change \{song_preview_curr_song_time = 0}
		break
	endif
	playbar_x = ((<time> / <song_length>) * <playbar_max_x>)
	song_preview_element :setprops playbar_dims = ((0.0, 14.0) + ((1.0, 0.0) * <playbar_x>))
	casttointeger \{time}
	mod a = <time> b = 60000
	<seconds> = (<mod> / 1000)
	<minutes> = (<time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		formattext textname = song_time_text qs(0xeacde407) a = <minutes> b = <seconds>
	else
		formattext textname = song_time_text qs(0xcc868dda) a = <minutes> b = <seconds>
	endif
	song_preview_element :setprops timer_text = <song_time_text>
	wait \{1
		gameframe}
	repeat
endscript

script song_preview_draw_album_cover 
	cas_update_band_logo \{album_art}
	pushassetcontext context = ($cas_band_logo_details.assetcontext)
	if screenelementexists \{id = jam_preview_album_cover}
		destroyscreenelement \{id = jam_preview_album_cover}
	endif
	createscreenelement {
		type = spriteelement
		parent = song_preview_element
		id = jam_preview_album_cover
		texture = ($cas_band_logo_details.textureasset)
		dims = (256.0, 256.0)
		pos = (346.0, 353.0)
		just = [center center]
		z_priority = 60
	}
	popassetcontext
endscript

script song_preview_menu_back 
	destroy_popup_warning_menu
	killspawnedscript \{name = song_preview_update_playbar}
	soundevent \{event = ghtunes_off}
	clean_up_user_control_helpers
	if screenelementexists \{id = song_preview_element}
		song_preview_element :setprops \{rot_angle = 90
			time = 0.2}
		song_preview_element :se_waitprops
	endif
	destroy_song_preview_menu ghtunes = <ghtunes>
	if (<ghtunes> = 1)
		song_preview_unload
		ui_event event = menu_back state = uistate_jam_ghtunes data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
	endif
endscript

script song_preview_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
endscript

script destroy_song_preview_menu \{ghtunes = 0}
	jam_stop_all_sound
	if screenelementexists \{id = song_preview_element}
		destroyscreenelement \{id = song_preview_element}
	endif
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = song_preview_update_playbar}
	if (<ghtunes> = 0)
		if screenelementexists \{id = current_menu}
			launchevent \{type = focus
				target = current_menu}
		endif
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
endscript

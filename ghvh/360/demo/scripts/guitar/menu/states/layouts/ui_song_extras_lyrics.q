
script ui_create_song_extras_lyrics 
	get_song_title song = <song>
	getuppercasestring <song_title>
	<song_title> = <uppercasestring>
	get_song_artist song = <song>
	getuppercasestring <song_artist>
	<song_artist> = <uppercasestring>
	formattext textname = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	get_all_exclusive_devices
	createscreenelement {
		type = descinterface
		desc = 'Setlist_B_com'
		id = current_menu_anchor
		parent = root_window
		song_title_text = <song_text>
		song_extras_alpha = 0
		song_details_alpha = 0
		song_lyrics_alpha = 1
		double_kick_alpha = <double_kick_alpha>
		double_kick_pos = <double_kick_pos>
		exclusive_device = <exclusive_device>
		event_handlers = [
			{pad_up ui_song_extras_lyrics_scroll params = {up}}
			{pad_down ui_song_extras_lyrics_scroll params = {down}}
			{pad_back song_lyrics_back params = {selected_index = <selected_index> from_backstage = <from_backstage> from = lyrics double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>}}
		]
	}
	if gotparam \{from_backstage}
		menu_music_off
		change \{ui_song_extras_finished_load = 0}
		current_menu_anchor :obj_spawnscriptnow ui_song_extras_lyrics_anim_in params = {new_double_kick_pos = <double_kick_pos> song = <song>}
	else
		current_menu_anchor :se_setprops \{song_lyrics_alpha = 1}
	endif
	current_menu_anchor :se_setprops text_lyrics_text = ($songlist_lyrics.<song>)
	launchevent \{type = focus
		target = current_menu_anchor}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_song_extras_lyrics_anim_in 
	menu_transition_in \{menu = current_menu_anchor
		anim_type = zoom_blur}
	ui_song_extras_load song = <song>
endscript

script ui_destroy_song_extras_lyrics 
	if (($signin_change_happening = 1) || ($invite_controller > -1))
		if gotparam \{from_backstage}
			ui_song_extras_unload
		endif
	endif
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
endscript

script ui_song_extras_lyrics_scroll 
	current_menu_anchor :obj_spawnscriptnow ui_song_extras_lyrics_scroll_spawned params = {<...>}
endscript

script ui_song_extras_lyrics_scroll_spawned 
	se_getprops \{text_lyrics_pos}
	se_getprops \{text_lyrics_dims}
	<text_y_pos> = (<text_lyrics_pos>.(0.0, 1.0))
	<text_height> = (<text_lyrics_dims>.(0.0, 1.0))
	se_getparentid
	getscreenelementdims id = <parent_id>
	<min_y> = ((<text_height> - (<height> / 2)) * -1)
	<scroll_len> = 425
	if gotparam \{up}
		if (<text_y_pos> < 0)
			<scroll_perc> = ((<text_y_pos> + 47) / (<min_y>))
			<scroll_pos> = ((1.0, 0.0) + ((<scroll_perc> * <scroll_len>) * (0.0, 1.0)))
			se_setprops \{text_lyrics_pos = {
					relative
					(0.0, 47.0)
				}
				time = 0.05}
			se_setprops setlist_b_scrollthumb_pos = <scroll_pos> time = 0.05
			se_waitprops
		endif
	elseif gotparam \{down}
		if (<text_y_pos> > <min_y>)
			<scroll_perc> = ((<text_y_pos> - 47) / <min_y>)
			if (<scroll_perc> > 1.0)
				<scroll_perc> = 1.0
			endif
			<scroll_pos> = ((1.0, 0.0) + ((<scroll_perc> * <scroll_len>) * (0.0, 1.0)))
			se_setprops \{text_lyrics_pos = {
					relative
					(0.0, -47.0)
				}
				time = 0.05}
			se_setprops setlist_b_scrollthumb_pos = <scroll_pos> time = 0.05
			se_waitprops
		endif
	endif
endscript

script song_lyrics_back 
	spawnscriptnow song_lyrics_back_spawned params = {<...>}
endscript

script song_lyrics_back_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	generic_menu_pad_back_sound
	if ($ui_song_extras_finished_load = 0)
		return
	endif
	wait \{1
		second}
	if gotparam \{from_backstage}
		ui_song_extras_unload
	endif
	generic_event_back nosound data = {<...>}
endscript

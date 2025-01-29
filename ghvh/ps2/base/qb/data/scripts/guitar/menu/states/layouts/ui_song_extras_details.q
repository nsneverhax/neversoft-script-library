
script ui_create_song_extras_details 
	get_song_title song = <song>
	GetUpperCaseString <song_title>
	<song_title> = <UppercaseString>
	get_song_artist song = <song>
	GetUpperCaseString <song_artist>
	<song_artist> = <UppercaseString>
	formatText TextName = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	CreateScreenElement {
		Type = descinterface
		desc = 'Setlist_B_com'
		id = current_menu_anchor
		parent = root_window
		song_title_text = <song_text>
		song_extras_alpha = 0
		song_details_alpha = 1
		song_lyrics_alpha = 0
		skeleton_left_pos = {relative (0.0, -50.0)}
		skeleton_right_pos = {relative (300.0, -50.0)}
		double_kick_alpha = <double_kick_alpha>
		double_kick_pos = <double_kick_pos>
		event_handlers = [
			{pad_up ui_song_extras_details_scroll params = {up}}
			{pad_down ui_song_extras_details_scroll params = {down}}
			{pad_back generic_event_back params = {data = {from = song_details double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>}}}
		]
	}
	LaunchEvent \{Type = focus
		target = current_menu_anchor}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_song_extras_details 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
endscript

script ui_song_extras_details_scroll 
	current_menu_anchor :Obj_SpawnScriptNow ui_song_extras_details_scroll_spawned params = {<...>}
endscript

script ui_song_extras_details_scroll_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_getprops \{text_details_pos}
	se_getprops \{text_details_dims}
	<text_y_pos> = (<text_details_pos>.(0.0, 1.0))
	<text_height> = (<text_details_dims>.(0.0, 1.0))
	se_getparentid
	GetScreenElementDims id = <parent_id>
	<min_y> = ((<text_height> - (<height> / 2)) * -1)
	<scroll_len> = 350
	if GotParam \{up}
		if (<text_y_pos> < 0)
			<scroll_perc> = ((<text_y_pos> + 47) / (<min_y>))
			<scroll_pos> = ((1.0, 0.0) + ((<scroll_perc> * <scroll_len>) * (0.0, 1.0)))
			se_setprops \{text_details_pos = {
					relative
					(0.0, 47.0)
				}
				time = 0.05}
			se_setprops setlist_b_details_scrollthumb_pos = <scroll_pos> time = 0.05
			se_waitprops
		endif
	elseif GotParam \{down}
		if (<text_y_pos> > <min_y>)
			<scroll_perc> = ((<text_y_pos> - 47) / <min_y>)
			if (<scroll_perc> > 1.0)
				<scroll_perc> = 1.0
			endif
			<scroll_pos> = ((1.0, 0.0) + ((<scroll_perc> * <scroll_len>) * (0.0, 1.0)))
			se_setprops \{text_details_pos = {
					relative
					(0.0, -47.0)
				}
				time = 0.05}
			se_setprops setlist_b_details_scrollthumb_pos = <scroll_pos> time = 0.05
			se_waitprops
		endif
	endif
endscript

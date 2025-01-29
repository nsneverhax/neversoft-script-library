song_extras_album_covers = [
	{
		string = qs(0x8438fc89)
		texture = album_cov_01
	}
	{
		string = qs(0xaa2a4580)
		texture = album_cov_02
	}
	{
		string = qs(0x5f48b8af)
		texture = album_cov_03
	}
	{
		string = qs(0x4b58f1d4)
		texture = album_cov_04
	}
	{
		string = qs(0xec6b0af0)
		texture = album_cov_05
	}
	{
		string = qs(0xf5669695)
		texture = album_cov_06
	}
	{
		string = qs(0x48400fda)
		texture = album_cov_07
	}
	{
		string = qs(0x3c469ddb)
		texture = album_cov_08
	}
	{
		string = qs(0x4e00726a)
		texture = album_cov_09
	}
	{
		string = qs(0x0716050e)
		texture = album_cov_10
	}
	{
		string = qs(0x8bfb9d1e)
		texture = album_cov_11
	}
	{
		string = qs(0x59773dda)
		texture = album_cov_13
	}
]

script ui_create_song_extras_details 
	get_song_title song = <song>
	GetUpperCaseString <song_title>
	<song_title> = <UppercaseString>
	get_song_artist song = <song>
	GetUpperCaseString <song_artist>
	<song_artist> = <UppercaseString>
	formatText TextName = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	ui_song_extras_details_get_album_cover song = <song>
	get_all_exclusive_devices
	CreateScreenElement {
		Type = descinterface
		desc = 'Setlist_B_com'
		id = current_menu_anchor
		parent = root_window
		exclusive_device = <exclusive_device>
		song_title_text = <song_text>
		text_details_text = ($songlist_details.<song>)
		song_extras_alpha = 0
		song_details_alpha = 1
		song_lyrics_alpha = 0
		skeleton_left_pos = {relative (0.0, -50.0)}
		skeleton_right_pos = {relative (300.0, -50.0)}
		double_kick_alpha = <double_kick_alpha>
		double_kick_pos = <double_kick_pos>
		album_cov_pho_texture = <album_texture>
		event_handlers = [
			{pad_up ui_song_extras_details_scroll params = {up}}
			{pad_down ui_song_extras_details_scroll params = {down}}
			{pad_back generic_event_back params = {data = {from = song_details double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>}}}
		]
	}
	current_menu_anchor :se_getprops \{text_details_dims}
	<text_height> = (<text_details_dims>.(0.0, 1.0))
	if (<text_height> <= 500)
		current_menu_anchor :se_setprops \{setlist_scroll_container_alpha = 0}
	endif
	LaunchEvent \{Type = focus
		target = current_menu_anchor}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	current_menu_anchor :Obj_SpawnScriptNow \{song_extra_skull_a_anim}
endscript

script ui_destroy_song_extras_details 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	KillSpawnedScript \{Name = song_extra_skull_a_anim}
	clean_up_user_control_helpers
endscript

script ui_song_extras_details_scroll 
	current_menu_anchor :Obj_SpawnScriptNow ui_song_extras_details_scroll_spawned params = {<...>}
endscript

script ui_song_extras_details_scroll_spawned 
	se_getprops \{text_details_pos}
	se_getprops \{text_details_dims}
	<text_y_pos> = (<text_details_pos>.(0.0, 1.0))
	<text_height> = (<text_details_dims>.(0.0, 1.0))
	if (<text_height> <= 500)
		return
	endif
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

script ui_song_extras_details_get_album_cover 
	<album_title> = ($permanent_songlist_props.<song>.album)
	GetArraySize ($song_extras_album_covers)
	<i> = 0
	begin
	if (<album_title> = ($song_extras_album_covers [<i>].string))
		return album_texture = ($song_extras_album_covers [<i>].texture)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{album_texture = album_cov_default}
endscript

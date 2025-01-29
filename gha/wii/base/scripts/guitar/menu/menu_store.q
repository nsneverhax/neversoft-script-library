store_menu_font = fontgrid_title_gh3
soundcheck_in_store = 0
0x604af81d = 0
store_camera_props = {
	main_store_menu = {
		LockTo = World
		Pos = (27.390575, 0.374346, 10.101139)
		Quat = (-0.0021890001, 0.997191, 0.032329)
		FOV = 72.0
	}
	guitar_selection = {
		LockTo = World
		Pos = (28.865236, 1.268629, 4.0361786)
		Quat = (-0.00024999998, 0.99804497, 0.062374)
		FOV = 90.0
	}
	song_selection = {
		LockTo = World
		Pos = (28.884464, 0.36025903, 6.658622)
		Quat = (-0.0062340004, 0.75204396, 0.007113)
		FOV = 72.0
	}
	outfits_selection = {
		LockTo = World
		Pos = (27.805117, 0.434748, 6.3148026)
		Quat = (0.011856999, -0.834623, 0.017981)
		FOV = 72.0
	}
}
current_store_camera_prop = None
target_store_camera_prop = None
store_camera_changing = 0
store_view_cam_created = 0
0xc4ce7639 = 0

script store_camera_script 
	Change \{current_store_camera_prop = main_store_menu}
	CCam_DoMorph {
		($store_camera_props.main_store_menu)
	}
	begin
	if NOT ($current_store_camera_prop = $target_store_camera_prop)
		Change \{store_camera_changing = 1}
		Wait \{0.5
			Seconds}
		CCam_DoMorph {
			($store_camera_props.($target_store_camera_prop))
			time = 1.0
			motion = smooth
		}
		Change current_store_camera_prop = ($target_store_camera_prop)
		Change \{store_camera_changing = 0}
	endif
	WaitOneGameFrame
	repeat
endscript

script store_camera_wait 
	Wait \{5
		gameframes}
	begin
	if ($store_camera_changing = 0)
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script create_store_window_frame Pos = (0.0, 0.0) dims = (128.0, 128.0) hilite_pos = (0.0, 0.0) hilite_off = (5.0, 0.0) hilite_dims = (125.0, 10.0) frame_rgba = (($g_menu_colors).frame_rgba) z = 10
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = store_frame_container}
	frame_dims = (348.0, 575.0)
	center_pos = (895.0, 320.0)
	create_ui_frame {
		parent = store_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = <frame_rgba>
		fill_rgba = (($g_menu_colors).fill_rgba)
		z_priority = (<z> - 1)
	}
	footer_dims = ((<frame_dims>.(1.0, 0.0) * (0.75, 0.0)) + (0.0, 128.0))
	footer_pos = (<center_pos> + (<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - ((<footer_dims>.(0.0, 1.0)) * (0.0, 0.5)))
	CreateScreenElement {
		Type = SpriteElement
		parent = store_frame_container
		Pos = <footer_pos>
		dims = <footer_dims>
		just = [center center]
		texture = store_frame_bottom_bg
		z_priority = (<z> + 50)
		rgba = (($g_menu_colors).lt_violet_grey)
	}
	if NOT GotParam \{no_hilite}
		CreateScreenElement {
			Type = ContainerElement
			parent = store_frame_container
			id = store_hilite_container
			Pos = <hilite_pos>
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = store_hilite_container
			texture = hilite_bar_01
			dims = <hilite_dims>
			z_priority = (<z> + 3)
			rgba = (($g_menu_colors).md_violet_grey)
			just = [center center]
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = store_hilite_container
			texture = character_hub_hilite_bookend
			Pos = (<hilite_dims>.(1.0, 0.0) * (0.5, 0.0) - <hilite_off>)
			dims = (40.0, 43.0)
			z_priority = (<z> + 2)
			rgba = (($g_menu_colors).md_violet_grey)
			just = [left center]
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = store_hilite_container
			texture = character_hub_hilite_bookend
			Pos = ((<hilite_dims>.(-1.0, 0.0) * (0.5, 0.0)) + <hilite_off>)
			dims = (40.0, 43.0)
			z_priority = (<z> + 2)
			rgba = (($g_menu_colors).md_violet_grey)
			just = [right center]
			flip_v
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		CreateScreenElement {
			Type = SpriteElement
			parent = store_frame_container
			Pos = <header_pos>
			id = frame_header_01
			just = [center bottom]
			texture = window_header_01
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = <z>
		}
	else
		box_pos = (<Pos> - (<dims>.(0.0, 1.0)) * (0.0, 0.5) + (-5.0, 90.0))
		box_dims = ((<dims>.(1.0, 0.0) * (1.0, 0.0)) + (0.0, 128.0))
		CreateScreenElement {
			Type = SpriteElement
			parent = store_frame_container
			texture = Char_Select_Frame_BG
			Pos = <box_pos>
			dims = <box_dims>
			z_priority = (<z> + 3)
			rgba = (($g_menu_colors).lt_violet_grey)
			just = [center center]
		}
	endif
endscript

script destroy_store_window_frame 
	destroy_menu \{menu_id = store_frame_container}
endscript
store_saved_guitar_id = None

script create_store_menu 
	mark_unsafe_for_shutdown
	SpawnScriptNow \{menu_music_on
		params = {
			setflag = 1
		}}
	Change \{rich_presence_context = presence_store}
	Change \{soundcheck_in_store = 1}
	Change \{generic_select_monitor_p1_changed = 0}
	if ($store_view_cam_created = 0)
		Change store_saved_guitar_id = ($player1_status.instrument_id)
		get_initial_outfit_reference
		Change structurename = player1_status style = <reference>
		unload_band
		destroy_bg_viewport
		setup_bg_viewport
		Change \{store_view_cam_created = 1}
	endif
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	SetScreenElementProps \{id = store_cash_text
		Pos = (890.0, 535.0)}
	hilite_pos = [
		(897.0, 155.0)
		(897.0, 204.0)
		(897.0, 254.0)
		(897.0, 303.0)
		(897.0, 352.0)
		(897.0, 402.0)
		(897.0, 450.0)
		(897.0, 456.0)
	]
	create_store_window_frame Pos = (900.0, 360.0) hilite_pos = (<hilite_pos> [0]) dims = (300.0, 512.0) hilite_dims = (335.0, 40.0)
	back_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back menu_store_go_back}
	]
	getlanguage
	switch <language>
		case language_french
		menu_pos = (788.0, 90.0)
		case language_german
		case language_spanish
		case language_italian
		default
		menu_pos = (766.0, 90.0)
	endswitch
	new_menu {
		scrollid = ms_scroll
		vmenuid = ms_vmenu
		menu_pos = <menu_pos>
		event_handlers = <back_handlers>
		z = 50
		spacing = -4
		focus_color = pink
		unfocus_color = dk_violet_grey
	}
	text_params = {
		parent = ms_vmenu
		Type = TextElement
		font = ($store_menu_font)
		rgba = ($menu_unfocus_color)
		no_shadow
		Scale = 1.2667
	}
	CreateScreenElement {
		<text_params>
		text = 'GUITARS'
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [0])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_guitars}}
			{pad_L3 store_debug_givebandcash}
			{pad_left store_debug_givebandcash}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 270)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
	endif
	CreateScreenElement {
		<text_params>
		text = 'FINISHES'
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [1])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_finishes}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 270)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
	endif
	CreateScreenElement {
		<text_params>
		text = 'SONGS'
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [2])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_songs}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 270)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
	endif
	CreateScreenElement {
		<text_params>
		text = 'CHARACTERS'
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [3])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_characters}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 270)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
	endif
	CreateScreenElement {
		<text_params>
		text = 'OUTFITS'
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [4])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_outfits}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 270)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
	endif
	CreateScreenElement {
		<text_params>
		text = 'STYLES'
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [5])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_styles}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 270)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
	endif
	last_hilite_index = 7
	GetPlatform
	show_videos = 1
	if NOT English
		if (<Platform> = PS3)
			<show_videos> = 0
		endif
	endif
	if (<show_videos> = 1)
		CreateScreenElement {
			<text_params>
			text = 'VIDEOS'
			event_handlers = [
				{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [6])}}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_videos}}
				{pad_L3 store_debug_givebandcash}
			]
		}
		GetScreenElementDims id = <id>
		if (<width> > 270)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = (250.0, 60.0)
		endif
	else
		<last_hilite_index> = 6
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
	if ($0xc4ce7639 = 0)
		PlayIGCCam \{Name = store_view_cam
			viewport = bg_viewport
			controlscript = store_camera_script
			play_hold = 1}
		Change \{0xc4ce7639 = 1}
	endif
	Change \{target_store_camera_prop = main_store_menu}
	store_camera_wait
	mark_safe_for_shutdown
endscript

script menu_store_focus 
	retail_menu_focus
	if ScreenElementExists \{id = store_hilite_container}
		store_hilite_container :DoMorph Pos = <hilite_pos> time = 0.05 motion = ease_out
	endif
endscript

script menu_store_go_back 
	KillCamAnim \{Name = store_view_cam}
	Change \{store_view_cam_created = 0}
	Change \{0xc4ce7639 = 0}
	clean_up_user_control_helpers
	Change \{soundcheck_in_store = 0}
	Change structurename = player1_status instrument_id = ($store_saved_guitar_id)
	formatText \{checksumName = player_status
		'player%i_status'
		i = 1}
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = 1 AddToStringLookup = true
		if GetGlobalTags <characterguitartags> noassert = 1
			Change structurename = <player_status> outfit = <current_outfit>
			Change structurename = <player_status> style = <current_style>
			formatText \{checksumName = change_flag
				'generic_select_monitor_p%i_changed'
				i = 1}
			Change GlobalName = <change_flag> NewValue = 1
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		menu_flow_go_back
	else
		if ScreenElementExists \{id = Dummy_container}
			DestroyScreenElement \{id = Dummy_container}
		endif
	endif
endscript

script destroy_store_menu 
	destroy_store_window_frame
	destroy_menu \{menu_id = ms_scroll}
	shut_down_store_hub
endscript

script setup_store_hub \{cash_pos = (0.0, 0.0)}
	if ViewportExists \{id = UI}
		SetViewportProperties \{viewport = UI
			Active = FALSE}
	endif
	Change \{game_mode = p1_career}
	destroy_crowd_models
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		if NOT (<pakname> = 'z_soundcheck')
			ResetWaypoints
			SetPakManCurrentBlock \{map = zones
				pak = z_soundcheck
				block_scripts = 1}
		endif
	else
		ResetWaypoints
		SetPakManCurrentBlock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
	endif
	disable_pause
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		id = store_container}
	CreateScreenElement {
		Type = TextElement
		Pos = <cash_pos>
		parent = store_container
		font = text_a4
		text = ''
		id = store_cash_text
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 61
		just = [center center]
		Scale = 1.4
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).black)
	}
	store_update_band_cash
	store_hide_already_owned
endscript

script shut_down_store_hub 
	destroy_band \{unload_paks}
	destroy_menu \{menu_id = store_container}
	if ViewportExists \{id = UI}
		SetViewportProperties \{viewport = UI
			Active = true}
	endif
endscript

script store_update_band_cash 
	get_current_band_info
	GetGlobalTags <band_info>
	formatText TextName = user_cash_amount '$%d' d = (<cash>) usecommas
	SetScreenElementProps {
		id = store_cash_text
		text = (<user_cash_amount>)
	}
	GetScreenElementDims \{id = store_cash_text}
	fit_text_in_rectangle id = store_cash_text dims = ((175.0, 0.0) + (<height> * (0.0, 1.0))) only_if_larger_x = 1
	Achievement_CheckBuyAchievements
endscript

script set_store_purchase_price \{price = 0}
	if ScreenElementExists \{id = store_price_tag_text}
		formatText TextName = price_text '$%d' d = (<price>)
		store_price_tag_text :SetProps text = <price_text>
		store_price_tag_text :SetTags tag_price = <price>
	endif
endscript

script create_store_songs_menu 
	mark_unsafe_for_shutdown
	menu_music_off \{setflag = 1}
	Change \{target_store_camera_prop = song_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	LoadPak \{'pak/album_covers/album_covers.pak'}
	SetScreenElementProps \{id = store_cash_text
		Pos = (890.0, 535.0)}
	create_store_window_frame \{Pos = (900.0, 350.0)
		dims = (370.0, 600.0)
		no_hilite}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = select_guitar_container
		Pos = (893.0, -100.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = store_songs_container
		Pos = (900.0, 210.0)}
	CreateScreenElement {
		Type = WindowElement
		parent = root_window
		id = store_info_scroll_window
		Pos = ($store_window_pos + (0.0, 60.0))
		dims = ($store_window_dims - (0.0, 80.0))
	}
	new_menu \{scrollid = ss_scroll
		vmenuid = ss_vmenu}
	text_params = {
		parent = ss_vmenu
		Type = TextElement
		font = ($store_menu_font)
		rgba = (($g_menu_colors).black)
		z_priority = 50
		Scale = 1.333
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
	}
	CreateScreenElement {
		<text_params>
		text = ''
		event_handlers = [
			{pad_left store_songs_right}
			{pad_right store_songs_left}
			{pad_down store_songs_right}
			{pad_up store_songs_left}
			{pad_choose store_songs_buy}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		id = store_songs_menu_holder
	}
	CreateScreenElement {
		Type = TextElement
		parent = store_songs_container
		just = [center center]
		font = ($store_menu_font)
		text = ''
		Scale = 1.333
		id = store_song_artist
		rgba = (($g_menu_colors).black)
		z_priority = (<text_params>.z_priority)
		Pos = (-5.0, -83.0)
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = store_songs_container
		just = [center center]
		font = text_a6
		text = ''
		Scale = 0.85
		dims = (300.0, 180.0)
		Pos = (-5.0, 15.0)
		id = store_song_title
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = (<text_params>.z_priority)
	}
	CreateScreenElement \{Type = SpriteElement
		parent = store_songs_container
		just = [
			center
			center
		]
		texture = store_song_record_frame
		Pos = (-505.0, 127.0)
		dims = (300.0, 295.0)
		id = store_songs_album_frame
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = store_songs_container
		just = [
			center
			center
		]
		Pos = (-512.0, 128.0)
		dims = (256.0, 256.0)
		id = store_songs_album_cover
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		parent = store_songs_container
		texture = Char_Select_Hilite1
		Pos = (-460.0, 128.0)
		dims = (730.0, 500.0)
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 0
	}
	CreateScreenElement \{Type = SpriteElement
		parent = store_songs_container
		texture = store_song_45
		Pos = (-380.0, 128.0)
		id = store_songs_album_45
		z_priority = 1}
	RunScriptOnScreenElement \{id = store_songs_album_45
		rotate_element_360
		params = {
			id = store_songs_album_45
			time = 2
		}}
	store_show_price_tag \{Pos = (520.0, 160.0)
		rot = -10}
	LaunchEvent \{Type = unfocus
		target = ss_vmenu}
	LaunchEvent \{Type = focus
		target = store_songs_menu_holder}
	store_show_already_owned
	Change \{current_setlist_songpreview = None}
	set_store_song_title \{index = 0}
	Change \{0x604af81d = 1}
	SpawnScriptLater \{setlist_songpreview_monitor}
	mark_safe_for_shutdown
endscript

script destroy_store_songs_menu 
	unpausespawnedscript \{setlist_songpreview_monitor}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	KillSpawnedScript \{Name = setlist_songpreview_monitor}
	if NOT ($current_setlist_songpreview = None)
		get_song_prefix song = ($current_setlist_songpreview)
		formatText checksumName = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		SongUnLoadFSBIfDownloaded
	endif
	destroy_store_price_tag
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = store_songs_container}
	destroy_menu \{menu_id = ss_scroll}
	destroy_store_window_frame
	shut_down_store_hub
	UnLoadPak \{'pak/album_covers/album_covers.pak'}
endscript

script store_scroll_info \{scroll_time = 20
		info_block_text = 'NO TEXT AVAILABLE.'}
	destroy_menu \{menu_id = store_info_block_text_id}
	CreateScreenElement {
		Type = TextBlockElement
		id = store_info_block_text_id
		parent = <parent>
		just = [left top]
		internal_just = [left top]
		Pos = (0.0, 0.0)
		Scale = (0.58, 0.6)
		text = <info_block_text>
		font = text_a5
		rgba = (($g_menu_colors).md_violet_grey)
		z_priority = <z>
		dims = <dims>
		line_spacing = 1.25
	}
	<this_ID> = <id>
	GetScreenElementDims id = <id>
	end_pos = (<height> * (0.0, -1.5))
	begin
	Wait \{5
		Seconds}
	DoScreenElementMorph id = <this_ID> Pos = <end_pos> time = <scroll_time>
	Wait (<scroll_time> * 0.8) Seconds
	SetScreenElementProps id = <this_ID> Pos = (0.0, 0.0)
	repeat
endscript

script find_bonus_info 
	array = Bonus_Songs_Info
	if GotParam \{guitar}
		ScriptAssert \{'Shouldn\'t be calling this function (find_bonus_info) for guitars!'}
	elseif GotParam \{character}
		array = Bonus_Characters_Info
	endif
	GetArraySize ($<array>)
	i = 0
	begin
	if (<item_checksum> = ((($<array>) [<i>]).item))
		return info_index = <i> true
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script menu_store_find_guitar_index_for_blurb 
	<i> = 0
	GetArraySize ($musician_instrument)
	begin
	if (<id> = (($musician_instrument [<i>]).desc_id))
		return guitar_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script set_store_song_title \{index = 0}
	store_hide_already_owned
	get_progression_globals game_mode = ($game_mode) Bonus
	store_song_artist :SetTags song_index = <index>
	song_checksum = ($<tier_global>.tier1.songs [<index>])
	find_bonus_info item_checksum = <song_checksum> song
	select_guitar_change_blurb_text text = ($Bonus_Songs_Info [<info_index>].text) x_dims = 362 Pos = (-125.0, 375.0) z = 50
	album_texture = ($Bonus_Songs_Info [<info_index>].album_cover)
	store_songs_album_cover :SetProps texture = <album_texture>
	get_song_title song = (<song_checksum>)
	SetScreenElementProps {
		id = store_song_title
		text = (<song_title>)
	}
	get_song_artist song = (<song_checksum>) with_year = 0
	GetUpperCaseString <song_artist>
	song_artist = <UppercaseString>
	SetScreenElementProps {
		id = store_song_artist
		text = (<song_artist>)
	}
	store_song_artist :SetProps \{Scale = (1.0, 1.0)
		relative_scale}
	GetScreenElementDims \{id = store_song_artist}
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_song_artist :SetProps Scale = <new_scale> relative_scale
	endif
	song_price = ($store_song_data.<song_checksum>.price)
	set_store_purchase_price price = (<song_price>)
	formatText checksumName = bonus_song_checksum '%p_song%i_tier%s' p = 'bonus' i = (<index> + 1) s = 1
	GetGlobalTags <song_checksum>
	if (<unlocked> = 1)
		store_show_already_owned
	endif
	KillSpawnedScript \{Name = 0xc61941d5}
	SpawnScriptNow \{0xc61941d5}
	Change target_setlist_songpreview = <song_checksum>
endscript

script store_songs_left 
	if ScreenElementExists \{id = store_songs_album_45}
		store_songs_album_45 :DoMorph rot_angle = RandomRange (180.0, -30.0)
		RunScriptOnScreenElement \{id = store_songs_album_45
			rotate_element_360
			params = {
				id = store_songs_album_45
				time = 2
				element_angle = -360
			}}
	endif
	store_song_artist :GetTags
	get_progression_globals game_mode = ($game_mode) Bonus
	GetArraySize ($<tier_global>.tier1.songs)
	<song_index> = (<song_index> - 1)
	if (<song_index> < 0)
		<song_index> = (<song_index> + <array_Size>)
	endif
	song_checksum = ($<tier_global>.tier1.songs [<song_index>])
	if NOT find_bonus_info item_checksum = <song_checksum> song
		store_song_artist :SetTags song_index = <song_index>
		store_songs_left
		return
	endif
	if (<song_index> < 0)
		<song_index> = (<song_index> + <array_Size>)
	endif
	generic_menu_up_or_down_sound \{up}
	set_store_song_title index = (<song_index>)
endscript

script store_songs_right 
	if ScreenElementExists \{id = store_songs_album_45}
		store_songs_album_45 :DoMorph rot_angle = RandomRange (30.0, 180.0)
		RunScriptOnScreenElement \{id = store_songs_album_45
			rotate_element_360
			params = {
				id = store_songs_album_45
				time = 2
			}}
	endif
	store_song_artist :GetTags
	get_progression_globals game_mode = ($game_mode) Bonus
	GetArraySize ($<tier_global>.tier1.songs)
	<song_index> = (<song_index> + 1)
	if (<song_index> = <array_Size>)
		<song_index> = 0
	endif
	song_checksum = ($<tier_global>.tier1.songs [<song_index>])
	if NOT find_bonus_info item_checksum = <song_checksum> song
		store_song_artist :SetTags song_index = <song_index>
		store_songs_right
		return
	endif
	if (<song_index> = <array_Size>)
		<song_index> = 0
	endif
	generic_menu_up_or_down_sound \{down}
	set_store_song_title index = (<song_index>)
endscript

script store_songs_buy 
	store_song_artist :GetTags
	get_progression_globals game_mode = ($game_mode) Bonus
	song_checksum = ($<tier_global>.tier1.songs [<song_index>])
	formatText checksumName = bonus_song_checksum '%p_song%i_tier%s' p = 'bonus' i = (<song_index> + 1) s = 1
	GetGlobalTags <song_checksum>
	if (<unlocked> = 0)
		get_current_band_info
		GetGlobalTags <band_info>
		song_price = ($store_song_data.<song_checksum>.price)
		if ((<cash> > <song_price>) || (<cash> = <song_price>))
			<cash> = (<cash> - <song_price>)
			SetGlobalTags <band_info> params = {cash = <cash>}
			SetGlobalTags <bonus_song_checksum> params = {unlocked = 1}
			SetGlobalTags <song_checksum> params = {unlocked = 1}
			progression_push_current \{force_gamemode = p1_career}
			SetGlobalTags <bonus_song_checksum> params = {unlocked = 1}
			SetGlobalTags <song_checksum> params = {unlocked = 1}
			progression_pop_current \{force_gamemode = p1_career}
			store_update_band_cash
			set_store_song_title index = (<song_index>)
			Change \{store_autosave_required = 1}
			SoundEvent \{event = Cash_Sound}
		endif
	endif
endscript
store_character_original_id_p1 = None
store_character_original_outfit_id_p1 = 0
store_character_original_style_id_p1 = 0

script create_store_character_menu \{for_outfits = 0
		for_styles = 0}
	SetScreenElementProps \{id = store_cash_text
		Pos = (890.0, 535.0)}
	create_store_window_frame \{Pos = (900.0, 350.0)
		dims = (370.0, 600.0)
		no_hilite}
	menu_pos = (760.0, 75.0)
	if (<for_outfits> = 1)
		<menu_pos> = (773.0, 77.0)
	endif
	if (<for_styles> = 1)
		<menu_pos> = (834.0, 77.0)
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = select_guitar_container
		Pos = (893.0, -100.0)}
	CreateScreenElement \{Type = WindowElement
		parent = root_window
		id = store_info_scroll_window
		Pos = $store_window_pos
		dims = $store_window_dims}
	new_menu scrollid = cs_scroll vmenuid = cs_vmenu menu_pos = <menu_pos>
	CreateScreenElement {
		parent = cs_vmenu
		Type = TextElement
		font = text_a4
		rgba = (($g_menu_colors).black)
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
		just = [center center]
		Scale = 1.1
		text = 'empty'
		id = character_name_text
		event_handlers = [
			{pad_back store_go_back}
			{pad_right store_next_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_down store_next_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_left store_previous_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_up store_previous_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_choose store_buy_character}
		]
	}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = Dummy_container
		Pos = (894.0, 152.0)}
	CreateScreenElement {
		parent = Dummy_container
		id = cs_text_field_2
		Type = TextElement
		font = text_a4
		Scale = 0.65000004
		rgba = (($g_menu_colors).grey45)
		z_priority = 50
		no_shadow
		just = [center center]
	}
	LaunchEvent \{Type = unfocus
		target = cs_vmenu}
	LaunchEvent \{Type = focus
		target = character_name_text}
	store_show_price_tag \{Pos = (580.0, 400.0)
		rot = -15}
endscript

script store_go_back 
	if NOT ($generic_select_monitor_p1_changed = 0)
		return
	endif
	if NOT ($store_guitar_loading = 0)
		return
	endif
	if ScreenElementExists \{id = Dummy_container}
		DestroyScreenElement \{id = Dummy_container}
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_store_characters_menu 
	mark_unsafe_for_shutdown
	Change store_character_original_id_p1 = ($player1_status.character_id)
	Change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	Change store_character_original_style_id_p1 = ($player1_status.style)
	Change \{target_store_camera_prop = outfits_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	create_store_character_menu
	character_name_text :SetTags \{current_character = -1}
	character_name_text :SetTags \{last_character_change = 0}
	character_name_text :SetTags \{goal_character = 0}
	character_name_text :SetTags character_array = ($Secret_Characters)
	store_update_already_bought_for_character
	store_get_name_from_id character_id = ($Secret_Characters [0].id)
	set_store_purchase_price price = ($Secret_Characters [0].price)
	formatText checksumName = character_id '%s' s = <character_name>
	Change structurename = player1_status character_id = <character_id>
	Change \{structurename = guitarist_info
		stance = stance_frontend}
	Change \{structurename = guitarist_info
		next_stance = stance_frontend}
	Change \{structurename = guitarist_info
		current_anim = Idle}
	Change \{structurename = guitarist_info
		cycle_anim = true}
	Change \{structurename = guitarist_info
		next_anim = None}
	Change \{structurename = bassist_info
		stance = stance_frontend}
	Change \{structurename = bassist_info
		next_stance = stance_frontend}
	Change \{structurename = bassist_info
		current_anim = Idle}
	Change \{structurename = bassist_info
		cycle_anim = true}
	Change \{structurename = bassist_info
		next_anim = None}
	Change \{store_shadow_character = 1}
	Change \{store_shadow_change = 1}
	SpawnScriptNow \{monitor_store_shadow_character}
	store_show_character character_index = 0 character_id = ($Secret_Characters [0].id) for_outfits = 0
	SpawnScriptNow \{generic_select_monitor
		params = {
			Player = 1
			player_status = player1_status
			change_flag = generic_select_monitor_p1_changed
			Name = GUITARIST
			node_flags = {
				node_name = Z_SoundCheck_TRG_Waypoint_Character_Start
			}
		}}
	WaitOneGameFrame
	store_next_character
	store_previous_character
	mark_safe_for_shutdown
endscript

script destroy_store_characters_menu 
	shut_down_store_hub
	KillSpawnedScript \{Name = monitor_store_shadow_character}
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_store_window_frame
	destroy_menu \{menu_id = cs_scroll}
	destroy_menu \{menu_id = character_name_text}
	generic_select_monitor_finish
	Change \{structurename = player1_status
		character_id = $store_character_original_id_p1}
	Change \{structurename = player1_status
		outfit = $store_character_original_outfit_id_p1}
	Change \{structurename = player1_status
		style = $store_character_original_style_id_p1}
endscript

script create_store_outfits_menu 
	mark_unsafe_for_shutdown
	Change store_character_original_id_p1 = ($player1_status.character_id)
	Change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	Change \{target_store_camera_prop = outfits_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	store_build_character_outfit_name profile_name = ($Bonus_Outfits [0].profile_name) character_id = ($Bonus_Outfits [0].id)
	set_store_purchase_price price = ($Bonus_Outfits [0].price)
	store_get_outfit_name_from_id character_id = ($Bonus_Outfits [0].id)
	formatText checksumName = character_id '%s' s = <character_name>
	Change structurename = player1_status character_id = <character_id>
	Change \{structurename = guitarist_info
		stance = stance_frontend}
	Change \{structurename = guitarist_info
		next_stance = stance_frontend}
	Change \{structurename = guitarist_info
		current_anim = Idle}
	Change \{structurename = guitarist_info
		cycle_anim = true}
	Change \{structurename = guitarist_info
		next_anim = None}
	EnableLightGroup \{Name = Guitar_Center_Band}
	create_store_character_menu \{for_outfits = 1}
	character_name_text :SetTags \{current_character = -1}
	character_name_text :SetTags \{last_character_change = 0}
	character_name_text :SetTags \{goal_character = 0}
	character_name_text :SetTags character_array = ($Bonus_Outfits)
	store_update_already_bought_for_character
	store_show_character {
		character_index = 0
		character_id = ($Bonus_Outfits [0].id)
		for_outfits = 1
	}
	SpawnScriptNow \{generic_select_monitor
		params = {
			Player = 1
			player_status = player1_status
			change_flag = generic_select_monitor_p1_changed
			Name = GUITARIST
			for_outfits = 1
			node_flags = {
				node_name = Z_SoundCheck_TRG_Waypoint_Character_Start
			}
		}}
	WaitOneGameFrame
	store_next_character \{for_outfits = 1}
	store_previous_character \{for_outfits = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_outfits_menu 
	shut_down_store_hub
	KillSpawnedScript \{Name = monitor_store_shadow_character}
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = cs_scroll}
	destroy_store_window_frame
	destroy_menu \{menu_id = character_name_text}
	generic_select_monitor_finish
	Change \{structurename = player1_status
		character_id = $store_character_original_id_p1}
	Change \{structurename = player1_status
		outfit = $store_character_original_outfit_id_p1}
endscript

script create_store_styles_menu 
	mark_unsafe_for_shutdown
	Change store_character_original_id_p1 = ($player1_status.character_id)
	Change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	Change store_character_original_style_id_p1 = ($player1_status.style)
	Change \{target_store_camera_prop = outfits_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	store_prune_styles_array
	store_build_character_outfit_name profile_name = (<styles_array> [0].profile_name) character_id = (<styles_array> [0].id)
	set_store_purchase_price price = (<styles_array> [0].price)
	store_get_outfit_name_from_id character_id = (<styles_array> [0].id) array = <styles_array>
	formatText checksumName = character_id '%s' s = <character_name>
	Change structurename = player1_status character_id = <character_id>
	create_store_character_menu \{for_outfits = 1
		for_styles = 1}
	character_name_text :SetTags \{current_character = -1}
	character_name_text :SetTags \{last_character_change = 0}
	character_name_text :SetTags \{goal_character = 0}
	character_name_text :SetTags character_array = <styles_array>
	EnableLightGroup \{Name = Guitar_Center_Band}
	store_update_already_bought_for_character
	store_show_character {
		character_index = 0
		character_id = ((<styles_array> [0]).id)
		for_outfits = 1
		for_styles = 1
	}
	SpawnScriptNow \{generic_select_monitor
		params = {
			Player = 1
			player_status = player1_status
			change_flag = generic_select_monitor_p1_changed
			Name = GUITARIST
			for_outfits = 1
			node_flags = {
				node_name = Z_SoundCheck_TRG_Waypoint_Character_Start
			}
		}}
	WaitOneGameFrame
	store_next_character \{for_outfits = 1
		for_styles = 1}
	store_previous_character \{for_outfits = 1
		for_styles = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_styles_menu 
	shut_down_store_hub
	KillSpawnedScript \{Name = monitor_store_shadow_character}
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = cs_scroll}
	destroy_store_window_frame
	destroy_menu \{menu_id = character_name_text}
	generic_select_monitor_finish
	Change \{structurename = player1_status
		character_id = $store_character_original_id_p1}
	Change \{structurename = player1_status
		outfit = $store_character_original_outfit_id_p1}
	Change \{structurename = player1_status
		style = $store_character_original_style_id_p1}
endscript

script store_get_name_from_id 
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<character_id> = (<profile_struct>.musician_body.desc_id))
		return character_name = (<profile_struct>.Name) character_full_name = (<profile_struct>.fullname)
	endif
	<index> = (<index> + 1)
	repeat <array_Size>

	ScriptAssert \{'Entry not found!'}
endscript

script store_get_outfit_name_from_id \{array = $Bonus_Outfits}
	GetArraySize (<array>)
	index = 0
	begin
	if (<character_id> = (<array> [<index>].id))
		return character_name = (<array> [<index>].profile_name)
	endif
	<index> = (<index> + 1)
	repeat <array_Size>

	ScriptAssert \{'Entry not found!'}
endscript

script store_buy_character 
	character_name_text :GetTags
	character_id = (<character_array> [<goal_character>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		price = (<character_array> [<goal_character>].price)
		get_current_band_info
		GetGlobalTags <band_info>
		if (<character_id> = Guitarist_satan_Outfit2_Style1)
			GetGlobalTags \{Guitarist_satan_Outfit1_Style1}
			if NOT (<unlocked> = 1)
				return
			endif
		endif
		if ((<cash> > <price>) || (<cash> = <price>))
			<cash> = (<cash> - <price>)
			SetGlobalTags <band_info> params = {cash = <cash>}
			SetGlobalTags <character_id> params = {unlocked = 1}
			GetArraySize \{$Musician_Profiles}
			<i> = 0
			begin
			if (($Musician_Profiles [<i>].musician_body.desc_id) = <character_id>)
				<guitar_id> = ($Musician_Profiles [<i>].musician_instrument.desc_id)
				SetGlobalTags <guitar_id> params = {unlocked = 1}
				break
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			store_update_band_cash
			store_update_already_bought_for_character
			Change \{store_autosave_required = 1}
			SoundEvent \{event = Cash_Sound}
			Change \{store_shadow_change = 1}
			Change \{store_shadow_character = 0}
		endif
	endif
endscript

script monitor_store_shadow_character 
	begin
	if ($store_shadow_change = 1)
		if ($store_shadow_character = 1)
			DisableLightGroup \{Name = Guitar_Center_Band}
		else
			EnableLightGroup \{Name = Guitar_Center_Band}
		endif
		Change \{store_shadow_change = 0}
	endif
	WaitOneGameFrame
	repeat
endscript
store_shadow_character = 1
store_shadow_change = 1

script store_update_already_bought_for_character 
	character_name_text :GetTags
	character_id = (<character_array> [<goal_character>].id)
	GetGlobalTags <character_id>
	if (<unlocked>)
		Change \{store_shadow_character = 0}
		store_show_already_owned unlocked_for_purchase = <unlocked_for_purchase> for_character = 1
	else
		Change \{store_shadow_character = 1}
		store_hide_already_owned \{for_character = 1}
	endif
endscript

script get_instrument_from_character 
	GetArraySize ($Musician_Profiles)
	i = 0
	begin
	if (<Name> = ($Musician_Profiles [<i>].Name))
		return instrument_id = ($Musician_Profiles [<i>].musician_instrument.desc_id)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>

	ScriptAssert \{'Didn\'t find the character by id!'}
endscript

script store_show_character \{for_outfits = 0
		for_styles = 0}
	character_name_text :GetTags
	GetArraySize <character_array>
	if (<for_styles>)
		store_build_character_outfit_name profile_name = (<character_array> [<character_index>].profile_name) character_id = (<character_array> [<character_index>].id)
		GetUpperCaseString <outfit_name>
		outfit_name = <UppercaseString>
		SetScreenElementProps id = character_name_text text = <outfit_name>
		GetUpperCaseString <character_outfit_name>
		character_outfit_name = <UppercaseString>
		SetScreenElementProps id = cs_text_field_2 text = <character_outfit_name>
	else
		if (<for_outfits>)
			store_build_character_outfit_name profile_name = (<character_array> [<character_index>].profile_name) character_id = (<character_array> [<character_index>].id)
			GetUpperCaseString <fullname>
			fullname = <UppercaseString>
			SetScreenElementProps id = character_name_text text = <fullname>
			GetUpperCaseString <character_outfit_name>
			character_outfit_name = <UppercaseString>
			SetScreenElementProps id = cs_text_field_2 text = <character_outfit_name>
			get_initial_outfit_reference outfit2 character_id = <character_id>
			KillSpawnedScript \{Name = Store_Update_Player_Status}
			SpawnScriptNow Store_Update_Player_Status params = {style = <reference>}
		else
			store_get_name_from_id character_id = <character_id>
			GetUpperCaseString <character_full_name>
			<character_full_name> = <UppercaseString>
			SetScreenElementProps id = character_name_text text = <character_full_name> font = ($store_menu_font) Pos = (135.0, 55.0)
			formatText checksumName = character_id '%s' s = <character_name>
			get_instrument_from_character Name = <character_name>
			get_initial_outfit_reference character_id = <character_id>
			KillSpawnedScript \{Name = Store_Update_Player_Status}
			SpawnScriptNow Store_Update_Player_Status params = {character_id = <character_id>
				instrument_id = <instrument_id>
				outfit = 1
				style = <reference>
			}
		endif
	endif
	character_name_text :SetProps \{Scale = 1.1}
	GetScreenElementDims \{id = character_name_text}
	if (<width> > 350)
		new_scale = ((340.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		character_name_text :SetProps Scale = <new_scale> relative_scale
	endif
	if (<for_styles>)
		store_get_outfit_name_from_id character_id = <character_id> array = $Bonus_Styles
		formatText checksumName = character_id '%s' s = <character_name>
		get_instrument_from_character Name = <character_name>
		store_find_outfit_and_style_indices {
			profile_name = (<character_array> [<character_index>].profile_name)
			character_id = (<character_array> [<character_index>].id)
		}
		KillSpawnedScript \{Name = Store_Update_Player_Status}
		SpawnScriptNow Store_Update_Player_Status params = {character_id = <character_id>
			instrument_id = <instrument_id>
			outfit = (<outfit_index> + 1)
			style = (<style_index> + 1)}
	elseif (<for_outfits>)
		store_get_outfit_name_from_id character_id = <character_id> array = $Bonus_Outfits
		formatText checksumName = character_id '%s' s = <character_name>
		get_instrument_from_character Name = <character_name>
		get_initial_outfit_reference outfit2 character_id = <character_id>
		KillSpawnedScript \{Name = Store_Update_Player_Status}
		SpawnScriptNow Store_Update_Player_Status params = {character_id = <character_id>
			instrument_id = <instrument_id>
			outfit = <outfit_num>
			style = <reference>}
	else
	endif
	set_store_purchase_price price = (<character_array> [<character_index>].price)
	if (<for_styles>)
		select_guitar_change_blurb_text text = (<character_array> [<character_index>].blurb) x_dims = 362 Pos = (-125.0, 320.0) dims = (388.0, 300.0) z = 50
	else
		if (<for_outfits>)
			find_bonus_info item_checksum = (<character_array> [<character_index>].info_name) character
			select_guitar_change_blurb_text text = ($Bonus_Characters_Info [<info_index>].text) x_dims = 362 Pos = (-125.0, 320.0) dims = (388.0, 300.0) z = 50 lines_in_window = 9
		else
			store_find_character_blurb_by_id id = (<character_array> [<character_index>].id)
			select_guitar_change_blurb_text text = <blurb_text> x_dims = 362 Pos = (-125.0, 320.0) dims = (388.0, 300.0) z = 50
		endif
	endif
	character_name_text :SetTags goal_character = <character_index>
	character_name_text :SetTags last_character_change = <starttime>
	store_update_already_bought_for_character
endscript

script 0xd04b286d 
	begin
	WaitOneGameFrame
	if ($generic_select_monitor_p1_changed != 1)
		break
	endif
	repeat
	Store_Update_Player_Status <...>
endscript

script 0x494279d7 
	begin
	WaitOneGameFrame
	if ($generic_select_monitor_p2_changed != 1)
		break
	endif
	repeat
	Store_Update_Player_Status <...>
endscript

script Store_Update_Player_Status \{Player = 1}
	formatText checksumName = player_status 'player%p_status' p = <Player>
	formatText checksumName = generic_select_monitor_changed 'generic_select_monitor_p%p_changed' p = <Player>
	if GotParam \{character_id}
		Change structurename = <player_status> character_id = <character_id>
	endif
	if GotParam \{instrument_id}
		Change structurename = <player_status> instrument_id = <instrument_id>
	endif
	if GotParam \{outfit}
		Change structurename = <player_status> outfit = <outfit>
	endif
	if GotParam \{style}
		Change structurename = <player_status> style = <style>
	endif
	Change GlobalName = <generic_select_monitor_changed> NewValue = 1
endscript

script store_find_character_blurb_by_id 
	GetArraySize ($Musician_Profiles)
	i = 0
	begin
	if (($Musician_Profiles [<i>].musician_body.desc_id) = <id>)
		return blurb_text = ($Musician_Profiles [<i>].blurb)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>

	ScriptAssert \{'Couldn\'t find the character blurb by id!'}
endscript

script store_next_character \{for_outfits = 0
		for_styles = 0}
	GetArraySize ($Secret_Characters)
	if NOT (<array_Size> > 1)
		return
	endif
	character_name_text :GetTags
	<goal_character> = (<goal_character> + 1)
	GetArraySize <character_array>
	if (<goal_character> = <array_Size>)
		<goal_character> = 0
	endif
	unlocked_for_purchase = 1
	GetGlobalTags (<character_array> [<goal_character>].id)
	if ((<character_array> [<goal_character>].id) = Guitarist_satan_Outfit2_Style1)
		GetGlobalTags \{Guitarist_satan_Outfit1_Style1
			param = unlocked}
		<unlocked_for_purchase> = <unlocked>
	endif
	if (<unlocked_for_purchase> = 0)
		character_name_text :SetTags goal_character = <goal_character>
		store_next_character for_outfits = <for_outfits> for_styles = <for_styles>
		return
	endif
	generic_menu_up_or_down_sound
	store_show_character {
		character_index = <goal_character>
		character_id = (<character_array> [<goal_character>].id)
		for_outfits = <for_outfits>
		for_styles = <for_styles>
	}
endscript

script store_previous_character \{for_outfits = 0
		for_styles = 0}
	GetArraySize ($Secret_Characters)
	if NOT (<array_Size> > 1)
		return
	endif
	character_name_text :GetTags
	<goal_character> = (<goal_character> - 1)
	GetArraySize <character_array>
	if (<goal_character> = -1)
		<goal_character> = (<array_Size> - 1)
	endif
	unlocked_for_purchase = 1
	GetGlobalTags (<character_array> [<goal_character>].id)
	if ((<character_array> [<goal_character>].id) = Guitarist_satan_Outfit2_Style1)
		GetGlobalTags \{Guitarist_satan_Outfit1_Style1
			param = unlocked}
		<unlocked_for_purchase> = <unlocked>
	endif
	if (<unlocked_for_purchase> = 0)
		character_name_text :SetTags goal_character = <goal_character>
		store_previous_character for_outfits = <for_outfits> for_styles = <for_styles>
		return
	endif
	generic_menu_up_or_down_sound
	store_show_character {
		character_index = <goal_character>
		character_id = (<character_array> [<goal_character>].id)
		for_outfits = <for_outfits>
		for_styles = <for_styles>
	}
endscript

script store_build_character_outfit_name 
	store_find_outfit_and_style_indices profile_name = <profile_name> character_id = <character_id>
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.Name = <profile_name>)
		outfit_array = (<profile_struct>.outfits)
		<reference> = (<outfit_array> [<outfit_index>].reference [0])
		break
	endif
	<index> = (<index> + 1)
	repeat (<array_Size>)
	if NOT GotParam \{outfit_array}

		ScriptAssert \{'Couldn\'t find matching musician profile!'}
	else
		if (<style_index> = (<reference> - 1))
			outfit_name = (<outfit_array> [<outfit_index>].Name)
			formatText TextName = character_outfit_name '%o' o = <outfit_name>
			return character_outfit_name = <character_outfit_name> outfit_num = (<outfit_index> + 1) profile_name = <profile_name> fullname = (<profile_struct>.fullname)
		else
			if (<style_index> >= <reference>)
				<style_index> = (<style_index> - 1)
			endif
			outfit_name = (<outfit_array> [<outfit_index>].Name)
			formatText TextName = outfit_name '%o' o = <outfit_name>
			style_name = (<outfit_array> [<outfit_index>].styles [(<style_index> + 1)])
			formatText TextName = character_outfit_name '%o' o = <style_name>
			return outfit_name = <outfit_name> character_outfit_name = <character_outfit_name> outfit_num = (<outfit_index> + 1) profile_name = <profile_name> fullname = (<profile_struct>.fullname)
		endif
	endif
endscript

script store_find_outfit_and_style_indices 
	outfit_index = 1
	begin
	style_index = 1
	begin
	formatText checksumName = test_outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <profile_name> o = <outfit_index> s = <style_index>
	if (<test_outfit_style_cs> = <character_id>)
		return outfit_index = (<outfit_index> -1) style_index = (<style_index> -1)
	endif
	<style_index> = (<style_index> + 1)
	repeat 7
	<outfit_index> = (<outfit_index> + 1)
	repeat 2

	ScriptAssert \{'Couldn\'t figure out the outfit and style indices!'}
endscript

script store_prune_styles_array 
	styles_array = ($Bonus_Styles)
	GetArraySize (<styles_array>)
	<mod_a> = 0
	<i> = 0
	begin
	Mod a = <mod_a> b = 12
	if (((<Mod> = 0) && (<mod_a> < 96)) || (<mod_a> = 96) || (<mod_a> = 101) || (<mod_a> = 106) || (<mod_a> = 111) || (<mod_a> = 117))
		RemoveArrayElement array = (<styles_array>) index = <i>
		<styles_array> = (<array>)
		<i> = (<i> - 1)
	endif
	<mod_a> = (<mod_a> + 1)
	<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize (<styles_array>)
	index = 0
	begin
	profile_name = (<styles_array> [<index>].profile_name)
	character_id = (<styles_array> [<index>].id)
	store_find_outfit_and_style_indices profile_name = <profile_name> character_id = <character_id>
	<outfit_index> = (<outfit_index> + 1)
	<style_index> = (<style_index> + 1)
	<need_2_check> = 0
	if ((<profile_name> = 'Fowlvis') || (<profile_name> = 'Robot'))
		<need_2_check> = 1
		<style> = 7
	elseif (<profile_name> = 'Satan')
		<need_2_check> = 1
		<style> = 2
	elseif ((<profile_name> = 'TomH') || (<profile_name> = 'JoeP') || (<profile_name> = 'BradW'))
		<need_2_check> = 1
		<style> = 1
	elseif NOT (<outfit_index> = 1)
		<need_2_check> = 1
		<style> = 5
	endif
	if (<need_2_check>)
		formatText checksumName = outfit_cs 'Guitarist_%n_Outfit%o_Style%s' n = <profile_name> o = <outfit_index> s = <style>
		GetGlobalTags <outfit_cs>
		if (<unlocked> = 0)
			RemoveArrayElement array = (<styles_array>) index = <index>
			<styles_array> = (<array>)
			<index> = (<index> - 1)
		endif
	endif
	<index> = (<index> + 1)
	repeat (<array_Size>)
	return styles_array = <styles_array>
endscript

script store_debug_givebandcash \{add_cash = 1000000}
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		add_cash = <cash>
		get_current_band_info
		GetGlobalTags <band_info>
		<cash> = (<cash> + <add_cash>)
		SetGlobalTags <band_info> params = {cash = <cash>}
		SetGlobalTags \{achievement_info
			params = {
				total_cash_in_career_mode = 1000000
			}}
		Achievements_CheckCareerTotals
		destroy_store_menu
		create_store_menu
	endif
endscript
store_guitar_loaded_pak_name = ''
store_window_pos = (780.0, 240.0)
store_window_dims = (300.0, 280.0)

script create_store_guitars_menu 
	mark_unsafe_for_shutdown
	Change \{target_store_camera_prop = guitar_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	if NOT ScreenElementExists \{id = store_cash_text}
		return
	endif
	SetScreenElementProps \{id = store_cash_text
		Pos = (890.0, 535.0)}
	create_store_window_frame \{Pos = (900.0, 350.0)
		dims = (370.0, 600.0)
		no_hilite}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = select_guitar_container
		Pos = (893.0, -100.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = store_guitar_container
		Pos = (893.0, 200.0)}
	CreateScreenElement {
		Type = WindowElement
		parent = root_window
		id = store_info_scroll_window
		Pos = ($store_window_pos + (0.0, 80.0))
		dims = (50.0, 50.0)
	}
	new_menu \{scrollid = sg_scroll
		vmenuid = sg_vmenu
		menu_pos = (895.0, 117.0)}
	text_params = {
		parent = sg_vmenu
		Type = TextElement
		font = ($store_menu_font)
		rgba = (($g_menu_colors).black)
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		text = ''
		id = store_guitar_name_container
		dims = (100.0, 0.0)
		event_handlers = [
			{pad_down store_guitar_next_guitar}
			{pad_up store_guitar_previous_guitar}
			{pad_left store_guitar_previous_guitar}
			{pad_right store_guitar_next_guitar}
			{pad_choose store_guitar_buy_guitar}
			{pad_back store_go_back}
		]
	}
	CreateScreenElement {
		<text_params>
		font = text_a4
		parent = store_guitar_name_container
		id = store_guitar_name
		just = [center center]
		Pos = (0.0, 7.0)
		Scale = 1.0
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		id = store_guitar_name_brand_container
		dims = (100.0, 0.0)
	}
	CreateScreenElement {
		<text_params>
		font = text_a4
		rgba = (($g_menu_colors).grey45)
		parent = store_guitar_name_brand_container
		Scale = 0.7
		id = store_guitar_name_brand
		Pos = (0.0, 35.0)
		just = [center center]
		no_shadow
	}
	CreateScreenElement {
		Type = TextElement
		parent = store_guitar_container
		just = [center center]
		font = text_a4
		text = ''
		Scale = 0.9
		id = store_guitar_finish_name
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = (<text_params>.z_priority)
		Pos = (0.0, 16.0)
	}
	LaunchEvent \{Type = unfocus
		target = sg_vmenu}
	LaunchEvent \{Type = focus
		target = store_guitar_name_container}
	guitar_array = ($Bonus_Guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	store_guitar_name :SetTags \{guitar_index = 0}
	store_guitar_name :SetTags guitar_array = <guitar_array>
	Change \{store_true_index = -1}
	find_guitar_index_by_id id = (<guitar_array> [0].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [0].price)
	SpawnScriptNow \{store_monitor_goal_guitar_index}
	store_show_price_tag Pos = (520.0, 230.0) price = (<guitar_array> [0].price) rot = -10 z3d = 2
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb id = ((<guitar_array> [0]).id)
	Change \{store_guitar_scroll_ready = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_guitars_menu 
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_store_window_frame
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = store_guitar_container}
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = sg_scroll}
	shut_down_store_hub
	store_monitor_goal_guitar_finish
endscript

script store_guitar_buy_guitar 
	store_guitar_name :GetTags
	guitar_id = (<guitar_array> [<guitar_index>].id)
	GetGlobalTags <guitar_id>
	if ((<unlocked> = 0) && (<unlocked_for_purchase> = 1))
		guitar_price = (<guitar_array> [<guitar_index>].price)
		get_current_band_info
		GetGlobalTags <band_info>
		if ((<cash> > <guitar_price>) || (<cash> = <guitar_price>))
			<cash> = (<cash> - <guitar_price>)
			SetGlobalTags <band_info> params = {cash = <cash>}
			SetGlobalTags <guitar_id> params = {unlocked = 1}
			store_update_band_cash
			store_update_already_bought_for_guitar
			Change \{store_autosave_required = 1}
			SoundEvent \{event = Cash_Sound}
		endif
	endif
endscript
store_guitar_scroll_ready = 1

script store_guitar_previous_guitar \{for_finishes = 0}
	if ($store_guitar_scroll_ready = 0)
		return
	endif
	Change \{store_guitar_scroll_ready = 0}
	generic_menu_up_or_down_sound
	store_guitar_name :GetTags
	<guitar_index> = (<guitar_index> - 1)
	GetArraySize (<guitar_array>)
	if (<guitar_index> < 0)
		<guitar_index> = (<guitar_index> + <array_Size>)
	endif
	store_guitar_name :SetTags guitar_index = <guitar_index>
	bonus_index = <guitar_index>
	find_guitar_index_by_id id = (<guitar_array> [<bonus_index>].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [<bonus_index>].price) for_finishes = <for_finishes>
	Change \{store_guitar_scroll_ready = 1}
endscript

script store_guitar_next_guitar \{for_finishes = 0}
	if ($store_guitar_scroll_ready = 0)
		return
	endif
	Change \{store_guitar_scroll_ready = 0}
	generic_menu_up_or_down_sound
	store_guitar_name :GetTags
	<guitar_index> = (<guitar_index> + 1)
	GetArraySize (<guitar_array>)
	if (<guitar_index> = <array_Size>)
		<guitar_index> = 0
	endif
	store_guitar_name :SetTags guitar_index = <guitar_index>
	bonus_index = <guitar_index>
	find_guitar_index_by_id id = (<guitar_array> [<bonus_index>].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [<bonus_index>].price) for_finishes = <for_finishes>
	Change \{store_guitar_scroll_ready = 1}
endscript

script find_guitar_index_by_id 
	get_musician_instrument_size
	find_index = 0
	begin
	get_musician_instrument_struct index = <find_index>
	if (<info_struct>.desc_id = <id>)
		return guitar_index = (<find_index>)
	endif
	<find_index> = (<find_index> + 1)
	repeat (<array_Size>)

	ScriptAssert \{'Didn\'t find the guitar!'}
endscript
store_last_index_update = 0
store_goal_index = 0
store_true_index = -1

script store_show_guitar \{guitar_index = 0
		for_finishes = 0}
	store_update_guitar_blackout
	get_musician_instrument_struct index = <guitar_index>
	if StructureContains structure = <info_struct> Name = 0x08122deb
		GetUpperCaseString (<info_struct>.0x08122deb)
	else
		GetUpperCaseString (<info_struct>.Name)
	endif
	SetScreenElementProps id = store_guitar_name text = <UppercaseString>
	GetScreenElementDims \{id = store_guitar_name}
	store_guitar_name :SetProps \{Scale = (1.0, 1.0)
		relative_scale}
	GetScreenElementDims \{id = store_guitar_name}
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_guitar_name :SetProps Scale = <new_scale> relative_scale
	endif
	GetUpperCaseString (<info_struct>.logo)
	SetScreenElementProps id = store_guitar_name_brand text = <UppercaseString>
	if (<for_finishes> = 1)
		GetUpperCaseString (<info_struct>.finish)
	else
		GetUpperCaseString (<info_struct>.name2)
	endif
	store_guitar_finish_name :SetProps text = <UppercaseString>
	store_guitar_finish_name :SetProps \{Scale = (1.0, 1.0)
		relative_scale}
	GetScreenElementDims \{id = store_guitar_finish_name}
	if (<width> >= 250.0)
		new_scale = ((250.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_guitar_finish_name :SetProps Scale = <new_scale> relative_scale
	endif
	set_store_purchase_price price = <price>
	Change store_goal_index = <guitar_index>
	store_guitar_name :GetTags
	GetStartTime
	Change store_last_index_update = (<starttime>)
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb id = ((<guitar_array> [<guitar_index>]).id)
	select_guitar_change_blurb_text inst_ID = (($musician_instrument [<guitar_index>]).desc_id) x_dims = 362 Pos = (-125.0, 355.0) dims = (388.0, 265.0) z = 50
endscript

script store_update_guitar_blackout 
	store_guitar_name :GetTags
	guitar_id = (<guitar_array> [<guitar_index>].id)
	GetGlobalTags <guitar_id>
endscript
store_guitar_loading = 0

script store_monitor_goal_guitar_index 
	begin
	if NOT ($store_true_index = $store_goal_index)
		Change store_true_index = ($store_goal_index)
		Change \{store_guitar_loading = 1}
		store_do_guitar_load guitar_index = ($store_goal_index)
		Change \{store_guitar_loading = 0}
	endif
	WaitOneGameFrame
	repeat
endscript

script store_monitor_goal_guitar_finish 
	unpausespawnedscript \{store_monitor_goal_guitar_index}
	begin
	if ($store_guitar_loading = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{store_guitar_loading = 1}
	KillSpawnedScript \{Name = store_monitor_goal_guitar_index}
	if CompositeObjectExists \{store_display_guitar}
		store_display_guitar :Die
	endif
	UnloadPakAsync pak_name = ($store_loaded_guitar_pak) Heap = heap_instrument1 async = 1
	Change \{store_guitar_loading = 0}
endscript
store_loaded_guitar_pak = ''

script store_update_already_bought_for_guitar 
	store_guitar_name :GetTags
	guitar_id = (<guitar_array> [<guitar_index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked>)
		store_show_already_owned unlocked_for_purchase = <unlocked_for_purchase>
	else
		store_hide_already_owned
	endif
endscript

script create_store_guitar_finishes_menu 
	mark_unsafe_for_shutdown
	Change \{target_store_camera_prop = guitar_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	SetScreenElementProps \{id = store_cash_text
		Pos = (890.0, 535.0)}
	create_store_window_frame \{Pos = (900.0, 360.0)
		dims = (360.0, 618.0)
		no_hilite}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = select_guitar_container
		Pos = (893.0, -100.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = store_guitar_container
		Pos = (893.0, 200.0)}
	CreateScreenElement \{Type = WindowElement
		parent = root_window
		id = store_info_scroll_window
		Pos = $store_window_pos
		dims = $store_window_dims}
	new_menu \{scrollid = sgf_scroll
		vmenuid = sgf_vmenu
		menu_pos = (895.0, 117.0)}
	text_params = {
		parent = sgf_vmenu
		Type = TextElement
		font = ($store_menu_font)
		rgba = (($g_menu_colors).black)
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		text = ''
		id = store_guitar_name_container
		dims = (100.0, 0.0)
		event_handlers = [
			{pad_down store_guitar_next_guitar params = {for_finishes = 1}}
			{pad_up store_guitar_previous_guitar params = {for_finishes = 1}}
			{pad_left store_guitar_previous_guitar params = {for_finishes = 1}}
			{pad_right store_guitar_next_guitar params = {for_finishes = 1}}
			{pad_choose store_guitar_buy_guitar}
			{pad_back store_go_back}
		]
	}
	CreateScreenElement {
		<text_params>
		font = text_a4
		parent = store_guitar_name_container
		id = store_guitar_name
		just = [center center]
		Pos = (0.0, 7.0)
		Scale = 1.0
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		id = store_guitar_name_brand_container
		dims = (100.0, 0.0)
	}
	CreateScreenElement {
		<text_params>
		font = text_a4
		rgba = (($g_menu_colors).grey45)
		parent = store_guitar_name_brand_container
		Scale = 0.7
		id = store_guitar_name_brand
		Pos = (0.0, 35.0)
		just = [center center]
		no_shadow
	}
	CreateScreenElement {
		Type = TextElement
		parent = store_guitar_container
		just = [center center]
		font = text_a4
		text = ''
		Scale = 0.9
		id = store_guitar_finish_name
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = (<text_params>.z_priority)
		Pos = (0.0, 16.0)
	}
	LaunchEvent \{Type = unfocus
		target = sgf_vmenu}
	LaunchEvent \{Type = focus
		target = store_guitar_name_container}
	guitar_array = ($Bonus_Guitar_Finishes)
	GetArraySize ($Bonus_Bass_Finishes)
	index = 0
	begin
	AddArrayElement array = (<guitar_array>) element = ($Bonus_Bass_Finishes [<index>])
	<guitar_array> = (<array>)
	<index> = (<index> + 1)
	repeat <array_Size>
	store_prune_guitar_finishes guitar_array = <guitar_array>
	store_guitar_name :SetTags \{guitar_index = 0}
	store_guitar_name :SetTags guitar_array = <guitar_array>
	Change \{store_true_index = -1}
	find_guitar_index_by_id id = (<guitar_array> [0].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [0].price) for_finishes = 1
	SpawnScriptNow \{store_monitor_goal_guitar_index}
	store_show_price_tag Pos = (520.0, 230.0) price = (<guitar_array> [0].price) rot = -10 z3d = 2
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb id = ((<guitar_array> [0]).id)
	select_guitar_change_blurb_text inst_ID = (($musician_instrument [<guitar_index>]).desc_id) x_dims = 362 Pos = (-125.0, 355.0) dims = (388.0, 265.0) z = 50
	Change \{store_guitar_scroll_ready = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_guitar_finishes_menu 
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = store_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = sgf_scroll}
	destroy_store_window_frame
	shut_down_store_hub
	store_monitor_goal_guitar_finish
endscript

script store_add_secret_guitars_and_basses 
	GetArraySize ($Secret_Guitars)
	index = 0
	begin
	guitar_id = ($Secret_Guitars [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		AddArrayElement array = (<guitar_array>) element = ($Secret_Guitars [<index>])
		<guitar_array> = (<array>)
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize ($Bonus_Basses)
	index = 0
	begin
	AddArrayElement array = (<guitar_array>) element = ($Bonus_Basses [<index>])
	<guitar_array> = (<array>)
	<index> = (<index> + 1)
	repeat <array_Size>
	return guitar_array = <guitar_array>
endscript

script store_do_guitar_load \{Pos = (0.0, 0.0, 0.0)
		node_name = Z_SoundCheck_TRG_Waypoint_Guitar_Start}
	if GotParam \{guitar_index}
		if GotParam \{node_index}
			get_waypoint_id index = <node_index>
			GetWaypointPos Name = <waypoint_id>
		else
			if GotParam \{node_name}
				GetWaypointPos Name = <node_name>
			endif
		endif
		existed = 0
		if CompositeObjectExists \{store_display_guitar}
			if GotParam \{UseOldPos}
				store_display_guitar :Obj_GetPosition
			endif
			store_display_guitar :Die
			<existed> = 1
		endif
		guitar_pos = <Pos>
		get_musician_instrument_struct index = <guitar_index>
		unformatted_meshname = (<info_struct>.mesh)
		stringremove text = (<unformatted_meshname>) remove = 'models\\' new_string = meshname
		find_loaded_pak_file Type = instrument desc_id = (<info_struct>.desc_id)
		if (<found> = 0)
			if (<existed> = 1)
				UnloadPakAsync pak_name = ($store_loaded_guitar_pak) Heap = heap_instrument1 async = 1
			endif
			LoadPakAsync pak_name = (<info_struct>.pak) Heap = heap_instrument1 async = 1
			Change store_loaded_guitar_pak = (<info_struct>.pak)
		endif
		if GotParam \{meshname}
			Scale = 1.25
			if (<info_struct>.desc_id = Instrument_Guitar_Demonik)
				<Scale> = 0.8
				<guitar_pos> = (<guitar_pos> + (0.0, 0.15, 0.0))
			endif
			if (<info_struct>.desc_id = Instrument_Pend)
				<guitar_pos> = (<guitar_pos> - (0.0, 0.1, 0.0))
			endif
			CreateCompositeObject {
				components = [
					{
						component = Skeleton
						skeletonname = GH3_guitarist_axel
					}
					{
						component = SetDisplayMatrix
					}
					{
						component = Model
						LightGroup = Guitar_center
					}
				]
				params = {
					Pos = (<guitar_pos> + (0.6, -0.14, 0.0))
					<info_struct>
					object_type = hud_model_3d
					Name = store_display_guitar
					Model = <meshname>
					Scale = <Scale>
				}
			}
			Profile = {
				<info_struct>
				musician_instrument = {desc_id = (<info_struct>.desc_id)}
			}
			store_display_guitar :Obj_SpawnScriptNow RotateGuitar params = {guitar_pos = <guitar_pos> Scale = (<Scale> / 1.25)}
		endif
	endif
endscript

script RotateGuitar 
	Type = t_bounce
	<allow_pause> = 1
	<speed> = 1.0
	Pos = (<guitar_pos> + (0.0, -0.14, 0.2))
	rotation = -75.0
	<rotate_left> = 1
	<rotate_right> = 0
	<rot_amount> = 1.0
	<acceleration> = 0.0
	begin
	vrotate = ((0.0, 0.0, 0.53) * <Scale>)
	RotateVector vector = <vrotate> ry = (90 - <rotation>)
	store_display_guitar :Obj_SetOrientation z = -90 X = <rotation>
	store_display_guitar :Obj_SetPosition position = (<Pos> + <result_vector>)
	if (<Type> = t_bounce)
		if (<rot_amount> > 1.0)
			<rot_amount> = 1.0
		elseif (<rot_amount> < -1.0)
			<rot_amount> = -1.0
		endif
		if ((<rotation> > 0.0) && <rotate_left>)
			<acceleration> = -0.025
		elseif ((<rotation> < -30.0) && <rotate_right>)
			<acceleration> = 0.025
		endif
		<rot_amount> = (<rot_amount> + <acceleration>)
		rotation = (<rotation> + <rot_amount>)
		if ((<rotation> > 18.0) && <rotate_left>)
			<rotate_left> = 0
			<rotate_right> = 1
		endif
		if ((<rotation> < -48.0) && <rotate_right>)
			<rotate_right> = 0
			<acceleration> = 0.025
		endif
		if (<rotation> > 360.0)
			<rotation> = (<rotation> - 360.0)
			<rot_amount> = 1.0
			<rotate_left> = 1
		endif
	elseif (<Type> = t_regular)
		rotation = (<rotation> + 1.0)
		if (<rotation> > 360.0)
			<rotation> = (<rotation> - 360.0)
		endif
	elseif (<Type> = t_pause)
		rotation = (<rotation> + 1.0)

		if (<rotation> > 360.0)
			<rotation> = (<rotation> - 360.0)
			<allow_pause> = 1
		endif
		if ((<rotation> > 0.0) && (<rotation> < 2.0) && <allow_pause>)
			<allow_pause> = 0
			Wait \{2
				Seconds}
		endif
	elseif (<Type> = t_speed)
		rotation = (<rotation> + <rot_amount>)
		if (<rot_amount> < 0.5)
			<rot_amount> = 0.5
		elseif (<rot_amount> > 1.5)
			<rot_amount> = 1.5
		endif
		if (<rotation> > 360.0)
			<rotation> = (<rotation> - 360.0)
		endif
		if ((<rotation> > 60.0) && (<rotation> < 275.0))
			<speed> = 0.05
		else
			<speed> = -0.05
		endif
		<rot_amount> = (<rot_amount> + <speed>)
	endif
	WaitOneGameFrame
	repeat
endscript

script store_show_price_tag \{parent = root_window
		price = 23
		Pos = (0.0, 0.0)
		z = 10
		rot = 0
		z3d = 1}
	destroy_store_price_tag
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		Pos = <Pos>
		id = store_price_tag_container
		z_priority = <z>
		rot_angle = <rot>
		Scale = 1.1
	}
	tex = store_tag_price
	if GotParam \{sold}
		<tex> = store_tag_sold
	else
		formatText TextName = price_text '$%d' d = <price>
		CreateScreenElement {
			Type = TextElement
			parent = store_price_tag_container
			id = store_price_tag_text
			text = <price_text>
			z_priority = 1
			font = text_a5
			Pos = (70.0, -18.0)
			rgba = [7 108 4 255]
			rot_angle = 7
		}
		<id> :SetTags tag_price = 0
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = store_price_tag_container
		id = store_price_tag
		texture = <tex>
		just = [center center]
		rgba = [255 255 255 255]
		dims = (384.0, 192.0)
		z_priority = 0
	}
	store_price_tag :SetProps z3d = <z3d>
	store_price_tag_text :SetProps z3d = (<z3d> - 0.1)
endscript

script destroy_store_price_tag 
	destroy_menu \{menu_id = store_price_tag_container}
endscript

script store_show_already_owned \{unlocked_for_purchase = 1
		for_character = 0}
	if ScreenElementExists \{id = store_price_tag}
		if (<for_character> = 0)
			store_price_tag :SetProps \{texture = store_tag_sold
				z3d = 1}
		else
			store_price_tag :SetProps \{texture = store_tag_sold
				z3d = 1}
		endif
	endif
	if ScreenElementExists \{id = store_price_tag_text}
		if (<for_character> = 0)
			store_price_tag_text :SetProps \{z3d = 0.9}
		else
			store_price_tag_text :SetProps \{z3d = 0.9}
		endif
		if (<unlocked_for_purchase>)
			store_price_tag_text :SetProps \{text = 'SOLD'
				rgba = [
					170
					90
					35
					255
				]}
		endif
		SetScreenElementProps \{id = store_price_tag_text
			Scale = 1}
		fit_text_in_rectangle \{id = store_price_tag_text
			dims = (130.0, 90.0)}
	endif
endscript

script store_hide_already_owned \{for_character = 0}
	if ScreenElementExists \{id = store_price_tag}
		if (<for_character> = 0)
			store_price_tag :SetProps \{texture = store_tag_price
				z3d = 2}
		else
			store_price_tag :SetProps \{texture = store_tag_price
				z3d = 5}
		endif
		if ScreenElementExists \{id = store_price_tag_text}
			if (<for_character> = 0)
				store_price_tag_text :SetProps \{rgba = [
						7
						108
						4
						255
					]
					z3d = 1.9}
			else
				store_price_tag_text :SetProps \{rgba = [
						7
						108
						4
						255
					]
					z3d = 4.9}
			endif
			SetScreenElementProps \{id = store_price_tag_text
				Scale = 1}
			fit_text_in_rectangle \{id = store_price_tag_text
				dims = (150.0, 90.0)}
		endif
	endif
endscript

script create_store_videos_menu 
	mark_unsafe_for_shutdown
	Change \{target_store_camera_prop = song_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	SetScreenElementProps \{id = store_cash_text
		Pos = (890.0, 535.0)}
	create_store_window_frame \{Pos = (900.0, 360.0)
		dims = (370.0, 600.0)
		no_hilite}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = select_guitar_container
		Pos = (893.0, -100.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = store_videos_container
		Pos = (900.0, 225.0)}
	CreateScreenElement {
		Type = WindowElement
		parent = root_window
		id = store_info_scroll_window
		Pos = ($store_window_pos + (0.0, 60.0))
		dims = ($store_window_dims - (0.0, 70.0))
	}
	new_menu \{scrollid = sv_scroll
		vmenuid = sv_vmenu}
	text_params = {
		parent = sv_vmenu
		Type = TextElement
		font = ($store_menu_font)
		rgba = (($g_menu_colors).black)
		z_priority = 50
		no_shadow
		Scale = 1.333
	}
	CreateScreenElement {
		<text_params>
		text = ''
		event_handlers = [
			{pad_left store_videos_right}
			{pad_right store_videos_left}
			{pad_down store_videos_right}
			{pad_up store_videos_left}
			{pad_choose store_videos_buy}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		id = store_videos_menu_holder
	}
	CreateScreenElement {
		Type = TextElement
		id = store_videos_artist
		parent = store_videos_container
		just = [center center]
		font = ($store_menu_font)
		text = ''
		Scale = 1.333
		id = store_videos_artist
		rgba = (($g_menu_colors).black)
		z_priority = (<text_params>.z_priority)
		Pos = (-4.0, -88.0)
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
	}
	<id> :SetTags videos_index = 0
	CreateScreenElement \{Type = SpriteElement
		parent = store_videos_container
		texture = store_video_generic
		id = store_video_generic
		Pos = (-480.0, 120.0)
		just = [
			center
			center
		]
		dims = (354.0, 354.0)
		z_priority = -1}
	store_show_price_tag \{parent = store_videos_container
		Pos = (-335.0, 80.0)
		rot = -10}
	LaunchEvent \{Type = unfocus
		target = sv_vmenu}
	LaunchEvent \{Type = focus
		target = store_videos_menu_holder}
	set_store_videos_title \{index = 0}
	mark_safe_for_shutdown
endscript

script destroy_store_videos_menu 
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = store_videos_container}
	destroy_menu \{menu_id = sv_scroll}
	destroy_store_window_frame
	shut_down_store_hub
endscript

script set_store_videos_title \{index = 0}
	store_videos_artist :SetTags videos_index = <index>
	videos_checksum = ($Bonus_videos [<index>].id)
	select_guitar_change_blurb_text text = ($Bonus_videos [<index>].info) x_dims = 362 Pos = (-125.0, 320.0) dims = (388.0, 300.0) z = 50 lines_in_window = 9
	text = ($Bonus_videos [<index>].Name)
	GetUpperCaseString <text>
	text = <UppercaseString>
	SetScreenElementProps {
		id = store_videos_artist
		text = <text>
	}
	store_videos_artist :SetProps \{Scale = 1}
	GetScreenElementDims \{id = store_videos_artist}
	fit_text_in_rectangle id = store_videos_artist dims = ((280.0, 0.0) + (<height> * (0.0, 1.0))) only_if_larger_x = 1
	video_price = ($Bonus_videos [<index>].price)
	set_store_purchase_price price = (<video_price>)
	store_hide_already_owned
	GetGlobalTags <videos_checksum>
	if (<unlocked> = 1)
		store_show_already_owned
	endif
endscript

script store_videos_left 
	store_videos_artist :GetTags
	<videos_index> = (<videos_index> - 1)
	GetArraySize ($Bonus_videos)
	if (<videos_index> < 0)
		<videos_index> = (<videos_index> + <array_Size>)
	endif
	generic_menu_up_or_down_sound \{up}
	set_store_videos_title index = (<videos_index>)
endscript

script store_videos_right 
	store_videos_artist :GetTags
	<videos_index> = (<videos_index> + 1)
	get_progression_globals game_mode = ($game_mode) Bonus
	GetArraySize ($Bonus_videos)
	if (<videos_index> = <array_Size>)
		<videos_index> = 0
	endif
	generic_menu_up_or_down_sound \{down}
	set_store_videos_title index = (<videos_index>)
endscript

script store_videos_buy 
	store_videos_artist :GetTags
	video_checksum = ($Bonus_videos [<videos_index>].id)
	video_price = ($Bonus_videos [<videos_index>].price)
	GetGlobalTags <video_checksum>
	if (<unlocked> = 0)
		get_current_band_info
		GetGlobalTags <band_info>
		if ((<cash> > <video_price>) || (<cash> = <video_price>))
			<cash> = (<cash> - <video_price>)
			SetGlobalTags <band_info> params = {cash = <cash>}
			SetGlobalTags <video_checksum> params = {unlocked = 1}
			store_update_band_cash
			set_store_videos_title index = (<videos_index>)
			Change \{store_autosave_required = 1}
			SoundEvent \{event = Cash_Sound}
		endif
	endif
endscript

script rotate_element_360 \{id = store_songs_album_45
		time = 5
		element_angle = 360}
	if ScreenElementExists id = <id>
		GetScreenElementProps id = <id>
		rot_360 = (<rot_angle> + <element_angle>)
		<id> :DoMorph rot_angle = <rot_360> time = <time> motion = ease_out
	endif
endscript

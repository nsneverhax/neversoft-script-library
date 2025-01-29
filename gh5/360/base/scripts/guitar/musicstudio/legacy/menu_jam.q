debug_notetracker = 0

script do_jam_loading 
	printf \{channel = jam_mode
		qs(0x983f859b)}
	setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 100)} time = 3}
	if ($jam_view_cam_created = 0)
		musicstudio_mainobj :musicstudio_removecurrentsong
		musicstudio_load_patterns
		create_loading_screen \{jam_mode = 1}
		Change \{current_level = load_z_studio}
		Load_Venue \{block_scripts = 0}
		destroy_band
		destroy_bg_viewport
		setup_bg_viewport
		PlayIGCCam \{Name = jam_view_cam
			viewport = bg_viewport
			controlscript = jam_camera_script
			play_hold = 1}
		Change \{jam_view_cam_created = 1}
	endif
	if GotParam \{on_enter}
		printf \{channel = bkutcher
			qs(0xe6516ece)}
		pop_unsafe_for_shutdown \{reason = enter_music_central}
	endif
	printf \{channel = jam_mode
		qs(0xbd55d6cd)}
	setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 1}
	jam_setup_new_song
	if NOT ScreenElementExists \{id = fullscreen_visualizer_viewport}
		create_visualizer_screen_element \{z_priority = -1}
	endif
	musicstudio_ambience_init
	musicstudio_start_menu_music
endscript

script jam_init_menu_light_show 
	LightShow_InitEventMappings \{force_pakname = 'z_studio'}
	lightshow_dummyloop
	LightShow_SetTime \{time = 0.0}
	LightShow_PlaySnapshot \{save = true
		UseSnapshotPositions = true
		Name = flare_01}
endscript

script create_jam_menu 
	Change \{rich_presence_context = presence_music_studio}
	if ($jam_reverb = 0)
		jam_init_reverb
	endif
	begin
	if NOT ScriptIsRunning \{do_jam_loading}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	destroy_all_exploding_text
	printf \{channel = jam_mode
		qs(0xca3cd2d6)}
	Change \{signin_jam_mode = 0}
	KillCamAnim \{Name = ch_view_cam}
	KillCamAnim \{Name = menu_view_cam}
	directorylisting = $jam_curr_directory_listing
	disable_pause
	UnPauseGame
	menu_music_off
	BG_Crowd_Front_End_Silence
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_container}
	make_generic_menu \{title = $menu_jam_ghstudio_string
		pad_back_script = menu_jam_back
		vmenu_id = jam_menu
		dims = (400.0, 400.0)
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
		pad_back_params = {
			nosound
		}}
	add_generic_musicstudio_menu_text_item \{icon = icon_jam_ghtunes
		text = $menu_jam_ghtunes_string
		pad_choose_script = jam_picked_ghtunes
		additional_focus_script = musicstudio_set_ambience
		additional_focus_params = {
			ambience = ghtunes_focus_ambience
			update_extra_info
		}
		additional_choose_script = musicstudio_set_ambience
		additional_choose_params = {
			ambience = ghtunes_choose_ambience
		}}
	add_generic_musicstudio_menu_text_item \{icon = icon_jam_recording
		text = $menu_jam_ghjam_string
		choose_state = uistate_jam_select_song
		choose_state_data = {
			curr_tab = 0
		}
		additional_focus_script = musicstudio_set_ambience
		additional_focus_params = {
			ambience = jam_room_focus_ambience
			update_extra_info
		}
		additional_choose_script = musicstudio_set_ambience
		additional_choose_params = {
			ambience = jam_room_choose_ambience
		}}
	normal_controller = 0
	if NOT isdrumcontroller controller = ($primary_controller)
		if NOT IsGuitarController controller = ($primary_controller)
			<normal_controller> = 1
		endif
	endif
	add_generic_musicstudio_menu_text_item \{icon = icon_jam_ghmix
		text = $menu_jam_ghmix_string
		choose_state = uistate_jam_select_song
		ui_event_script = ghmix_on_enter
		choose_state_data = {
			curr_tab = 0
			advanced_record = 2
		}
		additional_focus_script = musicstudio_set_ambience
		additional_focus_params = {
			ambience = ghmix_focus_ambience
			update_extra_info
		}
		additional_choose_script = musicstudio_set_ambience
		additional_choose_params = {
			ambience = ghmix_choose_ambience
		}}
	menu_jam_extra_info_create_ui
	<item_container_id> :se_setprops {
		event_handlers = [
			{focus retail_menu_focus params = {id = <id>}}
			{unfocus retail_menu_unfocus params = {id = <id>}}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
	destroy_loading_screen
	StartRendering
endscript

script menu_jam_extra_info_focus 
	extra_info_text = qs(0x03ac90f0)
	switch <ambience>
		case ghtunes_focus_ambience
		extra_info_text = qs(0xff38d233)
		case jam_room_focus_ambience
		extra_info_text = qs(0xfa0da9c5)
		case ghmix_focus_ambience
		extra_info_text = qs(0x877f7876)
	endswitch
	menu_jam_extra_info :se_setprops text = <extra_info_text>
endscript

script menu_jam_extra_info_create_ui 
	if ScreenElementExists \{id = generic_menu}
		CreateScreenElement \{Type = TextBlockElement
			parent = generic_menu
			id = menu_jam_extra_info
			font = fontgrid_text_a3
			rgba = [
				22
				26
				30
				255
			]
			text = qs(0x03ac90f0)
			just = [
				center
				center
			]
			internal_just = [
				left
				top
			]
			internal_scale = 0.35000002
			z_priority = 10
			Pos = (298.0, 355.0)
			dims = (278.0, 75.0)
			single_line = FALSE
			fit_width = wrap
			fit_height = `scale	down	if	larger`
			scale_mode = `per	axis`}
		CreateScreenElement \{parent = menu_jam_extra_info
			Type = SpriteElement
			texture = white
			rgba = [
				113
				121
				133
				255
			]
			dims = (292.0, 87.0)
			just = [
				left
				top
			]
			Scale = 1
			alpha = 0.75
			Pos = (-6.0, -6.0)
			z_priority = 9}
	endif
endscript

script add_generic_musicstudio_menu_text_item \{pad_choose_sound = musicstudio_menu_music_select}
	add_generic_menu_text_item {
		<...>
		dims = (262.0, 35.0)
		font = fontgrid_text_a3
		rgba = [113 121 133 255]
		not_focusable_rgba = [80 80 80 255]
		focus_script = focus_generic_musicstudio_menu_text_item
		unfocus_script = unfocus_generic_musicstudio_menu_text_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_musicstudio_menu_text_item 
	if ScreenElementExists \{id = generic_menu}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		<id> :se_setprops generic_menu_smenu_textitem_text_rgba = [22 26 30 255]
		<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
		if ScreenElementExists \{id = generic_musicstudio_menu_hilite}
			DestroyScreenElement \{id = generic_musicstudio_menu_hilite}
		endif
		dims = (293.0, 27.0)
		if (<array_Size> > 7)
			dims = (271.0, 27.0)
			generic_menu :se_setprops \{scroll_bar_alpha = 1}
		else
			generic_menu :se_setprops \{scroll_bar_alpha = 0}
		endif
		CreateScreenElement {
			id = generic_musicstudio_menu_hilite
			parent = <id>
			Type = SpriteElement
			texture = white
			rgba = [113 121 133 255]
			just = [left , center]
			dims = <dims>
			Scale = 1
			alpha = 1
			Pos = (11.0, 22.0)
			z_priority = 0
		}
		if generic_menu :desc_resolvealias \{Name = alias_generic_menu_vmenu
				param = VMenu}
			<VMenu> :menu_getselectedindex
			if GetScreenElementChildren id = <VMenu>
				GetArraySize <children>
				scroll_length = (0.0, 225.0)
				if (<array_Size> > 1)
					scroll_ratio = (<selected_index> / (<array_Size> - 1.0))
				else
					scroll_ratio = 0.0
				endif
				generic_menu :se_setprops scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) - (0.0, 225.0))
			endif
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_musicstudio_menu_text_item 
	<id> :se_setprops generic_menu_smenu_textitem_text_rgba = [113 121 133 255]
	<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_generic_musicstudio_menu_icon_item \{pad_choose_sound = musicstudio_menu_music_select}
	icon_alpha = 1.0
	if GotParam \{not_focusable}
		<icon_alpha> = 0.1
	endif
	add_generic_menu_icon_item {
		<...>
		desc = 'generic_musicstudio_menu_icon_item'
		dims = (225.0, 35.0)
		font = fontgrid_text_a3
		rgba = [113 121 133 255]
		not_focusable_rgba = [80 80 80 255]
		focus_script = focus_generic_musicstudio_menu_icon_item
		unfocus_script = unfocus_generic_musicstudio_menu_icon_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_musicstudio_menu_icon_item 
	if ScreenElementExists \{id = generic_menu}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = [22 26 30 255]
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		if ScreenElementExists \{id = generic_musicstudio_menu_hilite}
			DestroyScreenElement \{id = generic_musicstudio_menu_hilite}
		endif
		dims = (260.0, 27.0)
		if (<array_Size> > 7)
			dims = (238.0, 27.0)
			generic_menu :se_setprops \{scroll_bar_alpha = 1}
		else
			generic_menu :se_setprops \{scroll_bar_alpha = 0}
		endif
		CreateScreenElement {
			id = generic_musicstudio_menu_hilite
			parent = <id>
			Type = SpriteElement
			texture = white
			rgba = [113 121 133 255]
			just = [left , center]
			dims = <dims>
			Scale = 1
			alpha = 1
			Pos = (44.0, 22.0)
			z_priority = 0
		}
		if generic_menu :desc_resolvealias \{Name = alias_generic_menu_vmenu
				param = VMenu}
			<VMenu> :menu_getselectedindex
			if GetScreenElementChildren id = <VMenu>
				GetArraySize <children>
				scroll_length = (0.0, 225.0)
				if (<array_Size> > 1)
					scroll_ratio = (<selected_index> / (<array_Size> - 1.0))
				else
					scroll_ratio = 0.0
				endif
				generic_menu :se_setprops scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) - (0.0, 225.0))
			endif
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_musicstudio_menu_icon_item 
	<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = [113 121 133 255]
	<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script jam_create_sm 
	GetScreenElementDims id = <parent>
	CreateScreenElement {
		Type = TextElement
		parent = <parent>
		text = qs(0x7ca19d0c)
		font = fontgrid_text_a3
		just = [left center]
		Scale = 0.15
		Pos = <Pos>
		rgba = ($menu_unfocus_color)
	}
endscript

script jam_picked_ghtunes 
	generic_event_choose no_sound state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_ghtunes jam = 2 require_live = 1}
endscript

script jam_ghmix_failed_dialog 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
	if isxenonorwindx
		formatText \{TextName = dialog_txt
			qs(0x8acdea9d)}
	elseif isps3
		formatText \{TextName = dialog_txt
			qs(0x8acdea9d)}
	endif
	create_dialog_box {
		heading_text = qs(0x886500cd)
		body_text = <dialog_txt>
		options = [
			{
				func = jam_ghmix_refresh
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_ghmix_refresh 
	destroy_dialog_box
	ui_event \{event = menu_refresh}
endscript

script jam_change_look_at_cam \{cam = jam_look_at_mixer}
	return
endscript

script jam_goto_tutorials 
	<wrong_controller> = 0
	if NOT IsGuitarController controller = ($primary_controller)
		if NOT isdrumcontroller controller = ($primary_controller)
			if NOT ($allow_controller_for_all_instruments = 1)
				LaunchEvent \{Type = unfocus
					target = current_menu}
				create_dialog_box \{no_background
					heading_text = qs(0xaa163738)
					body_text = qs(0x456d03e4)
					options = [
						{
							func = jam_return_to_jam
							func_params = {
							}
							text = qs(0x0e41fe46)
						}
					]}
				<wrong_controller> = 1
			endif
		endif
	endif
	if (<wrong_controller> = 0)
		destroy_jam_song_select_menu
		generic_event_choose \{state = uistate_jam_tutorials}
	endif
endscript

script jam_return_to_jam 
	destroy_dialog_box
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script menu_jam_back 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_loading_screen
	Wait \{1
		gameframe}
	musicstudio_stop_menu_music \{FAST = 1}
	begin
	if NOT ScriptIsRunning \{musicstudio_instrument_load}
		if NOT ScriptIsRunning \{loaddrumkit}
			break
		endif
	endif
	printf \{'menu_jam_back - Waiting for paks we loaded up to finish loading'}
	Wait \{1
		gameframe}
	repeat
	KillCamAnim \{Name = jam_view_cam}
	generic_event_back \{nosound
		state = uistate_mainmenu}
endscript
music_studio_on_enter_venue = load_z_cairo

script exit_music_studio_cleanup 
	persistent_band_create_band \{refresh = 1}
	Change current_level = ($music_studio_on_enter_venue)
endscript

script destroy_jam_menu 
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = jam_tutorial_select_container}
		DestroyScreenElement \{id = jam_tutorial_select_container}
	endif
	if ScreenElementExists \{id = jam_container}
		DestroyScreenElement \{id = jam_container}
	endif
	destroy_generic_menu
	KillSpawnedScript \{id = jam_spawns}
	destroy_menu_backdrop
endscript

script jam_menu_get_lefty 
	lefty = 0
	getplayerinfo <Player> lefty_flip
	return lefty = <lefty_flip>
endscript

script has_lefty_adj_control_press 
	jam_menu_get_lefty Player = <Player>
	if (<lefty> = 0)
		if (<Dir> = up)
			if ControllerPressed up <controller>
				return \{true}
			endif
		else
			if ControllerPressed down <controller>
				return \{true}
			endif
		endif
	else
		if (<Dir> = down)
			if ControllerPressed up <controller>
				return \{true}
			endif
		else
			if ControllerPressed down <controller>
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

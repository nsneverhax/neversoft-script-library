debug_notetracker = 0

script do_jam_loading 
	printf \{channel = jam_mode
		qs(0x983f859b)}
	SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 100)} time = 3}
	if ($jam_view_cam_created = 0)
		musicstudio_mainobj :MusicStudio_RemoveCurrentSong
		musicstudio_load_patterns
		create_loading_screen \{jam_mode = 1}
		Change \{current_level = load_z_Studio}
		Load_Venue \{block_scripts = 0}
		destroy_band
		destroy_bg_viewport
		setup_bg_viewport
		Change \{jam_view_cam_created = 1}
	endif
	if GotParam \{on_enter}
		musicstudio_entry_unsafe_for_shutdown_pop
	endif
	printf \{channel = jam_mode
		qs(0xbd55d6cd)}
	SetSoundBussParams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 1}
	jam_setup_new_song
	if NOT ScreenElementExists \{id = fullscreen_visualizer_viewport}
		create_visualizer_screen_element \{z_priority = -1}
	endif
	musicstudio_ambience_init
	musicstudio_start_menu_music
endscript

script jam_init_menu_light_show 
	LightShow_InitEventMappings \{force_pakname = 'z_studio'}
	LightShow_DummyLoop
	LightShow_SetTime \{time = 0.0}
	LightShow_PlaySnapshot \{save = true
		UseSnapshotPositions = true
		name = Flare_01}
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
	wait \{1
		gameframe}
	repeat
	destroy_all_exploding_text
	printf \{channel = jam_mode
		qs(0xca3cd2d6)}
	Change \{signin_jam_mode = 0}
	KillCamAnim \{name = ch_view_cam}
	KillCamAnim \{name = menu_view_cam}
	directorylisting = $jam_curr_directory_listing
	disable_pause
	UnpauseGame
	Menu_Music_Off
	BG_Crowd_Front_End_Silence
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_container}
	make_generic_menu \{Title = $menu_jam_ghstudio_string
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
		choose_state = UIstate_jam_select_song
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
		if NOT isguitarcontroller controller = ($primary_controller)
			<normal_controller> = 1
		endif
	endif
	add_generic_musicstudio_menu_text_item \{icon = icon_jam_ghmix
		text = $menu_jam_ghmix_string
		choose_state = UIstate_jam_select_song
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
	<item_container_id> :SE_SetProps {
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
	LaunchEvent \{type = focus
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
	menu_jam_extra_info :SE_SetProps text = <extra_info_text>
endscript

script menu_jam_extra_info_create_ui 
	if ScreenElementExists \{id = generic_menu}
		CreateScreenElement \{type = TextBlockElement
			parent = generic_menu
			id = menu_jam_extra_info
			font = fontgrid_text_A3
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
			single_line = false
			fit_width = wrap
			fit_height = `scale	down	if	larger`
			scale_mode = `per	axis`}
		CreateScreenElement \{parent = menu_jam_extra_info
			type = SpriteElement
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
			scale = 1
			alpha = 0.75
			Pos = (-6.0, -6.0)
			z_priority = 9}
	endif
endscript

script add_generic_musicstudio_menu_text_item \{pad_choose_sound = musicstudio_menu_music_select}
	add_generic_menu_text_item {
		<...>
		dims = (415.0, 60.0)
		font = fontgrid_text_A3
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
		<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = [22 26 30 255]
		<id> :SE_SetProps generic_menu_smenu_textitem_text_font = <font>
		if ScreenElementExists \{id = generic_musicstudio_menu_hilite}
			DestroyScreenElement \{id = generic_musicstudio_menu_hilite}
		endif
		no_scroll_bar = 0
		current_menu :GetTags
		dims = (462.0, 64.0)
		if (<array_size> > 6 && <no_scroll_bar> = 0)
			dims = (433.0, 64.0)
			generic_menu :SE_SetProps \{scroll_bar_alpha = 1}
		else
			generic_menu :SE_SetProps \{scroll_bar_alpha = 0}
		endif
		CreateScreenElement {
			id = generic_musicstudio_menu_hilite
			parent = <id>
			type = SpriteElement
			texture = white
			rgba = [113 121 133 255]
			pos_anchor = [left center]
			just = [left , center]
			dims = <dims>
			scale = 1
			alpha = 1
			Pos = (-8.0, -5.0)
			z_priority = 0
		}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_vmenu
				param = vmenu}
			<vmenu> :Menu_GetSelectedIndex
			if GetScreenElementChildren id = <vmenu>
				GetArraySize <children>
				scroll_length = (0.0, 225.0)
				if (<array_size> > 1)
					scroll_ratio = (<selected_index> / (<array_size> - 1.0))
				else
					scroll_ratio = 0.0
				endif
				generic_menu :SE_SetProps scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) - (0.0, 225.0))
			endif
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_musicstudio_menu_text_item 
	<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = [113 121 133 255]
	<id> :SE_SetProps generic_menu_smenu_textitem_text_font = <font>
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
		font = fontgrid_text_A3
		rgba = [113 121 133 255]
		not_focusable_rgba = [80 80 80 255]
		focus_script = focus_generic_musicstudio_menu_icon_item
		unfocus_script = unfocus_generic_musicstudio_menu_icon_item
	}
	<item_container_id> :SE_SetProps generic_menu_smenu_iconitem_text_dims = (300.0, 40.0)
	return item_container_id = <item_container_id>
endscript

script focus_generic_musicstudio_menu_icon_item 
	if ScreenElementExists \{id = generic_menu}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_rgba = [22 26 30 255]
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_font = <font>
		if ScreenElementExists \{id = generic_musicstudio_menu_hilite}
			DestroyScreenElement \{id = generic_musicstudio_menu_hilite}
		endif
		dims = (400.0, 45.0)
		if (<array_size> > 7)
			generic_menu :SE_SetProps \{scroll_bar_alpha = 1}
		else
			generic_menu :SE_SetProps \{scroll_bar_alpha = 0}
		endif
		CreateScreenElement {
			id = generic_musicstudio_menu_hilite
			parent = <id>
			type = SpriteElement
			texture = white
			rgba = [113 121 133 255]
			just = [left , center]
			dims = <dims>
			scale = 1
			alpha = 1
			Pos = (54.0, 30.0)
			z_priority = 0
		}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_vmenu
				param = vmenu}
			<vmenu> :Menu_GetSelectedIndex
			if GetScreenElementChildren id = <vmenu>
				GetArraySize <children>
				scroll_length = (0.0, 225.0)
				if (<array_size> > 1)
					scroll_ratio = (<selected_index> / (<array_size> - 1.0))
				else
					scroll_ratio = 0.0
				endif
				generic_menu :SE_SetProps scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) - (0.0, 225.0))
			endif
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_musicstudio_menu_icon_item 
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_rgba = [113 121 133 255]
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_font = <font>
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script jam_create_sm 
	GetScreenElementDims id = <parent>
	CreateScreenElement {
		type = TextElement
		parent = <parent>
		text = qs(0x7ca19d0c)
		font = fontgrid_text_A3
		just = [left center]
		scale = 0.15
		Pos = <Pos>
		rgba = ($menu_unfocus_color)
	}
endscript

script jam_picked_ghtunes 
	generic_event_choose no_sound state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = UIstate_jam_ghtunes Jam = 2 require_live = 1}
endscript

script jam_ghmix_failed_dialog 
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
	if IsXenonOrWinDX
		FormatText \{TextName = dialog_txt
			qs(0x8acdea9d)}
	elseif IsPS3
		FormatText \{TextName = dialog_txt
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
	if NOT isguitarcontroller controller = ($primary_controller)
		if NOT isdrumcontroller controller = ($primary_controller)
			if NOT ($allow_controller_for_all_instruments = 1)
				LaunchEvent \{type = unfocus
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
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script menu_jam_back 
	LaunchEvent \{type = unfocus
		target = current_menu}
	create_loading_screen
	wait \{1
		gameframe}
	musicstudio_stop_menu_music \{FAST = 1}
	begin
	if NOT ScriptIsRunning \{MusicStudio_Instrument_Load}
		if NOT ScriptIsRunning \{LoadDrumKit}
			break
		endif
	endif
	printf \{'menu_jam_back - Waiting for paks we loaded up to finish loading'}
	wait \{1
		gameframe}
	repeat
	KillCamAnim \{name = jam_view_cam}
	generic_event_back \{nosound
		state = uistate_mainmenu}
endscript
music_studio_on_enter_venue = load_z_visualizer

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
	killspawnedscript \{id = jam_spawns}
	destroy_menu_backdrop
endscript

script jam_menu_get_lefty 
	lefty = 0
	GetPlayerInfo <player> lefty_flip
	return lefty = <lefty_flip>
endscript

script has_lefty_adj_control_press 
	jam_menu_get_lefty player = <player>
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
	return \{false}
endscript

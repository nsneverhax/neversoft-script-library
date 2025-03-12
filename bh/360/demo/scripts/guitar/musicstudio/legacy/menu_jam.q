debug_notetracker = 0

script do_jam_loading 
	printf \{channel = jam_mode
		qs(0x983f859b)}
	setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 100)} time = 3}
	if ($jam_view_cam_created = 0)
		musicstudio_mainobj :musicstudio_removecurrentsong
		musicstudio_load_patterns
		create_loading_screen \{jam_mode = 1}
		change \{current_level = load_z_studio}
		load_venue \{block_scripts = 0}
		destroy_band
		destroy_bg_viewport
		setup_bg_viewport
		change \{jam_view_cam_created = 1}
	endif
	if gotparam \{on_enter}
		0xc9083294
	endif
	printf \{channel = jam_mode
		qs(0xbd55d6cd)}
	setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = 1}
	jam_setup_new_song
	if NOT screenelementexists \{id = fullscreen_visualizer_viewport}
		create_visualizer_screen_element \{z_priority = -1}
	endif
	musicstudio_ambience_init
	musicstudio_start_menu_music
endscript

script jam_init_menu_light_show 
	lightshow_initeventmappings \{force_pakname = 'z_studio'}
	lightshow_dummyloop
	lightshow_settime \{time = 0.0}
	lightshow_playsnapshot \{save = true
		usesnapshotpositions = true
		name = flare_01}
endscript

script create_jam_menu 
	change \{rich_presence_context = presence_music_studio}
	if ($jam_reverb = 0)
		jam_init_reverb
	endif
	begin
	if NOT scriptisrunning \{do_jam_loading}
		break
	endif
	wait \{1
		gameframe}
	repeat
	destroy_all_exploding_text
	printf \{channel = jam_mode
		qs(0xca3cd2d6)}
	change \{signin_jam_mode = 0}
	killcamanim \{name = ch_view_cam}
	killcamanim \{name = menu_view_cam}
	directorylisting = $jam_curr_directory_listing
	disable_pause
	unpausegame
	menu_music_off
	bg_crowd_front_end_silence
	createscreenelement \{type = containerelement
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
		if NOT isguitarcontroller controller = ($primary_controller)
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
	launchevent \{type = focus
		target = current_menu}
	destroy_loading_screen
	startrendering
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
	if screenelementexists \{id = generic_menu}
		createscreenelement \{type = textblockelement
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
			pos = (298.0, 355.0)
			dims = (278.0, 75.0)
			single_line = false
			fit_width = wrap
			fit_height = `scale down if larger`
			scale_mode = `per axis`}
		createscreenelement \{parent = menu_jam_extra_info
			type = spriteelement
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
			pos = (-6.0, -6.0)
			z_priority = 9}
	endif
endscript

script add_generic_musicstudio_menu_text_item \{pad_choose_sound = musicstudio_menu_music_select}
	add_generic_menu_text_item {
		<...>
		dims = (415.0, 60.0)
		font = fontgrid_text_a3
		rgba = [113 121 133 255]
		not_focusable_rgba = [80 80 80 255]
		focus_script = focus_generic_musicstudio_menu_text_item
		unfocus_script = unfocus_generic_musicstudio_menu_text_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_musicstudio_menu_text_item 
	if screenelementexists \{id = generic_menu}
		getscreenelementchildren \{id = current_menu}
		getarraysize <children>
		<id> :se_setprops generic_menu_smenu_textitem_text_rgba = [22 26 30 255]
		<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
		if screenelementexists \{id = generic_musicstudio_menu_hilite}
			destroyscreenelement \{id = generic_musicstudio_menu_hilite}
		endif
		0x67218332 = 0
		current_menu :gettags
		dims = (462.0, 64.0)
		if (<array_size> > 6 && <0x67218332> = 0)
			dims = (433.0, 64.0)
			generic_menu :se_setprops \{scroll_bar_alpha = 1}
		else
			generic_menu :se_setprops \{scroll_bar_alpha = 0}
		endif
		createscreenelement {
			id = generic_musicstudio_menu_hilite
			parent = <id>
			type = spriteelement
			texture = white
			rgba = [113 121 133 255]
			pos_anchor = [left center]
			just = [left , center]
			dims = <dims>
			scale = 1
			alpha = 1
			pos = (-8.0, -5.0)
			z_priority = 0
		}
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_vmenu
				param = vmenu}
			<vmenu> :menu_getselectedindex
			if getscreenelementchildren id = <vmenu>
				getarraysize <children>
				scroll_length = (0.0, 225.0)
				if (<array_size> > 1)
					scroll_ratio = (<selected_index> / (<array_size> - 1.0))
				else
					scroll_ratio = 0.0
				endif
				generic_menu :se_setprops scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) - (0.0, 225.0))
			endif
		endif
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_musicstudio_menu_text_item 
	<id> :se_setprops generic_menu_smenu_textitem_text_rgba = [113 121 133 255]
	<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_generic_musicstudio_menu_icon_item \{pad_choose_sound = musicstudio_menu_music_select}
	icon_alpha = 1.0
	if gotparam \{not_focusable}
		<icon_alpha> = 0.1
	endif
	add_generic_menu_icon_item {
		<...>
		desc = 'generic_musicstudio_menu_icon_item'
		font = fontgrid_text_a3
		rgba = [113 121 133 255]
		not_focusable_rgba = [80 80 80 255]
		focus_script = focus_generic_musicstudio_menu_icon_item
		unfocus_script = unfocus_generic_musicstudio_menu_icon_item
	}
	<item_container_id> :se_setprops generic_menu_smenu_iconitem_text_dims = (300.0, 40.0)
	return item_container_id = <item_container_id>
endscript

script focus_generic_musicstudio_menu_icon_item 
	if screenelementexists \{id = generic_menu}
		getscreenelementchildren \{id = current_menu}
		getarraysize <children>
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = [22 26 30 255]
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		if screenelementexists \{id = generic_musicstudio_menu_hilite}
			destroyscreenelement \{id = generic_musicstudio_menu_hilite}
		endif
		dims = (400.0, 45.0)
		if (<array_size> > 7)
			generic_menu :se_setprops \{scroll_bar_alpha = 1}
		else
			generic_menu :se_setprops \{scroll_bar_alpha = 0}
		endif
		createscreenelement {
			id = generic_musicstudio_menu_hilite
			parent = <id>
			type = spriteelement
			texture = white
			rgba = [113 121 133 255]
			just = [left , center]
			dims = <dims>
			scale = 1
			alpha = 1
			pos = (54.0, 30.0)
			z_priority = 0
		}
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_vmenu
				param = vmenu}
			<vmenu> :menu_getselectedindex
			if getscreenelementchildren id = <vmenu>
				getarraysize <children>
				scroll_length = (0.0, 225.0)
				if (<array_size> > 1)
					scroll_ratio = (<selected_index> / (<array_size> - 1.0))
				else
					scroll_ratio = 0.0
				endif
				generic_menu :se_setprops scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) - (0.0, 225.0))
			endif
		endif
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_musicstudio_menu_icon_item 
	<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = [113 121 133 255]
	<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script jam_create_sm 
	getscreenelementdims id = <parent>
	createscreenelement {
		type = textelement
		parent = <parent>
		text = qs(0x7ca19d0c)
		font = fontgrid_text_a3
		just = [left center]
		scale = 0.15
		pos = <pos>
		rgba = ($menu_unfocus_color)
	}
endscript

script jam_picked_ghtunes 
	generic_event_choose no_sound state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_ghtunes jam = 2 require_live = 1}
endscript

script jam_ghmix_failed_dialog 
	launchevent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
	if isxenonorwindx
		formattext \{textname = dialog_txt
			qs(0x8acdea9d)}
	elseif isps3
		formattext \{textname = dialog_txt
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
				launchevent \{type = unfocus
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
	launchevent \{type = focus
		target = current_menu}
endscript

script menu_jam_back 
	launchevent \{type = unfocus
		target = current_menu}
	create_loading_screen
	wait \{1
		gameframe}
	musicstudio_stop_menu_music \{fast = 1}
	begin
	if NOT scriptisrunning \{musicstudio_instrument_load}
		if NOT scriptisrunning \{loaddrumkit}
			break
		endif
	endif
	printf \{'menu_jam_back - Waiting for paks we loaded up to finish loading'}
	wait \{1
		gameframe}
	repeat
	killcamanim \{name = jam_view_cam}
	generic_event_back \{nosound
		state = uistate_mainmenu}
endscript
music_studio_on_enter_venue = load_z_visualizer

script exit_music_studio_cleanup 
	persistent_band_create_band \{refresh = 1}
	change current_level = ($music_studio_on_enter_venue)
endscript

script destroy_jam_menu 
	set_focus_color
	set_unfocus_color
	if screenelementexists \{id = jam_tutorial_select_container}
		destroyscreenelement \{id = jam_tutorial_select_container}
	endif
	if screenelementexists \{id = jam_container}
		destroyscreenelement \{id = jam_container}
	endif
	destroy_generic_menu
	killspawnedscript \{id = jam_spawns}
	destroy_menu_backdrop
endscript

script jam_menu_get_lefty 
	lefty = 0
	getplayerinfo <player> lefty_flip
	return lefty = <lefty_flip>
endscript

script has_lefty_adj_control_press 
	jam_menu_get_lefty player = <player>
	if (<lefty> = 0)
		if (<dir> = up)
			if controllerpressed up <controller>
				return \{true}
			endif
		else
			if controllerpressed down <controller>
				return \{true}
			endif
		endif
	else
		if (<dir> = down)
			if controllerpressed up <controller>
				return \{true}
			endif
		else
			if controllerpressed down <controller>
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

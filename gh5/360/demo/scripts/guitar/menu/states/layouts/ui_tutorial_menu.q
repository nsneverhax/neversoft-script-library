
script ui_create_tutorial_menu 
	make_generic_menu \{title = qs(0xc6510dd1)
		dims = (400.0, 400.0)
		desc = 'generic_tutorial_select'}
	generic_menu :se_setprops \{help_text_caption_text = qs(0x00000000)}
	generic_menu :se_setprops \{challenge_instrument_alpha = 0.0}
	change \{rich_presence_context = presence_tutorial}
	cheat_turnoffall
	vocals_distribute_mics \{allow_default_headset}
	getcontrollertype controller = ($primary_controller)
	if ($allow_controller_for_all_instruments = 1)
		tutorial_system_set_part \{part = guitar}
	else
		switch (<controller_type>)
			case guitar
			case bass
			case drum
			tutorial_system_set_part part = <controller_type>
			default
			tutorial_system_set_part \{part = vocals}
		endswitch
	endif
	add_generic_tutorial_menu_icon_item {
		icon = gig_summary_star_256
		icon_rgba = ($uicolorref_palette.yellow_lt.rgba)
		text = qs(0xaf4736cc)
		choose_state = uistate_tutorial_gameplay_load
		choose_state_data = {tutorial_header = 'gameplay' title = qs(0xaf4736cc)}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($gameplay_tutorial_helper_text)}}
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		all_buttons}
	params = {
		icon = mixer_icon_guitar
		text = qs(0x9504b94a)
		choose_state = uistate_tutorial_menu_skill_level
		choose_state_data = {tutorial_header = 'guitar' title = qs(0x9504b94a) check_lefty_flip = 1}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($guitar_tutorial_helper_text)}}
	}
	if ($allow_controller_for_all_instruments = 0)
		if (<controller_type> != guitar)
			addparam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item <params>
	params = {
		icon = mixer_icon_bass
		text = qs(0x7d4f9214)
		choose_state = uistate_tutorial_bass_load
		choose_state_data = {tutorial_header = 'bass' title = qs(0x7d4f9214) check_lefty_flip = 1}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($bass_tutorial_helper_text)}}
	}
	if ($allow_controller_for_all_instruments = 0)
		if (<controller_type> != guitar)
			addparam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item <params>
	params = {
		icon = mixer_icon_drums
		text = qs(0x388cd3db)
		choose_state = uistate_tutorial_drums_load
		choose_state_data = {tutorial_header = 'drum' title = qs(0x388cd3db) check_lefty_flip = 1}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($drum_tutorial_helper_text)}}
	}
	if ($allow_controller_for_all_instruments = 0)
		if (<controller_type> != drum)
			addparam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item <params>
	params = {
		icon = mixer_icon_vox
		text = qs(0x1b9f6f84)
		choose_state = uistate_tutorial_vocals_load
		choose_state_data = {tutorial_header = 'vocals' title = qs(0x1b9f6f84)}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($vocals_tutorial_helper_text)}}
	}
	getcontrollertype controller = ($primary_controller)
	if ($allow_controller_for_all_instruments = 0)
		has_a_mic = 0
		if (<controller_type> = vocals || <controller_type> = controller)
			vocals_get_num_mics
			if (<num_mics> > 0)
				has_a_mic = 1
			endif
			if controller_has_headset controller = ($primary_controller)
				has_a_mic = 1
			endif
		endif
		if (<has_a_mic> = 0)
			addparam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	else
		has_a_mic = 1
	endif
	add_generic_tutorial_menu_icon_item <params>
	add_generic_tutorial_menu_icon_item {
		icon = icon_band_sm
		text = qs(0x34dc8180)
		choose_state = uistate_tutorial_band_load
		choose_state_data = {tutorial_header = 'band' title = qs(0x34dc8180)}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($band_tutorial_helper_text)}}
	}
	launchevent \{type = focus
		target = current_menu}
	if ($allow_controller_for_all_instruments = 0)
		spawnscriptlater tutorial_menu_controller_handler params = {has_a_mic = <has_a_mic>}
	endif
endscript

script ui_destroy_tutorial_menu 
	killspawnedscript \{name = tutorial_menu_controller_handler}
	destroy_generic_menu
endscript

script ui_init_tutorial_menu 
	change \{game_mode = tutorial}
	change \{g_in_tutorial = 1}
	hide_crowd_models
	change \{disable_crowd = 1}
	destroy_band
	fadetoblack \{on
		z_priority = 1
		alpha = 1.0
		time = 0.1
		no_wait}
	tutorial_system_setup_players
endscript

script ui_deinit_tutorial_menu 
	killspawnedscript \{name = tutorial_menu_controller_handler}
	tutorial_system_exit_cleanup
	persistent_band_refresh_changed_characters
	change \{disable_crowd = 0}
	hide_crowd_models \{active = false}
	spawnscriptnow \{noqbid
		switch_to_no_band_camera}
	fadetoblack \{off
		z_priority = 1
		alpha = 1.0
		time = 0.1
		no_wait}
	hide_glitch \{num_frames = 25}
	change \{g_in_tutorial = 0}
	change \{game_mode = career}
endscript

script add_generic_tutorial_menu_text_item \{pad_choose_sound = generic_menu_pad_choose_sound}
	add_generic_menu_text_item {
		<...>
		dims = (262.0, 35.0)
		font = fontgrid_text_a3
		rgba = [113 121 133 255]
		not_focusable_rgba = [40 40 40 255]
		focus_script = focus_generic_tutorial_menu_text_item
		unfocus_script = unfocus_generic_tutorial_menu_text_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_tutorial_menu_text_item 
	if screenelementexists \{id = generic_menu}
		<id> :se_setprops generic_menu_smenu_textitem_text_rgba = [22 26 30 255]
		<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
		if screenelementexists \{id = generic_tutorial_menu_hilite}
			destroyscreenelement \{id = generic_tutorial_menu_hilite}
		endif
		createscreenelement {
			id = generic_tutorial_menu_hilite
			parent = <id>
			type = spriteelement
			desc = 'generic_tutorial_select_item'
			texture = white
			rgba = [113 121 133 255]
			just = [left , center]
			dims = (271.0, 27.0)
			scale = 1
			alpha = 1
			pos = (11.0, 22.0)
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

script unfocus_generic_tutorial_menu_text_item 
	<id> :se_setprops generic_menu_smenu_textitem_text_rgba = [113 121 133 255]
	<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_generic_tutorial_menu_icon_item \{icon_alpha = 1.0}
	if gotparam \{not_focusable}
		if (<icon_alpha> > 0.1)
			<icon_alpha> = 0.1
		endif
	endif
	add_generic_menu_icon_item {
		<...>
		desc = 'generic_tutorial_menu_icon_item'
		dims = (325.0, 35.0)
		font = fontgrid_text_a3
		rgba = [145 154 173 255]
		not_focusable_rgba = [80 80 80 255]
		additional_choose_script = generic_menu_pad_choose_sound
		focus_script = focus_generic_tutorial_menu_icon_item
		unfocus_script = unfocus_generic_tutorial_menu_icon_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_tutorial_menu_icon_item 
	if screenelementexists \{id = generic_menu}
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = [22 26 30 255]
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		if screenelementexists \{id = generic_tutorial_menu_hilite}
			destroyscreenelement \{id = generic_tutorial_menu_hilite}
		endif
		createscreenelement {
			id = generic_tutorial_menu_hilite
			parent = <id>
			type = spriteelement
			texture = white
			rgba = [145 154 173 255]
			just = [left , center]
			dims = (335.0, 27.0)
			scale = 1
			alpha = 1
			pos = (44.0, 22.0)
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

script unfocus_generic_tutorial_menu_icon_item 
	<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = [145 154 173 255]
	<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script tutorial_menu_controller_handler 
	orig_state = <has_a_mic>
	begin
	has_a_mic = 0
	vocals_get_num_mics
	if (<num_mics> > 0)
		has_a_mic = 1
	endif
	if controller_has_headset controller = ($primary_controller)
		has_a_mic = 1
	endif
	getcontrollertype controller = ($primary_controller)
	if (<controller_type> = guitar || <controller_type> = drum)
		has_a_mic = <orig_state>
	endif
	if NOT (<has_a_mic> = <orig_state>)
		launchevent \{type = unfocus
			target = current_menu}
		break
	endif
	wait \{1
		gameframes}
	repeat
	ui_create_tutorial_menu
endscript
tutorial_on_enter_venue = load_z_cairo

script exit_tutorial_cleanup 
	persistent_band_create_band \{async = 0}
	change current_level = ($tutorial_on_enter_venue)
	load_venue \{block_scripts = 0}
endscript

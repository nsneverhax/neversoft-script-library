
script ui_create_tutorial_menu 
	make_generic_menu \{Title = qs(0xc6510dd1)
		dims = (400.0, 400.0)
		desc = 'generic_tutorial_select'}
	generic_menu :SE_SetProps \{help_text_caption_text = qs(0x00000000)}
	generic_menu :SE_SetProps \{challenge_instrument_alpha = 0.0}
	Change \{rich_presence_context = presence_tutorial}
	cheat_turnoffall
	vocals_distribute_mics \{allow_default_headset}
	GetControllerType controller = ($primary_controller)
	if ($allow_controller_for_all_instruments = 1)
		tutorial_system_set_part \{part = guitar}
	else
		switch (<controller_type>)
			case guitar
			case bass
			case Drum
			tutorial_system_set_part part = <controller_type>
			default
			tutorial_system_set_part \{part = vocals}
		endswitch
	endif
	add_generic_tutorial_menu_icon_item {
		icon = gig_summary_star_256
		icon_rgba = ($UIColorRef_Palette.yellow_lt.rgba)
		text = qs(0xaf4736cc)
		choose_state = UIstate_tutorial_gameplay_load
		choose_state_data = {tutorial_header = 'gameplay' Title = qs(0xaf4736cc)}
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
		choose_state = UIstate_tutorial_menu_skill_level
		choose_state_data = {tutorial_header = 'guitar' Title = qs(0x9504b94a) check_lefty_flip = 1}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($guitar_tutorial_helper_text)}}
	}
	if ($allow_controller_for_all_instruments = 0)
		if (<controller_type> != guitar)
			AddParam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item <params>
	params = {
		icon = mixer_icon_bass
		text = qs(0x7d4f9214)
		choose_state = UIstate_tutorial_bass_load
		choose_state_data = {tutorial_header = 'bass' Title = qs(0x7d4f9214) check_lefty_flip = 1}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($bass_tutorial_helper_text)}}
	}
	if ($allow_controller_for_all_instruments = 0)
		if (<controller_type> != guitar)
			AddParam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item <params>
	params = {
		icon = mixer_icon_drums
		text = qs(0x388cd3db)
		choose_state = UIstate_tutorial_drums_load
		choose_state_data = {tutorial_header = 'drum' Title = qs(0x388cd3db) check_lefty_flip = 1}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($drum_tutorial_helper_text)}}
	}
	if ($allow_controller_for_all_instruments = 0)
		if (<controller_type> != Drum)
			AddParam \{structure_name = params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item <params>
	params = {
		icon = mixer_icon_vox
		text = qs(0x1b9f6f84)
		choose_state = UIstate_tutorial_vocals_load
		choose_state_data = {tutorial_header = 'vocals' Title = qs(0x1b9f6f84)}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($vocals_tutorial_helper_text)}}
	}
	GetControllerType controller = ($primary_controller)
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
			AddParam \{structure_name = params
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
		choose_state = UIstate_tutorial_band_load
		choose_state_data = {tutorial_header = 'band' Title = qs(0x34dc8180)}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = {helper_text = ($band_tutorial_helper_text)}}
	}
	LaunchEvent \{type = focus
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
	Change \{game_mode = tutorial}
	Change \{g_in_tutorial = 1}
	hide_crowd_models
	Change \{disable_crowd = 1}
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
	Change \{disable_crowd = 0}
	hide_crowd_models \{active = false}
	spawnscriptnow \{noqbid
		switch_to_no_band_camera}
	fadetoblack \{off
		z_priority = 1
		alpha = 1.0
		time = 0.1
		no_wait}
	hide_glitch \{num_frames = 25}
	GMan_SongFunc \{func = clear_play_list}
	Change \{g_in_tutorial = 0}
	Change \{game_mode = career}
endscript

script add_generic_tutorial_menu_text_item \{pad_choose_sound = generic_menu_pad_choose_sound}
	add_generic_menu_text_item {
		<...>
		dims = (262.0, 35.0)
		font = fontgrid_text_A3
		rgba = [113 121 133 255]
		not_focusable_rgba = [40 40 40 255]
		focus_script = focus_generic_tutorial_menu_text_item
		unfocus_script = unfocus_generic_tutorial_menu_text_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_tutorial_menu_text_item 
	if ScreenElementExists \{id = generic_menu}
		<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = [22 26 30 255]
		<id> :SE_SetProps generic_menu_smenu_textitem_text_font = <font>
		if ScreenElementExists \{id = generic_tutorial_menu_hilite}
			DestroyScreenElement \{id = generic_tutorial_menu_hilite}
		endif
		CreateScreenElement {
			id = generic_tutorial_menu_hilite
			parent = <id>
			type = SpriteElement
			desc = 'generic_tutorial_select_item'
			texture = white
			rgba = [113 121 133 255]
			just = [left , center]
			dims = (307.0, 27.0)
			scale = 1
			alpha = 1
			Pos = (-15.0, 20.0)
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

script unfocus_generic_tutorial_menu_text_item 
	<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = [113 121 133 255]
	<id> :SE_SetProps generic_menu_smenu_textitem_text_font = <font>
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_generic_tutorial_menu_icon_item \{icon_alpha = 1.0}
	if GotParam \{not_focusable}
		if (<icon_alpha> > 0.1)
			<icon_alpha> = 0.1
		endif
	endif
	add_generic_menu_icon_item {
		<...>
		desc = 'generic_tutorial_menu_icon_item'
		dims = (325.0, 35.0)
		font = fontgrid_text_A3
		rgba = [145 154 173 255]
		not_focusable_rgba = [80 80 80 255]
		additional_choose_script = generic_menu_pad_choose_sound
		focus_script = focus_generic_tutorial_menu_icon_item
		unfocus_script = unfocus_generic_tutorial_menu_icon_item
	}
	return item_container_id = <item_container_id>
endscript

script focus_generic_tutorial_menu_icon_item 
	if ScreenElementExists \{id = generic_menu}
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_rgba = [22 26 30 255]
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_font = <font>
		if ScreenElementExists \{id = generic_tutorial_menu_hilite}
			DestroyScreenElement \{id = generic_tutorial_menu_hilite}
		endif
		CreateScreenElement {
			id = generic_tutorial_menu_hilite
			parent = <id>
			type = SpriteElement
			texture = white
			rgba = [145 154 173 255]
			just = [left , center]
			dims = (385.0, 27.0)
			scale = 1
			alpha = 1
			Pos = (44.0, 22.0)
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

script unfocus_generic_tutorial_menu_icon_item 
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_rgba = [145 154 173 255]
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_font = <font>
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script tutorial_menu_controller_handler 
	orig_state = <has_a_mic>
	GetControllerType controller = ($primary_controller)
	prev_type = <controller_type>
	begin
	has_a_mic = 0
	vocals_get_num_mics
	if (<num_mics> > 0)
		has_a_mic = 1
	endif
	if controller_has_headset controller = ($primary_controller)
		has_a_mic = 1
	endif
	GetControllerType controller = ($primary_controller)
	curr_type = <controller_type>
	if (<controller_type> = guitar || <controller_type> = Drum)
		has_a_mic = <orig_state>
	endif
	if NOT (<has_a_mic> = <orig_state>)
		LaunchEvent \{type = unfocus
			target = current_menu}
		break
	endif
	if NOT (<curr_type> = <prev_type>)
		LaunchEvent \{type = unfocus
			target = current_menu}
		break
	endif
	wait \{1
		gameframes}
	repeat
	ui_create_tutorial_menu
endscript
tutorial_on_enter_venue = load_Z_Cairo

script exit_tutorial_cleanup 
	persistent_band_create_band \{async = 0}
	Change current_level = ($tutorial_on_enter_venue)
	Load_Venue \{block_scripts = 0}
endscript

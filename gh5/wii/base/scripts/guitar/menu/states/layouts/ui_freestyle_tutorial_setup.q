
script ui_create_freestyle_tutorial_setup 
	CreateScreenElement \{parent = root_window
		id = freestyle_tutorial_setup_tree
		Type = descinterface
		desc = 'freestyle_tutorial_setup_tree_v2'}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = banner_animatable}
	<resolved_id> :obj_spawnscript ui_shakeytime
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_skull_add_container}
	<resolved_id> :obj_spawnscript ui_shakey
	<resolved_id> :obj_spawnscript ui_frazzmatazz
	create_2d_spring_system \{desc_id = freestyle_tutorial_setup_tree
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = tutorial_setup}}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_back freestyle_tutorial_setup_back}
		]
	}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_option_guitar}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_tutorial_setup_trigger_info_text params = {guitar}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_tutorial_setup_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_tutorial_setup_choose_guitar}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
		z_priority = 12
	}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_option_drums}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_tutorial_setup_trigger_info_text params = {drums}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_tutorial_setup_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_tutorial_setup_choose_drums}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
		z_priority = 12
	}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_option_air_drums}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_tutorial_setup_trigger_info_text params = {air_drums}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_tutorial_setup_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_tutorial_setup_choose_air_drums}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
		z_priority = 12
	}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_option_advanced}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_tutorial_setup_trigger_info_text params = {advanced}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_tutorial_setup_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_tutorial_setup_choose_advanced}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
		z_priority = 12
	}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_option_bass}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_tutorial_setup_trigger_info_text params = {bass}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_tutorial_setup_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_tutorial_setup_choose_bass}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
		z_priority = 12
	}
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
	LaunchEvent Type = focus target = <resolved_id>
endscript

script ui_destroy_freestyle_tutorial_setup 
	DestroyScreenElement \{id = freestyle_tutorial_setup_tree}
	clean_up_user_control_helpers
endscript

script freestyle_tutorial_setup_back 
	generic_event_choose \{state = uistate_freestyle_mainmenu
		clear_previous_stack}
endscript

script freestyle_tutorial_cancel_tutorial_selection 
	destroy_dialog_box
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
	LaunchEvent Type = focus target = <resolved_id>
endscript

script freestyle_tutorial_setup_choose_guitar 
	getwiicontrollertype controller = <device_num>
	if (<controller_type> = guitar)
		freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			player_device = <device_num>
			heading_text = qs(0x4f022e0d)
			body_text = qs(0xdf12eb32)
			options = [
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = guitar handedness = righty}
					text = qs(0x7b0518c0)
				}
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = guitar handedness = lefty}
					text = qs(0x2e9b1b43)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			back_button_script = freestyle_tutorial_cancel_tutorial_selection
		}
	else
		if ((<controller_type> = rb_drumkit) || (<controller_type> = rb_guitar) || (<controller_type> = None))
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = rockband
		else
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = guitar
		endif
	endif
endscript

script freestyle_tutorial_setup_choose_drums 
	getwiicontrollertype controller = <device_num>
	if (<controller_type> = drumkit)
		freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			player_device = <device_num>
			heading_text = qs(0x4f022e0d)
			body_text = qs(0xdf12eb32)
			options = [
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = drums handedness = righty}
					text = qs(0x7b0518c0)
				}
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = drums handedness = lefty}
					text = qs(0x2e9b1b43)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			back_button_script = freestyle_tutorial_cancel_tutorial_selection
		}
	else
		if ((<controller_type> = rb_drumkit) || (<controller_type> = rb_guitar) || (<controller_type> = None))
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = rockband
		else
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = drums
		endif
	endif
endscript

script freestyle_tutorial_setup_choose_air_drums 
	getwiicontrollertype controller = <device_num>
	if (<controller_type> = nunchuk)
		freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			player_device = <device_num>
			heading_text = qs(0x4f022e0d)
			body_text = qs(0xdf12eb32)
			options = [
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = drums handedness = righty}
					text = qs(0x7b0518c0)
				}
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = drums handedness = lefty}
					text = qs(0x2e9b1b43)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			back_button_script = freestyle_tutorial_cancel_tutorial_selection
		}
	else
		if ((<controller_type> = rb_drumkit) || (<controller_type> = rb_guitar) || (<controller_type> = None))
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = rockband
		else
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = nunchuk
		endif
	endif
endscript

script freestyle_tutorial_setup_choose_advanced 
	getwiicontrollertype controller = <device_num>
	if (<controller_type> = guitar)
		freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			player_device = <device_num>
			heading_text = qs(0x4f022e0d)
			body_text = qs(0xdf12eb32)
			options = [
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = advanced instrument = guitar handedness = righty}
					text = qs(0x7b0518c0)
				}
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = advanced instrument = guitar handedness = lefty}
					text = qs(0x2e9b1b43)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			back_button_script = freestyle_tutorial_cancel_tutorial_selection
		}
	else
		if ((<controller_type> = rb_drumkit) || (<controller_type> = rb_guitar) || (<controller_type> = None))
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = rockband
		else
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = guitar
		endif
	endif
endscript

script freestyle_tutorial_setup_choose_bass 
	getwiicontrollertype controller = <device_num>
	if (<controller_type> = guitar)
		freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			player_device = <device_num>
			heading_text = qs(0x4f022e0d)
			body_text = qs(0xdf12eb32)
			options = [
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = bass handedness = righty}
					text = qs(0x7b0518c0)
				}
				{
					func = freestyle_launch_tutorials
					func_params = {device_num = <device_num> difficulty = beginner instrument = bass handedness = lefty}
					text = qs(0x2e9b1b43)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			back_button_script = freestyle_tutorial_cancel_tutorial_selection
		}
	else
		if ((<controller_type> = rb_drumkit) || (<controller_type> = rb_guitar) || (<controller_type> = None))
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = rockband
		else
			freestyle_tutorial_setup_spawn_notice controller = (<device_num> + 1) required_type = guitar
		endif
	endif
endscript

script freestyle_tutorial_setup_spawn_notice 
	switch <required_type>
		case guitar
		text = qs(0xefaab628)
		case drums
		text = qs(0xafb98ec7)
		case nunchuk
		text = qs(0x333fead0)
		case rockband
		text = qs(0xdf39fa26)
	endswitch
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_menu}
	LaunchEvent Type = unfocus target = <resolved_id>
	create_dialog_box {
		use_all_controllers
		heading_text = qs(0xcf5deb58)
		body_text = <text>
		options = [
			{
				func = freestyle_tutorial_setup_destroy_notice
				func_params = {dont_remove_helpers}
				text = qs(0x0e41fe46)
			}
		]
		dlog_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		on_destroy_script = LaunchEvent
		on_destroy_script_params = {Type = focus target = <resolved_id>}
	}
endscript

script freestyle_tutorial_setup_destroy_notice 
	destroy_dialog_box
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script freestyle_tutorial_setup_trigger_info_text 
	freestyle_tutorial_setup_tree :desc_resolvealias \{Name = alias_info_text}
	text = qs(0x00000000)
	printstruct <...>
	if GotParam \{guitar}
		text = qs(0x069a387f)
	elseif GotParam \{bass}
		text = qs(0x7f97184b)
	elseif GotParam \{drums}
		text = qs(0xeb2f3bc6)
	elseif GotParam \{air_drums}
		text = qs(0xb34112aa)
	elseif GotParam \{error}
		formatText TextName = text qs(0xeaddf292) n = <controller> i = <required_type>
	elseif GotParam \{beginner}
		text = qs(0xf7e7796b)
	elseif GotParam \{advanced}
		text = qs(0x0ff815f5)
	endif
	<resolved_id> :se_setprops {
		text = <text>
	}
endscript

script freestyle_tutorial_setup_text_flash 
	<id> :se_setprops {
		alpha = 0
		Scale = 1.2
	}
	<id> :se_setprops {
		alpha = 1
		rgba = [0 255 255 255]
		Scale = 1.0
		time = 0.1
	}
	Wait \{0.1
		Seconds}
	<id> :se_setprops {
		rgba = [255 255 255 255]
		time = 0.1
	}
	Wait \{0.5
		Seconds}
endscript

script freestyle_launch_tutorials 
	destroy_dialog_box
	Change \{freestyle_game_mode = tutorial}
	Change \{freestyle_recording_mode = None}
	freestyle_set_default_player_data
	freestyle_setup_tutorial_player controller = <device_num> difficulty = <difficulty> instrument = <instrument> handedness = <handedness>
	freestyle_apply_style_settings_by_id \{style_id = tutorial}
	generic_event_replace \{data = {
			state = uistate_freestyle_game
			clear_previous_stack
		}}
endscript

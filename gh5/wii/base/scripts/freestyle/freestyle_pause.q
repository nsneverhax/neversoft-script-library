
script freestyle_spawn_pause_menu 
	if NOT GotParam \{device_num}
		device_num = [0 1 2 3]
	endif
	freestyle_toggle_controller_manager \{OFF}
	freestyle_pause
	generic_menu_pad_choose_sound
	kill_start_key_binding
	CreateScreenElement {
		parent = freestyle_root
		id = freestyle_pause_tree
		Type = descinterface
		desc = 'freestyle_pause_tree_v2'
		song_genre_text = ($freestyle_current_style_settings.visible_name)
	}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_clown2_container}
	<resolved_id> :obj_spawnscript ui_shakey
	<resolved_id> :obj_spawnscript ui_frazzmatazz
	create_2d_spring_system \{desc_id = freestyle_pause_tree
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = Pause controller = <device_num>}}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_start freestyle_pause_resume}
		]
		exclusive_device = <device_num>
	}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_resume}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_pause_tree Pos = (-265.0, 0.0) Scale = (1.4, 1.5)}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_pause_resume}
		]
		exclusive_device = <device_num>
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_restart}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_pause_tree Pos = (-265.0, 0.0) Scale = (1.4, 1.5)}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_pause_restart}
		]
		exclusive_device = <device_num>
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_end}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_pause_tree Pos = (-265.0, 0.0) Scale = (1.4, 1.5)}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_pause_end}
		]
		exclusive_device = <device_num>
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_debug}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_pause_tree Pos = (-265.0, 0.0) Scale = (1.4, 1.5)}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_pause_debug}
		]
		exclusive_device = <device_num>
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	if ($enable_debug = 0)
		freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_debug}
		DestroyScreenElement id = <resolved_id>
	endif
	if (($freestyle_game_mode) = tutorial)
		freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_restart}
		<resolved_id> :se_setprops {text = qs(0x24793bfb)}
		freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_end}
		<resolved_id> :se_setprops {text = qs(0x55c34bc7)}
	endif
	if (($freestyle_recording_mode) = playback)
		freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_option_end}
		<resolved_id> :se_setprops {text = qs(0x55c34bc7)}
	endif
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
	LaunchEvent Type = focus target = <resolved_id>
	if (($freestyle_game_mode) = tutorial)
		freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
		LaunchEvent Type = unfocus target = <resolved_id>
	endif
endscript

script freestyle_pause_resume 
	generic_menu_pad_choose_sound
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freestyle_pause_tree}
	freestyle_set_start_key_binding
	if (($freestyle_game_mode) = tutorial)
		freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
		LaunchEvent Type = focus target = <resolved_id>
	endif
	Wait \{2
		frames}
	freestyle_unpause
	freestyle_toggle_controller_manager \{On}
endscript

script freestyle_pause_restart 
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
		if (($freestyle_recording_mode) = overdub)
			heading_text = qs(0xaa163738)
			body_text = qs(0x7606e417)
		elseif (($freestyle_recording_mode) = record)
			heading_text = qs(0xaa163738)
			body_text = qs(0x66e052f1)
		elseif (($freestyle_recording_mode) = playback)
			heading_text = qs(0xcf5deb58)
			body_text = qs(0x0be331bb)
		elseif (($freestyle_recording_mode) = None)
			if (($freestyle_game_mode) = tutorial)
				heading_text = qs(0xcf5deb58)
				body_text = qs(0x6dddab0d)
			endif
		endif
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			use_all_controllers
			heading_text = <heading_text>
			body_text = <body_text>
			options = [
				{
					func = destroy_dialog_box
					func_params = {dont_remove_helpers}
					text = qs(0xf7723015)
				}
				{
					func = freestyle_pause_restart
					text = qs(0xb8790f2f)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			on_destroy_script = LaunchEvent
			on_destroy_script_params = {Type = focus target = <resolved_id>}
		}
	else
		generic_menu_pad_choose_sound
		destroy_dialog_box
		Change \{freestyle_restarting = true}
		generic_event_replace \{data = {
				state = uistate_freestyle_game
				clear_previous_stack
			}}
	endif
endscript

script freestyle_pause_end 
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
		if (($freestyle_recording_mode) = overdub)
			heading_text = qs(0xaa163738)
			body_text = qs(0x1ccd5a50)
			option_1 = qs(0x502d0838)
			option_2 = qs(0xf7723015)
		elseif (($freestyle_recording_mode) = record)
			heading_text = qs(0xaa163738)
			body_text = qs(0xfa74b319)
			option_1 = qs(0x502d0838)
			option_2 = qs(0xf7723015)
		elseif (($freestyle_recording_mode) = playback)
			heading_text = qs(0xcf5deb58)
			body_text = qs(0x888b5a00)
			option_1 = qs(0x67d9c56d)
			option_2 = qs(0xf7723015)
		elseif (($freestyle_recording_mode) = None)
			if (($freestyle_game_mode) = tutorial)
				heading_text = qs(0xcf5deb58)
				body_text = qs(0x13ed4eb2)
				option_1 = qs(0x67d9c56d)
				option_2 = qs(0xf7723015)
			endif
		endif
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			use_all_controllers
			heading_text = <heading_text>
			body_text = <body_text>
			options = [
				{
					func = destroy_dialog_box
					func_params = {dont_remove_helpers}
					text = <option_2>
				}
				{
					func = freestyle_pause_end
					text = <option_1>
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			on_destroy_script = LaunchEvent
			on_destroy_script_params = {Type = focus target = <resolved_id>}
		}
	else
		generic_menu_pad_choose_sound
		destroy_dialog_box
		DestroyScreenElement \{id = freestyle_pause_tree}
		freestyle_end_game \{from_menu = true}
	endif
endscript
freestyle_debug_menu_pak_path = 'pak/ui/debug_menu.pak'

script freestyle_pause_debug 
	Change \{debug_revert_from_debug_script = freestyle_pause_refocus_from_debug}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_pause_tree :se_setprops \{alpha = 0}
	if NOT ispakloaded \{$freestyle_debug_menu_pak_path
			Heap = heap_temporary}
		LoadPak \{$freestyle_debug_menu_pak_path
			Heap = heap_temporary}
	endif
	create_debugging_menu
endscript

script freestyle_pause_refocus_from_debug 
	destroy_debugging_menu
	UnLoadPak \{$freestyle_debug_menu_pak_path}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
	LaunchEvent Type = focus target = <resolved_id>
	freestyle_pause_tree :se_setprops \{alpha = 1}
	Change \{debug_revert_from_debug_script = back_to_retail_menu}
endscript

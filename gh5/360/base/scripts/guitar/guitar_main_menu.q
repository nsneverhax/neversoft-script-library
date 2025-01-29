g_mainmenu_freeplay_timer = 120

script mainmenu_populate_menu_options_global 
	mainmenu_text = {
		career = {
			menu_item_text = qs(0xde7ec8b3)
			helper_text = qs(0x3a276c3f)
		}
		quickplay = {
			menu_item_text = qs(0xfabdce2b)
			helper_text = qs(0x274833eb)
		}
		training = {
			menu_item_text = qs(0xd093953b)
			helper_text = qs(0x1d06e07b)
		}
		competitive = {
			menu_item_text = qs(0x6e63fe63)
			helper_text = qs(0x822a435b)
		}
		music_store = {
			menu_item_text = qs(0xa8e9637f)
			helper_text = qs(0xb21014b9)
		}
		music_central = {
			menu_item_text = $guitar_main_menu_ghstudio_string
			helper_text = $music_central_helper_text
		}
		creator = {
			menu_item_text = qs(0x9f894c1e)
			helper_text = qs(0x351586ce)
		}
		options = {
			menu_item_text = qs(0x976cf9e7)
			helper_text = qs(0x55e419ba)
		}
		leaderboards = {
			menu_item_text = qs(0xa1ae7e56)
			helper_text = qs(0xb1e36b7c)
		}
		debugmenu = {
			menu_item_text = qs(0xafdfad24)
			helper_text = qs(0x03ac90f0)
		}
		motd = {
			menu_item_text = qs(0x3e13521a)
			helper_text = qs(0x11d60d78)
		}
		xbox_party = {
			menu_item_text = qs(0x58e064fa)
			helper_text = qs(0xde181a9e)
		}
	}
	Change g_mainmenu_text = <mainmenu_text>
endscript
force_mainmenu_signin = 0

script mainmenu_kill_song_and_characters 
	closesonglogfile
	gman_songfunc \{func = clear_play_list}
endscript

script fix_primary_controller_for_autolaunch 
	if (($primary_controller) = -1)
		Change \{primary_controller = 0}
	endif
	Change \{primary_controller_assigned = 1}
endscript

script create_main_menu 
	reset_all_special_events
	clear_exclusive_devices
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	disable_pause
	UnPauseGame
	disable_pause
	SpawnScriptNow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	Change \{end_credits = 0}
	setplayerinfo \{1
		device = 0}
	setplayerinfo \{2
		device = 1}
	setplayerinfo \{3
		device = 2}
	setplayerinfo \{4
		device = 3}
	if ($new_message_of_the_day = 1)
		RunScriptOnScreenElement \{id = current_menu
			pop_in_new_downloads_notifier}
	endif
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		main_menu_select_online
		fadetoblack \{OFF
			time = 0}
	else
	endif
	if ($autolaunch_cas = 1)
		Change \{autolaunch_cas = 0}
		spawnscriptdelayed frames = 20 ui_event_wait params = {event = menu_change data = {state = uistate_character_selection device_num = ($primary_controller) from_main_menu}}
	endif
	if ($autolaunch_jam = 1)
		Change \{autolaunch_jam = 0}
		spawnscriptdelayed frames = 20 music_central_select_music_studio params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_lobby = 1)
		Change \{autolaunch_lobby = 0}
		spawnscriptdelayed frames = 20 main_menu_select_band_lobby params = {device_num = ($primary_controller) lobby_mode = ($g_lobby_state)}
	endif
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_freeplay_timer}
	TOD_Proxim_Update_LightFX_Viewport \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 0}
	venue_screenfx
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	CreateScreenElement \{parent = root_window
		id = mainmenu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
			motd_id = None
		}}
	mainmenu_setup_physics_elements \{screen_id = mainmenu_id}
	mainmenu_setup_option \{choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = quickplay
		}
		menu_item = quickplay}
	mainmenu_setup_option \{choose_script = main_menu_select_career
		choose_params = {
			lobby_mode = career
		}
		menu_item = career}
	mainmenu_setup_option \{choose_script = main_menu_select_music_store
		menu_item = music_store}
	mainmenu_setup_option \{choose_script = music_central_select_music_studio
		menu_item = music_central}
	mainmenu_setup_option \{choose_script = main_menu_select_options
		menu_item = options}
	if isxenonorwindx
		mainmenu_setup_option \{choose_script = main_menu_select_xbox_party
			menu_item = xbox_party}
	endif
	mainmenu_setup_option \{choose_script = main_menu_select_leaderboards
		menu_item = leaderboards}
	mainmenu_setup_option \{choose_script = main_menu_select_cas
		menu_item = creator}
	mainmenu_setup_option \{choose_script = main_menu_select_training
		menu_item = training}
	mainmenu_setup_option \{choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = vs
		}
		menu_item = competitive}
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if ((<show_debug_menus>) && ($is_multiplayer_beta = 0))
		mainmenu_setup_option \{choose_script = main_menu_select_debug
			menu_item = debugmenu}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				main_menu_select_freeplay
			}
		]}
	create_motd
	set_focus_color
	set_unfocus_color
endscript

script main_menu_select_xbox_party 
	printf \{qs(0x7743abb8)}
	generic_menu_pad_choose_sound
	if CheckForSignIn controller_index = <device_num> network_platform_only
		NetSessionFunc {
			Obj = plat_party
			func = show_party_sessions_ui
			params = {
				controller_index = <device_num>
			}
		}
	else
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			current_menu :se_setprops \{block_events}
		endif
		if ScreenElementExists \{id = motdinterface}
			LaunchEvent \{Type = unfocus
				target = motdinterface}
		endif
		create_dialog_box {
			dlg_z_priority = 1000
			heading_text = qs(0xaa163738)
			body_text = qs(0x113c41ea)
			parent = root_window
			no_background
			options = [
				{
					func = main_menu_xbox_party_dialog_box_exit
					text = qs(0x0e41fe46)
				}
			]
			player_device = <device_num>
		}
		AssignAlias id = <menu_id> alias = main_menu_select_xbox_party_warning
		LaunchEvent \{Type = focus
			target = main_menu_select_xbox_party_warning}
	endif
endscript

script main_menu_xbox_party_dialog_box_exit 
	printf \{qs(0x7fc8b8a0)}
	if ScreenElementExists \{id = main_menu_select_xbox_party_warning}
		destroy_dialog_box
	endif
	if ScreenElementExists \{id = motdinterface}
		LaunchEvent \{Type = focus
			target = motdinterface}
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0x8a778398)
		button = yellow
		z = 100
		all_buttons}
	if ScreenElementExists \{id = motdinterface}
		add_user_control_helper \{text = qs(0x3e13521a)
			button = blue
			z = 100
			all_buttons}
	endif
endscript

script mainmenu_setup_physics_elements 
	RequireParams \{[
			screen_id
		]
		all}
	create_2d_spring_system desc_id = <screen_id> num_springs = 2 stiffness = 50 rest_length = 1
	if <screen_id> :desc_resolvealias Name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_logo_container param = gh5_logo_id
		<gh5_logo_id> :obj_spawnscript ui_alphaflight
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_up_arrow
		arrow_up_id = <resolved_id>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_down_arrow
		arrow_down_id = <resolved_id>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_vmenu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SetTags \{smooth_morph_time = 0.1}
		<event_handlers> = [
			{pad_up mainmenu_pad_up params = {arrow_id = <arrow_up_id>}}
			{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
			{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
			{pad_down mainmenu_pad_down params = {arrow_id = <arrow_down_id>}}
			{menu_selection_changed generic_menu_up_or_down_sound}
		]
		current_menu :se_setprops event_handlers = <event_handlers>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
endscript

script mainmenu_setup_option 
	if ScreenElementExists \{id = mainmenu_id}
		RequireParams \{[
				menu_item
			]
			all}
		menu_item_text = ($g_mainmenu_text.<menu_item>.menu_item_text)
	else
		RequireParams \{[
				menu_item_text
			]
			all}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'menurow_txt_desc'
		autosizedims = true
		menurow_txt_item_text = <menu_item_text>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_unfocus_color)
	}
	if GotParam \{blank_entry}
		<id> :se_setprops {
			not_focusable
		}
	elseif GotParam \{not_focusable}
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = [64 64 64 255]
		}
	else
		if ScreenElementExists \{id = mainmenu_id}
			<id> :SetTags {
				menu_item = <menu_item>
			}
		elseif GotParam \{helper_text}
			RequireParams \{[
					screen_id
				]
				all}
			<id> :SetTags {
				helper_text = <helper_text>
				screen_id = <screen_id>
			}
		endif
		Sound = true
		if GotParam \{no_sound}
			<Sound> = FALSE
		endif
		array = [
			{focus mainmenu_item_focus params = {Sound = <Sound>}}
			{unfocus mainmenu_item_unfocus params = {Sound = <Sound>}}
		]
		if GotParam \{choose_state}
			AddArrayElement array = <array> element = {pad_choose generic_blocking_execute_script params = {pad_script = generic_event_choose pad_params = {state = <choose_state> data = {<choose_params>}}}}
		elseif GotParam \{choose_script}
			AddArrayElement array = <array> element = {pad_choose generic_blocking_execute_script params = {pad_script = <choose_script> pad_params = {<choose_params>}}}
		endif
		if GotParam \{back_state}
			AddArrayElement array = <array> element = {pad_back generic_event_back params = {state = <back_state>}}
		elseif GotParam \{back_script}
			AddArrayElement array = <array> element = {pad_back <back_script>}
		endif
		<id> :se_setprops event_handlers = <array>
	endif
	return mainmenu_item_id = <id>
endscript

script mainmenu_item_focus \{time = 0.05
		grow_scale = 1.5
		Sound = true}
	if (<Sound> = true)
	endif
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	if ScreenElementExists \{id = mainmenu_id}
		if <id> :GetSingleTag menu_item
			mainmenu_id :se_setprops {
				mainmenu_helper_text_text = ($g_mainmenu_text.<menu_item>.helper_text)
				motion = ease_in
				time = <time>
			}
		endif
	else
		<id> :GetTags
		if GotParam \{helper_text}
			<screen_id> :se_setprops mainmenu_helper_text_text = <helper_text>
		endif
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_focus_color)
		motion = ease_in
		time = <time>
	}
endscript

script mainmenu_item_unfocus \{time = 0.05}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_unfocus_color)
		motion = ease_in
		Scale = <Scale>
		time = <time>
	}
endscript

script mainmenu_pad_up 
	RequireParams \{[
			arrow_id
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_freeplay_timer}
endscript

script mainmenu_pad_down 
	RequireParams \{[
			arrow_id
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse params = {down}
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_freeplay_timer}
endscript

script mainmenu_do_arrow_pulse 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = dropdown_arrow
		dims = (64.0, 32.0)
		Pos = (32.0, 16.0)
		just = [center center]
		rgba = (($g_menu_colors).gh5_focus_white)
		z_priority = 6
	}
	if GotParam \{down}
		<id> :se_setprops flip_h
	endif
	<id> :se_setprops Scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 time = 0.1 relative_scale
	Wait \{0.1
		Seconds}
	DestroyScreenElement id = <id>
endscript

script mainmenu_do_scroll_glow 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (32.0, 16.0)
		rgba = [255 215 0 255]
		just = [center center]
		z_priority = 0
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	Wait \{0.2
		Seconds}
	DestroyScreenElement id = <id>
endscript

script destroy_main_menu 
	generic_ui_destroy
	DestroyScreenElement \{id = mainmenu_id}
endscript

script main_menu_select_freeplay 
	play_cameracut \{prefix = 'cameras_no_band'}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SpawnScriptNow \{killmenumusicslowly}
	SpawnScriptNow \{going_into_freeplay_from_main_menu}
	if NOT GotParam \{do_not_play_sfx}
		generic_menu_pad_choose_sound
	endif
	if GotParam \{device_num}
		set_primary_controller {
			device_num = <device_num>
			require_signin = 0
			state = uistate_freeplay
			data = {
				no_sound = 1
				clear_previous_stack
				freeplay_auto_join_device = <device_num>
			}
		}
	else
		ui_event \{event = menu_replace
			data = {
				state = uistate_freeplay
				clear_previous_stack
			}}
	endif
endscript

script main_menu_select_career 
	StopRendering
	if NOT has_completed_forced_career_flow device_num = <device_num>
		main_menu_select_band_lobby lobby_mode = career device_num = <device_num> state = uistate_career_movie data = {movie = 'career_intro' new_state = uistate_character_selection new_data = {device_num = <device_num>}}
	else
		main_menu_select_band_lobby lobby_mode = career device_num = <device_num>
	endif
endscript

script main_menu_select_band_lobby \{state = uistate_band_lobby_setup
		data = {
		}}
	StopRendering
	RequireParams \{[
			lobby_mode
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	Change g_lobby_state = <lobby_mode>
	if checksumequals a = <lobby_mode> b = career
		if has_completed_forced_career_flow device_num = <device_num>
			Change \{g_lobby_enter_from_main_menu = 1}
		endif
	else
		Change \{g_lobby_enter_from_main_menu = 1}
	endif
	<data> = {<data> device_num = <device_num>}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = <state> data = <data> optional_signin = 1
endscript

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_select_music_central 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_music_central
endscript

script main_menu_select_cas 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	hide_glitch \{num_frames = 10}
	lightshow_notingameplay_setmood \{mood = band_lobby}
	play_cameracut \{prefix = 'cameras_no_band'}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection optional_signin = 1 data = {device_num = <device_num> from_main_menu}
endscript

script main_menu_select_training 
	hide_glitch \{num_frames = 15}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_select_training require_signin = 0 data = {from_main_menu = 1 no_sound = 1}
endscript

script main_menu_select_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> optional_signin = 1 state = uistate_options data = {no_sound = 1}
endscript

script main_menu_select_leaderboards 
	Change \{rich_presence_context = presence_leaderboards}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> require_signin = 0 state = uistate_leaderboard_instrument data = {no_sound = 1}
endscript

script main_menu_select_debug 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
endscript

script main_menu_select_music_store 
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> require_live = 1 musicstore = 1 state = uistate_songlist data = {mode = music_store no_sound = 1}
endscript

script main_menu_select_motd 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_motd}
endscript

script main_menu_select_vip 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_vip_invite}
endscript

script pop_in_new_downloads_notifier \{time = 0.5}
	Wait \{0.5
		Second}
	if NOT ScreenElementExists \{id = main_menu_text_container}
		return
	endif
	Pos = (100.0, 390.0)
	text = qs(0x40fdb3fc)
	CreateScreenElement {
		Type = TextElement
		parent = main_menu_text_container
		text = <text>
		Scale = 0.5
		rgba = [255 255 205 255]
		just = [center center]
		font_spacing = 5
		font = fontgrid_text_a3
		Pos = <Pos>
		z_priority = 5
		alpha = 0
	}
	GetScreenElementDims id = <id>
	if (<width> >= 500)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	CreateScreenElement {
		Type = TextElement
		parent = main_menu_text_container
		id = new_downloads_text_glow
		text = <text>
		Scale = 0.5
		rgba = [255 255 255 255]
		font = fontgrid_text_a3
		just = [center center]
		font_spacing = 5
		Pos = <Pos>
		z_priority = 6
		alpha = 0
	}
	GetScreenElementDims id = <id>
	if (<width> >= 500)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaySprite {
		parent = main_menu_text_container
		tex = white
		Pos = (<Pos>)
		just = [center center]
		rgba = [170 90 35 255]
		z = 4
		dims = ((<width> + 20) * (1.0, 0.0) + (0.0, 1.0) * (<height> + 10))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaySprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [right center]
		rgba = [170 90 35 255]
		z = 4
		Pos = ((<Pos>) - <width> * (0.5, 0.0) - (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		flip_v
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaySprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [left center]
		rgba = [170 90 35 255]
		z = 4
		Pos = ((<Pos>) + <width> * (0.5, 0.0) + (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	SpawnScriptNow \{glow_new_downloads_text
		params = {
			time = 0.75
		}}
endscript

script main_menu_select_generic 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if GotParam \{dont_clear_stack}
		generic_event_choose state = <state> data = {<data>}
	else
		generic_event_choose state = <state> data = {<data>}
	endif
endscript

script set_primary_controller \{event = menu_change
		require_signin = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ((GotParam Force) || ($force_mainmenu_signin = 1))
		Change \{primary_controller_assigned = 0}
		Change \{primary_controller = -1}
		Change \{force_mainmenu_signin = 0}
	endif
	Change \{signin_jam_mode = 0}
	if ($game_mode = freeplay)
		Change \{game_mode = p1_quickplay}
	endif
	if GotParam \{jam}
		if ($jam_view_cam_created = 1)
			ScriptAssert \{'logic error, this value should be zero here'}
		endif
		Change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = {<data> jam = 1} jam = 1 require_signin = <require_signin> require_live = <require_live>}
	else
		if ($skip_signin = 1)
			ui_event event = menu_change data = <...>
		else
			generic_event_choose event = <event> no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> require_signin = <require_signin> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> musicstore = <musicstore> optional_signin = <optional_signin>}
		endif
	endif
endscript

script mainmenu_freeplay_timer 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait ($g_mainmenu_freeplay_timer) Seconds
	main_menu_select_freeplay \{do_not_play_sfx}
endscript

g_mainmenu_freeplay_timer = 60

script mainmenu_populate_menu_options_global 
	mainmenu_text = {
		Play = {
			menu_item_text = qs(0xffb0c002)
			helper_text = qs(0xfc63818f)
		}
		create = {
			menu_item_text = qs(0x122e3c10)
			helper_text = qs(0x910bb813)
		}
		career = {
			menu_item_text = qs(0x0f9f249e)
			helper_text = qs(0x90fff7fe)
		}
		quickplay = {
			menu_item_text = qs(0x7cdc150a)
			helper_text = qs(0x756c8c77)
		}
		training = {
			menu_item_text = qs(0xd093953b)
			helper_text = qs(0xdfa46ab2)
		}
		competitive = {
			menu_item_text = qs(0x6e63fe63)
			helper_text = qs(0x00db8035)
		}
		party_play = {
			menu_item_text = qs(0x8a778398)
			helper_text = qs(0x03ac90f0)
		}
		music_store = {
			menu_item_text = qs(0xdbb3498d)
			helper_text = qs(0x5baba664)
		}
		music_central = {
			menu_item_text = $guitar_main_menu_ghstudio_string
			helper_text = $music_central_helper_text
		}
		creator = {
			menu_item_text = qs(0x432d47e2)
			helper_text = qs(0x82621434)
		}
		options = {
			menu_item_text = qs(0x976cf9e7)
			helper_text = qs(0xc3dadf37)
		}
		award_case = {
			menu_item_text = qs(0xa1ae7e56)
			helper_text = qs(0x6c133480)
		}
		hall_of_records = {
			menu_item_text = qs(0x624c597d)
			helper_text = qs(0x9ee0729d)
		}
		debugmenu = {
			menu_item_text = qs(0xafdfad24)
			helper_text = qs(0x03ac90f0)
		}
		motd = {
			menu_item_text = qs(0x3e13521a)
			helper_text = qs(0x034236e7)
		}
		xbox_party = {
			menu_item_text = qs(0x1ccddae6)
			helper_text = qs(0x13f47000)
		}
	}
	Change g_mainmenu_text = <mainmenu_text>
endscript
force_mainmenu_signin = 0

script mainmenu_kill_song_and_characters 
	closesonglogfile
	playlist_clear
endscript

script fix_primary_controller_for_autolaunch 
	if (($primary_controller) = -1)
		threadsafesetglobalinteger \{global_name = primary_controller
			new_value = 0}
	endif
	threadsafesetglobalinteger \{global_name = primary_controller_assigned
		new_value = 1}
endscript

script create_main_menu 
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	disable_pause
	UnPauseGame
	disable_pause
	unload_songqpak
	SpawnScriptNow \{audio_ui_menu_music_on}
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

script create_main_menu_elements \{do_not_add_friend_feed = !i1768515945}
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
	mainmenu_id :Obj_SpawnScriptNow \{fg_objects_1
		params = {
			desc_id = mainmenu_id
		}}
	mainmenu_id :Obj_SpawnScriptNow \{ampzilla_anim
		params = {
			desc_id = mainmenu_id
		}}
	mainmenu_id :Obj_SpawnScriptNow \{anim_clouds
		params = {
			desc_id = mainmenu_id
		}}
	mainmenu_setup_option \{choose_script = main_menu_select_play
		menu_item = Play}
	mainmenu_setup_option \{choose_script = main_menu_select_create
		menu_item = create}
	mainmenu_setup_option \{choose_script = main_menu_select_music_store
		menu_item = music_store}
	mainmenu_setup_option \{choose_script = main_menu_select_hall_of_records
		menu_item = hall_of_records}
	mainmenu_setup_option \{choose_script = main_menu_select_options
		menu_item = options}
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if (<show_debug_menus>)
		mainmenu_setup_option \{choose_script = main_menu_select_debug
			menu_item = debugmenu}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				main_menu_select_freeplay
			}
		]}
	if NOT demobuild
		if (<do_not_add_friend_feed> = 0)
			current_menu :Obj_SpawnScriptLater \{attempt_to_add_friend_feed
				params = {
					menu = main
					parent_id = mainmenu_id
					event_handler = current_menu
				}}
		endif
	endif
	main_menu_finalize
	set_focus_color
	set_unfocus_color
endscript

script main_menu_finalize 
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	<i> = 0
	begin
	(<children> [<i>]) :obj_getintegertag tag_name = focusable
	if (<integer_value> = 1)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<front_check> = <i>
	<i> = (<array_Size> - 1)
	begin
	(<children> [<i>]) :obj_getintegertag tag_name = focusable
	if (<integer_value> = 1)
		break
	endif
	<i> = (<i> - 1)
	repeat <array_Size>
	<back_check> = <i>
	current_menu :obj_setintegertag {
		tag_name = num_children
		integer_value = <array_Size>
	}
	current_menu :obj_setintegertag {
		tag_name = front_check
		integer_value = <front_check>
	}
	current_menu :obj_setintegertag {
		tag_name = back_check
		integer_value = <back_check>
	}
	mainmenu_do_smart_arrow_logic
endscript

script main_menu_add_control_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	ui_event_get_stack
	if ((<stack> [0].base_name) != 'mainmenu')
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100
			all_buttons}
	else
		add_user_control_helper \{text = qs(0x8a778398)
			button = yellow
			z = 100
			all_buttons}
		obj_spawnscript \{main_menu_add_friendfeed_button_pill_spawned}
	endif
endscript

script main_menu_select_xbox_party 
	mainmenu_animate \{id = options_menu_id
		spawn = 1}
	printf \{qs(0x7743abb8)}
	ui_sfx \{menustate = Generic
		uitype = select}
	if CheckForSignIn controller_index = <device_num> network_platform_only
		NetSessionFunc {
			Obj = plat_party
			func = show_party_sessions_ui
			params = {
				controller_index = <device_num>
			}
		}
	else
		if CheckForSignIn controller_index = <device_num> local
			<body_text> = qs(0x113c41ea)
			<options> = [
				{
					func = main_menu_xbox_party_dialog_box_exit
					text = qs(0x0e41fe46)
				}
			]
		else
			<body_text> = qs(0x3facf63d)
			<options> = [
				{
					func = mainmenu_do_xbox_party_signin
					text = qs(0x17df5913)
				}
				{
					func = main_menu_xbox_party_dialog_box_exit
					text = qs(0xf7723015)
				}
			]
		endif
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
			body_text = <body_text>
			parent = root_window
			no_background
			options = <options>
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
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	if ScreenElementExists \{id = motdinterface}
		add_user_control_helper \{text = qs(0x3e13521a)
			button = orange
			z = 100
			all_buttons}
	endif
endscript

script mainmenu_setup_physics_elements 
	RequireParams \{[
			screen_id
		]
		all}
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_up_arrow
		AssignAlias id = <resolved_id> alias = mainmenu_up_arrow
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_down_arrow
		AssignAlias id = <resolved_id> alias = mainmenu_down_arrow
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_vmenu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SetTags \{smooth_morph_time = 0.1}
		<event_handlers> = [
			{pad_up mainmenu_pad_up}
			{pad_down mainmenu_pad_down}
			{menu_selection_changed ui_sfx params = {menustate = Generic uitype = scrollup}}
			{menu_selection_changed mainmenu_do_smart_arrow_logic}
		]
		current_menu :se_setprops event_handlers = <event_handlers>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_smenu
		AssignAlias id = <resolved_id> alias = mainmenu_smenu
	else
		ScriptAssert \{qs(0xefd483aa)}
	endif
endscript

script mainmenu_setup_option \{parent = current_menu}
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
	if GotParam \{icon}
		if NOT GotParam \{icon_side}
			<icon_side> = left
		endif
		if (<icon_side> = right)
			<menurow_desc> = 'menurow_txt_ico_desc'
		else
			<menurow_desc> = 'menurow_ico_txt_desc'
		endif
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = <menurow_desc>
			just = [center center]
			autosizedims = true
			menurow_just = [center center]
			menurow_internal_just = [center center]
			menurow_txt_item_internal_just = [center center]
			menurow_txt_item_text = <menu_item_text>
			menurow_txt_item_font = fontgrid_title_a1
			menurow_txt_item_rgba = [216 181 117 255]
			menurow_ico_item_texture = <icon>
		}
	else
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'menurow_txt_desc'
			just = [center center]
			autosizedims = true
			menurow_just = [center center]
			menurow_internal_just = [center center]
			menurow_txt_item_internal_just = [center center]
			menurow_txt_item_text = <menu_item_text>
			menurow_txt_item_font = fontgrid_title_a1
			menurow_txt_item_rgba = [216 181 117 255]
			menurow_hightlight_bar_alpha = 0
		}
	endif
	if GotParam \{blank_entry}
		<id> :se_setprops {
			not_focusable
		}
		<id> :obj_setintegertag {
			tag_name = focusable
			integer_value = 0
		}
	elseif GotParam \{not_focusable}
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = [64 64 64 255]
		}
		<id> :obj_setintegertag {
			tag_name = focusable
			integer_value = 0
		}
	else
		<id> :obj_setintegertag {
			tag_name = focusable
			integer_value = 1
		}
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
			AddArrayElement array = <array> element = {pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		elseif GotParam \{choose_script}
			AddArrayElement array = <array> element = {pad_choose generic_blocking_execute_script params = {pad_script = <choose_script> pad_params = {<choose_params>}}}
			AddArrayElement array = <array> element = {pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		endif
		if GotParam \{back_state}
			AddArrayElement array = <array> element = {pad_back generic_event_back params = {state = <back_state>}}
			AddArrayElement array = <array> element = {pad_back ui_sfx params = {menustate = Generic uitype = back}}
		elseif GotParam \{back_script}
			AddArrayElement array = <array> element = {pad_back <back_script>}
		endif
		if GotParam \{additional_focus_script}
			AddArrayElement array = <array> element = {focus <additional_focus_script> params = {<additional_focus_params>}}
		endif
		<id> :se_setprops event_handlers = <array>
	endif
	return mainmenu_item_id = <id>
endscript

script mainmenu_do_smart_arrow_logic 
	SetScreenElementLock \{id = mainmenu_smenu
		OFF}
	SetScreenElementLock \{id = mainmenu_smenu
		On}
	mainmenu_smenu :scrollingmenu_getfirstvisibleindex
	mainmenu_smenu :scrollingmenu_getlastvisibleindex
	current_menu :obj_getintegertag \{tag_name = num_children}
	<num_children> = <integer_value>
	current_menu :obj_getintegertag \{tag_name = front_check}
	<front_check> = <integer_value>
	current_menu :obj_getintegertag \{tag_name = back_check}
	<back_check> = <integer_value>
	<arrow_visibility> = [Hide Hide]
	if NOT (<num_children> < 6)
		if NOT (<first_visible_index> = <front_check>)
			if (<last_visible_index> = <back_check>)
				<arrow_visibility> = [unhide Hide]
			else
				<arrow_visibility> = [unhide unhide]
			endif
		elseif (<last_visible_index> = <back_check>)
			<arrow_visibility> = [Hide Hide]
		else
			<arrow_visibility> = [Hide unhide]
		endif
	endif
	mainmenu_up_arrow :se_setprops {
		(<arrow_visibility> [0])
	}
	mainmenu_down_arrow :se_setprops {
		(<arrow_visibility> [1])
	}
endscript

script mainmenu_item_focus \{time = 0.05
		grow_scale = 1.1
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
	<id> :se_getprops menurow_txt_item_dims
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_rgba = [250 250 250 255]
		menurow_highlight_bar_alpha = 0.5
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
		menurow_highlight_bar_alpha = 0
		menurow_txt_item_rgba = [216 181 117 255]
		motion = ease_in
		Scale = <Scale>
		time = <time>
	}
endscript

script mainmenu_pad_up 
	mainmenu_up_arrow :obj_spawnscript \{mainmenu_do_scroll_glow}
	mainmenu_up_arrow :obj_spawnscript \{mainmenu_do_arrow_pulse}
	ui_event_get_top
	if (<base_name> = 'mainmenu')
		RunScriptOnScreenElement \{id = current_menu
			mainmenu_freeplay_timer}
	endif
endscript

script mainmenu_pad_down 
	mainmenu_down_arrow :obj_spawnscript \{mainmenu_do_scroll_glow}
	mainmenu_down_arrow :obj_spawnscript \{mainmenu_do_arrow_pulse
		params = {
			down
		}}
	ui_event_get_top
	if (<base_name> = 'mainmenu')
		RunScriptOnScreenElement \{id = current_menu
			mainmenu_freeplay_timer}
	endif
endscript

script mainmenu_do_arrow_pulse 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = mainmenu_wgt_barrel_arrow
		dims = (32.0, 32.0)
		Pos = (16.0, 16.0)
		just = [center center]
		z_priority = 98
		rgba = [166 30 45 255]
	}
	<id> :se_setprops
	if GotParam \{down}
		<id> :se_setprops flip_h
	endif
	<id> :se_setprops Scale = 1.2 time = 0.01 relative_scale
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
		dims = (32.0, 32.0)
		Pos = (16.0, 16.0)
		rgba = [255 215 0 255]
		just = [center center]
		z_priority = 98
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 1.2 @ 2.5 @ 2.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	Wait \{0.2
		Seconds}
	DestroyScreenElement id = <id>
endscript

script destroy_main_menu 
	generic_ui_destroy
	KillSpawnedScript \{Name = anim_clouds}
	KillSpawnedScript \{Name = fg_objects_1}
	KillSpawnedScript \{Name = ampzilla_anim}
	DestroyScreenElement \{id = mainmenu_id}
endscript

script main_menu_select_freeplay \{kill_freeplay_timeout = 1}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if (<kill_freeplay_timeout> = 1)
		KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
		KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	endif
	LaunchEvent \{Type = unfocus
		target = current_menu}
	play_cameracut \{prefix = 'cameras_no_band'}
	mainmenu_animate \{id = mainmenu_play_id
		block_events = 1}
	ui_event_add_params \{play_anim_out = 0}
	create_loading_screen
	SpawnScriptNow \{audio_ui_kill_menu_music_slowly}
	SpawnScriptNow \{audio_crowd_play_surge_from_main_menu_to_freeplay}
	if NOT GotParam \{do_not_play_sfx}
		ui_sfx \{menustate = Generic
			uitype = complete}
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

script main_menu_select_sing_a_long 
	ui_sing_a_long_songlist
endscript

script main_menu_select_play 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	universal_help_display_help_check help_context = training_menu device_num = <device_num>
	ui_sfx \{menustate = Generic
		uitype = select}
	if (<show_help_page> = 1)
		set_primary_controller {
			device_num = <device_num>
			state = uistate_universal_help
			optional_signin = 1
			data = {
				is_popup = 1
				next_state_name = uistate_mainmenu_play
				next_state_params = {
					from_main_menu = 1
					no_sound = 1
				}
				help_global_index = <help_index>
				device_num = <device_num>
				show_mainmenu_bg = 1
			}
		}
		Change \{respond_to_signin_changed = 1}
	else
		set_primary_controller device_num = <device_num> optional_signin = 1 state = uistate_mainmenu_play
	endif
endscript

script main_menu_select_create 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	set_primary_controller device_num = <device_num> state = uistate_mainmenu_create optional_signin = 1
endscript

script main_menu_select_career 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	mainmenu_animate \{id = mainmenu_play_id
		block_events = 1}
	ui_event_add_params \{play_anim_out = 0}
	universal_help_display_help_check help_context = career_lobby device_num = <device_num>
	if (<show_help_page> = 1)
		generic_event_choose {
			state = uistate_universal_help
			data = {
				next_state_script = main_menu_enter_career
				next_state_params = {
					device_num = <device_num>
				}
				help_global_index = <help_index>
				device_num = <device_num>
			}
		}
	else
		main_menu_enter_career device_num = <device_num>
	endif
endscript

script main_menu_enter_career 
	StopRendering
	main_menu_select_band_lobby lobby_mode = career device_num = <device_num> animate_ui = 0
endscript

script main_menu_select_band_lobby \{state = uistate_band_lobby
		data = {
		}
		animate_ui = 1}
	RequireParams \{[
			lobby_mode
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	if (<animate_ui> = 1)
		mainmenu_animate \{id = mainmenu_play_id
			block_events = 1}
	endif
	ui_event_add_params \{play_anim_out = 0}
	StopRendering
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
		Change \{g_lobby_enter_from_main_menu = 1}
	else
		Change \{g_lobby_enter_from_main_menu = 1}
	endif
	<data> = {<data> device_num = <device_num>}
	set_primary_controller device_num = <device_num> state = <state> data = <data> optional_signin = 1
endscript

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_select_cas 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	destroy_friend_feed
	lightshow_notingameplay_setmood \{mood = band_lobby}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	universal_help_display_help_check help_context = rock_star_creator device_num = <device_num>
	if (<show_help_page> = 1)
		set_primary_controller {
			device_num = <device_num>
			state = uistate_universal_help
			optional_signin = 1
			data = {
				next_state_name = uistate_character_selection
				next_state_params = {
					device_num = <device_num>
					from_main_menu
				}
				help_global_index = <help_index>
				device_num = <device_num>
			}
			no_hide_glitch = 1
		}
	else
		set_primary_controller {
			device_num = <device_num>
			state = uistate_character_selection
			optional_signin = 1
			data = {
				device_num = <device_num>
				from_main_menu
			}
			no_hide_glitch = 1
		}
	endif
endscript

script main_menu_select_training 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	ui_sfx \{menustate = Generic
		uitype = select}
	set_primary_controller device_num = <device_num> state = uistate_select_training require_signin = 0 data = {from_main_menu = 1 no_sound = 1}
endscript

script main_menu_select_training_from_universal_help 
	ui_sfx \{menustate = Generic
		uitype = select}
	set_primary_controller device_num = <device_num> state = uistate_select_training event = menu_replace require_signin = 0 data = {from_main_menu = 1 no_sound = 1}
endscript

script main_menu_select_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	hide_glitch \{num_frames = 5}
	universal_help_display_help_check help_context = options_menu device_num = <device_num>
	ui_sfx \{menustate = Generic
		uitype = select}
	if (<show_help_page> = 1)
		set_primary_controller {
			device_num = <device_num>
			optional_signin = 1
			state = uistate_universal_help
			data = {
				next_state_name = uistate_options
				next_state_params = {
					no_sound = 1
				}
				help_global_index = <help_index>
				device_num = <device_num>
			}
		}
	else
		set_primary_controller device_num = <device_num> optional_signin = 1 state = uistate_options data = {no_sound = 1}
	endif
endscript

script main_menu_select_leaderboards 
	Change \{rich_presence_context = presence_leaderboards}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	hide_glitch \{num_frames = 5}
	universal_help_display_help_check help_context = options_menu device_num = <device_num>
	ui_sfx \{menustate = Generic
		uitype = select}
	if (<show_help_page> = 1)
		set_primary_controller {
			device_num = <device_num>
			state = uistate_universal_help
			require_signin = 0
			data = {
				next_state_name = uistate_leaderboard_instrument
				next_state_params = {
					no_sound = 1
				}
				help_global_index = <help_index>
				device_num = <device_num>
			}
		}
	else
		set_primary_controller device_num = <device_num> require_signin = 0 state = uistate_leaderboard_instrument data = {no_sound = 1}
	endif
endscript

script main_menu_select_award_case 
	Change \{rich_presence_context = presence_leaderboards}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	mainmenu_animate \{id = hor_menu_id
		block_events = 1}
	universal_help_display_help_check help_context = leaderboards_menu device_num = <device_num>
	if (<show_help_page> = 1)
		set_primary_controller {
			device_num = <device_num>
			state = uistate_universal_help
			require_signin = 0
			data = {
				next_state_name = uistate_songlist
				next_state_params = {
					mode = leaderboard
					device_num = <device_num>
				}
				help_global_index = <help_index>
				device_num = <device_num>
				leaderboards = 1
			}
		}
	else
		pushdisablerendering \{context = going_into_songlist
			Type = unchecked}
		generic_event_choose state = uistate_songlist data = {mode = leaderboard device_num = <device_num> leaderboards = 1}
	endif
endscript

script main_menu_select_hall_of_records 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	ui_sfx \{menustate = Generic
		uitype = select}
	set_primary_controller device_num = <device_num> state = uistate_hall_of_records optional_signin = 1
endscript

script main_menu_select_debug 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_debug}
endscript

script main_menu_select_music_store 
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	net_counter_increment \{counter_name = globalcounter_music_store_main}
	destroy_friend_feed
	universal_help_display_help_check help_context = music_store device_num = <device_num>
	if (<show_help_page> = 1)
		generic_event_choose {
			state = uistate_universal_help
			data = {
				next_state_script = set_primary_controller
				next_state_params = {
					device_num = <device_num>
					event = menu_replace
					require_live = 1
					musicstore = 1
					state = uistate_songlist
					data = {
						mode = music_store
						no_sound = 1
					}
				}
				help_global_index = <help_index>
				device_num = <device_num>
			}
		}
	else
		set_primary_controller device_num = <device_num> require_live = 1 musicstore = 1 state = uistate_songlist data = {mode = music_store no_sound = 1}
	endif
	audio_ui_kill_menu_music_slowly
endscript

script main_menu_select_motd \{device_num = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_friend_feed
	set_primary_controller {
		device_num = <device_num>
		optional_signin = 1
		state = uistate_motd
	}
endscript

script main_menu_select_vip 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
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
	CreateScreenElement {
		Type = SpriteElement
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
	CreateScreenElement {
		Type = SpriteElement
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
	CreateScreenElement {
		Type = SpriteElement
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
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose state = <state> data = {<data>}
	else
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose state = <state> data = {<data>}
	endif
endscript

script set_primary_controller \{event = menu_change
		require_signin = 1
		no_hide_glitch = 0
		allow_back = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ((GotParam Force) || ($force_mainmenu_signin = 1))
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 0}
		threadsafesetglobalinteger \{global_name = primary_controller
			new_value = -1}
		Change \{force_mainmenu_signin = 0}
	endif
	Change \{signin_jam_mode = 0}
	if ($game_mode = freeplay)
		Change \{game_mode = quickplay}
	endif
	if (<allow_back> = 0)
		RemoveParameter \{allow_back}
	endif
	if GotParam \{jam}
		if ($jam_view_cam_created = 1)
			ScriptAssert \{'logic error, this value should be zero here'}
		endif
		Change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> show_mainmenu_bg = 1 no_hide_glitch = <no_hide_glitch> allow_back = <allow_back> new_state = <state> new_data = {<data> jam = 1} jam = 1 require_signin = <require_signin> require_live = <require_live>}
	else
		if ($skip_signin = 1)
			ui_event event = menu_change state = <state> data = <data>
		else
			generic_event_choose event = <event> no_sound state = uistate_signin data = {device_num = <device_num> show_mainmenu_bg = 1 no_hide_glitch = <no_hide_glitch> allow_back = <allow_back> new_state = <state> new_data = <data> require_signin = <require_signin> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> musicstore = <musicstore> optional_signin = <optional_signin>}
		endif
	endif
endscript

script mainmenu_freeplay_timer 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait ($g_mainmenu_freeplay_timer) Seconds
	LaunchEvent \{Type = unfocus
		target = current_menu}
	main_menu_select_freeplay \{do_not_play_sfx
		kill_freeplay_timeout = 0}
endscript

script mainmenu_freeplay_timer_pause 
	begin
	SpawnScriptNow \{mainmenu_freeplay_timer}
	Wait \{1
		gameframe}
	repeat
endscript

script mainmenu_do_xbox_party_signin \{device_num = !i1768515945}
	ui_sfx \{menustate = Generic
		uitype = select}
	main_menu_xbox_party_dialog_box_exit
	NetSessionFunc \{func = showsigninui
		params = {
			online_only
		}
		breakpoint = 0}
	wait_for_blade_complete
	if CheckForSignIn controller_index = <device_num> network_platform_only
		NetSessionFunc {
			Obj = plat_party
			func = show_party_sessions_ui
			params = {
				controller_index = <device_num>
			}
		}
	endif
endscript

script ampzilla_anim \{desc_id = !q1768515945}
	if <desc_id> :desc_resolvealias Name = alias_ampzilla_phys1
		AssignAlias id = <resolved_id> alias = ampzilla_phys1_id
	else
		ScriptAssert \{qs(0xf8dc3bb9)}
	endif
	if <desc_id> :desc_resolvealias Name = alias_mainmenu_dude
		AssignAlias id = <resolved_id> alias = mainmenu_dude_id
	else
		ScriptAssert \{qs(0x32f98d30)}
	endif
	if <desc_id> :desc_resolvealias Name = alias_mainmenu_fg_chain
		AssignAlias id = <resolved_id> alias = mainmenu_fg_chain_id
	else
		ScriptAssert \{qs(0x32f98d30)}
	endif
	if <desc_id> :desc_resolvealias Name = alias_mainmenu_menubg1
		AssignAlias id = <resolved_id> alias = mainmenu_menubg1_id
	else
		ScriptAssert \{qs(0x32f98d30)}
	endif
	if <desc_id> :desc_resolvealias Name = alias_mainmenu_axestone
		AssignAlias id = <resolved_id> alias = mainmenu_axestone_id
	else
		ScriptAssert \{qs(0x32f98d30)}
	endif
	if <desc_id> :desc_resolvealias Name = alias_mainmenu_bgoutrock
		AssignAlias id = <resolved_id> alias = mainmenu_bgoutrock_id
	else
		ScriptAssert \{qs(0x32f98d30)}
	endif
	<desc_id> :Obj_SpawnScriptNow create_2d_spring_system params = {desc_id = ampzilla_phys1_id num_springs = 1 objID1 = anchor_spring_1 objid2 = physics_spring_1 stiffness = 0.01 rest_length = 1}
	<desc_id> :Obj_SpawnScriptNow create_2d_spring_system params = {desc_id = mainmenu_fg_chain_id num_springs = 1 objID1 = anchor_spring_1 objid2 = physics_spring_1 stiffness = 0.005 rest_length = 1}
	<desc_id> :Obj_SpawnScriptNow create_2d_spring_system params = {desc_id = mainmenu_axestone_id num_springs = 1 objID1 = anchor_spring_1 objid2 = physics_spring_1 stiffness = 0.005 rest_length = 1}
endscript

script fg_objects_1 
endscript

script anim_clouds \{desc_id = !q1768515945}
	<desc_id> :desc_resolvealias Name = alias_mainmenu_anim_cloud_1 param = mainmenu_anim_cloud_1_id
	<mainmenu_anim_cloud_1_id> :obj_spawnscript cloud_drift_leftoright
	<desc_id> :desc_resolvealias Name = alias_mainmenu_anim_cloud_2 param = mainmenu_anim_cloud_2_id
	<mainmenu_anim_cloud_2_id> :obj_spawnscript cloud_drift_righttoleft
endscript

script cloud_drift_leftoright 
	begin
	r = RandomInteger (1.0, 4.0)
	time = Random (@ 30 @ 25 @ 15 @ 35 )
	switch <r>
		case 1
		<start_pos> = (-800.0, -107.0)
		<end_pos> = (800.0, -107.0)
		<z_priority> = 2
		<Scale> = (2.2, 2.2)
		case 2
		<start_pos> = (-800.0, -200.0)
		<end_pos> = (800.0, -200.0)
		<z_priority> = 3
		<Scale> = (2.5, 2.5)
		case 3
		<start_pos> = (-800.0, -145.0)
		<end_pos> = (800.0, -145.0)
		<z_priority> = 1
		<Scale> = (3.01, 3.01)
		default
		<start_pos> = (-800.0, -200.0)
		<end_pos> = (800.0, -200.0)
		<z_priority> = 2
		<Scale> = (2.6, 2.6)
	endswitch
	se_setprops Pos = <start_pos>
	se_setprops Scale = <Scale>
	se_setprops z_priority = <z_priority> time = 0
	se_waitprops
	se_setprops Pos = <end_pos> time = <time>
	se_waitprops
	repeat
endscript

script cloud_drift_righttoleft 
	begin
	time = Random (@ 30 @ 25 @ 15 @ 35 )
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		<start_pos> = (700.0, -100.0)
		<end_pos> = (-800.0, -100.0)
		<z_priority> = 2
		<Scale> = (2.2, 2.2)
		case 2
		<start_pos> = (700.0, -201.0)
		<end_pos> = (-800.0, -201.0)
		<z_priority> = 4
		<Scale> = (2.5, 2.5)
		case 3
		<start_pos> = (700.0, -145.0)
		<end_pos> = (-800.0, -145.0)
		<z_priority> = 1
		<Scale> = (2.01, 2.01)
		default
		<start_pos> = (700.0, -200.0)
		<end_pos> = (-800.0, -200.0)
		<z_priority> = 3
		<Scale> = (2.6, 2.6)
	endswitch
	se_setprops Pos = <start_pos>
	se_setprops Scale = <Scale>
	se_setprops z_priority = <z_priority> time = 0
	se_waitprops
	se_setprops Pos = <end_pos> time = <time>
	se_waitprops
	Wait \{1
		Second}
	repeat
endscript

script create_mainmenu_bg 
	if ScreenElementExists \{id = mainmenu_background_image}
		return
	endif
	GetPakManCurrent \{map = ui_paks}
	if (<pak> = SongList)
		CreateScreenElement {
			parent = root_window
			id = mainmenu_background_image
			Type = descinterface
			desc = 'songlist'
			tags = {
				motd_id = None
			}
			z_priority = <z_priority>
		}
		if mainmenu_background_image :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
			AssignAlias id = <resolved_id> alias = songlist_scrollbar_wgt
		endif
		songlist_scrollbar_wgt :se_setprops \{alpha = 0.0}
		mainmenu_background_image :se_setprops \{songlist_bg_illo_alpha = 1.0
			music_store_bg_illo_alpha = 0.0
			songlist_tab_in_focus_alpha = 0.0
			songlist_tab_out_focus_alpha = 1.0
			music_store_tab_in_focus_alpha = 0.0
			music_store_tab_out_focus_alpha = 0.0
			rank_capsule_alpha = 0.0
			songlist_songs_available_text_text = qs(0x03ac90f0)
			songlist_songs_available_num_text = qs(0x03ac90f0)}
	else
		CreateScreenElement {
			parent = root_window
			id = mainmenu_background_image
			Type = descinterface
			desc = 'mainmenu'
			tags = {
				motd_id = None
			}
			z_priority = <z_priority>
		}
		mainmenu_background_image :desc_applyscene \{Name = Default}
		if mainmenu_background_image :desc_resolvealias \{Name = alias_mainmenu_up_arrow}
			<resolved_id> :se_setprops {
				Hide
			}
		endif
		if mainmenu_background_image :desc_resolvealias \{Name = alias_mainmenu_down_arrow}
			<resolved_id> :se_setprops {
				Hide
			}
		endif
	endif
endscript

script destroy_mainmenu_bg 
	printscriptinfo \{'destroy_mainmenu_bg'}
	if ScreenElementExists \{id = mainmenu_background_image}
		mainmenu_background_image :Die
	endif
endscript

script mainmenu_animate \{id = !q1768515945
		spawn = 0
		block_events = 0}
	if (<spawn> = 1)
		SpawnScriptNow mainmenu_animate_spawned params = {id = <id> block_events = <block_events>}
	else
		mainmenu_animate_spawned {id = <id> block_events = <block_events>}
	endif
endscript

script mainmenu_animate_spawned \{id = !q1768515945
		spawn = 0
		block_events = 0}
	if ScreenElementExists id = <id>
		if (<block_events> = 1)
			<id> :se_setprops block_events
		endif
		begin
		<id> :se_setprops {
			chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-122.0, -255.0)
			axestone_anim_pos = (291.0, 108.0)
			ampzilla_anim_pos = (-104.0, -210.0)
			mainmenu_anim_calcium_fulltop_pos = (127.0, 100.0)
		}
		<id> :se_waitprops
		<id> :se_setprops {
			chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-128.0, -258.0)
			axestone_anim_pos = (302.0, 100.0)
			ampzilla_anim_pos = (-106.0, -208.0)
			mainmenu_anim_calcium_fulltop_pos = (130.0, 100.0)
			time = 0.01
		}
		<id> :se_waitprops
		<id> :se_setprops {
			chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -260.0)
			axestone_anim_pos = (289.0, 102.0)
			ampzilla_anim_pos = (-100.0, -205.0)
			mainmenu_anim_calcium_fulltop_pos = (125.0, 100.0)
			time = 0.01
		}
		<id> :se_waitprops
		<id> :se_setprops {
			chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-125.0, -250.0)
			axestone_anim_pos = (299.0, 110.0)
			ampzilla_anim_pos = (-103.0, -204.0)
			mainmenu_anim_calcium_fulltop_pos = (128.0, 100.0)
			time = 0.01
		}
		<id> :se_waitprops
		<id> :se_setprops {
			chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -251.0)
			axestone_anim_pos = (305.0, 98.0)
			ampzilla_anim_pos = (-106.0, -206.0)
			mainmenu_anim_calcium_fulltop_pos = (127.0, 100.0)
			time = 0.01
		}
		<id> :se_waitprops
		<id> :se_setprops {
			chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-135.0, -252.0)
			axestone_anim_pos = (297.0, 101.0)
			ampzilla_anim_pos = (-108.0, -202.0)
			mainmenu_anim_calcium_fulltop_pos = (132.0, 100.0)
			time = 0.01
		}
		<id> :se_waitprops
		<id> :se_setprops {
			chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-122.0, -255.0)
			axestone_anim_pos = (291.0, 108.0)
			ampzilla_anim_pos = (-104.0, -210.0)
			mainmenu_anim_calcium_fulltop_pos = (127.0, 100.0)
			time = 0.01
		}
		<id> :se_waitprops
		repeat 1
		if (<block_events> = 1)
			<id> :se_setprops unblock_events
		endif
	endif
endscript

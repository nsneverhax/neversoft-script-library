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
			helper_text = qs(0x68f39042)
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
			helper_text = qs(0xa6fdaa92)
		}
		xbox_party = {
			menu_item_text = qs(0xd7a1361a)
			helper_text = qs(0xcfadd110)
		}
	}
	change g_mainmenu_text = <mainmenu_text>
endscript
force_mainmenu_signin = 0

script mainmenu_kill_song_and_characters 
	closesonglogfile
	gman_songfunc \{func = clear_play_list}
endscript

script fix_primary_controller_for_autolaunch 
	if (($primary_controller) = -1)
		change \{primary_controller = 0}
	endif
	change \{primary_controller_assigned = 1}
endscript

script create_main_menu 
	reset_all_special_events
	clear_exclusive_devices
	setmenuautorepeattimes \{(0.3, 0.1)}
	disable_pause
	unpausegame
	disable_pause
	spawnscriptnow \{menu_music_on}
	change \{end_credits = 0}
	setplayerinfo \{1
		device = 0}
	setplayerinfo \{2
		device = 1}
	setplayerinfo \{3
		device = 2}
	setplayerinfo \{4
		device = 3}
	if ($new_message_of_the_day = 1)
		runscriptonscreenelement \{id = current_menu
			pop_in_new_downloads_notifier}
	endif
	if NOT ($invite_controller = -1)
		change \{invite_controller = -1}
		main_menu_select_online
		fadetoblack \{off
			time = 0}
	else
	endif
	if ($autolaunch_cas = 1)
		change \{autolaunch_cas = 0}
		spawnscriptdelayed frames = 20 ui_event_wait params = {event = menu_change data = {state = uistate_character_selection device_num = ($primary_controller) from_main_menu}}
	endif
	if ($autolaunch_jam = 1)
		change \{autolaunch_jam = 0}
		spawnscriptdelayed frames = 20 music_central_select_music_studio params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_lobby = 1)
		change \{autolaunch_lobby = 0}
		spawnscriptdelayed frames = 20 main_menu_select_band_lobby params = {device_num = ($primary_controller) lobby_mode = ($g_lobby_state)}
	endif
	runscriptonscreenelement \{id = current_menu
		mainmenu_freeplay_timer}
	tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 0}
	venue_screenfx
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	createscreenelement \{parent = root_window
		id = mainmenu_id
		type = descinterface
		desc = 'mainmenu'
		tags = {
			motd_id = none
		}}
	mainmenu_setup_physics_elements \{screen_id = mainmenu_id}
	if screenelementexists \{id = mainmenu_id}
		if mainmenu_id :desc_resolvealias \{name = 0x593ba975}
			if screenelementexists id = <resolved_id>
				<resolved_id> :obj_spawnscript 0x206fbd50 params = {}
			endif
		endif
	endif
	0xd462728b = {}
	if demobuild
		0xd462728b = {0xa3721c47}
	endif
	mainmenu_setup_option \{choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = quickplay
		}
		menu_item = quickplay}
	mainmenu_setup_option choose_script = main_menu_select_career choose_params = {lobby_mode = career} menu_item = career <0xd462728b>
	mainmenu_setup_option choose_script = main_menu_select_music_store menu_item = music_store <0xd462728b>
	mainmenu_setup_option choose_script = music_central_select_music_studio menu_item = music_central <0xd462728b>
	mainmenu_setup_option \{choose_script = main_menu_select_options
		menu_item = options}
	if NOT demobuild
		if isxenonorwindx
			mainmenu_setup_option choose_script = main_menu_select_xbox_party menu_item = xbox_party <0xd462728b>
		endif
	endif
	if NOT demobuild
		mainmenu_setup_option choose_script = main_menu_select_leaderboards menu_item = leaderboards <0xd462728b>
	endif
	mainmenu_setup_option choose_script = main_menu_select_cas menu_item = creator <0xd462728b>
	if NOT demobuild
		mainmenu_setup_option choose_script = main_menu_select_training menu_item = training <0xd462728b> <0xd462728b>
	endif
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
	if (<show_debug_menus>)
		mainmenu_setup_option \{choose_script = main_menu_select_debug
			menu_item = debugmenu}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				main_menu_select_freeplay
			}
			{
				pad_option
				ui_sing_a_long_songlist
			}
		]}
	if NOT demobuild
		create_motd
	endif
	set_focus_color
	set_unfocus_color
	if mainmenu_id :desc_resolvealias \{name = 0x179e5690
			param = 0xc88ea12d}
		<0xc88ea12d> :se_getprops
		<0xc88ea12d> :obj_spawnscript 0x6407587e params = {time = 30.0 startpos = <0x5eabc0e2>}
	else
	endif
endscript

script main_menu_select_xbox_party 
	printf \{qs(0x7743abb8)}
	generic_menu_pad_choose_sound
	if checkforsignin controller_index = <device_num> network_platform_only
		netsessionfunc {
			obj = plat_party
			func = show_party_sessions_ui
			params = {
				controller_index = <device_num>
			}
		}
	else
		if checkforsignin controller_index = <device_num> local
			text = qs(0x113c41ea)
		else
			text = qs(0xe64b19a2)
		endif
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
			current_menu :se_setprops \{block_events}
		endif
		if screenelementexists \{id = motdinterface}
			launchevent \{type = unfocus
				target = motdinterface}
		endif
		create_dialog_box {
			dlg_z_priority = 1000
			heading_text = qs(0xaa163738)
			body_text = <text>
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
		assignalias id = <menu_id> alias = main_menu_select_xbox_party_warning
		launchevent \{type = focus
			target = main_menu_select_xbox_party_warning}
	endif
endscript

script main_menu_xbox_party_dialog_box_exit 
	printf \{qs(0x7fc8b8a0)}
	if screenelementexists \{id = main_menu_select_xbox_party_warning}
		destroy_dialog_box
	endif
	if screenelementexists \{id = motdinterface}
		launchevent \{type = focus
			target = motdinterface}
	endif
	if screenelementexists \{id = current_menu}
		current_menu :se_setprops \{unblock_events}
		launchevent \{type = focus
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
	<helper_pill_id> :obj_spawnscriptnow sheen_highlight
	<helper_pill_id> :obj_spawnscriptnow sheen_highlight_bottom
	add_user_control_helper \{text = qs(0x51923839)
		button = blue
		z = 100
		all_buttons}
	<helper_pill_id> :obj_spawnscriptnow sheen_highlight
	<helper_pill_id> :obj_spawnscriptnow sheen_highlight_bottom
	if screenelementexists \{id = motdinterface}
		add_user_control_helper \{text = qs(0x3e13521a)
			button = orange
			z = 100
			all_buttons}
	endif
endscript

script mainmenu_setup_physics_elements 
	requireparams \{[
			screen_id
		]
		all}
	create_2d_spring_system desc_id = <screen_id> num_springs = 2 stiffness = 50 rest_length = 1
	if <screen_id> :desc_resolvealias name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias name = alias_logo_container param = gh5_logo_id
		<gh5_logo_id> :obj_spawnscript ui_alphaflight
	else
		scriptassert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias name = alias_mainmenu_up_arrow
		arrow_up_id = <resolved_id>
	else
		scriptassert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias name = alias_mainmenu_down_arrow
		arrow_down_id = <resolved_id>
	else
		scriptassert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias name = alias_mainmenu_vmenu
		assignalias id = <resolved_id> alias = current_menu
		current_menu :settags \{smooth_morph_time = 0.1}
		<event_handlers> = [
			{pad_up mainmenu_pad_up params = {arrow_id = <arrow_up_id>}}
			{pad_up 0xbecf6bba params = {dir = -1 isvertical = true}}
			{pad_down 0xbecf6bba params = {dir = 1 isvertical = true}}
			{pad_down mainmenu_pad_down params = {arrow_id = <arrow_down_id>}}
			{menu_selection_changed generic_menu_up_or_down_sound}
		]
		current_menu :se_setprops event_handlers = <event_handlers>
	else
		scriptassert \{qs(0xfdafa36d)}
	endif
endscript

script mainmenu_setup_option 
	if screenelementexists \{id = mainmenu_id}
		requireparams \{[
				menu_item
			]
			all}
		menu_item_text = ($g_mainmenu_text.<menu_item>.menu_item_text)
	else
		requireparams \{[
				menu_item_text
			]
			all}
	endif
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'menurow_txt_desc'
		autosizedims = true
		menurow_txt_item_text = <menu_item_text>
		menurow_txt_item_font = fontgrid_text_a1
		menurow_txt_item_rgba = [100 84 164 255]
		0xe2d8d29d = 6
		menurow_just = [right center]
	}
	if gotparam \{blank_entry}
		<id> :se_setprops {
			not_focusable
		}
	elseif gotparam \{not_focusable}
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = [64 64 64 255]
			alpha = 0.125
		}
		<id> :settags not_focusable = 1
	else
		if gotparam \{0xa3721c47}
			removeparameter \{choose_state}
			choose_script = soundevent
			choose_params = {event = menu_warning_sfx}
			<id> :se_setprops {
				menurow_txt_item_rgba = ($0x24ff60ab)
			}
			<id> :settags 0xa3721c47 = 1
		endif
		if screenelementexists \{id = mainmenu_id}
			<id> :settags {
				menu_item = <menu_item>
			}
		elseif gotparam \{helper_text}
			requireparams \{[
					screen_id
				]
				all}
			<id> :settags {
				helper_text = <helper_text>
				screen_id = <screen_id>
			}
		endif
		sound = true
		if gotparam \{no_sound}
			<sound> = false
		endif
		array = [
			{focus mainmenu_item_focus params = {sound = <sound>}}
			{unfocus mainmenu_item_unfocus params = {sound = <sound>}}
		]
		if gotparam \{choose_state}
			addarrayelement array = <array> element = {pad_choose generic_blocking_execute_script params = {pad_script = generic_event_choose pad_params = {state = <choose_state> data = {<choose_params>}}}}
		elseif gotparam \{choose_script}
			addarrayelement array = <array> element = {pad_choose generic_blocking_execute_script params = {pad_script = <choose_script> pad_params = {<choose_params>}}}
		endif
		if gotparam \{back_state}
			addarrayelement array = <array> element = {pad_back generic_event_back params = {state = <back_state>}}
		elseif gotparam \{back_script}
			addarrayelement array = <array> element = {pad_back <back_script>}
		endif
		<id> :se_setprops event_handlers = <array>
	endif
	return mainmenu_item_id = <id>
endscript

script mainmenu_item_focus \{grow_scale = 1.8
		sound = true}
	if (<sound> = true)
	endif
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	<id> :getsingletag 0xa3721c47
	if gotparam \{0xa3721c47}
		if screenelementexists \{id = mainmenu_id}
			mainmenu_id :se_setprops \{mainmenu_helper_text_text = qs(0xff643d8e)}
		else
			<id> :gettags
			<screen_id> :se_setprops mainmenu_helper_text_text = qs(0xff643d8e)
		endif
	else
		if screenelementexists \{id = mainmenu_id}
			if <id> :getsingletag menu_item
				mainmenu_id :se_setprops mainmenu_helper_text_text = ($g_mainmenu_text.<menu_item>.helper_text)
			endif
		else
			<id> :gettags
			if gotparam \{helper_text}
				<screen_id> :se_setprops mainmenu_helper_text_text = <helper_text>
			endif
		endif
	endif
	menurow_txt_item_rgba = ($menu_focus_color)
	if gotparam \{0xa3721c47}
		menurow_txt_item_rgba = ($0x1892c8f1)
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		0xe2d8d29d = 0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <menurow_txt_item_rgba>
	}
	<id> :obj_spawnscript 0x206fbd50 params = {0x1f44740d = 3}
	<id> :desc_refreshcontentdims
	<id> :settags 0x9a010967 = <grow_scale>
	<id> :se_setprops menurow_scale = 1
	<id> :se_setprops menurow_scale = <grow_scale> time = 0.1 motion = ease_in
endscript

script mainmenu_item_unfocus 
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	<id> :getsingletag 0xa3721c47
	menurow_txt_item_rgba = [100 84 164 255]
	if gotparam \{0xa3721c47}
		menurow_txt_item_rgba = ($0x24ff60ab)
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		0xe2d8d29d = 6
		menurow_txt_item_font = fontgrid_text_a1
		menurow_txt_item_rgba = <menurow_txt_item_rgba>
	}
	<id> :desc_refreshcontentdims
	if <id> :getsingletag 0x9a010967
		<id> :se_setprops menurow_scale = <0x9a010967>
		<id> :se_setprops menurow_scale = 1.0 time = 0.1 motion = ease_in
	endif
endscript

script mainmenu_pad_up 
	requireparams \{[
			arrow_id
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse
	runscriptonscreenelement \{id = current_menu
		mainmenu_freeplay_timer}
	current_menu :gettags
	getscreenelementchildren \{id = current_menu}
	0xcf273e4e \{up}
endscript

script mainmenu_pad_down 
	requireparams \{[
			arrow_id
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse params = {down}
	runscriptonscreenelement \{id = current_menu
		mainmenu_freeplay_timer}
	current_menu :gettags
	getscreenelementchildren \{id = current_menu}
	0xcf273e4e \{down}
endscript

script mainmenu_do_arrow_pulse 
	obj_getid
	if gotparam \{down}
		mainmenu_id :se_setprops \{0x36b2836f = 1.3
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{0x36b2836f = 1.0
			time = 0.1}
		mainmenu_id :se_waitprops
	else
		mainmenu_id :se_setprops \{0x6947a857 = 1.3
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{0x6947a857 = 1.0
			time = 0.1}
		mainmenu_id :se_waitprops
	endif
endscript

script mainmenu_do_scroll_glow 
	obj_getid
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		pos = (0.0, 0.0)
		rgba = [255 215 0 255]
		pos_anchor = [center center]
		just = [center center]
		z_priority = 5
		alpha = 0.3
		blend = add
	}
	<id> :se_setprops scale = 1.2 relative_scale
	<id> :se_setprops scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	wait \{0.2
		seconds}
	destroyscreenelement id = <id>
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroyscreenelement \{id = mainmenu_id}
endscript

script main_menu_select_freeplay 
	se_setprops \{block_events}
	play_cameracut \{prefix = 'cameras_no_band'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	spawnscriptnow \{killmenumusicslowly}
	spawnscriptnow \{going_into_freeplay_from_main_menu}
	if NOT gotparam \{do_not_play_sfx}
		generic_menu_pad_choose_sound
	endif
	if gotparam \{device_num}
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
	stoprendering
	if NOT has_completed_forced_career_flow device_num = <device_num>
		main_menu_select_band_lobby lobby_mode = career device_num = <device_num> state = uistate_career_movie data = {movie = 'career_intro' new_state = uistate_character_selection new_data = {device_num = <device_num>}}
	else
		main_menu_select_band_lobby lobby_mode = career device_num = <device_num>
	endif
endscript

script main_menu_select_band_lobby \{state = uistate_band_lobby_setup
		data = {
		}}
	stoprendering
	requireparams \{[
			lobby_mode
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	change g_lobby_state = <lobby_mode>
	if checksumequals a = <lobby_mode> b = career
		if has_completed_forced_career_flow device_num = <device_num>
			change \{g_lobby_enter_from_main_menu = 1}
		endif
	else
		change \{g_lobby_enter_from_main_menu = 1}
	endif
	<data> = {<data> device_num = <device_num>}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = <state> data = <data> optional_signin = 1
endscript

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_select_music_central 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_music_central
endscript

script main_menu_select_cas 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	hide_glitch \{num_frames = 10}
	lightshow_notingameplay_setmood \{mood = band_lobby}
	play_cameracut \{prefix = 'cameras_no_band'}
	killspawnedscript \{name = persistent_band_cancel_lobby}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection optional_signin = 1 data = {device_num = <device_num> from_main_menu}
endscript

script main_menu_select_training 
	hide_glitch \{num_frames = 15}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_select_training require_signin = 0 data = {from_main_menu = 1 no_sound = 1}
endscript

script main_menu_select_options 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> optional_signin = 1 state = uistate_options data = {no_sound = 1}
endscript

script main_menu_select_leaderboards 
	change \{rich_presence_context = presence_leaderboards}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> require_signin = 0 state = uistate_leaderboard_instrument data = {no_sound = 1}
endscript

script main_menu_select_debug 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
endscript

script main_menu_select_music_store 
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> require_live = 1 musicstore = 1 state = uistate_songlist data = {mode = music_store no_sound = 1}
endscript

script main_menu_select_motd 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_motd}
endscript

script main_menu_select_vip 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_vip_invite}
endscript

script pop_in_new_downloads_notifier \{time = 0.5}
	wait \{0.5
		second}
	if NOT screenelementexists \{id = main_menu_text_container}
		return
	endif
	pos = (100.0, 390.0)
	text = qs(0x40fdb3fc)
	createscreenelement {
		type = textelement
		parent = main_menu_text_container
		text = <text>
		scale = 0.5
		rgba = [255 255 205 255]
		just = [center center]
		font_spacing = 5
		font = fontgrid_text_a3
		pos = <pos>
		z_priority = 5
		alpha = 0
	}
	getscreenelementdims id = <id>
	if (<width> >= 500)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	createscreenelement {
		type = textelement
		parent = main_menu_text_container
		id = new_downloads_text_glow
		text = <text>
		scale = 0.5
		rgba = [255 255 255 255]
		font = fontgrid_text_a3
		just = [center center]
		font_spacing = 5
		pos = <pos>
		z_priority = 6
		alpha = 0
	}
	getscreenelementdims id = <id>
	if (<width> >= 500)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaysprite {
		parent = main_menu_text_container
		tex = white
		pos = (<pos>)
		just = [center center]
		rgba = [170 90 35 255]
		z = 4
		dims = ((<width> + 20) * (1.0, 0.0) + (0.0, 1.0) * (<height> + 10))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaysprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [right center]
		rgba = [170 90 35 255]
		z = 4
		pos = ((<pos>) - <width> * (0.5, 0.0) - (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		flip_v
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaysprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [left center]
		rgba = [170 90 35 255]
		z = 4
		pos = ((<pos>) + <width> * (0.5, 0.0) + (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	spawnscriptnow \{glow_new_downloads_text
		params = {
			time = 0.75
		}}
endscript

script main_menu_select_generic 
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if gotparam \{dont_clear_stack}
		generic_event_choose state = <state> data = {<data>}
	else
		generic_event_choose state = <state> data = {<data>}
	endif
endscript

script set_primary_controller \{event = menu_change
		require_signin = 1}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if ((gotparam force) || ($force_mainmenu_signin = 1))
		change \{primary_controller_assigned = 0}
		change \{primary_controller = -1}
		change \{force_mainmenu_signin = 0}
	endif
	change \{signin_jam_mode = 0}
	if ($game_mode = freeplay)
		change \{game_mode = p1_quickplay}
	endif
	if gotparam \{jam}
		if ($jam_view_cam_created = 1)
			scriptassert \{'logic error, this value should be zero here'}
		endif
		change \{signin_jam_mode = 1}
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
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait ($g_mainmenu_freeplay_timer) seconds
	main_menu_select_freeplay \{do_not_play_sfx}
endscript

script 0x6407587e \{time = 30.0
		startpos = (0.0, 0.0)}
	endpos = (<startpos> - (1280.0, 0.0))
	begin
	se_setprops {
		pos = <endpos>
		time = <time>
	}
	se_waitprops
	se_setprops {
		pos = <startpos>
	}
	repeat
endscript

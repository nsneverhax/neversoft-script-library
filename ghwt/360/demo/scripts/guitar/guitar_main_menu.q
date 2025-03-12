force_mainmenu_signin = 0

script create_main_menu 
	change \{respond_to_signin_changed = 0}
	reset_quickplay_song_list
	cas_destroy_all_characters
	reset_character_ids
	sanity_check_fix_deleted_characters
	band_builder_clear_random_appearances
	frontend_load_soundcheck
	reset_all_special_events
	clear_exclusive_devices
	setmenuautorepeattimes \{(0.3, 0.05)}
	disable_pause
	unpausegame
	change \{current_num_players = 1}
	change structurename = player1_status controller = ($primary_controller)
	disable_pause
	spawnscriptnow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	change \{should_reset_gig_posters_selection = 1}
	change \{setlist_previous_tier = 1}
	change \{setlist_previous_song = 0}
	change \{setlist_previous_tab = tab_setlist}
	change \{current_song = $startup_song}
	change \{end_credits = 0}
	change \{battle_do_or_die = 0}
	change \{battle_do_or_die_speed_scale = 1.0}
	change \{battle_do_or_die_attack_scale = 1.0}
	change \{rich_presence_context = presence_menus}
	change \{player1_device = 0}
	change \{player2_device = 1}
	change \{player3_device = 2}
	change \{player4_device = 3}
	change \{current_gig_number = 1}
	change \{current_progression_flag = none}
	change \{options_for_manage_band = 0}
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
		spawnscriptlater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_jam = 1)
		change \{autolaunch_jam = 0}
		spawnscriptlater main_menu_select_jam params = {device_num = ($primary_controller)}
	endif
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	base_menu_pos = (730.0, 125.0)
	main_menu_font = fontgrid_title_a1
	create_viewport_ui \{texture = `tex\zones\sound_stage\alpha_texture1.dds`
		texdict = `zones/z_soundcheck/z_soundcheck.tex`}
	demo_mode_disable = {rgba = [96 96 96 255] not_focusable}
	createscreenelement {
		type = vmenu
		parent = <window_id>
		id = current_menu
		dims = (1280.0, 720.0)
		just = [left top]
		pos = (0.0, 0.0)
		internal_just = [center bottom]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		position_children = false
	}
	container_pos = (640.0, 100.0)
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-160.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xde7ec8b3)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_career
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = <container_pos>
		}
		text_params = {
			text = qs(0xfabdce2b)
		}
		choose_script = main_menu_select_quickplay
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (20.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xfef0f891)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_multiplayer
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	if isxenon
		online_text = qs(0x2725b21f)
	else
		online_text = qs(0xe60e3e4a)
	endif
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-60.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = <online_text>
			<demo_mode_disable>
		}
		choose_script = main_menu_select_online
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = <container_pos>
		}
		text_params = {
			text = qs(0x79dfdd25)
		}
		choose_script = main_menu_select_jam
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-40.0, 0.0))
		}
		text_params = {
			text = qs(0x9f894c1e)
		}
		choose_script = main_menu_select_cas
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (0.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x271e2cfc)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_downloads
	}
	if isxenon
		container_pos = (<container_pos> + (0.0, 85.0))
		add_mainmenu_item {
			parent = current_menu
			container_params = {
				pos = (<container_pos> + (0.0, 0.0))
			}
			text_params = {
				text = qs(0x67d9c56d)
			}
			choose_script = 0x970e8f51
		}
	else
		container_pos = (<container_pos> + (0.0, 85.0))
		add_mainmenu_item {
			parent = current_menu
			container_params = {
				pos = (<container_pos> + (-40.0, 0.0))
				<demo_mode_disable>
			}
			text_params = {
				text = qs(0x976cf9e7)
				<demo_mode_disable>
			}
			choose_script = main_menu_select_options
		}
	endif
	container_pos = (<container_pos> + (0.0, 55.0))
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if (<show_debug_menus>)
		if ($is_multiplayer_beta = 0)
			add_mainmenu_item {
				parent = current_menu
				container_params = {
					pos = <container_pos>
					dims = (200.0, 30.0)
				}
				text_params = {
					text = qs(0xe4963f83)
					scale = 0.65000004
				}
				choose_script = main_menu_select_debug
			}
		endif
	endif
endscript

script add_mainmenu_item \{default_container_params = {
			dims = (200.0, 50.0)
			child_anchor = [
				center
				top
			]
			scale = 1.8
		}
		default_text_params = {
			text = qs(0x03ac90f0)
			rgba = [
				200
				200
				200
				250
			]
			just = [
				center
				center
			]
		}
		choose_script = nullscript}
	if globalexists \{name = massive_build}
		if NOT ($massive_build = 0)
			if gotparam \{massive_secret_item}
				return
			endif
		endif
	endif
	createscreenelement {
		<default_container_params>
		<container_params>
		type = containerelement
		parent = <parent>
		event_handlers = [
			{focus mainmenu_item_focus}
			{unfocus mainmenu_item_unfocus}
			{pad_choose <choose_script>}
		]
	}
	container_id = <id>
	createscreenelement {
		font = ($test_menu_font)
		<default_text_params>
		<text_params>
		type = textelement
		parent = <container_id>
		local_id = text
	}
	getscreenelementdims id = <id>
	if (<width> > 420)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = ((420.0, 0.0) + <height> * (0.0, 1.0))
	endif
	return container_id = <container_id>
endscript

script mainmenu_item_focus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = {<id> child = text} font = fontgrid_text_a6_fire material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
endscript

script mainmenu_item_unfocus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = {<id> child = text} rgba = [200 200 200 250] font = fontgrid_text_a6 material = null
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
endscript

script main_menu_select_career 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{game_mode = p1_career}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode
endscript

script main_menu_select_quickplay 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = quickplay}
endscript

script main_menu_select_multiplayer 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{game_mode = p2_faceoff}
	change \{current_num_players = 2}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	main_menu_select_generic device_num = <device_num> state = uistate_select_controller
endscript

script main_menu_select_training 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{game_mode = training}
	change \{current_num_players = 1}
	change \{came_to_practice_from = main_menu}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	set_primary_controller device_num = <device_num> state = uistate_select_practice_mode
endscript

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_select_downloads 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_downloads downloads = 1
endscript

script main_menu_select_options 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_options
endscript

script main_menu_select_jam 
	generic_menu_pad_choose_sound
	spawnscriptnow \{menu_music_fade
		params = {
			time = 1.0
			out
			dont_fade_crowd
		}}
	bg_crowd_front_end_silence \{immediate = 1}
	0xcef67b9d = ''
	plat = 'XBOX'
	if isps3
		plat = 'PS3'
	endif
	formattext textname = movie 'GH_MUSIC_%a%b' a = <plat> b = <0xcef67b9d>
	launchevent \{type = unfocus
		target = current_menu}
	playmovieandwait movie = <movie>
	launchevent \{type = focus
		target = current_menu}
	spawnscriptnow \{menu_music_fade
		params = {
			time = 2.0
			in
			dont_fade_crowd
		}}
	return
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if isxenon
		change \{jam_curr_directory_listing = [
			]}
	endif
	change \{respond_to_signin_changed = 1}
	set_primary_controller device_num = <device_num> state = uistate_jam jam
	spawnscriptnow \{menu_music_fade
		params = {
			time = 8.160001
			out
			dont_fade_crowd
		}}
	wait \{1
		seconds}
	bg_crowd_front_end_silence \{immediate = 1}
endscript

script main_menu_select_cas 
	generic_menu_pad_choose_sound
	spawnscriptnow \{menu_music_fade
		params = {
			time = 1.0
			out
			dont_fade_crowd
		}}
	bg_crowd_front_end_silence \{immediate = 1}
	0xcef67b9d = ''
	plat = 'XBOX'
	if isps3
		plat = 'PS3'
	endif
	formattext textname = movie 'GH_CREAT_%a%b' a = <plat> b = <0xcef67b9d>
	launchevent \{type = unfocus
		target = current_menu}
	playmovieandwait movie = <movie>
	launchevent \{type = focus
		target = current_menu}
	spawnscriptnow \{menu_music_fade
		params = {
			time = 2.0
			in
			dont_fade_crowd
		}}
	return
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection data = {from_main_menu = 1}
endscript

script main_menu_select_debug 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
endscript

script 0x970e8f51 
	printf \{qs(0x2a04b7d5)}
	do_demo_outro
endscript
0x9cf507d8 = 0
0xafe8873e = 0
0xfd5e1663 = [
	'outro_1'
	'outro_2'
]
0xc1c900c3 = [
	'outro_1'
	'outro_2n'
]

script do_demo_outro 
	printf \{qs(0x2a04b7d5)}
	wait_for_safe_shutdown
	printf \{qs(0x7e5d73b7)}
	disable_pause
	stoprendering
	shutdown_game_for_signin_change \{signin_change = 0}
	launchevent \{type = unfocus
		target = root_window}
	change \{0x9cf507d8 = 1}
	startrendering
	getterritory
	if (<territory> = territory_us)
		splashscreens = $0xc1c900c3
	else
		splashscreens = $0xfd5e1663
	endif
	getarraysize <splashscreens>
	i = 0
	begin
	displayloadingscreen (<splashscreens> [<i>]) localized
	wait \{3
		seconds}
	gettruestarttime
	begin
	gettrueelapsedtime starttime = <starttime>
	if (<elapsedtime> >= 7000)
		break
	endif
	if ($0xafe8873e != 0)
		break
	endif
	if controllerpressed \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($0xafe8873e != 0)
		break
	endif
	displayloadingscreen \{freeze}
	hideloadingscreen
	i = (<i> + 1)
	repeat <array_size>
	demoquit
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
	generic_event_choose state = <state> data = <data>
endscript

script set_primary_controller \{event = menu_change}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if ((gotparam force) || ($force_mainmenu_signin = 1))
		change \{primary_controller = -1}
		change \{force_mainmenu_signin = 0}
	endif
	change \{signin_jam_mode = 0}
	if gotparam \{jam}
		if ($jam_view_cam_created = 1)
			scriptassert \{'logic error, this value should be zero here'}
		endif
		change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		generic_event_choose event = <event> no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards>}
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script frontend_load_soundcheck \{async = 1}
	printscriptinfo \{'frontend_load_soundcheck'}
	if getpakmancurrent \{map = zones}
		printf 'frontend_load_soundcheck : %s is loaded' s = <pak> donotresolve
		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
		endif
	endif
	if gotparam \{load_soundcheck}
		needs_loading_screen = 1
		if pakfilesarecached
			needs_loading_screen = 0
			if NOT frontend_anim_paks_are_loaded
				needs_loading_screen = 1
			endif
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				create_loading_screen
			else
				hide_glitch \{num_frames = 3}
			endif
		endif
		if NOT isps3 \{testkit}
			if NOT pakfilesarecached
				if ((cd) || ($force_pak_caching = 1))
					if ($disable_pak_caching = 0)
						if cachepakfiles
							block \{untilevent = cache_pak_files_loaded}
						endif
					endif
				endif
			endif
		endif
		if pakfilesarecached
			setpakmancurrentblock \{map = zones
				pak = z_soundcheck
				block_scripts = 1}
		else
			setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = (<async> - 1)
		endif
		load_frontend_anim_paks async = <async>
		if NOT gotparam \{gigboard}
			hide_glitch \{num_frames = 30}
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				destroy_loading_screen
			endif
		endif
	endif
endscript

script reset_character_ids 
	printf \{'reset_character_ids'}
	change \{structurename = player1_status
		character_id = judy}
	change \{structurename = player2_status
		character_id = judy}
	change \{structurename = player3_status
		character_id = judy}
	change \{structurename = player4_status
		character_id = judy}
	change \{structurename = player5_status
		character_id = judy}
	change \{structurename = player6_status
		character_id = judy}
	change \{structurename = player7_status
		character_id = judy}
	change \{structurename = player8_status
		character_id = judy}
endscript

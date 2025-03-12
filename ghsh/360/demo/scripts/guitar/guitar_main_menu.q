force_mainmenu_signin = 0

script create_main_menu 
	change \{respond_to_signin_changed = 0}
	closesonglogfile
	reset_quickplay_song_list
	cas_destroy_all_characters
	reset_character_ids
	sanity_check_fix_deleted_characters
	band_builder_clear_random_appearances
	destroy_band
	destroy_bandname_viewport
	frontend_load_soundcheck
	reset_all_special_events
	clear_exclusive_devices
	setmenuautorepeattimes \{(0.3, 0.05)}
	disable_pause
	unpausegame
	change \{current_num_players = 1}
	change structurename = player1_status controller = ($primary_controller)
	disable_pause
	get_num_globaltag_sets
	savegame = 0
	begin
	setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = 0 vocals_highway_view_save = scrolling}
	<savegame> = (<savegame> + 1)
	repeat <num_globaltag_sets>
	i = 1
	begin
	setplayerinfo <i> lefty_flip = 0
	setplayerinfo <i> lefthanded_gems = 0
	setplayerinfo <i> lefthanded_button_ups = 0
	setplayerinfo <i> lefthanded_button_ups_flip_save = 0
	setplayerinfo <i> lefthanded_gems_flip_save = 0
	setplayerinfo <i> vocals_highway_view = scrolling
	i = (<i> + 1)
	repeat 4
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
	if ($autolaunch_cas = 1 || $autolaunch_cas_artist = 1)
		change \{autolaunch_cas = 0}
		spawnscriptlater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_jam = 1)
		change \{autolaunch_jam = 0}
		spawnscriptlater main_menu_select_jam params = {device_num = ($primary_controller)}
	endif
	spawnscriptnow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
endscript

script mainmenu_focus 
	obj_getid
	se_setprops rgba = (($g_menu_colors).menu_title)
	bx_focushighlightstarson objid = <objid>
endscript

script mainmenu_unfocus 
	obj_getid
	se_setprops rgba = (($g_menu_colors).menu_gold)
endscript

script highlight_motion 
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :die
	endif
	isgreatesthits
	if (<is_greatest_hits>)
		tex = gh_spirit_logo_eu
	else
		tex = gh_spirit_logo
	endif
	createscreenelement {
		type = descinterface
		id = current_menu_anchor
		parent = root_window
		desc = 'main_menu_layout'
		just = [center center]
		gh_spirit_logo_texture = <tex>
	}
	current_menu_anchor :obj_spawnscriptnow \{bg_swap}
	bx_createhighlightstars \{parent = current_menu_anchor}
	assignalias id = <id> alias = 0xa73e4640
	if current_menu_anchor :desc_resolvealias \{name = alias_menu}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
			]}
		if getscreenelementchildren \{id = current_menu}
			getarraysize <children>
			i = 0
			begin
			curr_id = (<children> [<i>])
			<curr_id> :se_setprops {
				event_handlers = [
					{focus mainmenu_focus}
					{unfocus mainmenu_unfocus}
				]
				tags = {index = <i>}
			}
			i = (<i> + 1)
			repeat <array_size>
			curr_id = (<children> [0])
			<curr_id> :se_setprops {
				not_focusable
				rgba = (($g_menu_colors).0xd003083d)
			}
			curr_id = (<children> [1])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_quickplay}
				]
			}
			curr_id = (<children> [2])
			<curr_id> :se_setprops {
				not_focusable
				rgba = (($g_menu_colors).0xd003083d)
			}
			curr_id = (<children> [3])
			<curr_id> :se_setprops {
				not_focusable
				rgba = (($g_menu_colors).0xd003083d)
			}
			bx_resizetextfield {
				id = <curr_id>
				dims = (360.0, 46.6)
				fit_width = `scale each line if larger`
			}
			curr_id = (<children> [4])
			<curr_id> :se_setprops {
				not_focusable
				rgba = (($g_menu_colors).0xd003083d)
			}
			if isps3
				<curr_id> :se_setprops dims = (0.0, 0.0) text = qs(0xe60e3e4a)
			endif
			curr_id = (<children> [5])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_backstage}
				]
			}
			curr_id = (<children> [6])
			<curr_id> :se_setprops {
				not_focusable
				rgba = (($g_menu_colors).0xd003083d)
			}
			curr_id = (<children> [7])
			<0x6f819a60> = false
			if ($0x86d19377 = 1)
				<0x6f819a60> = true
			endif
			if (<0x6f819a60> = true)
				<curr_id> :se_setprops {
					event_handlers = [
						{pad_choose 0x970e8f51}
					]
				}
			else
				<curr_id> :se_setprops {
					hide
					not_focusable
				}
			endif
			curr_id = (<children> [8])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_debug}
				]
			}
			show_debug_menus = 0
			if ($enable_button_cheats = 1)
				<show_debug_menus> = 1
				if ($enable_debug_menus = 0)
					<show_debug_menus> = 0
				endif
			endif
			if (<show_debug_menus> = 0)
				<curr_id> :die
			endif
		endif
	endif
	return
	base_menu_pos = (730.0, 125.0)
	main_menu_font = fontgrid_title_a1
	create_viewport_ui \{texture = `tex\zones\sound_stage\alpha_texture1.dds`
		texdict = `zones/z_soundcheck/z_soundcheck.tex`}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	if ($is_demo_mode = 0)
		if ($is_multiplayer_beta = 1)
			demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
		else
			demo_mode_disable = {}
		endif
	endif
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
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xfabdce2b)
			<demo_mode_disable>
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
		}
		text_params = {
			text = <online_text>
		}
		choose_script = main_menu_select_online
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = <container_pos>
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x79dfdd25)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_jam
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-40.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x9f894c1e)
			<demo_mode_disable>
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
			font = fontgrid_text_a11_large
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
		font = fontgrid_bordello
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
	setscreenelementprops id = {<id> child = text} rgba = [210 210 210 250]
endscript

script mainmenu_item_unfocus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = {<id> child = text} rgba = [200 200 200 250]
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
	change \{came_to_practice_from_progression = none}
	change \{came_to_practice_character_id = emptyguy}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	set_primary_controller device_num = <device_num> state = uistate_select_practice_mode data = <...>
endscript

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_select_backstage 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_backstage
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
endscript

script main_menu_select_cas 
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
	'outro_3'
	'outro_4'
	'outro_5'
]
0xc1c900c3 = [
	'outro_1n'
	'outro_3'
	'outro_4'
	'outro_5n'
]

script do_demo_outro 
	printf \{qs(0x2a04b7d5)}
	destroyscreenelement \{id = 0xa73e4640}
	wait_for_safe_shutdown
	printf \{qs(0x7e5d73b7)}
	disable_pause
	stoprendering
	shutdown_game_for_signin_change \{signin_change = 0}
	launchevent \{type = unfocus
		target = root_window}
	change \{0x9cf507d8 = 1}
	startrendering
	isgreatesthits
	if (<is_greatest_hits>)
		splashscreens = $0xfd5e1663
	else
		splashscreens = $0xc1c900c3
	endif
	getarraysize <splashscreens>
	i = 0
	begin
	displayloadingscreen (<splashscreens> [<i>]) localized
	wait \{1.5
		seconds}
	gettruestarttime
	begin
	gettrueelapsedtime starttime = <starttime>
	if (<elapsedtime> >= 8500)
		break
	endif
	if ($0xafe8873e != 0)
		break
	endif
	getenterbuttonassignment
	switch <assignment>
		case circle
		if controllerpressed \{circle}
			break
		endif
		default
		if controllerpressed \{x}
			break
		endif
	endswitch
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
	requireparams \{[
			device_num
		]
		all}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if ((gotparam force) || ($force_mainmenu_signin = 1))
		change \{primary_controller = -1}
		change \{last_start_pressed_device = -1}
		change \{force_mainmenu_signin = 0}
	endif
	change \{respond_to_signin_changed = 1}
	change \{signin_jam_mode = 0}
	if ($current_num_players = 1)
		if (<device_num> > -1)
			setplayerinfo 1 controller = <device_num>
		endif
	endif
	if gotparam \{jam}
		if ($jam_view_cam_created = 1)
			scriptassert \{'logic error, this value should be zero here'}
		endif
		change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		if gotparam \{require_live}
			force = 1
		elseif gotparam \{leaderboards}
			force = 1
		endif
		change primary_controller = <device_num>
		change last_start_pressed_device = <device_num>
		refresh_autokick_cheat
		restore_globals_from_global_tags
		generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
		return
		get_savegame_from_controller controller = <device_num>
		if NOT is_autosave_on savegame = <savegame>
			change primary_controller = <device_num>
			change last_start_pressed_device = <device_num>
			refresh_autokick_cheat
			restore_globals_from_global_tags
			generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
			return
		endif
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
		if NOT gotparam \{load_soundcheck}
			if NOT istextureloaded \{id = main_menu_skull}
				load_soundcheck = 1
			endif
		endif
	endif
	if NOT frontend_anim_paks_are_loaded
		load_anims = 1
	endif
	if ((gotparam load_soundcheck) || (gotparam load_anims))
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
		if gotparam \{load_soundcheck}
			if pakfilesarecached
				setpakmancurrentblock \{map = zones
					pak = z_soundcheck
					block_scripts = 1}
			else
				setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = (<async> - 1)
			endif
		endif
		if gotparam \{load_anims}
			load_frontend_anim_paks \{async = 1}
		endif
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

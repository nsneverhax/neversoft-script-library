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
	create_frontend_bg
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

script create_frontend_bg 
	spawnscriptnow \{play_frontend_bg_movie}
	if NOT screenelementexists \{id = current_bg_anchor}
		createscreenelement \{type = descinterface
			id = current_bg_anchor
			parent = root_window
			desc = 'main_menu_layout'
			just = [
				center
				center
			]}
		assignalias id = <id> alias = 0x0fb8f7d1
		current_bg_anchor :obj_spawnscriptnow \{frontend_background_anim}
	endif
endscript

script cleanup_frontend_bg 
	if screenelementexists \{id = current_bg_anchor}
		killspawnedscript \{name = frontend_background_anim}
		destroyscreenelement \{id = current_bg_anchor}
	endif
endscript
frontend_movie_buffer = 2
frontend_movie_texture_slot = 3
frontend_movie = 'VHstage02'
frontend_movie_path = 'movies\\bik\\VHstage02.bik.xen'
frontend_movie_playing = 0
frontend_movie_kill = 0

script play_frontend_bg_movie 
	change \{frontend_movie_kill = 0}
	check_movie = 0
	if ismovieplaying textureslot = ($frontend_movie_texture_slot)
		check_movie = 1
	endif
	printf channel = movie qs(0x45c03020) p = ($frontend_movie_playing) c = <check_movie>
	printscriptinfo \{channel = movie
		'play_frontend_bg_movie'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT ismovieplaying textureslot = ($frontend_movie_texture_slot)
		printf channel = movie qs(0x78b8a882) p = ($frontend_movie_playing)
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -500
			id = movie_backdrop}
		stoprendering \{reason = bg_movie}
		if NOT ($bink_heap_state = big)
			killallmovies
			waitforallmoviestofinish
			set_bink_heap_state \{state = big}
		elseif ismovieplaying textureslot = ($frontend_movie_texture_slot)
			killmovie textureslot = ($frontend_movie_texture_slot)
		endif
		playmovie {
			movie = ($frontend_movie)
			textureslot = ($frontend_movie_texture_slot)
			texturepri = 1
			no_hold
		}
		begin
		if (($frontend_movie_kill) = 1)
			kill_frontend_bg_movie
			startrendering \{reason = bg_movie}
			break
		elseif ismovieplaying textureslot = ($frontend_movie_texture_slot)
			printf channel = movie qs(0x94d59837) p = ($frontend_movie_playing)
			change \{frontend_movie_playing = 1}
			startrendering \{reason = bg_movie}
			break
		endif
		wait \{1
			gameframe
			ignoreslomo}
		repeat
	endif
	check_movie = 0
	if ismovieplaying textureslot = ($frontend_movie_texture_slot)
		check_movie = 1
		spawnscriptnow \{background_movie_fade_watcher}
	endif
	printf channel = movie qs(0x971dd427) p = ($frontend_movie_playing) c = <check_movie> k = ($frontend_movie_kill)
endscript

script background_movie_fade_watcher 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	begin
	if NOT ismovieplaying textureslot = ($frontend_movie_texture_slot)
		wait \{1
			gameframe}
		fadetoblack \{off
			id = movie_backdrop
			no_wait}
		change \{frontend_movie_playing = 0}
		change \{frontend_movie_kill = 0}
		printf channel = movie qs(0x6e297407) p = ($frontend_movie_playing) k = ($frontend_movie_kill)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script cleanup_frontend_bg_movie 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	printf channel = movie qs(0xfb2ed2dd) p = ($frontend_movie_playing)
	printscriptinfo \{channel = movie
		'cleanup_frontend_bg_movie'}
	if ismovieplaying textureslot = ($frontend_movie_texture_slot)
		kill_frontend_bg_movie
	elseif scriptisrunning \{play_frontend_bg_movie}
		printf channel = movie qs(0xae2c70ba) p = ($frontend_movie_playing)
		change \{frontend_movie_kill = 1}
	else
		fadetoblack \{off
			id = movie_backdrop
			no_wait}
		change \{frontend_movie_playing = 0}
		change \{frontend_movie_kill = 0}
	endif
	check_movie = 0
	if ismovieplaying textureslot = ($frontend_movie_texture_slot)
		check_movie = 1
	endif
	printf channel = movie qs(0x6524b8ac) p = ($frontend_movie_playing) c = <check_movie> k = ($frontend_movie_kill)
endscript

script kill_frontend_bg_movie 
	printf channel = movie qs(0x27481b56) p = ($frontend_movie_playing)
	hide_glitch \{num_frames = 3}
	killmovie textureslot = ($frontend_movie_texture_slot)
	change \{frontend_movie_playing = 0}
	change \{frontend_movie_kill = 0}
	fadetoblack \{off
		id = movie_backdrop
		no_wait}
endscript

script mainmenu_focus 
	obj_getid
	gettags
	if gotparam \{isinterface}
		<objid> :se_setprops item_color = ($menu_focus_color)
		<objid> :focus_set_spinners
	else
		se_setprops rgba = ($menu_focus_color)
		<objid> :menu_focus_set_highlight
	endif
endscript

script mainmenu_unfocus 
	obj_getid
	gettags
	if gotparam \{isinterface}
		<objid> :se_setprops item_color = ($menu_unfocus_color)
		if <objid> :desc_resolvealias name = alias_left_spinner
			hide_spinners spinner_id = <objid>
		endif
	else
		se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script hookup_spinner_focus_functionality \{menu = current_menu_anchor}
	obj_getid
	setscreenelementprops {
		id = <objid>
		event_handlers = [
			{focus focus_set_spinners params = {menu = <menu>}}
		]
	}
	if <objid> :desc_resolvealias name = alias_left_spinner
		setscreenelementprops {
			id = <objid>
			event_handlers = [
				{unfocus hide_spinners params = {spinner_id = <objid>}}
			]
		}
	endif
endscript

script focus_set_spinners \{menu = current_menu_anchor}
	obj_getid
	<objid> :se_getprops
	if (<type> = descinterface)
		if <objid> :desc_resolvealias name = alias_left_spinner
			if scriptisrunning \{animate_spinners}
				killspawnedscript \{name = animate_spinners}
			endif
			<objid> :obj_spawnscript animate_spinners params = {menu_id = <objid>}
		else
			<objid> :menu_focus_set_highlight menu = <menu>
		endif
	else
		<objid> :menu_focus_set_highlight menu = <menu>
	endif
endscript
spinner_spin_rate = 45.0

script animate_spinners spin_rate = ($spinner_spin_rate)
	setscriptcannotpause
	requireparams \{[
			menu_id
		]
		all}
	if NOT screenelementexists id = <menu_id>
		scriptassert \{qs(0x98004f72)}
	endif
	if <menu_id> :desc_resolvealias name = alias_spinner
		spinner_id = <resolved_id>
	else
		spinner_id = <menu_id>
	endif
	if NOT screenelementexists id = <spinner_id>
		return
	endif
	if <spinner_id> :desc_resolvealias name = alias_left_spinner
		left_spinner_id = <resolved_id>
		<left_spinner_id> :se_setprops alpha = 1.0 time = 0.0
	endif
	if <spinner_id> :desc_resolvealias name = alias_right_spinner
		right_spinner_id = <resolved_id>
		<right_spinner_id> :se_setprops alpha = 1.0 time = 0.0
	endif
	begin
	if NOT screenelementexists id = <spinner_id>
		printf \{channel = kim
			qs(0x739173d6)}
		break
	endif
	if screenelementexists id = <left_spinner_id>
		<left_spinner_id> :se_getprops rot_angle
		<left_spinner_id> :se_setprops rot_angle = (<rot_angle> + <spin_rate>) time = 0.5
	elseif <spinner_id> :desc_resolvealias name = alias_left_spinner
		left_spinner_id = <resolved_id>
	endif
	if screenelementexists id = <right_spinner_id>
		<right_spinner_id> :se_getprops rot_angle
		<right_spinner_id> :se_setprops rot_angle = (<rot_angle> - <spin_rate>) time = 0.5
	elseif <spinner_id> :desc_resolvealias name = alias_right_spinner
		right_spinner_id = <resolved_id>
	endif
	wait \{5
		gameframes
		ignoreslomo}
	repeat
endscript

script hide_spinners \{spinner_id = current_menu_anchor}
	if screenelementexists id = <spinner_id>
		if <spinner_id> :desc_resolvealias name = alias_left_spinner
			left_spinner_id = <resolved_id>
			<left_spinner_id> :se_setprops alpha = 0.0 time = 0.0
		endif
		if <spinner_id> :desc_resolvealias name = alias_right_spinner
			right_spinner_id = <resolved_id>
			<right_spinner_id> :se_setprops alpha = 0.0 time = 0.0
		endif
	endif
endscript

script highlight_motion \{menu_id = current_menu_anchor
		alias_name = alias_highlight
		motion = spin}
	array_size = 0
	if <menu_id> :desc_resolvealias name = <alias_name>
		if NOT (<motion> = spin)
			if getscreenelementchildren id = <resolved_id>
				getarraysize <children>
				prev = (<array_size> - 1)
				curr = 0
				prev_id = (<children> [<prev>])
				curr_id = (<children> [<curr>])
			else
				return
			endif
		endif
	endif
	switch <motion>
		case spin
		animate_spinners menu_id = <menu_id>
		case movie
		begin
		if (<array_size> > 0)
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			curr = (<curr> + 1)
			if (<curr> >= <array_size>)
				curr = 0
			endif
		endif
		wait \{0.1
			second}
		repeat
		case bounce
		return
		case random_highlight
		if (<array_size> > 0)
			begin
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			if NOT gotparam \{no_flip}
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_v = true
				else
					<curr_id> :se_setprops flip_v = false
				endif
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_h = true
				else
					<curr_id> :se_setprops flip_h = false
				endif
			endif
			wait \{0.1
				second}
			repeat
		endif
		default
		scriptassert \{qs(0x01720eb0)}
	endswitch
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :die
	endif
	set_focus_color
	set_unfocus_color
	createscreenelement \{type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'menu_frontend'
		just = [
			center
			center
		]}
	if <id> :desc_resolvealias name = alias_menu
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			tags = {item_scale = <item_scale>}
			spacing_between = -15
		}
	endif
	add_menu_frontend_item \{desc = 'menu_tape_01'
		text = qs(0xde7ec8b3)
		pad_choose_script = main_menu_select_career
		not_focusable
		rgba = [
			64
			64
			64
			128
		]}
	add_menu_frontend_item \{desc = 'menu_tape_02'
		text = qs(0xfabdce2b)
		pad_choose_script = main_menu_select_quickplay}
	add_menu_frontend_item \{desc = 'menu_tape_03'
		text = qs(0xfef0f891)
		pad_choose_script = main_menu_select_multiplayer
		not_focusable
		rgba = [
			64
			64
			64
			128
		]}
	if isxenon
		text = qs(0x2725b21f)
	else
		text = qs(0xe60e3e4a)
	endif
	add_menu_frontend_item {
		desc = 'menu_tape_04'
		text = <text>
		pad_choose_script = main_menu_select_online
		not_focusable
		rgba = [64 64 64 128]
	}
	add_menu_frontend_item \{desc = 'menu_tape_05'
		text = qs(0x17044f94)
		pad_choose_script = main_menu_select_backstage}
	add_menu_frontend_item \{desc = 'menu_tape_01'
		text = qs(0x2c98ca28)
		pad_choose_script = main_menu_select_options
		not_focusable
		rgba = [
			64
			64
			64
			128
		]}
	add_menu_frontend_item \{desc = 'menu_tape_02'
		text = qs(0x79dfdd25)
		pad_choose_script = main_menu_select_jam
		not_focusable
		rgba = [
			64
			64
			64
			128
		]}
	if 0x37dfa9d7
		add_menu_frontend_item \{desc = 'menu_tape_05'
			text = qs(0x67d9c56d)
			pad_choose_script = 0x970e8f51}
	endif
	return
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
		current_menu :obj_spawnscript \{highlight_motion
			no_flip}
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
				event_handlers = [
					{pad_choose main_menu_select_career}
				]
			}
			curr_id = (<children> [1])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_quickplay}
				]
			}
			curr_id = (<children> [2])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_multiplayer}
				]
			}
			curr_id = (<children> [3])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_online}
				]
			}
			if isps3
				<curr_id> :se_setprops dims = (0.0, 0.0) text = qs(0xe60e3e4a)
			endif
			curr_id = (<children> [4])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_backstage}
				]
			}
			curr_id = (<children> [5])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_options}
				]
			}
			curr_id = (<children> [6])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_jam}
				]
			}
			curr_id = (<children> [7])
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
	main_menu_select_online_continue <...>
endscript

script main_menu_select_online_continue 
	if isxenon
		failed = 0
		sign_in = 1
		if netsessionfunc \{func = is_cable_unplugged}
			failed = 1
			sign_in = 0
			text = qs(0xeef7c882)
		elseif netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
			failed = 1
			text = qs(0xb9fd7c2c)
		elseif NOT checkforsignin local controller_index = <device_num> dont_set_primary
			failed = 1
			text = qs(0xee63bbfc)
		elseif NOT checkforsignin controller_index = <device_num> dont_set_primary
			failed = 1
			text = qs(0x7888d99e)
		elseif NOT netsessionfunc func = ismultiplayerallowed params = {controller_index = <device_num>}
			failed = 1
			text = qs(0x076f1bf2)
		endif
		if (<failed> = 1)
			launchevent \{type = unfocus
				target = current_menu}
			array = []
			if (<sign_in> = 1)
				addarrayelement array = <array> element = {func = {main_menu_signin_for_online} func_params = {device_num = <device_num>} text = qs(0x17df5913)}
			endif
			addarrayelement array = <array> element = {func = {main_menu_go_back} text = qs(0x320a8d1c)}
			create_popup_warning_menu {
				textblock = {
					text = <text>
					pos = (640.0, 370.0)
				}
				menu_pos = (640.0, 465.0)
				player_device = <device_num>
				options = <array>
			}
			return
		endif
	endif
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_go_back 
	destroy_popup_warning_menu
	launchevent \{type = focus
		target = current_menu}
endscript

script main_menu_signin_for_online 
	netsessionfunc \{func = showsigninui
		params = {
			online_only
		}}
	wait_for_blade_complete
	setbuttoneventmappings \{block_menu_input}
	wait \{1
		seconds
		ignoreslomo}
	destroy_popup_warning_menu
	setbuttoneventmappings \{unblock_menu_input}
	main_menu_select_online_continue device_num = <device_num>
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
	wait \{1
		seconds}
	bg_crowd_front_end_silence \{immediate = 1}
endscript

script main_menu_select_cas 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection data = {from_main_menu = 1}
	cleanup_frontend_bg_movie
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
	'outro_3'
	'outro_4'
]
0xc1c900c3 = [
	'outro_1'
	'outro_2'
	'outro_3'
	'outro_4'
]

script do_demo_outro 
	printf \{qs(0xf99127a2)}
	destroyscreenelement \{id = 0x0fb8f7d1}
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
		if NOT gotparam \{force}
			if current_band_save_created controller = <device_num>
				if checkforsignin local controller_index = <device_num>
					change primary_controller = <device_num>
					change last_start_pressed_device = <device_num>
					restore_globals_from_global_tags
					refresh_autokick_cheat
					generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
					return
				endif
			endif
			get_savegame_from_controller controller = <device_num>
			if NOT is_autosave_on savegame = <savegame>
				change primary_controller = <device_num>
				change last_start_pressed_device = <device_num>
				restore_globals_from_global_tags
				refresh_autokick_cheat
				generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
				return
			endif
		endif
		printscriptinfo
		finalprintf \{qs(0x858bff12)}
		printstruct <...>
		generic_event_choose event = <event> no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> musicstore = <musicstore>}
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script is_soundcheck_loaded 
	if getpakmancurrent \{map = zones}
		printf channel = ui 'Is_Soundcheck_loaded : %s is loaded' s = <pak> donotresolve
		if (<pak> = z_soundcheck)
			return \{true}
		endif
	endif
	return \{false}
endscript

script frontend_load_soundcheck \{async = 1}
	printscriptinfo \{channel = ui
		'frontend_load_soundcheck'}
	if getpakmancurrent \{map = zones}
		printf channel = ui 'frontend_load_soundcheck : %s is loaded' s = <pak> donotresolve
		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
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
initial_bg_anim_spawn = 1

script frontend_background_anim 
	printf \{channel = kim
		qs(0xe1eea255)}
	se_getprops \{mm_bg_top_pos}
	<org_mm_bg_top_pos> = <mm_bg_top_pos>
	se_getprops \{mm_bg_bot_pos}
	<org_mm_bg_bot_pos> = <mm_bg_bot_pos>
	se_getprops \{mm_bg_bot_02_pos}
	<org_mm_bg_bot_02_pos> = <mm_bg_bot_02_pos>
	se_getprops \{mm_white_stripe_01_pos}
	<org_mm_white_stripe_01_pos> = <mm_white_stripe_01_pos>
	se_getprops \{mm_white_stripe_01b_pos}
	<org_mm_white_stripe_01b_pos> = <mm_white_stripe_01b_pos>
	se_getprops \{mm_white_stripe_02_pos}
	<org_mm_white_stripe_02_pos> = <mm_white_stripe_02_pos>
	se_getprops \{mm_white_stripe_02b_pos}
	<org_mm_white_stripe_02b_pos> = <mm_white_stripe_02b_pos>
	se_getprops \{mm_white_stripe_03_pos}
	<org_mm_white_stripe_03_pos> = <mm_white_stripe_03_pos>
	se_getprops \{mm_white_stripe_04_pos}
	<org_mm_white_stripe_04_pos> = <mm_white_stripe_04_pos>
	se_getprops \{mm_black_stripe_01_pos}
	<org_mm_black_stripe_01_pos> = <mm_black_stripe_01_pos>
	se_getprops \{mm_black_stripe_01b_pos}
	<org_mm_black_stripe_01b_pos> = <mm_black_stripe_01b_pos>
	se_getprops \{mm_black_stripe_02_pos}
	<org_mm_black_stripe_02_pos> = <mm_black_stripe_02_pos>
	se_getprops \{mm_black_stripe_03_pos}
	<org_mm_black_stripe_03_pos> = <mm_black_stripe_03_pos>
	se_getprops \{mm_blacktrans_stripe_11_pos}
	<org_mm_blacktrans_stripe_11_pos> = <mm_blacktrans_stripe_11_pos>
	if ($initial_bg_anim_spawn = 1)
		change \{initial_bg_anim_spawn = 0}
		se_setprops mm_bg_top_pos = (<org_mm_bg_top_pos> + (2000.0, 150.0))
		se_setprops mm_bg_bot_pos = (<org_mm_bg_bot_pos> + (-1450.0, 0.0))
		se_setprops mm_bg_bot_02_pos = (<org_mm_bg_bot_02_pos> + (1060.0, -110.0))
		se_setprops mm_white_stripe_01_pos = (<org_mm_white_stripe_01_pos> + (2056.0, 200.0))
		se_setprops mm_white_stripe_01b_pos = (<org_mm_white_stripe_01b_pos> + (273.0, -277.0))
		se_setprops mm_white_stripe_02_pos = (<org_mm_white_stripe_02_pos> + (162.0, 875.0))
		se_setprops mm_white_stripe_02b_pos = (<org_mm_white_stripe_02b_pos> + (1600.0, 0.0))
		se_setprops mm_white_stripe_03_pos = (<org_mm_white_stripe_03_pos> + (80.0, 442.0))
		se_setprops mm_white_stripe_04_pos = (<org_mm_white_stripe_04_pos> + (893.0, -13.0))
		se_setprops mm_black_stripe_01_pos = (<org_mm_black_stripe_01_pos> + (-1481.0, 242.0))
		se_setprops mm_black_stripe_01b_pos = (<org_mm_black_stripe_01b_pos> + (391.0, 329.0))
		se_setprops mm_black_stripe_02_pos = (<org_mm_black_stripe_02_pos> + (0.0, 0.0))
		se_setprops \{mm_black_stripe_02_alpha = 0.0}
		se_setprops mm_black_stripe_03_pos = (<org_mm_black_stripe_03_pos> + (98.0, -1238.0))
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos> + (98.0, -1238.0))
		se_setprops \{logogh_vh_alpha = 0.0}
		se_setprops \{logogh_vh_alpha = 1.0
			time = 3.5}
		wait \{0.33
			seconds}
		se_setprops mm_bg_top_pos = <org_mm_bg_top_pos> time = 0.06
		wait \{0.21000001
			seconds}
		se_setprops mm_bg_bot_pos = <org_mm_bg_bot_pos> time = 0.04
		wait \{0.22
			seconds}
		se_setprops mm_bg_bot_02_pos = <org_mm_bg_bot_02_pos> time = 0.044999998
		wait \{0.43
			seconds}
		se_setprops mm_black_stripe_01_pos = <org_mm_black_stripe_01_pos> time = 0.13
		se_setprops mm_black_stripe_01b_pos = <org_mm_black_stripe_01b_pos> time = 0.2
		wait \{0.23
			seconds}
		se_setprops mm_white_stripe_01b_pos = <org_mm_white_stripe_01b_pos> time = 0.05
		se_setprops mm_white_stripe_02b_pos = <org_mm_white_stripe_02b_pos> time = 0.11
		wait \{0.16
			seconds}
		se_setprops mm_white_stripe_01_pos = <org_mm_white_stripe_01_pos> time = 0.055
		se_setprops mm_white_stripe_02_pos = <org_mm_white_stripe_02_pos> time = 0.11
		wait \{0.17
			seconds}
		se_setprops mm_white_stripe_03_pos = <org_mm_white_stripe_03_pos> time = 0.09
		se_setprops mm_white_stripe_04_pos = <org_mm_white_stripe_04_pos> time = 0.075
		se_setprops mm_black_stripe_03_pos = <org_mm_black_stripe_03_pos> time = 0.08
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos>) time = 0.08
		se_setprops \{mm_black_stripe_02_alpha = 1.0
			time = 1.5}
	endif
	wait \{2
		seconds}
	begin
	element = Random (@ mm_white_stripe_01 @ mm_white_stripe_02 @ mm_white_stripe_03 @ mm_white_stripe_04 @ mm_black_stripe_01 @ mm_black_stripe_02 @ mm_black_stripe_03 )
	switch <element>
		case mm_white_stripe_01
		se_setprops mm_white_stripe_01_pos = (<org_mm_white_stripe_01_pos> + (-1900.0, -150.0)) time = 0.33
		se_setprops mm_white_stripe_01_pos = (<org_mm_white_stripe_01_pos> + (1485.0, 88.0)) time = 0
		se_setprops mm_white_stripe_01_pos = <org_mm_white_stripe_01_pos> time = 0.33
		case mm_white_stripe_02
		se_setprops mm_white_stripe_02_pos = (<org_mm_white_stripe_02_pos> + (385.0, -980.0)) time = 0.33
		se_setprops mm_white_stripe_02_pos = (<org_mm_white_stripe_02_pos> + (162.0, 875.0)) time = 0.0
		se_setprops mm_white_stripe_02_pos = <org_mm_white_stripe_02_pos> time = 0.33
		case mm_white_stripe_03
		se_setprops mm_white_stripe_03_pos = (<org_mm_white_stripe_03_pos> + (-1167.0, -523.0)) time = 0.33
		se_setprops mm_white_stripe_03_pos = (<org_mm_white_stripe_03_pos> + (80.0, 442.0)) time = 0.0
		se_setprops mm_white_stripe_03_pos = <org_mm_white_stripe_03_pos> time = 0.33
		case mm_white_stripe_04
		se_setprops mm_white_stripe_04_pos = (<org_mm_white_stripe_04_pos> + (-513.0, 584.0)) time = 0.33
		se_setprops mm_white_stripe_04_pos = (<org_mm_white_stripe_04_pos> + (893.0, -13.0)) time = 0.0
		se_setprops mm_white_stripe_04_pos = <org_mm_white_stripe_04_pos> time = 0.33
		case mm_black_stripe_01
		se_setprops mm_black_stripe_01_pos = (<org_mm_black_stripe_01_pos> + (-1473.0, 474.0)) time = 0.33
		se_setprops mm_black_stripe_01_pos = (<org_mm_black_stripe_01_pos> + (-1481.0, 242.0)) time = 0.0
		se_setprops mm_black_stripe_01_pos = <org_mm_black_stripe_01_pos> time = 0.33
		case mm_black_stripe_02
		se_setprops \{mm_black_stripe_02_alpha = 0.0
			time = 0.5}
		wait \{0.66
			seconds}
		se_setprops \{mm_black_stripe_02_alpha = 1.0
			time = 0.5}
		case mm_black_stripe_03
		se_setprops mm_black_stripe_03_pos = (<org_mm_black_stripe_03_pos> + (602.0, 1199.0)) time = 0.33
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos> + (602.0, 1199.0)) time = 0.33
		se_setprops mm_black_stripe_03_pos = (<org_mm_black_stripe_03_pos> + (98.0, -1238.0)) time = 0.0
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos> + (98.0, -1238.0)) time = 0.0
		se_setprops mm_black_stripe_03_pos = <org_mm_black_stripe_03_pos> time = 0.33
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos>) time = 0.33
	endswitch
	randtime = Random (@ 2 )
	wait <randtime> seconds
	repeat
endscript

main_menu_enable_2p = 0
main_menu_enable_2p_id = two_player_select
device_selected_2player = -1
large_movie_buffer_size = 2490368
ui_mainmenu_showed_legal = 0
ui_in_mainmenu = 1
demo_movies = [
	{
		movie = 'ATTRACT_VID_Tony_Stevie'
		start_frame = 0
		loop_start = 0
		loop_end = 1158
	}
	{
		movie = 'ATTRACT_VID_mikev_v3'
		start_frame = 0
		loop_start = 0
		loop_end = 1653
	}
	{
		movie = 'ATTRACT_VID_hard1'
		start_frame = 0
		loop_start = 0
		loop_end = 1784
	}
	{
		movie = 'ATTRACT_VID_Daewon'
		start_frame = 0
		loop_start = 0
		loop_end = 1778
	}
	{
		movie = 'ATTRACT_VID_Tony_Bob'
		start_frame = 0
		loop_start = 0
		loop_end = 1560
	}
	{
		movie = 'ATTRACT_VOD_Rodney'
		start_frame = 0
		loop_start = 0
		loop_end = 1400
	}
]
current_demo_movie = {
}
ui_mainmenu_return_to_iis = 0
ui_mainmenu_attract_time = 45

script ui_initial_interactive_screen 
	change ui_mainmenu_return_to_iis = 1
	pushsoundbussparams
	setsoundbussparams $no_music_at_all_bussset time = 0.3
	if NOT gotparam SkipMovies
		hideloadingscreen
		load_level_handle_loading_screen intro
		enableusermusic disable
		begin
		if NOT istrue $is_changing_levels
			break
		endif
		wait 1 frame
		repeat
		change is_changing_levels = 1
		iFrames = 0
		begin
		if IsConsoleUIDisplayed
			iFrames = 0
		else
			iFrames = (<iFrames> + 1)
		endif
		if (<iFrames> >= (30 * 4))
			break
		endif
		wait 1 frame
		repeat
		hideloadingscreen
		change is_changing_levels = 0
		change ui_mainmenu_showed_legal = 1
		if screenelementexists id = ui_mainmenu_wait_anchor
			destroyscreenelement id = ui_mainmenu_wait_anchor
		endif
		createscreenelement {
			type = containerelement
			id = ui_mainmenu_wait_anchor
			parent = current_menu_anchor
			pos = (640.0, 360.0)
			event_handlers = [
				{pad_choose ui_initial_interactive_screen_kill}
				{pad_start ui_initial_interactive_screen_kill}
			]
		}
		wait 1.0 seconds ignoreslomo
		playmovie {
			movie = 'atvi'
			textureslot = 0
			no_hold
			no_looping
			buffer_size = $large_movie_buffer_size
		}
		launchevent type = focus target = ui_mainmenu_wait_anchor
		printf "~~~~~~WAITING FOR ATVI MOVIE TO FINISH"
		begin
		if NOT ismovieplaying textureslot = 0
			break
		endif
		wait 1 gameframe
		repeat
		playmovie {
			movie = 'ns_logo'
			textureslot = 0
			no_hold
			no_looping
			buffer_size = $large_movie_buffer_size
		}
		printf "~~~~~~WAITING FOR NEVERSOFT MOVIE TO FINISH"
		begin
		if NOT ismovieplaying textureslot = 0
			break
		endif
		wait 1 gameframe
		repeat
	endif
	popsoundbussparams
	if screenelementexists id = attract_bg
		doscreenelementmorph {
			id = attract_bg
			alpha = 0.0
			time = 1.0
		}
	endif
	if screenelementexists id = ui_kill_movie_anchor
		destroyscreenelement id = ui_kill_movie_anchor
	endif
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	if NOT english
		spawnscriptnow ui_initial_interactive_screen_check_memcard
		return
	endif
	createscreenelement {
		type = containerelement
		id = ui_mainmenu_wait_anchor
		parent = current_menu_anchor
		pos = (640.0, 360.0)
		event_handlers = [
			{pad_choose ui_initial_interactive_screen_check_memcard}
			{pad_start ui_initial_interactive_screen_check_memcard}
		]
	}
	createscreenelement {
		parent = ui_mainmenu_wait_anchor
		type = spriteelement
		just = [center center]
		pos = (0.0, 0.0)
		texture = esrb_bg
		z_priority = 100
	}
	createscreenelement {
		parent = ui_mainmenu_wait_anchor
		type = textblockelement
		text = "ESRB Notice:\\nGame Experience May Change During Online Play\\nPress the START button to continue"
		just = [center center]
		internal_just = [center center]
		pos = (200.0, 200.0)
		font = text_a1
		scale = (0.7, 0.7)
		alpha = 1.0
		z_priority = 100
		font_spacing = 1.0
		dims = (896.0, -200.0)
		allow_expansion
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	getscreenelementdims id = <id>
	createscreenelement {
		parent = ui_mainmenu_wait_anchor
		type = spriteelement
		just = [center center]
		pos = (0.0, 0.0)
		texture = black
		alpha = 0.7
		z_priority = 99
		dims = ((((1.0, 0.0) * (<width> + 32)) + ((0.0, 1.0) * (<height> + 32))))
	}
	launchevent type = focus target = ui_mainmenu_wait_anchor
	wait ($ui_mainmenu_attract_time) seconds
	launchevent type = unfocus target = ui_mainmenu_wait_anchor
	spawnscriptnow attract_timer_wait params = {attract_time = 1}
endscript

script ui_initial_interactive_screen_kill 
	if ismovieplaying \{textureslot = 0}
		killmovie \{textureslot = 0}
	endif
endscript

script ui_initial_interactive_screen_check_memcard 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	change ui_mainmenu_return_to_iis = 0
	playmovie movie = 'mainmenu' textureslot = 0 start_frame = 1 loop_start = 74 loop_end = 384
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	killspawnedscript name = ui_initial_interactive_screen
	if isxenon
		spawnscriptnow ui_mainmenu_wait_for_movie
		return
	endif
	memcard_select_source force = 1
	resettimer
	mcmess_checkingcard
	mc_enumeratefolders
	if (<result> = false)
		text = "No valid save device was found.\\n\\nYou will not be able to save your progress untill one is provided."
	endif
	if NOT gotparam folderlisting
		if NOT mc_spacefornewfolder desc = CombinedProgression
			if isps3
				formattext {
					textname = text
					"Insufficient free space on HDD.\\n\\nYou will not be able to save your progress unless at least %skb of free space is available."
					s = <spacerequired>
				}
			elseif isxenon
				formattext {
					textname = text
					"Your storage device does not have enough free blocks to save.\\n\\nYou will not be able to save your progress unless at least %s free blocks are available."
					s = <spacerequired>
				}
			endif
		endif
	endif
	dialog_box_exit no_pad_start
	if gotparam text
		create_error_box {
			title = "WARNING!"
			text = <text>
			preserve_case
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = ui_mainmenu_wait_for_movie}
			]
		}
		return
	endif
	spawnscriptnow ui_mainmenu_wait_for_movie
endscript

script ui_mainmenu_skip_movie 
	if ismovieplaying \{textureslot = 0}
		killmovie \{textureslot = 0}
	endif
endscript

script ui_mainmenu_wait_for_movie 
	killspawnedscript name = ui_initial_interactive_screen_check_memcard
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	if ismovieplaying textureslot = 0
		killmovie textureslot = 0
	endif
	printpushpopdebuginfo push name = "ui_mainmenu_wait_for_movie"
	pushsoundbussparams
	setsoundbussparams $no_music_at_all_bussset time = 0.3
	soundevent event = Goal_UI_Positive_Text
	printf "~~~~~~WAITING FOR CACHE TO FINISH"
	printf "~~~~~~MOVIE FINISHED"
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	printpushpopdebuginfo pop name = "ui_skip_movie_to_mainmenu"
	popsoundbussparams
	ui_create_mainmenu
	PlaylistPlay
endscript

script ui_mainmenu_wait_for_caching_finished 
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	createscreenelement {
		type = containerelement
		id = ui_mainmenu_wait_anchor
		parent = current_menu_anchor
		pos = (560.0, 410.0)
		event_handlers = [
			{pad_choose killmovie params = {textureslot = 0}}
			{pad_start killmovie params = {textureslot = 0}}
		]
	}
	createscreenelement {
		parent = ui_mainmenu_wait_anchor
		type = "Press the START button to skip"
		just = [center center]
		pos = (-240.0, 0.0)
		font = text_a1
		scale = 0.45000002
		z_priority = 100
		alpha = 0.7
		font_spacing = 2
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	launchevent type = focus target = ui_mainmenu_wait_anchor
endscript
ui_mainmenu_first_load = 1

script ui_create_mainmenu 
	printf "UI: ui_create_mainmenu"
	change milestone_screens_active = 0
	if ($pausemenu_buss_set_active = 0)
		printpushpopdebuginfo push name = "ui_create_pausemenu"
		pushsoundbussparams
		change pausemenu_buss_set_active = 1
	endif
	net_reset_server_cheats
	kill_start_key_binding
	mainmenu_random_skater_pick
	setsoundbussparams $default_bussset time = 0.5
	fadetoblack off time = 0 no_wait
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = current_menu_anchor
	}
	SetShouldIgnoreUnboundControllers false
	change ui_in_mainmenu = 1
	if screenelementexists id = attach_container
		spawnscriptnow ui_attract_wait_for_movie params = {no_return isdone}
	endif
	menu_stack_clear
	menu_reset_skater_speed_to_default
	if screenelementexists id = attract_bg
		doscreenelementmorph {
			id = attract_bg
			alpha = 0.0
			time = 1.0
		}
	endif
	if screenelementexists id = main_menu_bg
		destroyscreenelement id = main_menu_bg
	endif
	if screenelementexists id = choose_trick_menu_container
		destroyscreenelement id = choose_trick_menu_container
	endif
	if screenelementexists id = online_save_bg
		destroyscreenelement id = online_save_bg
	endif
	createscreenelement {
		id = main_menu_bg
		parent = root_window
		type = containerelement
	}
	createscreenelement {
		parent = main_menu_bg
		type = spriteelement
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = -3000
		texture = white
		dims = (10000.0, 10000.0)
		rgba = [0 0 0 255]
	}
	if cd
		if ($ui_initial_boot = 1)
			change ui_initial_boot = 0
			spawnscriptnow ui_initial_interactive_screen
			return
		endif
	endif
	if (istrue $enable_playlist)
		PlaylistPlay
	endif
	change sysnotify_allow_invite = 1
	tilesprite {
		texture = map_bg_news
		parent = main_menu_bg
		tile_dims = (1480.0, 1520.0)
		dims = (250.0, 250.0)
		pos = (0.0, -400.0)
		sprite_props = {rgba = [150 70 70 255]}
		container_props = {z_priority = -2999}
	}
	enableusermusic
	SpawnSecondControllerCheck
	printf "$pause_fmv_playing = %p" p = ($pause_fmv_playing) channel = ui
	if ($pause_fmv_playing = 0)
		killspawnedscript name = pause_menu_fmv_play_spawned
		pause_menu_fmv_play
	endif
	change ui_x360_sign_in_checked = 0
	if screenelementexists id = mainmenu_anchor
		destroyscreenelement id = mainmenu_anchor
	endif
	make_next_menu {
		menu_id = mainmenu_anchor
		hmenu_id = mainmenu_vmenu
		pos = (650.0, -180.0)
		spacing = 25
		pad_back_script = nullscript
		pad_back_sound = nullscript
	}
	doscreenelementmorph id = mainmenu_anchor rot_angle = 20 scale = (1.6, 1.4)
	add_next_menu_item {
		text = "story mode"
		pad_choose_script = ui_exit_mainmenu
		pad_choose_params = {
			choose_state = UIstate_yourlife
			career
		}
		attract = attract_timer_reset
	}
	add_next_menu_item {
		id = two_player_select
		text = "2 player"
		pad_choose_script = ui_check_2player_valid
		attract = attract_timer_reset
	}
	add_next_menu_item {
		text = "options"
		pad_choose_script = ui_exit_mainmenu
		pad_choose_params = {
			choose_state = UIstate_mainoptions
		}
		attract = attract_timer_reset
	}
	if isxenon
		add_next_menu_item {
			text = "Xbox LIVE"
			pad_choose_script = ui_exit_mainmenu
			pad_choose_params = {
				pad_choose_script = ui_onlinemain_destroy_and_signin
				xbox_live
			}
			attract = attract_timer_reset
		}
	else
		add_next_menu_item {
			text = "online"
			pad_choose_script = ui_exit_mainmenu
			pad_choose_params = {
				pad_choose_script = ui_onlinemain_destroy_and_signin
				xbox_live
			}
			attract = attract_timer_reset
		}
	endif
	if ($ui_mainmenu_first_load = 1)
		change ui_mainmenu_first_load = 0
	endif
	next_menu_finish helper_text = $generic_helper_text_no_back
	pause_menu_fmv_play
endscript

script ui_create_background 
	if screenelementexists \{id = mainmenu_background}
		return
	endif
	createscreenelement \{id = mainmenu_background
		parent = root_window
		z_priority = -1002
		type = spriteelement
		texture = black
		dims = (10000.0, 10000.0)
		just = [
			center
			center
		]
		pos = (320.0, 240.0)
		rgba = [
			128
			0
			0
			255
		]}
endscript

script ui_destroy_background 
	if screenelementexists \{id = mainmenu_background}
		destroyscreenelement \{id = mainmenu_background}
	endif
endscript

script ui_check_2player_valid 
	if ($main_menu_enable_2p = 1)
		change device_selected_2player = <device_num>
		change pause_fmv_playing = 0
		ui_exit_mainmenu choose_state = UIstate_2player <...>
	else
		killspawnedscript name = attract_timer_wait
		generic_ui_destroy
		if isxenon
			<text> = "Please connect a second Xbox 360 Controller to play a 2 player match."
		else
			get_connect_second_sixaxis_controller_text
		endif
		create_dialog_box {
			title = "WARNING!"
			text = <text>
			buttons = [
				{text = "RETURN TO MAIN MENU" pad_choose_script = ui_check_2player_valid_back_to_menu}
			]
			vmenu_width = 700
			text_dims = (700.0, 0.0)
			preserve_case
			additional_highlight_scale = (0.3, 0.0)
		}
	endif
endscript

script ui_check_2player_valid_back_to_menu 
	killallmovies \{blocking}
	ui_create_mainmenu
endscript
ps3_first_input = 0

script ui_kill_dialog_and_create_mainmenu 
	dialog_box_exit
	ui_create_mainmenu
endscript

script ui_exit_mainmenu 
	killspawnedscript name = attract_timer_wait
	generic_ui_destroy
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if isxenon
		xenon_handle_first_input device_num = <device_num> <...>
	endif
	if isxenon
		if gotparam xbox_live
			if checkforsignin local
				if NOT checkforsignin
					create_dialog_box {title = "Xbox LIVE"
						text = "The current Gamer Profile is not enabled for Xbox LIVE multiplayer game play or the network connection has been lost."
						buttons = [
							{text = "CONTINUE" pad_choose_script = ui_kill_dialog_and_create_mainmenu}
						]
						no_animate
						preserve_case
					}
					return
				endif
			endif
		endif
	endif
	if isps3
		if ($ps3_first_input = 0)
			change ps3_first_input = 1
			ps3_handle_first_input <...>
		endif
	endif
	if gotparam choose_state
		ui_change_state state = <choose_state>
	else
		<pad_choose_script>
	endif
	change ui_in_mainmenu = 0
endscript

script ui_destroy_mainmenu 
	printf \{"UI: ui_destroy_mainmenu"}
	StopSecondControllerCheck
	generic_ui_destroy
endscript

script attract_timer_wait attract_time = ($ui_mainmenu_attract_time)
	if NOT cd
	endif
	begin
	wait 1 second
	repeat <attract_time>
	if screenelementexists id = mainmenu_anchor
		launchevent type = unfocus target = mainmenu_anchor
	endif
	printf 'ATTRACT TIME IS UP!' channel = ui
	ui_create_background
	if NOT screenelementexists id = attract_bg
		createscreenelement {
			type = spriteelement
			id = attract_bg
			parent = root_window
			dims = (10000.0, 10000.0)
			texture = black
			alpha = 0.0
			z_priority = 100000
		}
	endif
	doscreenelementmorph {
		id = attract_bg
		alpha = 1.0
		time = 1.0
	}
	wait 1.0 seconds
	generic_ui_destroy
	if NOT screenelementexists id = current_menu_anchor
		createscreenelement {
			type = containerelement
			parent = root_window
			id = current_menu_anchor
		}
	endif
	pause_menu_fmv_kill
	killallmovies
	getarraysize $demo_movies
	mod b = <array_size> a = (RandomRange (1.0, 32767.0))
	casttointeger mod
	change current_demo_movie = ($demo_movies [<mod>])
	pushsoundbussparams
	if NOT structurecontains structure = $current_demo_movie name = no_music
		setsoundbussparams $Mugging_Scenes_Music_Up_BussSet time = 0.3
		enableusermusic
	else
		setsoundbussparams $no_music_at_all_bussset time = 0.3
		enableusermusic disable
	endif
	wait 2 frames
	playmovie $current_demo_movie textureslot = 0 no_looping no_hold
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = attach_container
		z_priority = 90000
	}
	createscreenelement {
		type = containerelement
		parent = attach_container
		pos = (250.0, 275.0)
		rot_angle = -60
	}
	setsearchallassetcontexts
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = movie_title
	}
	setsearchallassetcontexts off
	start_string = "press the START button to continue\\n"
	if isps3
		start_string = "press the START button to continue"
	endif
	createscreenelement {
		type = textblockelement
		parent = attach_container
		pos = (640.0, 600.0)
		font = text_a1
		text = <start_string>
		dims = (1280.0, 0.0)
		allow_expansion
		just = [center top]
		internal_just = [center top]
		scale = 0.8
		rgba = [128 128 128 255]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	wait 1 second
	doscreenelementmorph {
		id = attract_bg
		alpha = 0.0
		time = 1.0
	}
	spawnscriptnow ui_attract_wait_for_movie
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	createscreenelement {
		type = containerelement
		id = ui_mainmenu_wait_anchor
		parent = current_menu_anchor
		event_handlers = [
			{pad_choose ui_finish_attract}
			{pad_start ui_finish_attract}
		]
	}
	ui_create_background
	launchevent type = focus target = ui_mainmenu_wait_anchor
endscript

script ui_finish_attract 
	killspawnedscript \{name = ui_attract_wait_for_movie}
	ui_attract_wait_for_movie \{isdone}
endscript

script ui_attract_wait_for_movie 
	if NOT gotparam isdone
		begin
		if NOT ismovieplaying textureslot = 0
			break
		else
			getmovieframe textureslot = 0
			if (<frame> > (($current_demo_movie.loop_end) - 30))
				break
			endif
		endif
		wait 1 frame
		repeat
	endif
	if screenelementexists id = attract_bg
		doscreenelementmorph {
			id = attract_bg
			alpha = 1.0
			time = 1.0
		}
		wait 1.0 seconds
	endif
	killallmovies
	if screenelementexists id = attach_container
		destroyscreenelement id = attach_container
	endif
	enableusermusic
	printf 'ATTRACT DONE!' channel = ui
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	popsoundbussparams
	wait 1 frame
	if NOT gotparam no_return
		if ($ui_mainmenu_return_to_iis = 1)
			ui_initial_interactive_screen SkipMovies
		else
			ui_create_mainmenu
		endif
	endif
endscript

script attract_timer_reset 
	killspawnedscript \{name = attract_timer_wait}
	spawnscriptnow \{attract_timer_wait}
endscript

script enable_two_player_option 
	change \{main_menu_enable_2p = 1}
endscript

script disable_two_player_option 
	change \{main_menu_enable_2p = 0}
endscript
had_pad_event = 0

script reset_had_pad_event 
	change \{had_pad_event = 0}
endscript

script handling_pad_event 
	change \{had_pad_event = 1}
endscript

script mainmenu_display_loading_screen 
	change \{is_changing_levels = 1}
	if gotparam \{killbink}
		pause_menu_fmv_kill
		wait \{1
			second}
	endif
	load_level_handle_movie_loading_screen
endscript
mainmenu_random_skater_pick_done = 0

script mainmenu_random_skater_pick 
	if getglobalflag \{flag = $career_started}
		change \{mainmenu_random_skater_pick_done = 0}
	else
		if ($mainmenu_random_skater_pick_done = 0)
			change \{mainmenu_random_skater_pick_done = 1}
			change \{cas_skater_invalid = 1}
			choose_random_skater
		endif
	endif
endscript


script launch_level_select_menu 
	hide_current_goal
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if screenelementexists id = main_menu_bg_anchor
		destroyscreenelement id = main_menu_bg_anchor
	endif
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			hide
		}
	endif
	the_heap = scratch
	if innetgame
		if NOT infrontend
			the_heap = bottomupheap
		endif
	endif
	if NOT innetgame
		if NOT infrontend
			do_unload_unloadable
		endif
		loadpak 'pak/levelselect/levelselect.pak' heap = <the_heap>
	else
		loadpak 'pak/levelselect/levelselect.pak' heap = <the_heap>
	endif
	pause_menu_gradient off
	SetMenuPadMappings [active
		use_as_first
	]
	create_level_select_menu <...>
endscript

script level_select_unload 
	printf \{"**** UNLOADING LEVEL SELECT PAK ****"}
	unloadpak \{'pak/levelselect/levelselect.pak'}
	waitunloadpak \{'pak/levelselect/levelselect.pak'}
	if NOT infrontend
		if NOT innetgame
			do_load_unloadable
		endif
	endif
endscript

script level_select_get_info_panel_script 
	if insplitscreengame
		if NOT gamemodeequals is_coop
			info_panel_script = level_select_build_highscore_info_panel
		else
			info_panel_script = level_select_build_classic_info_panel
		endif
	else
		GetGameMode
		switch <gamemode>
			case classic
			info_panel_script = level_select_build_classic_info_panel
			case career
			info_panel_script = level_select_build_info_panel
			case freeskate
			case singlesession
			info_panel_script = level_select_build_highscore_info_panel
			case net
			info_panel_script = level_select_build_online_info_panel
			default
			info_panel_script = level_select_build_online_info_panel
		endswitch
	endif
	return <...>
endscript

script network_level_select_pad_back 
	<net_pad_back> = 1
	level_select_menu_exit <...>
endscript

script kill_level_select_scripts 
	level_select_get_info_panel_script
	killspawnedscript \{name = level_select_build_info_panel_common_bits}
	killspawnedscript name = <info_panel_script>
	killspawnedscript \{name = level_select_spin_globe}
	killspawnedscript \{name = show_active_globe_dot}
	killspawnedscript \{name = globe_dot_highlight_pulse}
endscript

script level_select_menu_exit 
	kill_level_select_scripts
	kill_level_select_cams
	if objectexists id = level_menu
		destroyscreenelement id = level_menu
		level_select_unload
	endif
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			unhide
		}
	endif
	if gotparam no_new_menu
		return
	endif
	if infrontend
		GetGameMode
		if insplitscreengame
			<state> = UIstate_2player_select_2p
		else
			switch <gamemode>
				case career
				<state> = UIstate_yourlife
				case freeskate
				case singlesession
				<state> = UIstate_freeskate_ready
				default
				<state> = uistate_mainmenu
			endswitch
		endif
		ui_change_state state = <state>
	else
		if gotparam end_run
			ui_change_state state = UIstate_2player_create_game
		else
			printf "Attempting to fire pause event!"
			if innetgame
				<state> = uistate_pausemenu
			else
				<state> = UIstate_pauseoptions
			endif
			ui_change_state state = <state>
		endif
	endif
endscript

script kill_level_select_cams 
	if infrontend
		killskatercamanim \{name = level_select_cam}
	endif
endscript

script really_change_level 
	DisablePakManStreaming
	change \{is_changing_levels = 1}
	if NOT gotparam \{no_state_change}
		ui_change_state
	else
		generic_ui_destroy
	endif
	pause_menu_fmv_kill
	killskatercamanim \{name = pause_menu_camera}
	wait \{10
		frames}
	if OnServer
		change_level <...>
	else
		if ishost
			FCFSRequestChangeLevel <...>
		endif
	endif
endscript
return_to_level = [
	null
]

script level_select_change_level 
	printf "level_select_change_level"
	if NOT gotparam not_from_levelselect_menu
		level_select_menu_exit no_new_menu
	endif
	if gotparam autosave
		do_autosave immediate suspend_ui
	endif
	change bedroom_select_skater = came_from_career_game
	if NOT infrontend
		if (<level> = whole_world)
			unload_net_area_pak
			ChangeLevel level = <level>
			do_actual_unpause
			ui_change_state state = uistate_gameplay
			return
		endif
	endif
	if NOT gotparam load_screen_already_up
		load_level_handle_movie_loading_screen level = <level>
	endif
	goalmanager_showpoints
	if screenelementexists id = level_menu
		destroyscreenelement id = level_menu
		spawnscriptnow level_select_unload
	endif
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if infrontend
		SetColorBufferClear clear = 0
		stopkeyboardhandler
	endif
	kill_level_select_cams
	if innetgame
		show_warning = 1
		level_select_menu_exit no_new_menu
		unpause_game_and_destroy_pause_menu dont_unpause_music
	endif
	if innetgame
		if gotparam area_pak
			change newarea = <area_pak>
		endif
		if gotparam spawn_in
			change multiplayer_spawn_in = <spawn_in>
			printstruct $multiplayer_spawn_in
		endif
	endif
	if NOT infrontend
		if cd
			if NOT levelis <level>
				really_change_level <...>
			else
				if gotparam quit_to_single
					really_change_level <...>
				else
					if inmultiplayergame
						really_change_level <...>
					elseif gotparam chose_same_level_script
						<chose_same_level_script>
					else
						if root_window :getsingletag no_exit_pause_menu
							level_select_menu_exit
							return
						endif
						if gotparam end_run
							level_select_menu_exit end_run
							return
						endif
						if insplitscreengame
							level_select_menu_exit end_run no_new_menu
							return
						endif
					endif
				endif
			endif
		else
			really_change_level <...>
		endif
	else
		really_change_level <...>
	endif
	barriers_game = 0
	if NOT innetgame
		if NOT gamemodeequals is_career
			barriers_game = 1
		endif
		level_select_menu_exit no_new_menu
		unpause_game_and_destroy_pause_menu dont_unpause_music
	else
		printf "**************** level_select_change_level"
		printstruct <...>
		barriers_game = 1
	endif
	if (<barriers_game> = 1)
		if gotparam area_pak
			change newarea = <area_pak>
		endif
		if gotparam spawn_in
			change multiplayer_spawn_in = <spawn_in>
			printstruct $multiplayer_spawn_in
		endif
	else
		change multiplayer_spawn_in = []
	endif
endscript

script level_select_invalid_choice 
	printf \{"locked!"}
endscript

script level_select_valid_choice 
	if screenelementexists \{id = main_menu_bg}
		doscreenelementmorph \{id = main_menu_bg
			alpha = 1}
	endif
	spawnscriptnow \{ui_destroy_2player_bg}
	theme_menu_pad_choose_sound
	kill_level_select_scripts
	if gotparam \{level_callback_script}
		<level_callback_script> <...>
	endif
endscript

script SetStartingLevelFlags 
	setglobalflag \{flag = $GLOBALFLAG_PLACEHOLDER}
endscript
level_select_menu_level_info = [
	{
		text = "VIEWER"
		level = viewer
		DEVKIT_ONLY
		career_only
	}
	{
		text = "SKATE LOUNGE"
		level = load_z_crib
	}
	{
		text = "CREATE-A-SKATER"
		level = load_z_bedroom
	}
	{
		text = "PHILLY SLUMS"
		level = Load_Z_Slums
	}
	{
		text = "PHILLY LIBERTY BELL"
		level = Load_Z_Bell
	}
	{
		text = "PHILLY LOVE PARK"
		level = Load_Z_Love
	}
	{
		text = "PHILLY FDR"
		level = Load_Z_FDR
	}
	{
		text = "BALTIMORE CITY"
		level = Load_Z_BCity
	}
	{
		text = "BALTIMORE LANSDOWNE"
		level = Load_Z_Lansdowne
	}
	{
		text = "BALTIMORE HARBOR"
		level = load_z_harbor
	}
	{
		text = "DC MONUMENTS"
		level = Load_Z_Monuments
	}
	{
		text = "DC MALL"
		level = Load_Z_Museums
	}
	{
		text = "DC AIR/SPACE MUSEUM"
		level = Load_Z_Museum_Int
	}
	{
		text = "PHIL/BALT BRIDGE"
		level = Load_Z_PB_Bridge
	}
	{
		text = "BALT/DC BRIDGE"
		level = Load_Z_BW_Bridge
	}
	{
		text = "DC/PHIL BRIDGE"
		level = Load_Z_WP_Bridge
	}
	{
		text = "TESTLEVEL A1"
		level = Load_Z_TestLevel_A1
		DEVKIT_ONLY
		career_only
	}
	{
		text = "TESTLEVEL CLIMBING"
		level = Load_Z_TestLevel_Climbing
		DEVKIT_ONLY
		career_only
	}
	{
		text = "TESTLEVEL"
		level = Load_Z_TestLevel
		DEVKIT_ONLY
		career_only
	}
	{
		text = "TESTLEVEL PEDS"
		level = load_z_testlevel_peds
		DEVKIT_ONLY
		career_only
	}
	{
		text = "AMBIENT SCENES"
		level = Load_Z_AmbientScenes
		DEVKIT_ONLY
		career_only
	}
]
level_select_menu_classic_level_info = [
]
multiplayer_level_whole_world = {
	text = "world"
	area_pak = ''
	area_pak_zone = ''
	checksum = wholeworld
	spawn_in = [
		z_love
	]
	multiplayer_level
	ui_struct = $level_select_ui_whole_world
}
multiplayer_level_dc = {
	text = "dc"
	area_pak = 'z_online_dc'
	area_pak_zone = 'load_Z_museums'
	checksum = onlinedc
	spawn_in = [
		z_museums
	]
	multiplayer_level
	ui_struct = $level_select_ui_dc
}
multiplayer_level_baltimore = {
	text = "baltimore"
	area_pak = 'z_online_baltimore'
	area_pak_zone = 'load_Z_bcity'
	checksum = onlinebaltimore
	spawn_in = [
		z_bcity
	]
	multiplayer_level
	ui_struct = $level_select_ui_baltimore
}
multiplayer_level_philly = {
	text = "philly"
	area_pak = 'z_online_philly'
	area_pak_zone = 'load_Z_Slums'
	checksum = onlinephilly
	spawn_in = [
		z_love
	]
	multiplayer_level
	ui_struct = $level_select_ui_philly
}
multiplayer_level_philly_2p = {
	text = "philly"
	area_pak = 'z_online_philly'
	area_pak_zone = 'load_Z_Slums'
	checksum = onlinephilly
	spawn_in = [
		z_love
	]
	multiplayer_level
	ui_struct = $level_select_ui_philly
}
multiplayer_level_crib = {
	text = "SKATE LOUNGE"
	area_pak = 'Z_Crib'
	area_pak_zone = 'Z_Crib'
	checksum = netcrib
	spawn_in = [
		z_crib
	]
	multiplayer_level
	ui_struct = $level_select_ui_crib
}
online_level_select_menu_level_info = [
	{
		$multiplayer_level_whole_world
		level = Load_Z_Slums
	}
	{
		$multiplayer_level_dc
		level = Load_Z_Museums
	}
	{
		$multiplayer_level_baltimore
		level = Load_Z_BCity
	}
	{
		$multiplayer_level_philly
		level = Load_Z_Slums
	}
	{
		$multiplayer_level_crib
		level = load_z_crib
	}
]
net_crib_index = 4
twoplayer_level_select_menu_level_info = [
	{
		$multiplayer_level_dc
		level = Load_Z_Museums
	}
	{
		$multiplayer_level_baltimore
		level = Load_Z_BCity
	}
	{
		$multiplayer_level_philly_2p
		level = Load_Z_Love
	}
	{
		$multiplayer_level_crib
		level = load_z_crib
	}
]
level_select_ui_whole_world = {
	description = "Use the entire town as one enormous skate park to form huge lines and score gigantic combos to top your opponents."
	images = [
		adventure
		Capitol
		Factory
		schoolout
	]
	map_pos = (0.77247995, 0.200657)
}
level_select_ui_dc = {
	description = "Washington DC: keep your valuables close."
	images = [
		adventure
		Capitol
		Factory
		schoolout
	]
	map_pos = (0.39371502, 0.73191196)
}
level_select_ui_baltimore = {
	description = "Baltimore: where the hell is baltimore?"
	images = [
		adventure
		Capitol
		Factory
		schoolout
	]
	map_pos = (0.28403202, 0.247902)
}
level_select_ui_philly = {
	description = "Philly: contributing to chronic heart disease with every cheesesteak sold."
	images = [
		adventure
		Capitol
		Factory
		schoolout
	]
	map_pos = (0.77247995, 0.200657)
}
level_select_ui_crib = {
	description = "Challenge other skaters to games in your own personalized skate pad."
	images = [
		adventure
		Capitol
		Factory
		schoolout
	]
	map_pos = (0.808579, 0.129954)
}
level_select_last_level_played = Load_MainMenu
level_select_focus_target1 = 0
globe_target_x = 89.0
globe_target_y = 0.0
globe_target_dot_num = 0
globe_new_target_x = 0.0
globe_state = still
globe_piece_size = 64
globe_interpolation = 0.0
globe_vel = 0
globe_pos = 0.0
globe_idle_frames = 0
level_select_last_gamemode_processed = 0
level_select_last_demoflag_processed = 0
level_select_last_dot_count = 0
level_select_item_current_index = 0

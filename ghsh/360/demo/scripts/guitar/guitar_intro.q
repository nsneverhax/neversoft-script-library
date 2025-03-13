intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = 0
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = 0
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -1800
	button_ripple_per_button_time = 100
	hud_start_time = -1400
	hud_move_time = 200
}
immediate_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = 0
	song_title_fade_time = 700
	song_title_on_time = 0
	highway_start_time = 0
	highway_move_time = 0
	button_ripple_start_time = 0
	button_ripple_per_button_time = 0
	hud_start_time = 0
	hud_move_time = 0
}
current_intro = $fast_intro_sequence_props

script play_intro 
	calculate_clapping_lag
	killspawnedscript \{name = loading_screen_crowd_swell}
	killspawnedscript \{name = crowd_loading_whistle}
	printstruct <...>
	start_drummer_cameras
	gamemode_getnumplayersshown
	if ($show_boss_helper_screen = 1)
		player = 1
		begin
		formattext checksumname = player_status 'player%i_status' i = <player>
		enableinput off controller = ($<player_status>.controller)
		player = (<player> + 1)
		repeat <num_players_shown>
		intro_check_for_celeb_intro_ui
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	if screenelementexists \{id = metallifacts_container}
		disable_bg_viewport
		return
	endif
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	if gotparam \{fast}
		change \{current_intro = $fastintro_sequence_props}
	elseif gotparam \{practice}
		change \{current_intro = $practice_sequence_props}
	else
		change \{current_intro = $intro_sequence_props}
	endif
	if ($g_in_tutorial = 0)
		spawnscriptnow \{intro_song_info
			id = intro_scripts}
	endif
	intro_check_for_celeb_intro_ui
	if NOT ($cheat_performancemode = 1 && $is_network_game = 0)
		spawnscriptnow \{intro_highway_move
			id = intro_scripts}
	endif
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext textname = player_text 'p%i' i = <player>
	spawnscriptnow intro_buttonup_ripple params = <...> id = intro_scripts
	player = (<player> + 1)
	repeat <num_players_shown>
	if (($tutorial_disable_hud = 0) && ($end_credits = 0))
		spawnscriptnow \{intro_hud_move
			id = intro_scripts}
	endif
	bandmanager_setplayingintroanims
endscript

script destroy_intro 
	killspawnedscript \{id = intro_scripts}
	killspawnedscript \{name = song_intro_kick_sfx_waiting}
	killspawnedscript \{name = song_intro_highway_up_sfx_waiting}
	killspawnedscript \{name = move_highway_2d}
	killspawnedscript \{name = intro_buttonup_ripple}
	killspawnedscript \{name = intro_hud_move}
	destroyscreenelement \{id = intro_container}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	enableinput controller = ($<player_status>.controller)
	player = (<player> + 1)
	repeat $current_num_players
endscript

script intro_buttonup_ripple 
	enableinput off controller = ($<player_status>.controller)
	begin
	getsongtimems
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		enableinput controller = ($<player_status>.controller)
		return
	endif
	getarraysize \{$gem_colors}
	all_vocals = 1
	player = 1
	begin
	formattext checksumname = current_player_status 'player%i_status' i = <player> addtostringlookup
	if NOT ($<current_player_status>.part = vocals)
		all_vocals = 0
		break
	endif
	player = (<player> + 1)
	repeat $current_num_players
	if (<all_vocals> = 0)
		soundevent \{event = notes_ripple_up_sfx}
	endif
	extendcrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	buttonup_count = 0
	begin
	wait ($current_intro.button_ripple_per_button_time / 1000.0) seconds
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		setarrayelement arrayname = <pixel_array> globalarray index = <array_count> newvalue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_size> + 1)
	enableinput controller = ($<player_status>.controller)
endscript

script intro_song_info 
	begin
	getsongtimems
	if ($current_intro.song_title_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			return
		endif
	endif
	get_song_title song = ($current_song)
	get_song_artist_text song = ($current_song)
	get_song_artist song = ($current_song)
	if ($current_song = jamsession)
		year = 2008
		if ui_event_exists_in_stack \{name = 'setlist'}
			jam_directory_index = ($temp_jamsession_song_list [($quickplay_song_list_current)])
			getarraysize ($jam_curr_directory_listing) param = directory_size
			if (<jam_directory_index> > 0 && <jam_directory_index> < <directory_size>)
				<year> = ($jam_curr_directory_listing [<jam_directory_index>].year)
			endif
		elseif ui_event_exists_in_stack \{name = 'jam'}
			jam_struct = ($jamsession_songlist_props.jamsession)
			year = (<jam_struct>.year_num)
		endif
		if NOT gotparam \{song_artist}
			get_savegame_from_controller controller = ($primary_controller)
			get_current_band_info
			getglobaltags savegame = <savegame> <band_info>
			song_artist = qs(0x98b69c18)
			if gotparam \{name}
				if (<name> != qs(0x03ac90f0))
					song_artist = <name>
				endif
			endif
			formattext textname = year_text qs(0x06d54ab3) d = <year>
			song_artist = (<song_artist> + <year_text>)
		endif
	endif
	createscreenelement {
		parent = root_window
		id = intro_container
		type = descinterface
		desc = 'song_intro'
		alpha = 0
		z_priority = 500
		intro_artist_text = <song_artist>
		intro_title_text = <song_title>
		intro_performed_text = <song_artist_text>
	}
	intro_container :se_setprops alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :se_waitprops
	wait ($current_intro.song_title_on_time / 1000.0) seconds
	intro_container :se_setprops alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :se_waitprops
	destroyscreenelement \{id = intro_container}
endscript

script intro_highway_move 
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
	begin
	getsongtimems
	if ($current_intro.highway_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	all_vocals = 1
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	if NOT ($<player_status>.part = vocals)
		all_vocals = 0
		break
	endif
	player = (<player> + 1)
	repeat $current_num_players
	if (<all_vocals> = 0)
		spawnscriptnow \{song_intro_highway_up_sfx_waiting}
	else
		spawnscriptnow \{song_intro_highway_up_vocals_sfx_waiting}
	endif
	gamemode_getnumplayersshown
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	spawnscriptnow vocals_highway_slide_in params = {delay = 150 player = <player>}
	move_highway_camera_to_default <...> time = ($current_intro.highway_move_time / 1000.0)
	player = (<player> + 1)
	repeat <num_players_shown>
endscript

script intro_hud_move 
	begin
	getsongtimems
	if ($current_intro.hud_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	gamemode_getnumplayersshown
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	move_hud_to_default time = ($current_intro.hud_move_time / 1000.0)
	player = (<player> + 1)
	repeat <num_players_shown>
	if ($game_mode = p2_battle && $battle_do_or_die = 1)
		restore_saved_powerups
	endif
	all_vocals = 1
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	if NOT ($<player_status>.part = vocals)
		all_vocals = 0
		break
	endif
	player = (<player> + 1)
	repeat $current_num_players
	spawnscriptnow \{song_intro_kick_sfx_waiting}
endscript

script intro_check_for_celeb_intro_ui 
	transition_getprefix type = ($current_playing_transition)
	if (<celeb_intro> = 1)
		spawnscriptnow intro_celeb_ui params = {celeb_intro = <type_textnl>}
	endif
endscript

script intro_celeb_ui 
	switch ($current_playing_transition)
		case intro_lemmy
		<start_delay> = 2.0
		<duration> = 4.0
		case intro_kingdiamond
		<start_delay> = 2.0
		<duration> = 4.0
		default
		scriptassert qs(0x58b8b629) s = ($current_playing_transition)
	endswitch
	formattext textname = desc 'celeb_%c' c = <celeb_intro>
	wait <start_delay> seconds
	createscreenelement \{type = containerelement
		id = celeb_intro_ui_cont
		parent = root_window
		pos = (0.0, 0.0)
		z_priority = 100}
	setsearchallassetcontexts
	createscreenelement {
		parent = celeb_intro_ui_cont
		id = celeb_intro_ui
		type = descinterface
		desc = <desc>
	}
	setsearchallassetcontexts \{off}
	celeb_intro_ui :desc_resolvealias \{name = alias_celeb_intro_banner}
	assignalias id = <resolved_id> alias = celeb_intro_banner
	celeb_intro_banner :se_setprops \{alpha = 0.0}
	celeb_intro_banner :se_getprops \{pos}
	<banner_pos> = <pos>
	celeb_intro_ui :desc_resolvealias \{name = alias_celeb_intro_alltherest}
	assignalias id = <resolved_id> alias = celeb_intro_alltherest
	celeb_intro_alltherest :se_setprops \{alpha = 0.0}
	celeb_intro_alltherest :se_getprops \{pos}
	<alltherest_pos> = <pos>
	<time_between_bounces> = 0.1
	celeb_intro_banner :obj_spawnscriptnow intro_celeb_ui_bounce params = {id = celeb_intro_banner starting_pos = <banner_pos>}
	wait <time_between_bounces> seconds
	celeb_intro_alltherest :obj_spawnscriptnow intro_celeb_ui_bounce params = {id = celeb_intro_alltherest starting_pos = <alltherest_pos>}
	wait (<duration> - <time_between_bounces>) seconds
	soundevent \{event = boss_logo_second_part}
	<zoom_out_time> = 0.04
	celeb_intro_alltherest :se_setprops scale = 3.0 alpha = 0.0 pos = (<alltherest_pos> + (0.0, 300.0)) time = <zoom_out_time>
	wait \{0.1
		seconds}
	celeb_intro_banner :se_setprops scale = 3.0 alpha = 0.0 pos = (<banner_pos> + (0.0, 300.0)) time = <zoom_out_time>
	celeb_intro_banner :se_waitprops
	destroyscreenelement \{id = celeb_intro_ui_cont}
endscript

script intro_celeb_ui_bounce 
	<zoom_in_time> = 0.05
	<first_bounce_time> = 0.02
	<settle_in_time> = 0.01
	<id> :se_setprops scale = 3.0 pos = (<starting_pos> + (0.0, 200.0))
	<id> :se_setprops scale = 0.8 alpha = 1.0 pos = (<starting_pos>) motion = ease_in time = <zoom_in_time>
	<id> :se_waitprops
	<id> :se_setprops scale = 0.9 pos = (<starting_pos> + (0.0, 5.0)) moion = ease_out time = <first_bounce_time>
	<id> :se_waitprops
	<id> :se_setprops scale = 0.8 pos = (<starting_pos>) motion = ease_in time = <settle_in_time>
endscript

script kill_intro_celeb_ui 
	if scriptisrunning \{wait_and_show_boss_helper_after_intro}
		killspawnedscript \{name = wait_and_show_boss_helper_after_intro}
	endif
	if scriptisrunning \{intro_celeb_ui}
		if screenelementexists \{id = celeb_intro_ui_cont}
			destroyscreenelement \{id = celeb_intro_ui_cont}
		endif
		killspawnedscript \{name = intro_celeb_ui}
	endif
endscript

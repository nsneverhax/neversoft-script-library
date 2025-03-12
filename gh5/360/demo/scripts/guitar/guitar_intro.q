intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -4000
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
	killspawnedscript \{name = loading_screen_crowd_swell}
	killspawnedscript \{name = crowd_loading_whistle}
	printstruct <...>
	start_drummer_cameras
	getnumplayersingame \{on_screen}
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	if gotparam \{fast}
		change \{current_intro = $fastintro_sequence_props}
	elseif gotparam \{practice}
		change \{current_intro = $practice_sequence_props}
	else
		change \{current_intro = $intro_sequence_props}
	endif
	show_song_info = 1
	if ($g_in_tutorial = 1)
		show_song_info = 0
	endif
	gamemode_gettype
	if ($calibrate_lag_enabled = 1)
		show_song_info = 0
	endif
	if (<show_song_info> = 1)
		spawnscriptnow \{intro_song_info
			id = intro_scripts}
	endif
	intro_check_for_celeb_intro_ui
	if NOT ($cheat_performancemode = 1 && $is_network_game = 0)
		spawnscriptnow \{intro_highway_move
			id = intro_scripts}
	endif
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		spawnscriptnow intro_buttonup_ripple params = <...> id = intro_scripts
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> controller
		enableinput controller = <controller>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script intro_buttonup_ripple 
	getplayerinfo <player> controller
	enableinput off controller = <controller>
	begin
	getsongtimems
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		enableinput controller = <controller>
		return
	endif
	gamemode_gettype
	if (<type> = freeplay)
		if playerinfoequals <player> freeplay_state = dropped
			enableinput controller = <controller>
			return
		endif
	endif
	getarraysize \{$gem_colors}
	all_vocals = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer \{out = i}
		begin
		if playerinfoequals <i> part = vocals
			all_vocals = 0
			break
		endif
		getnextplayer player = <i> out = i
		repeat <num_players>
	endif
	spawnscriptnow highway_ripple_ui_sfx params = {<...>}
	extendcrcplayer button_up_pixel_array <player> out = pixel_array
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
	enableinput controller = <controller>
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
	gman_songtool_getcurrentsong
	get_song_title song = <current_song>
	get_song_artist_text song = <current_song>
	get_song_artist song = <current_song>
	get_song_original_artist song = <current_song>
	if (<current_song> = jamsession)
		year = 2008
		if ui_event_exists_in_stack \{name = 'songlist'}
			gman_songfunc \{func = get_current_song_jam_index}
			getarraysize ($jam_curr_directory_listing) param = directory_size
			if (<current_song_jam_index> > 0 && <current_song_jam_index> < <directory_size>)
				<year> = ($jam_curr_directory_listing [<current_song_jam_index>].year)
			endif
		elseif ui_event_exists_in_stack \{name = 'jam'}
			jam_struct = ($jamsession_songlist_props.jamsession)
			year = (<jam_struct>.year_num)
		endif
		if NOT gotparam \{song_artist}
			get_savegame_from_controller controller = ($primary_controller)
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
	if (<original_artist> = 1)
		createscreenelement {
			parent = root_window
			id = intro_container
			type = descinterface
			desc = 'song_intro'
			alpha = 0
			intro_info_stacker_alpha = 1
			intro_cover_info_stacker_alpha = 0
			z_priority = 500
			intro_artist_text = <song_artist>
			intro_title_text = <song_title>
			intro_performed_text = <song_artist_text>
		}
	else
		get_cover_artist_text song = <current_song>
		get_covered_by_text song = <current_song>
		createscreenelement {
			parent = root_window
			id = intro_container
			type = descinterface
			desc = 'song_intro'
			alpha = 0
			intro_info_stacker_alpha = 0
			intro_cover_info_stacker_alpha = 1
			z_priority = 500
			intro_artist_text = <song_artist>
			intro_title_text = <song_title>
			intro_performed_text = <song_artist_text>
			cover_intro_performed_text = <covered_by_text>
			cover_intro_artist_text = <cover_artist_text>
		}
	endif
	intro_container :se_setprops alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :se_waitprops
	wait ($current_intro.song_title_on_time / 1000.0) seconds
	intro_container :se_setprops alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :se_waitprops
	destroyscreenelement \{id = intro_container}
endscript

script intro_highway_move 
	gamemode_gettype
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
	all_instrument = 1
	highway_up_sfx = guitar
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		skip_player = false
		if (<type> = freeplay)
			if playerinfoequals <player> freeplay_state = dropped
				skip_player = true
			endif
		endif
		if (<skip_player> = false)
			if NOT playerinfoequals <player> part = vocals
				all_vocals = 0
			else
				all_instrument = 0
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
		if ((<all_vocals> = 0) && (<all_instrument> = 0))
			highway_up_sfx = both
		elseif (<all_vocals> = 0)
			highway_up_sfx = guitar
		elseif (<all_instrument> = 0)
			highway_up_sfx = vocal
		endif
	endif
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	play_vocal_highway_sfx = 0
	switch <highway_up_sfx>
		case guitar
		spawnscriptnow \{song_intro_highway_up_sfx_waiting}
		play_vocal_highway_sfx = 0
		case vocal
		play_vocal_highway_sfx = 1
		case both
		spawnscriptnow \{song_intro_highway_up_sfx_waiting}
		play_vocal_highway_sfx = 1
		default
		printf \{channel = sfx
			qs(0x97b59f58)}
	endswitch
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		skip_player = false
		if (<type> = freeplay)
			if playerinfoequals <player> freeplay_state = dropped
				skip_player = true
			endif
		endif
		if (<skip_player> = false)
			spawnscriptnow vocals_highway_slide_in params = {delay = 90 player = <player> play_vocal_highway_sfx = <play_vocal_highway_sfx>}
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	move_highway_camera_to_default
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
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		move_hud_to_default time = ($current_intro.hud_move_time / 1000.0)
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	all_vocals = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT playerinfoequals <player> part = vocals
			all_vocals = 0
			break
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	spawnscriptnow \{song_intro_kick_sfx_waiting}
endscript

script intro_check_for_celeb_intro_ui 
	transition_getprefix type = ($current_playing_transition)
	if (<celeb_intro> = 1)
		spawnscriptnow intro_celeb_ui params = {celeb_intro = <type_textnl>}
	endif
endscript

script intro_celeb_ui 
	onexitrun \{cleanup_intro_celeb}
	switch <celeb_intro>
		case intro_bellamy
		<start_delay> = 7.8
		<duration> = 3.0
		case intro_cobain
		<start_delay> = 6.0
		<duration> = 3.2
		case intro_manson
		<start_delay> = 7.5
		<duration> = 3.5
		case intro_santana
		<start_delay> = 4.0
		<duration> = 3.0
		default
		<start_delay> = 2.0
		<duration> = 4.0
	endswitch
	wait <start_delay> seconds
	createscreenelement \{type = containerelement
		id = celeb_intro_ui_cont
		parent = root_window
		pos = (0.0, 0.0)
		z_priority = 100}
	setsearchallassetcontexts
	createscreenelement \{parent = celeb_intro_ui_cont
		id = celeb_intro_ui
		type = descinterface
		desc = 'celeb_intro'}
	celeb_intro_ui :se_setprops {
		firstname_text = <firstname>
		lastname_text = <lastname>
	}
	setsearchallassetcontexts \{off}
	celeb_intro_ui :desc_resolvealias \{name = alias_frame_anim}
	assignalias id = <resolved_id> alias = frame_anim
	frame_anim :se_getprops \{pos}
	<frame_anim_pos> = <pos>
	celeb_intro_ui :desc_resolvealias \{name = alias_frame_container}
	assignalias id = <resolved_id> alias = frame_container
	frame_container :se_setprops \{alpha = 1}
	frame_container :se_getprops \{pos}
	<frame_container> = <pos>
	frame_anim :se_setprops \{pos = (-10.0, 300.0)}
	frame_anim :se_waitprops
	frame_anim :se_setprops \{pos = (-10.0, -40.0)
		time = 0.01
		motion = ease_in}
	frame_anim :se_waitprops
	frame_anim :se_setprops \{pos = (-10.0, 80.0)
		time = 0.01
		motion = ease_in}
	<time_between_bounces> = 0.01
	frame_container :obj_spawnscriptnow intro_celeb_ui_bounce params = {id = frame_container starting_pos = <frame_container_pos>}
	wait (<duration> - <time_between_bounces>) seconds
	frame_anim :se_waitprops
	frame_anim :se_setprops \{pos = (-10.0, 80.0)}
	frame_anim :se_waitprops
	frame_anim :se_setprops \{pos = (-10.0, -20.0)
		time = 0.01
		motion = ease_in}
	frame_anim :se_waitprops
	frame_anim :se_setprops \{pos = (-10.0, 300.0)
		time = 0.01
		motion = ease_in}
	frame_anim :se_waitprops
	frame_anim :se_setprops \{alpha = 0
		time = 0.1}
	destroyscreenelement \{id = celeb_intro_ui_cont}
endscript

script cleanup_intro_celeb 
	if screenelementexists \{id = celeb_intro_ui_cont}
		destroyscreenelement \{id = celeb_intro_ui_cont}
	endif
endscript

script intro_celeb_ui_bounce 
	if celeb_intro_ui :desc_resolvealias \{name = alias_frame_container
			param = celeb_frame_add_id}
		<celeb_frame_add_id> :obj_spawnscript ui_shakey params = {pos = (637.0, 415.0)}
	else
		scriptassert \{'pdetrich'}
	endif
	if celeb_intro_ui :desc_resolvealias \{name = alias_frame_container
			param = celeb_frame_add_id}
		<celeb_frame_add_id> :obj_spawnscript ui_shakey params = {pos = (637.0, 415.0)}
	else
		scriptassert \{'pdetrich'}
	endif
endscript

script kill_intro_celeb_ui 
	if scriptisrunning \{intro_celeb_ui}
		if screenelementexists \{id = celeb_intro_ui_cont}
			destroyscreenelement \{id = celeb_intro_ui_cont}
		endif
		killspawnedscript \{name = intro_celeb_ui}
	endif
endscript

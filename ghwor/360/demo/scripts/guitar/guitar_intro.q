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
career_power_intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
career_power_fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -3000
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
current_intro_starttime = 0

script play_intro \{has_delayed_intro = 0
		alpha_in_highway = 0
		no_sound = 0}
	killspawnedscript \{name = audio_crowd_play_loading_screen_swell}
	killspawnedscript \{name = audio_crowd_loading_whistle}
	printstruct <...>
	start_drummer_cameras
	getnumplayersingame \{on_screen}
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	gamemode_gettype
	if gotparam \{fast}
		if (<type> = career)
			change \{current_intro = $career_power_fastintro_sequence_props}
		else
			change \{current_intro = $fastintro_sequence_props}
		endif
	elseif gotparam \{practice}
		change \{current_intro = $practice_sequence_props}
	else
		if (<type> = career)
			change \{current_intro = $career_power_intro_sequence_props}
		else
			change \{current_intro = $intro_sequence_props}
		endif
	endif
	playlist_getcurrentsong
	if song_has_delayed_intro song = <current_song>
		has_delayed_intro = 1
	endif
	if song_alpha_in_highway song = <current_song>
		alpha_in_highway = 1
	endif
	gamemode_gettype
	if (<type> != career)
		has_delayed_intro = 0
		alpha_in_highway = 0
	endif
	if (<no_sound> = 1)
		alpha_in_highway = 1
	endif
	if (<alpha_in_highway> = 1)
		has_delayed_intro = 1
	endif
	if (<has_delayed_intro> = 1)
		change \{highway_displayed = 0}
	else
		change \{highway_displayed = 1}
	endif
	change current_intro_starttime = ($current_starttime)
	getsongtimems
	if ($current_intro_starttime - 3000 < <time>)
		change current_intro_starttime = (<time> + 3000)
	endif
	show_song_info = 1
	if ($g_in_tutorial = 1)
		show_song_info = 0
	endif
	if ($calibrate_lag_enabled = 1)
		show_song_info = 0
	endif
	if (<show_song_info> = 1)
		spawnscriptnow \{intro_song_info
			id = intro_scripts}
	endif
	intro_check_for_celeb_intro_ui
	if NOT ($cheat_performancemode = 1 && $is_network_game = 0)
		spawnscriptnow intro_highway_move id = intro_scripts params = {has_delayed_intro = <has_delayed_intro> alpha_in_highway = <alpha_in_highway>}
	endif
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		spawnscriptnow intro_buttonup_ripple params = <...> id = intro_scripts
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	if ($end_credits = 0)
		spawnscriptnow intro_hud_move id = intro_scripts params = {has_delayed_intro = <has_delayed_intro> alpha_in_highway = <alpha_in_highway>}
	endif
	bandmanager_setplayingintroanims
endscript

script move_highway_camera_to_default 
	display_highway
endscript
highway_displayed = 0

script display_highway \{fade_time = 0.66}
	gamemode_gettype
	if (<type> != career)
		return
	endif
	if ($highway_displayed = 0)
		change \{highway_displayed = 1}
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			getplayerinfo <player> controller
			enableinput controller = <controller>
			getnextplayer on_screen player = <player>
			repeat <num_players_shown>
		endif
		hud_root :se_setprops alpha = 1 time = (<fade_time> / 2.0)
		ignore_combo_meter = 0
		if ($cheat_hudfreemode = 1)
			ignore_combo_meter = 1
		endif
		set_all_highway_props alpha = 1 time = <fade_time> ignore_combo_meter = <ignore_combo_meter>
		wait <fade_time> seconds
		set_all_highway_prepass_props \{alpha = 1}
		if ($g_suppress_power_rocker_intro = 0)
			do_power_rocker_intro
		endif
		change \{g_suppress_power_rocker_intro = 0}
	endif
endscript

script hide_highway \{fadetime = 0.5}
	gamemode_gettype
	if (<type> != career)
		return
	endif
	if NOT gotparam \{endofsong}
		gamemode_gettype
		if (<type> != career)
			return
		endif
		disable_pause
	endif
	if ($highway_displayed = 1)
		change \{highway_displayed = 0}
		band_failing_vignette_off
		killspawnedscript \{name = do_johnny_bonus_star_timer_spawned}
		if gotparam \{endofsong}
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				getplayerinfo <player> controller
				enableinput controller = <controller> off
				whammyfxoffall player = <player>
				getnextplayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
		hide_all_johnny_timers
		set_all_highway_prepass_props \{alpha = 0}
		set_all_highway_props alpha = 0 time = <fadetime>
		hud_root :se_setprops alpha = 0 time = (<fadetime> / 2.0)
		if NOT gotparam \{endofsong}
			wait <fadetime> seconds
		endif
	endif
endscript

script wait_for_fade 
	begin
	if scriptisrunning \{hide_highway}
		wait \{1
			gameframe}
	elseif scriptisrunning \{display_highway}
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
endscript

script destroy_intro 
	killspawnedscript \{id = intro_scripts}
	killspawnedscript \{name = audio_gameplay_intro_kick_sfx_waiting}
	killspawnedscript \{name = audio_gameplay_intro_highway_up_sfx_waiting}
	killspawnedscript \{name = move_highway_2d}
	killspawnedscript \{name = intro_buttonup_ripple}
	killspawnedscript \{name = intro_hud_move}
	killspawnedscript \{name = play_intro}
	killspawnedscript \{name = display_highway}
	destroyscreenelement \{id = intro_container}
	change \{g_suppress_power_rocker_intro = 0}
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
	if (<alpha_in_highway> = 1)
		if ($highway_displayed = 0)
			enableinput off controller = <controller>
		endif
		return
	endif
	enableinput off controller = <controller>
	if (<has_delayed_intro> = 1)
		return
	endif
	begin
	getsongtimems
	if ($current_intro.button_ripple_start_time + $current_intro_starttime < <time>)
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
	spawnscriptnow audio_ui_play_highway_ripple_sfx params = {<...>}
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
	if ($current_intro.song_title_start_time + $current_intro_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	playlist_getcurrentsong
	get_song_title song = <current_song>
	get_song_artist_text song = <current_song>
	get_song_artist song = <current_song>
	get_song_original_artist song = <current_song>
	if (<current_song> = jamsession)
		year = 2008
		if ui_event_exists_in_stack \{name = 'songlist'}
			playlist_getcurrentsongprops
			if structurecontains structure = <additional_props> jam_index
				jam_index = (<additional_props>.jam_index)
				getarraysize ($jam_curr_directory_listing) param = directory_size
				if (<jam_index> > 0 && <jam_index> < <directory_size>)
					<year> = ($jam_curr_directory_listing [<jam_index>].year)
				endif
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

script intro_highway_move \{has_delayed_intro = 0}
	gamemode_gettype
	killspawnedscript \{name = audio_crowd_play_one_shots_between_songs}
	killspawnedscript \{name = audio_crowd_play_surge_between_songs}
	begin
	getsongtimems
	if ($current_intro.highway_start_time + $current_intro_starttime < <time>)
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
	if scriptexists \{audio_crowd_play_swells_during_stats_screen}
		killspawnedscript \{name = audio_crowd_play_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	spawnscriptnow \{audio_find_rms}
	play_vocal_highway_sfx = 0
	spawnscriptnow \{audio_check_for_celeb_intro_encore}
	if (<has_delayed_intro> = 0)
		switch <highway_up_sfx>
			case guitar
			spawnscriptnow \{audio_gameplay_intro_highway_up_sfx_waiting}
			play_vocal_highway_sfx = 0
			case vocal
			play_vocal_highway_sfx = 1
			case both
			spawnscriptnow \{audio_gameplay_intro_highway_up_sfx_waiting}
			play_vocal_highway_sfx = 1
			default
			printf \{channel = sfx
				qs(0x97b59f58)}
		endswitch
	endif
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
	move_highway_to_default
	if (<has_delayed_intro> = 1)
		set_all_highway_prepass_props \{alpha = 0}
		set_all_highway_props \{alpha = 0}
	endif
	if (<alpha_in_highway> = 1)
		display_highway
	endif
endscript

script intro_hud_move \{has_delayed_intro = 0}
	if (<has_delayed_intro> = 1)
		return
	endif
	begin
	getsongtimems
	if ($current_intro.hud_start_time + $current_intro_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if screenelementexists \{id = hud_root}
		hud_root :se_setprops \{alpha = 1
			time = 0.25}
		do_power_rocker_intro
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
	spawnscriptnow \{audio_gameplay_intro_kick_sfx_waiting}
endscript

script intro_check_for_celeb_intro_ui 
	if ($current_playing_transition != none)
		transition_getprefix type = ($current_playing_transition)
		if (<celeb_intro> = 1)
			spawnscriptnow intro_celeb_ui params = {celeb_intro = <type_textnl>}
		endif
	endif
endscript

script do_power_rocker_intro 
	<power_rocker_intro> = 0
	<power_rocker_params> = {}
	gamemode_gettype
	if (<type> = career)
		<power_rocker_intro> = 1
		if quest_progression_is_chapter_rush
			playlist_getcurrentsong
			if (<current_song> != ($quest_chapter_midboss.songs [0]))
				<power_rocker_intro> = 0
			endif
		endif
	endif
	if (<type> = quickplay)
		if gman_ispowerscoreenabled
			gman_getdata \{goal = quickplay
				name = powers_enabled}
			getarraysize \{powers_enabled}
			if (<array_size> > 0)
				<cnt> = 0
				begin
				formattext checksumname = name 'power_name_%d' d = (<cnt> + 1)
				<power_info> = (<powers_enabled> [<cnt>].power_info)
				<level_info> = (<powers_enabled> [<cnt>].level)
				if (<level_info> = 2)
					<text> = ($<power_info>.character_power2)
				else
					<text> = ($<power_info>.character_power)
				endif
				addparam structure_name = power_rocker_params name = <name> value = <text>
				<cnt> = (<cnt> + 1)
				repeat <array_size>
			endif
			<power_rocker_intro> = 1
		endif
	endif
	if ($calibrate_lag_enabled = 1)
		<power_rocker_intro> = 0
	endif
	if ($cheat_hudfreemode = 1)
		<power_rocker_intro> = 0
	endif
	if (<power_rocker_intro> = 1)
		killspawnedscript \{name = intro_power_rocker}
		spawnscriptnow intro_power_rocker params = <power_rocker_params>
	endif
endscript

script intro_power_rocker 
	if NOT screenelementexists \{id = hud_root}
		printf \{channel = zdebug
			qs(0x92c84f03)}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_celeb_intro_cont
			param = parent}
		printf \{channel = zdebug
			qs(0x90ea6703)}
		return
	endif
	onexitrun \{intro_power_rocker_cleanup}
	createscreenelement {
		parent = <parent>
		id = celeb_intro_ui
		type = descinterface
		desc = 'celeb_intro'
		gfx_container_scale = (0.9, 0.9)
		just = [center center]
		pos_anchor = [center center]
		alpha = 0
		z_priority = 70
	}
	gamemode_gettype
	if (<type> = career)
		player = ($g_net_leader_player_num)
		getplayerinfo <player> score_attribute_level
		if console_is_net_career_client
			savegame = -1
		else
			if (<player> < 1)
				getfirstplayer \{local}
			endif
			getplayerinfo <player> controller
			getsavegamefromcontroller controller = <controller>
		endif
		<quest_chapter> = ($current_chapter)
		<rocker_name_text> = qs(0x86589cce)
		<rocker_full_name> = qs(0x86589cce)
		<character_power> = qs(0x3f693a17)
		if (<quest_chapter> != none)
			<rocker_hero_info> = ($<quest_chapter>.hero_info)
			<rocker_name_text> = ($<rocker_hero_info>.character_name)
			if (<score_attribute_level> = 2)
				<rocker_full_name> = ($<rocker_hero_info>.character_transformation_fullname)
				<character_power> = ($<rocker_hero_info>.character_power2)
			else
				<character_power> = ($<rocker_hero_info>.character_power)
				<rocker_full_name> = ($<rocker_hero_info>.character_fullname)
			endif
			if quest_progression_is_chapter_finale
				<current_song> = none
				playlist_getcurrentsong
				get_finalbattle_song_number song = <current_song>
				if (<song_number> = 0 || <song_number> = 1)
					formattext textname = character_power qs(0x373afb18) d = (<song_number> + 1)
				endif
			endif
			if NOT quest_progression_is_chapter_finale
				if NOT quest_progression_is_chapter_rush
					if quest_progression_check_domination_unlocked savegame = <savegame>
						character_power = (($finale_hero_info).character_power2)
					endif
				endif
			endif
		endif
		spawnscriptnow audio_play_career_power_up_sfx params = {character = <rocker_name_text> lvl = <score_attribute_level>}
		celeb_intro_ui :se_setprops name_text = <rocker_full_name> power_text = <character_power>
	else
		celeb_intro_ui :se_setprops \{career_text_cont_alpha = 0.0
			qp_text_cont_alpha = 1.0}
		if NOT gotparam \{power_name_1}
			<power_name_1> = qs(0x0a28c063)
		endif
		if NOT gotparam \{power_name_2}
			<power_name_2> = qs(0x0a28c063)
		endif
		celeb_intro_ui :se_setprops power_1_text = <power_name_1> power_2_text = <power_name_2>
	endif
	getscreenelementposition id = <parent> summed
	lightning_source = (<screenelementpos> + (0.0, 0.0))
	<lightning_strike_johnny_meter> = 0
	<lightning_strike_rock_meter> = 0
	<lightning_strike_shields> = 0
	<lightning_strike_multiplier> = 0
	<lightning_strike_sp_meter> = 0
	<do_some_resurrection_fx> = 0
	<rails_flame_red> = 0
	<do_bg_light_fx> = 0
	getfirstplayer \{on_screen
		local}
	getplayerinfo <player> min_multiplier
	getplayerinfo <player> star_power_per_note_streak
	getplayerinfo <player> crowd_meter_start_bonus
	getplayerinfo <player> star_power_gain_multiplier
	getplayerinfo <player> star_power_multiplier
	getplayerinfo <player> multiplier_5
	getplayerinfo <player> miss_note_bonus_allowed
	getplayerinfo <player> band
	getbandinfo <band> max_resurrection_lives
	bg_light_fx_color = [255 255 255 255]
	lightning_to_multiplier_color_johnny = [64 255 64 255]
	lightning_to_multiplier_color_lars = [255 64 64 255]
	lightning_to_shields = [255 128 0 255]
	lightning_to_sp_meter_newmale = [64 128 255 255]
	lightning_to_sp_meter_tesla = [128 255 129 255]
	lightning_to_rock_meter = [64 255 64 255]
	if (<min_multiplier> > 1)
		<lightning_strike_johnny_meter> = 1
		<do_bg_light_fx> = 1
		lightning_to_multiplier_color = <lightning_to_multiplier_color_johnny>
		<bg_light_fx_color> = <lightning_to_multiplier_color_johnny>
	endif
	if (<multiplier_5> > 0)
		<lightning_strike_multiplier> = 1
		lightning_to_multiplier_color = <lightning_to_multiplier_color_lars>
		<do_bg_light_fx> = 1
		<bg_light_fx_color> = <lightning_to_multiplier_color_lars>
	endif
	if (<star_power_per_note_streak> > 0)
		<lightning_strike_sp_meter> = 1
		<do_bg_light_fx> = 1
		<bg_light_fx_color> = <lightning_to_sp_meter_tesla>
		lightning_to_sp_meter_color = <lightning_to_sp_meter_tesla>
	endif
	if (<star_power_gain_multiplier> > 1.0)
		<lightning_strike_sp_meter> = 1
		<do_bg_light_fx> = 1
		<bg_light_fx_color> = <lightning_to_sp_meter_newmale>
		lightning_to_sp_meter_color = <lightning_to_sp_meter_newmale>
	endif
	if (<max_resurrection_lives> > 0)
		<do_some_resurrection_fx> = 1
	endif
	if (<crowd_meter_start_bonus> > 1)
		<lightning_strike_rock_meter> = 1
		<do_bg_light_fx> = 1
		<bg_light_fx_color> = <lightning_to_rock_meter>
	endif
	if (<star_power_multiplier> > 2)
		<rails_flame_red> = 1
	endif
	if (<miss_note_bonus_allowed> > 0)
		<lightning_strike_shields> = 1
		<do_bg_light_fx> = 1
		<bg_light_fx_color> = <lightning_to_shields>
	endif
	in_out_anim_time = 0.2
	total_anim_time = 1.7
	fx_sync_time = 0.4
	if screenelementexists \{id = celeb_intro_ui}
		celeb_intro_ui :se_setprops alpha = 1.0 time = <in_out_anim_time> gfx_container_scale = (1.0, 1.0)
		wait <in_out_anim_time> seconds
	endif
	if (<do_bg_light_fx> = 1)
		spawnscriptnow celeb_intro_frame_glow01 params = {player = <player> rgba = <bg_light_fx_color>}
	endif
	wait <fx_sync_time> second
	if (<rails_flame_red> = 1)
		create_all_highway_star_power_effect
	endif
	if (<do_some_resurrection_fx> = 1)
		create_all_highway_res_fx
	endif
	if (<lightning_strike_multiplier> = 1)
		audio_play_character_powers_sfx \{power = lightningboltright}
		lightning_strike_all_multipliers source_pos = <lightning_source> rgba = <lightning_to_multiplier_color>
		wait \{0.8
			seconds}
	endif
	if (<lightning_strike_johnny_meter> = 1)
		audio_play_character_powers_sfx \{power = lightningboltright}
		lightning_strike_all_johnny_meters source_pos = <lightning_source> rgba = <lightning_to_multiplier_color>
		wait \{0.8
			seconds}
	endif
	if (<lightning_strike_sp_meter> = 1)
		audio_play_character_powers_sfx \{power = lightningbolt}
		lightning_strike_all_sp_meters source_pos = <lightning_source> rgba = <lightning_to_sp_meter_color>
		wait \{0.8
			seconds}
	endif
	if (<lightning_strike_rock_meter> = 1)
		audio_play_character_powers_sfx \{power = lightningboltleft}
		lightning_strike_all_rock_meters source_pos = <lightning_source> rgba = <lightning_to_rock_meter>
		wait \{0.8
			seconds}
	endif
	if (<lightning_strike_shields> = 1)
		audio_play_character_powers_sfx \{power = lightningboltleft}
		lightning_strike_all_player_shields source_pos = <lightning_source> rgba = <lightning_to_shields>
		wait \{0.8
			seconds}
	endif
	<wait_time> = (<total_anim_time> - (2 * <in_out_anim_time>))
	wait <wait_time> seconds
	if (<rails_flame_red> = 1)
		kill_all_highway_star_power_effect
	endif
	if screenelementexists \{id = celeb_intro_ui}
		celeb_intro_ui :se_setprops alpha = 0.0 time = <in_out_anim_time> gfx_container_scale = (0.9, 0.9)
		wait <in_out_anim_time> seconds
	endif
endscript

script intro_power_rocker_cleanup 
	if screenelementexists \{id = celeb_intro_ui}
		destroyscreenelement \{id = celeb_intro_ui}
	endif
	killspawnedscript \{name = celeb_intro_frame_glow01}
	killspawnedscript \{name = p2p_lightning_create_fx}
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

script kill_intro_celeb_ui 
	if scriptisrunning \{intro_celeb_ui}
		if screenelementexists \{id = celeb_intro_ui_cont}
			destroyscreenelement \{id = celeb_intro_ui_cont}
		endif
		killspawnedscript \{name = intro_celeb_ui}
	endif
endscript

script celeb_intro_frame_glow01 
	if NOT hud_root :desc_resolvealias \{name = alias_celeb_intro_cont
			param = parent}
		printf \{channel = zdebug
			qs(0x8a6612ed)}
		return
	endif
	rgba_out = [0 0 0 255]
	wait \{10
		gameframe}
	create2dparticlesystem {
		parent = <parent>
		pos = (0.0, 30.0)
		z_priority = 10
		material = mat_ray_square_add
		start_color = <rgba>
		end_color = <rgba_out>
		start_scale = (5.5, 1.5)
		end_scale = (15.5, 2.1499999)
		start_angle_spread = 360.0
		min_rotation = -2
		max_rotation = 2
		emit_start_radius = 10
		emit_radius = 50
		emit_rate = 0.01
		emit_dir = 0.0
		emit_spread = 0.0
		velocity = 0
		friction = (0.0, 0.0)
		time = 0.05
	}
	<intro_fx01> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (0.0, 0.0)
		z_priority = 10
		material = mat_particle_lightning_arc01
		start_color = <rgba>
		end_color = <rgba_out>
		start_scale = (1.25, 2.5)
		end_scale = (2.5, 1.25)
		start_angle_spread = 360.0
		min_rotation = -200
		max_rotation = 200
		emit_start_radius = 0
		emit_radius = 500
		emit_rate = 0.15
		emit_dir = 90
		emit_spread = 0.0
		velocity = 12
		friction = (0.0, 0.0)
		time = 0.05
	}
	<intro_fx02> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (-150.0, 0.0)
		z_priority = 10
		material = mat_particle_lightning_arc01
		start_color = <rgba>
		end_color = <rgba_out>
		start_scale = (1.25, 2.5)
		end_scale = (2.5, 1.25)
		start_angle_spread = 360.0
		min_rotation = -200
		max_rotation = 200
		emit_start_radius = 0
		emit_radius = 500
		emit_rate = 0.15
		emit_dir = 90
		emit_spread = 0.0
		velocity = 12
		friction = (0.0, 0.0)
		time = 0.05
	}
	<intro_fx03> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (150.0, 0.0)
		z_priority = 10
		material = mat_particle_lightning_arc01
		start_color = <rgba>
		end_color = <rgba_out>
		start_scale = (1.25, 2.5)
		end_scale = (2.5, 1.25)
		start_angle_spread = 360.0
		min_rotation = -200
		max_rotation = 200
		emit_start_radius = 0
		emit_radius = 500
		emit_rate = 0.15
		emit_dir = 90
		emit_spread = 360.0
		velocity = -12
		friction = (0.0, 0.0)
		time = 0.05
	}
	<intro_fx04> = <id>
	wait \{0.5
		seconds}
	destroy2dparticlesystem id = <intro_fx01> kill_when_empty
	destroy2dparticlesystem id = <intro_fx02> kill_when_empty
	destroy2dparticlesystem id = <intro_fx03> kill_when_empty
	destroy2dparticlesystem id = <intro_fx04> kill_when_empty
endscript

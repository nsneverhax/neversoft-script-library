
script ingame_play_movie 
	ingame_pre_movie_cleanup
	mempushcontext \{0}
	startdelaysystemui
	if gotparam \{movies}
		getarraysize <movies>
		index = 0
		begin
		playmovie movie = (<movies> [<index>])
		index = (<index> + 1)
		repeat <array_size>
	else
		playmovie <...>
	endif
	stopdelaysystemui
	mempopcontext
	ingame_post_movie_cleanup <...>
endscript

script ingame_pre_movie_cleanup 
	displayloadingscreen \{blank}
	if infrontend
		killskatercamanim \{all}
	endif
	pausegame
	pausespawnedscripts
	cleanup_before_changing_level <...>
	cleanup \{preserve_skaters}
	KillMessages
endscript

script ingame_post_movie_cleanup \{loading_screen = blank}
	mempushcontext \{0}
	displayloadingscreen <loading_screen>
	mempopcontext
	if NOT gotparam \{level}
		getcurrentlevel
	endif
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	change_level level = <level> from_movie
	restore_start_key_binding
endscript

script movie_check_subtitle_force 
	getarraysize \{$movie_subtitles_force_display}
	if (<array_size> = 0)
		return \{false}
	endif
	<i> = 0
	begin
	if checksumequals a = ($movie_subtitles_force_display [<i>]) b = <subtitle_array>
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script moviedisplaysubtitles 
	formattext checksumname = subtitle_array '%s_subtitles' s = <movie>
	if getglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
		if NOT movie_check_subtitle_force subtitle_array = <subtitle_array>
			return
		endif
	endif
	printf "Looking for movie subtitle array %s_subtitles" s = <movie>
	if globalexists name = <subtitle_array> type = array
		printf "found subtitles"
		getarraysize ($<subtitle_array>)
		<num_subtitles> = <array_size>
		<anchor_placement> = {
			scale = 1.0
			pos = (0.0, 0.0)
		}
		createscreenelement {
			parent = root_window
			id = movie_subtitles_anchor
			type = containerelement
			just = [center top]
			<anchor_placement>
		}
		movie_subtitles_anchor :obj_spawnscriptnow movie_subtitles_parse params = {
			subtitle_array = <subtitle_array>
			num_subtitles = <num_subtitles>
		}
		onexitrun MovieCleanupSubtitles
		begin
		if ismovieplaying textureslot = <textureslot>
			wait 1 gameframes
		else
			break
		endif
		repeat
	else
		printf "No subtitles found for %s, ignoring" s = <movie>
	endif
endscript

script MovieCleanupSubtitles 
	if screenelementexists \{id = movie_subtitles_anchor}
		destroyscreenelement \{id = movie_subtitles_anchor}
	endif
	printf \{"Movie subtitles cleaned up"}
endscript

script movie_subtitles_parse 
	<subtitle_index> = 0
	<prev_time> = 0.0
	begin
	<cur_subtitle> = (<subtitle_array> [<subtitle_index>])
	<wait_time> = (<cur_subtitle>.time - <prev_time>)
	if (<wait_time> < 0)
		scriptassert "found bad time value (%f) in movie subtitle times (element %d). all times must be increasing" f = (<cur_subtitle>.time) d = <subtitle_index>
	endif
	wait <wait_time> seconds
	movie_subtitles_parse_element <cur_subtitle>
	<prev_time> = (<cur_subtitle>.time)
	<subtitle_index> = (<subtitle_index> + 1)
	repeat <num_subtitles>
endscript

script movie_subtitles_parse_element 
	<text_params> = {
		scale = 0.8
		pos = (600.0, 675.0)
		dims = (1200.0, 0.0)
		just = [center bottom]
		internal_just = [center bottom]
	}
	if screenelementexists id = videophone_screen_cont
		<text_params> = {
			scale = 0.6
			pos = (320.0, 390.0)
			dims = (700.0, 0.0)
			just = [center bottom]
			internal_just = [center bottom]
		}
	endif
	create_panel_block {
		parent = movie_subtitles_anchor
		id = movie_subtitle_element
		text = <text>
		time = (<duration> * 1000)
		font_face = text_a1
		rgba = [220 200 180 255]
		z_priority = 115
		<text_params>
	}
endscript

ui_endmovies_active = 0

script ui_endmovies_create 
	change \{ui_endmovies_active = 1}
	spawnscriptnow ui_endmovies_create_spawned id = ui_endmovies params = {sequence = <sequence>}
endscript

script ui_endmovies_create_spawned 
	ui_destroy_background
	createscreenelement {
		id = endmovies_background
		parent = root_window
		z_priority = -500
		type = spriteelement
		texture = black
		scale = (160.0, 140.0)
		just = [center center]
		pos = (320.0, 240.0)
		rgba = [0 0 0 255]
		alpha = 0
	}
	doscreenelementmorph id = endmovies_background alpha = 1 time = 0.2
	wait 0.2 seconds
	getarraysize (<sequence>.movies)
	if (<array_size> > 0)
		<i> = 0
		begin
		ui_endmovies_play movie = (<sequence>.movies [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	doscreenelementmorph id = endmovies_background alpha = 0 time = 0.2
	wait 0.2 seconds
	do_actual_unpause
	pauseskaters
	goal_create_pro_success_screen {
		goal = (<sequence>.goal)
		unlocked_skaters_text = (<sequence>.unlocked_skaters_text)
		no_video = 1
		no_peds = 1
		end_game = 1
	}
	wait_for_pro_success_screen
	do_actual_pause
	pauseskaters
	(<sequence>.dialog_script)
endscript

script ui_endmovies_destroy 
	change \{ui_endmovies_active = 0}
	if screenelementexists \{id = endmovies_background}
		destroyscreenelement \{id = endmovies_background}
	endif
	do_actual_unpause
	killspawnedscript \{id = ui_endmovies}
endscript

script ui_endmovies_play 
	printpushpopdebuginfo push name = "ui_endmovies_play"
	pushsoundbussparams
	setsoundbussparams $no_music_at_all_bussset time = 0.5
	enableusermusic disable
	playmovie movie = <movie> textureslot = 0 no_looping no_hold
	printf "PLAYING MOVIE: %a" a = <movie>
	wait 1 second
	createscreenelement {
		type = containerelement
		id = ui_endmovies_wait_anchor
		event_handlers = [
			{pad_choose ui_endmovies_finish_movie}
			{pad_start ui_endmovies_finish_movie}
		]
	}
	launchevent type = focus target = ui_endmovies_wait_anchor
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 frame
	repeat
	printpushpopdebuginfo pop name = "ui_endmovies_finish_movie"
	popsoundbussparams
	enableusermusic
	if screenelementexists id = ui_endmovies_wait_anchor
		destroyscreenelement id = ui_endmovies_wait_anchor
	endif
endscript

script ui_endmovies_finish_movie 
	killmovie \{textureslot = 0}
endscript

script wait_for_endmovies 
	wait \{1
		gameframe}
	begin
	if ($ui_endmovies_active = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script sk9_ui_end_game 
	begin
	if IsScreenClear
		break
	endif
	wait \{1
		gameframe}
	repeat
	goal_presentation_hold_skater
	hide_all_hud_items
	ui_show_accolade \{title = "story complete"}
	goal_presentation_unhold_skater
endscript

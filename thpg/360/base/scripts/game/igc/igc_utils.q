igc_custom_camera_name = custom_igc_cam

script playigccamscene 
	hide_all_hud_sprites
	playigccam {
		name = $igc_custom_camera_name
		<...>
		exitscript = show_all_hud_sprites
		allow_pause = 1
	}
endscript

script playigccamscenewithhud 
	playigccam {
		<...>
		allow_pause = 1
	}
endscript

script freeze_skater_for_cinematic 
	skater :switchoffatomic \{cas_board}
	skater :pausephysics
	skater :pause
	skater :disableplayerinput
	skater :skaterloopingsound_turnoff
endscript

script unfreeze_skater_after_cinematic 
	skater :unpausephysics
	skater :enableplayerinput
	skater :unpause
	skater :input_debounce \{x}
	if NOT skater :walking
		skater :skaterloopingsound_turnon
	endif
endscript

script fadetoblack time = 0.5 alpha = 0.5 z_priority = 9000 rgba = [0 0 0 255] texture = black id = screenfader pos = (640.0, 360.0) parent = root_window
	if gotparam on
		if NOT screenelementexists id = <id>
			setscreenelementlock off id = <parent>
			if NOT gotparam create_script
				createscreenelement {
					type = spriteelement
					parent = <parent>
					id = <id>
					texture = <texture>
					pos = <pos>
					rgba = <rgba>
					just = [center center]
					dims = (1280.0, 720.0)
					alpha = 0
					z_priority = <z_priority>
					no_zwrite
				}
			else
				<create_script>
			endif
		else
			terminateobjectsscripts id = <id>
			<id> :removetags [waiting_to_die]
		endif
		if gotparam show_loading
			net_view_goals_create_searching_text {
				text = "Loading..."
				scale = 0.75
				parent = <parent>
				id = fade_to_black_loading_text
			}
		endif
		doscreenelementmorph id = <id> time = <time> alpha = <alpha>
		setscreenelementprops id = <id> z_priority = <z_priority>
	endif
	if gotparam off
		if screenelementexists id = <id>
			doscreenelementmorph id = <id> time = <time> alpha = 0
			if gotparam no_wait
				runscriptonscreenelement id = <id> fadetoblack_wait_and_die params = {time = <time>}
			else
				<id> :settags waiting_to_die
				if (<time> > 0.0)
					wait <time> seconds ignoreslomo
				endif
				if screenelementexists id = <id>
					if <id> :getsingletag waiting_to_die
						destroyscreenelement id = <id>
					endif
				endif
			endif
		endif
		if screenelementexists id = fade_to_black_loading_text
			if (<time> > 0)
				runscriptonscreenelement id = fade_to_black_loading_text net_view_goals_searching_fade_out_and_die
			else
				destroyscreenelement id = fade_to_black_loading_text
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die 
	if gotparam \{time}
		wait <time> seconds ignoreslomo
	endif
	die
endscript

script igc_fadeout \{time = 0.75}
	fadetoblack on alpha = 1.0 time = <time>
	wait (<time> + 0.1) seconds ignoreslomo
endscript

script igc_fadeout_fast 
	fadetoblack \{on
		alpha = 1.0
		time = 0.0}
endscript

script igc_fadein_fast 
	fadetoblack \{off
		time = 0.0}
endscript

script igc_fadein \{time = 0.75}
	fadetoblack off time = <time> no_wait
endscript

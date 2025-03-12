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
	skater :switchoffatomic \{board}
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

script fadetoblack \{time = 0.5
		alpha = 0.5
		z_priority = 9000
		rgba = [
			0
			0
			0
			255
		]
		scale = (600.0, 400.0)
		texture = black
		id = screenfader
		pos = (320.0, 240.0)
		parent = root_window}
	if gotparam \{on}
		if NOT screenelementexists id = <id>
			setscreenelementlock off id = <parent>
			if NOT gotparam \{create_script}
				createscreenelement {
					type = spriteelement
					parent = <parent>
					id = <id>
					texture = <texture>
					pos = <pos>
					rgba = <rgba>
					just = [center center]
					scale = <scale>
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
		doscreenelementmorph id = <id> time = <time> alpha = <alpha>
	endif
	if gotparam \{off}
		if screenelementexists id = <id>
			doscreenelementmorph id = <id> time = <time> alpha = 0
			if gotparam \{no_wait}
				runscriptonscreenelement id = <id> fadetoblack_wait_and_die params = {time = <time>}
			else
				<id> :settags waiting_to_die
				if (<time> > 0.0)
					printf \{"waiting"}
					wait <time> seconds
				endif
				if screenelementexists id = <id>
					if <id> :getsingletag waiting_to_die
						destroyscreenelement id = <id>
					endif
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die 
	if gotparam \{time}
		wait <time> seconds
	endif
	die
endscript

script igc_fadeout \{time = 0.75}
	fadetoblack on alpha = 1.0 time = <time>
	wait (<time> + 0.1) seconds
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

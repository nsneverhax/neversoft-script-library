
script fadetoblack \{time = 0.5
		alpha = 0.5
		z_priority = 9000
		rgba = [
			0
			0
			0
			255
		]
		Scale = (600.0, 400.0)
		texture = black
		id = screenfader
		Pos = (320.0, 240.0)
		parent = root_window}
	if GotParam \{careeronly}
		gamemode_gettype
		if (<Type> != career)
			return
		endif
	endif
	if GotParam \{On}
		if NOT ScreenElementExists id = <id>
			if NOT GotParam \{create_script}
				CreateScreenElement {
					Type = SpriteElement
					parent = <parent>
					id = <id>
					texture = <texture>
					Pos = <Pos>
					rgba = <rgba>
					just = [center center]
					Scale = <Scale>
					alpha = 0
					z_priority = <z_priority>
					no_zwrite
				}
			else
				<create_script>
			endif
		else
			TerminateObjectsScripts id = <id>
			<id> :RemoveTags [waiting_to_die]
		endif
		legacydoscreenelementmorph id = <id> time = <time> alpha = <alpha>
	elseif GotParam \{OFF}
		if ScreenElementExists id = <id>
			legacydoscreenelementmorph id = <id> time = <time> alpha = 0.0
			if GotParam \{no_wait}
				RunScriptOnScreenElement id = <id> fadetoblack_wait_and_die params = {time = <time>}
				return
			endif
			<id> :SetTags waiting_to_die
			Wait <time> Seconds ignoreslomo
			if ScreenElementExists id = <id>
				if <id> :GetSingleTag waiting_to_die
					<id> :Die
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die \{time = 0.0}
	Wait <time> Seconds ignoreslomo
	Die
endscript

script fadeoutandin \{time = 2.0
		alpha = 1.0
		delay = 0.0
		initial_delay = 0.0
		z_priority = 9000}
	playlist_getcurrentsong
	if (<current_song> = bohemianrhapsody)
		if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
			return
		endif
	else
		gamemode_gettype
		if (<Type> != career)
			return
		endif
	endif
	<half_time> = (<time> / 2.0)
	<wait_time> = (<half_time> + <delay>)
	if GotParam \{kill_highways}
		disable_bg_viewport
	endif
	if (<initial_delay> > 0.0)
		Wait <initial_delay> Seconds
	endif
	fadetoblack On time = <half_time> alpha = <alpha> z_priority = <z_priority>
	Wait <wait_time> Seconds
	if GotParam \{kill_highways}
		enable_bg_viewport
	endif
	fadetoblack OFF time = <half_time> alpha = <alpha>
endscript

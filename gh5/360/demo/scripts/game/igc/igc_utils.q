
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
		legacydoscreenelementmorph id = <id> time = <time> alpha = <alpha>
	elseif gotparam \{off}
		if screenelementexists id = <id>
			legacydoscreenelementmorph id = <id> time = <time> alpha = 0.0
			if gotparam \{no_wait}
				runscriptonscreenelement id = <id> fadetoblack_wait_and_die params = {time = <time>}
				return
			endif
			<id> :settags waiting_to_die
			wait <time> seconds ignoreslomo
			if screenelementexists id = <id>
				if <id> :getsingletag waiting_to_die
					<id> :die
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die \{time = 0.0}
	wait <time> seconds ignoreslomo
	die
endscript

script igc_fadeout \{time = 0.75}
	fadetoblack on alpha = 1.0 time = <time>
	wait (<time> + 0.1) seconds
endscript

script igc_fadein \{time = 0.75}
	fadetoblack off time = <time> no_wait
endscript

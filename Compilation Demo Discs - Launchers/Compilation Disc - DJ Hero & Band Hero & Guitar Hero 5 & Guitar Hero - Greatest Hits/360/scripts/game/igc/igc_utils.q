
script fadetoblack \{time = 0.5
		alpha = 0.5
		z_priority = 9000
		rgba = [
			0
			0
			0
			255
		]
		texture = black
		id = screenfader
		parent = root_window}
	if GotParam \{on}
		if NOT ScreenElementExists id = <id>
			if NOT GotParam \{create_script}
				CreateScreenElement {
					type = SpriteElement
					parent = <parent>
					id = <id>
					texture = <texture>
					rgba = <rgba>
					just = [left top]
					dims = (1280.0, 720.0)
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
		LegacyDoScreenElementMorph id = <id> time = <time> alpha = <alpha>
	elseif GotParam \{off}
		if ScreenElementExists id = <id>
			LegacyDoScreenElementMorph id = <id> time = <time> alpha = 0.0
			if GotParam \{no_wait}
				RunScriptOnScreenElement id = <id> fadetoblack_wait_and_die params = {time = <time>}
				return
			endif
			<id> :SetTags waiting_to_die
			Wait <time> seconds ignoreslomo
			if ScreenElementExists id = <id>
				if <id> :GetSingleTag waiting_to_die
					<id> :Die
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die \{time = 0.0}
	Wait <time> seconds ignoreslomo
	Die
endscript

script igc_fadeout \{time = 0.75}
	fadetoblack on alpha = 1.0 time = <time>
	Wait (<time> + 0.1) seconds
endscript

script igc_fadein \{time = 0.75}
	fadetoblack off time = <time> no_wait
endscript

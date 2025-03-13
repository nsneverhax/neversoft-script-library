igc_debug = 0
igc_debug_hold_camera = 0
igc_playing = 0

script igc_temporarily_disable_input 
	debounce \{x}
	killspawnedscript \{id = igc_input_toggle}
	spawnscriptnow \{temporarilydisableinput
		params = {
			time = 350
		}
		id = igc_input_toggle}
endscript

script temporarilydisableinput \{time = 1500}
	onexitrun \{temporarilydisableinput_reenable}
	setbuttoneventmappings \{block_menu_input}
	if gotparam \{seconds}
		wait <time> seconds ignoreslomo
	else
		wait <time> ignoreslomo
	endif
endscript

script temporarilydisableinput_reenable 
	setbuttoneventmappings \{unblock_menu_input}
endscript

script igc_immediately_start_rendering 
	killspawnedscript \{id = igc_render_toggle}
	startrendering
endscript

script igc_temporarily_disable_rendering 
	if NOT istrue \{$is_changing_levels}
		killspawnedscript \{id = igc_render_toggle}
		spawnscriptnow igc_temporarily_disable_rendering_with_wait params = <...> id = igc_render_toggle
	endif
endscript

script igc_temporarily_disable_rendering_with_wait 
	setscriptcannotpause
	onexitrun \{igc_temporarily_disable_rendering_with_wait_end}
	pushdisablerendering \{context = igc_temporarily_disable_rendering
		type = stack}
	wait <...>
endscript

script igc_temporarily_disable_rendering_with_wait_end 
	popdisablerendering \{context = igc_temporarily_disable_rendering
		type = stack}
endscript

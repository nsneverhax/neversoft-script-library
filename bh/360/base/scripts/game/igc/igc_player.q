igc_debug = 0
igc_debug_hold_camera = 0
igc_playing = 0

script igc_temporarily_disable_input 
	Debounce \{x}
	killspawnedscript \{id = igc_input_toggle}
	spawnscriptnow \{TemporarilyDisableInput
		params = {
			time = 350
		}
		id = igc_input_toggle}
endscript

script TemporarilyDisableInput \{time = 1500}
	OnExitRun \{TemporarilyDisableInput_Reenable}
	SetButtonEventMappings \{block_menu_input}
	if GotParam \{seconds}
		wait <time> seconds ignoreslomo
	else
		wait <time> ignoreslomo
	endif
endscript

script TemporarilyDisableInput_Reenable 
	SetButtonEventMappings \{unblock_menu_input}
endscript

script igc_immediately_start_rendering 
	killspawnedscript \{id = igc_render_toggle}
	StartRendering
endscript

script igc_temporarily_disable_rendering 
	if NOT IsTrue \{$is_changing_levels}
		killspawnedscript \{id = igc_render_toggle}
		spawnscriptnow igc_temporarily_disable_rendering_with_wait params = <...> id = igc_render_toggle
	endif
endscript

script igc_temporarily_disable_rendering_with_wait 
	OnExitRun \{igc_temporarily_disable_rendering_with_wait_end}
	StopRendering
	wait <...>
endscript

script igc_temporarily_disable_rendering_with_wait_end 
	StartRendering
endscript

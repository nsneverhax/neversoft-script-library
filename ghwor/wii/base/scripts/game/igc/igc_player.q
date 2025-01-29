igc_debug = 0
igc_debug_hold_camera = 0
igc_playing = 0

script igc_temporarily_disable_rendering 
	if NOT IsTrue \{$is_changing_levels}
		KillSpawnedScript \{id = igc_render_toggle}
		SpawnScriptNow igc_temporarily_disable_rendering_with_wait params = <...> id = igc_render_toggle
	endif
endscript

script igc_temporarily_disable_rendering_with_wait 
	setscriptcannotpause
	OnExitRun \{igc_temporarily_disable_rendering_with_wait_end}
	pushdisablerendering \{context = igc_temporarily_disable_rendering
		Type = stack}
	Wait <...>
endscript

script igc_temporarily_disable_rendering_with_wait_end 
	popdisablerendering \{context = igc_temporarily_disable_rendering
		Type = stack}
endscript

debug_igc_camera = 0
igc_camera_show_frame_info = 0
cinematic_camera_default_lerp_params = {
	Type = All
	ON = 1
	slow_lerp_factor = 0.6
	fast_lerp_factor = 0.0
	lerp_dropoff = 16.0
}
cinematic_camera_default_handcam_params = {
	motionX = {
		amplitude = 0.033999998
		Center = 0.0
		periodBase = 0.012999999
		periodMultiples = [
			1
			3
			4
		]
	}
	motionY = {
		amplitude = 0.04
		Center = 0.0
		periodBase = 0.016999999
		periodMultiples = [
			1
			3
			4
		]
	}
	amplitudePosition = {
		amplitude = 0.2
		Center = 0.0
		periodBase = 0.0023
		periodMultiples = [
			1
			16
		]
	}
	amplitudeRotation = {
		amplitude = -0.3
		Center = 0.0
		periodBase = 0.0023
		periodMultiples = [
			1
		]
	}
	zoomStabilityMap = [
		(1.3, 0.7)
		(30.0, 100.0)
	]
	driftSlerpMap = [
		(0.0, 0.8)
		(0.05, 1.0)
	]
	zoomDriftMap = [
		(1.2, 0.6)
		(30.0, 100.0)
	]
	driftAllowedAmplitude = {
		amplitude = 0.4
		Center = 1.0
		periodBase = 0.02
		periodMultiples = [
			1
		]
	}
}

script IGC_RunCameraScript 
	CCam_On
	if GotParam \{ControlScript}
		<ControlScript> <Params>
	else
		CCam_SetSmoothing \{Type = All
			ON = 1
			fast_lerp_factor = 0.6}
		<cam_params> = <...>
		RemoveComponent \{structure_name = cam_params
			Name = Time}
		CCam_DoMorph <cam_params>
		if GotParam \{frames}
			ScriptAssert \{"PlayIGCCam frames is deprecated; please use time= in seconds instead"}
		endif
		if GotParam \{Time}
			Wait <Time> Seconds
		endif
	endif
	if GotParam \{Play_hold}
		play_hold_value = <Play_hold>
		if GotParam \{play_hold_value}
			if NOT (<play_hold_value> = 1)
				RemoveParameter \{Play_hold}
			endif
		endif
		if GotParam \{Play_hold}
			begin
			Wait \{1
				GameFrames}
			repeat
		endif
	endif
endscript

script igc_camera_update_frame_count 
	if NOT ScreenElementExists \{Id = igc_camera_frame_info}
		SetScreenElementLock \{Id = root_window
			OFF}
		CreateScreenElement \{PARENT = root_window
			Id = igc_camera_frame_info
			Type = ContainerElement
			z_priority = 10000}
		CreateScreenElement \{Type = TextElement
			PARENT = igc_camera_frame_info
			local_id = counter1
			Pos = (25.0, 400.0)
			Text = ""
			font = text_A1
			rgba = [
				60
				60
				100
				100
			]
			just = [
				LEFT
				Center
			]
			Scale = 0.8}
		CreateScreenElement \{Type = TextElement
			PARENT = igc_camera_frame_info
			local_id = counter2
			Pos = (25.0, 418.0)
			Text = ""
			font = text_A1
			rgba = [
				60
				60
				100
				100
			]
			just = [
				LEFT
				Center
			]
			Scale = 0.8}
	endif
	FormatText {
		TextName = text1
		"Frame %f"
		F = <frames>
	}
	FormatText {
		TextName = text2
		"%m:%s:%p"
		M = <minutes>
		S = <Seconds>
		P = <pct>
		integer_width = 2
	}
	SetScreenElementProps Id = {igc_camera_frame_info child = counter1} Text = <text1>
	SetScreenElementProps Id = {igc_camera_frame_info child = counter2} Text = <text2>
endscript

script igc_camera_frame_counter_kill 
	if ScreenElementExists \{Id = igc_camera_frame_info}
		DestroyScreenElement \{Id = igc_camera_frame_info}
	endif
endscript
